package sqlconnect

//package main

import (
	"database/sql"
	//"fmt"
	"log"
	"time"

	_ "github.com/lib/pq"
)

func main() {
	/*connStr := "user=postgres dbname=mydb password=test123 host=127.0.0.1 sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	rows, err := db.Query("SELECT * FROM mydbschema.table1")
	//log.Fatal(db)
	//log.Fatal(rows)
	for rows.Next(){
		var i int
		var p string
		err := rows.Scan(&i, &p)
		if err != nil {
			log.Fatal(err)
		}
		log.Fatal("returned:",i, p)
	}
	db.Close()
	name := "krishna"
	Userdao(name)
	namet := "Gaurav"
	namef := "krishna"
	msg := "Hello"
	Senddao(namet, namef, msg)*/
	//name := "Radha"
	//Allmessages(name)
}

func connection() (*sql.DB, error) {
	connStr := "user=postgres dbname=mydb password=test123 host=127.0.0.1 sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Printf("%v", err)
		return nil, err
	}
	return db, nil
}
func Userdao(name string) {
	db, err := connection()
	if err != nil {
		log.Printf("%v", err)
		return
	}
	defer db.Close()
	rows, err := db.Query("SELECT * FROM mydbschema.users")
	for rows.Next() {
		var nm string
		err := rows.Scan(&nm)
		if err != nil {
			log.Printf("%v", err)
			return
		}
		if nm == name {
			return
		}
	}
	statement := "INSERT INTO mydbschema.users VALUES ($1)"
	_, er := db.Exec(statement, name)
	if er != nil {
		log.Printf("%v", err)
	}
}

func Senddao(to string, from string, message string) (id int) {
	db, err := connection()
	if err != nil {
		log.Printf("%v", err)
		return
	}
	defer db.Close()
	rows, e := db.Query("SELECT * FROM mydbschema.users WHERE name = $1", to)
	if e != nil {
		log.Printf("%v", e)
		return
	}
	if !rows.Next() {
		return
	}

	lastInsertId := 0
	er := db.QueryRow("INSERT INTO mydbschema.messages (frm, rec, message, time) VALUES ($1, $2, $3, $4) RETURNING id", from, to, message, time.Now()).Scan(&lastInsertId)

	//log.Printf("Entery:%d", lastInsertId)
	if er != nil {
		log.Printf("%v", er)
	}
	return lastInsertId
}

type page struct {
	Id      int64
	To      string
	From    string
	Message string
	Time    time.Time
}

func Allmessages(name string) (g []page) {
	db, err := connection()
	if err != nil {
		log.Printf("%v", err)
		return
	}
	defer db.Close()
	row, er := db.Query("SELECT * FROM mydbschema.users WHERE name = $1", name)
	if er != nil {
		log.Printf("%v", er)
		return
	}
	if !row.Next() {
		log.Printf("Name not found")
		return
	}

	rows, e := db.Query("SELECT * FROM mydbschema.messages WHERE frm = $1 OR rec = $2", name, name)
	if e != nil {
		log.Printf("%v", er)
		return
	}

	var (
		id      int
		from    string
		to      string
		message string
	)
	var grp []page
	t := time.Now()
	defer rows.Close()
	for rows.Next() {
		err := rows.Scan(&id, &from, &to, &message, &t)
		if err != nil {
			log.Printf("%v", err)
			return
		}
		//fmt.Println(id, from, to, message, t)
		m := page{}
		m.Id = int64(id)
		m.To = to
		m.From = from
		m.Message = message
		m.Time = t
		grp = append(grp, m)
	}
	//fmt.Println(grp)
	return grp
}

func Allusers() (r []string) {
	db, err := connection()
	if err != nil {
		log.Printf("%v", err)
		return
	}
	rows, err := db.Query("SELECT * FROM mydbschema.users")
	var ret []string
	for rows.Next() {
		var nm string
		err := rows.Scan(&nm)
		if err != nil {
			log.Printf("%v", err)
			return
		}
		ret = append(ret, nm)
	}
	defer db.Close()
	return ret
}
