package main

import (
	"log"

	"github.com/gavril-s/dolzhnik-online/internal/config"
)

func main() {
	env := config.ReadEnv()
	db, err := config.ConnectToPostgers(env)
	if err != nil {
		log.Fatal(err)
	}
}
