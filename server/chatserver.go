package main

import (
	"context"
	"log"
	"net"
	"sync"
	"time"

	"./chat"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
)

type page struct {
	Id      int64
	To      string
	From    string
	Message string
	Time    time.Time
}

type pagegroup struct {
	group []page
}

var users = make(map[string]pagegroup)
var mux sync.Mutex

type username struct {
	Name string
}

type server struct{}

func main() {
	listener, err := net.Listen("tcp", ":55133")
	if err != nil {
		log.Println("error:", err)
	}
	log.Printf("Started")
	srv := grpc.NewServer()
	chat.RegisterChatsServer(srv, &server{})
	reflection.Register(srv)

	if e := srv.Serve(listener); e != nil {
		log.Println("error:", e)
	}
}

func (s *server) Join(ctx context.Context, request *chat.SendJoin) (*chat.GetJoin, error) {
	uname := request.Name
	if uname == "" {
		log.Printf("Name cannot be empty")
		return nil, status.Errorf(codes.InvalidArgument,
			"Name cannot be empty")
	}
	if _, ok := users[uname]; ok == false {
		mux.Lock()
		users[uname] = pagegroup{}
		mux.Unlock()
		log.Printf("Name added%s,%d", request.Name, len(users))
	} else {
		log.Printf("Name already present")
	}
	return &chat.GetJoin{}, nil
}

func (s *server) Send(ctx context.Context, request *chat.SendMessage) (*chat.GetMessage, error) {
	pagevar := page{}
	sender := request.From
	receiver := request.To
	if sender == "" || receiver == "" {
		return nil, status.Errorf(codes.InvalidArgument,
			"Name cannot be empty")
	}
	_, ok := users[sender]
	_, ol := users[receiver]
	if ok == false || ol == false {
		log.Printf("Name not found")
		return nil, status.Errorf(codes.InvalidArgument,
			"Name not found")
	} else {
		pagevar.Time = time.Now()
		pagevar.Id = 245
		pagevar.To = receiver
		pagevar.From = sender
		pagevar.Message = request.Smsg
		mux.Lock()
		s := users[sender]
		r := users[receiver]
		users[sender] = pagegroup{append(s.group, pagevar)}
		users[receiver] = pagegroup{append(r.group, pagevar)}
		mux.Unlock()

		log.Printf("Received:%v and \n %v", users[sender], users[receiver])
	}
	return &chat.GetMessage{Id: pagevar.Id, From: pagevar.From, To: pagevar.To, Rmsg: pagevar.Message, Time: pagevar.Time.String()}, nil
}

func (s *server) Message(ctx context.Context, request *chat.SendAllMessage) (*chat.GetAllMessage, error) {
	ofName := request.Usr
	if _, ok := users[ofName]; ok == false {
		return nil, status.Errorf(codes.InvalidArgument,
			"Name not found")
	}
	full := make([]*chat.GetMessage, len(users[ofName].group))
	for index, ele := range users[ofName].group {
		allmsg := &chat.GetMessage{}
		allmsg.Id = ele.Id
		allmsg.From = ele.From
		allmsg.To = ele.To
		allmsg.Rmsg = ele.Message
		allmsg.Time = ele.Time.String()
		full[index] = allmsg
	}

	return &chat.GetAllMessage{Msgs: full}, nil
}

func (s *server) Users(ctx context.Context, request *chat.SendUsers) (*chat.GetUsers, error) {
	log.Printf("users")
	mux.Lock()
	keys := make([]string, 0, len(users))
	for k := range users {
		keys = append(keys, k)
	}
	mux.Unlock()
	log.Printf("Users: %v", keys)
	return &chat.GetUsers{Names: keys}, nil
}
