package config

import (
	"os"
	"reflect"
)

type Env struct {
	DBHost     string `env:"DB_HOST"`
	DBPort     string `env:"DB_PORT"`
	DBUser     string `env:"DB_USER"`
	DBPassword string `env:"DB_PASSWORD"`
	DBName     string `env:"DB_NAME"`
}

func ReadEnv() Env {
	var env Env

	envType := reflect.TypeOf(env)
	for i := range envType.NumField() {
		field := envType.Field(i)
		envKey := field.Tag.Get("env")
		envVal := os.Getenv(envKey)
		reflect.ValueOf(&env).Elem().FieldByName(field.Name).SetString(envVal)
	}

	return env
}
