package main

import (
	"chat"
	"context"
	"log"
	"net"
	"time"

	"./sqlconnect"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
)

type server struct{}

func main() {
	listener, err := net.Listen("tcp", ":8080")
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
	sqlconnect.Userdao(uname)
	return &chat.GetJoin{}, nil
}

func (s *server) Send(ctx context.Context, request *chat.SendMessage) (*chat.GetMessage, error) {
	sender := request.From
	receiver := request.To
	if sender == "" || receiver == "" {
		return nil, status.Errorf(codes.InvalidArgument,
			"Name cannot be empty")
	}
	uid := sqlconnect.Senddao(receiver, sender, request.Smsg)
	return &chat.GetMessage{Id: int64(uid), From: sender, To: receiver, Rmsg: request.Smsg, Time: time.Now().String()}, nil
}

func (s *server) Message(ctx context.Context, request *chat.SendAllMessage) (*chat.GetAllMessage, error) {
	ofName := request.Usr
	grp := sqlconnect.Allmessages(ofName)

	full := make([]*chat.GetMessage, 0)
	for _, ele := range grp {
		allmsg := &chat.GetMessage{}
		allmsg.Id = ele.Id
		allmsg.From = ele.From
		allmsg.To = ele.To
		allmsg.Rmsg = ele.Message
		allmsg.Time = ele.Time.String()
		full = append(full, allmsg)
	}

	return &chat.GetAllMessage{Msgs: full}, nil
}

func (s *server) Users(ctx context.Context, request *chat.SendUsers) (*chat.GetUsers, error) {
	keys := sqlconnect.Allusers()
	log.Printf("Users: %v", keys)
	return &chat.GetUsers{Names: keys}, nil
}
