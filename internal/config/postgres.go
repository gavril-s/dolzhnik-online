package config

import (
	"fmt"

	"github.com/jmoiron/sqlx"
)

func ConnectToPostgers(env Env) (*sqlx.DB, error) {
	conn, err := sqlx.Connect(
		"postgres",
		fmt.Sprintf(
			"host=%s port=%s user=%s password=%s dbname=%s sslmode=disable",
			env.DBHost, env.DBPort, env.DBUser, env.DBPassword, env.DBName,
		),
	)
	if err != nil {
		return nil, err
	}
	return conn, nil
}
