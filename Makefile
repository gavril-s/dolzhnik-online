DB_CONTAINER_NAME=dolzhnik-db
DB_IMAGE=postgres:17

DB_HOST=localhost
DB_PORT=5432
DB_USER=admin
DB_PASSWORD=adminpass
DB_NAME=dolzhnik

APP_BINARY=app
MIGRATION_DIR=migrations
DB_DATA_DIR=pgdata

include .env

bin-deps:
	go install github.com/pressly/goose/v3/cmd/goose@latest

migration:
	@read -p "Enter migration name: " NAME; \
	[ -z "$$NAME" ] && echo "Migration name is required" && exit 1; \
	goose -dir $(MIGRATION_DIR) create $$NAME sql 

prepare-data-dir:
	@mkdir -p $(DB_DATA_DIR)

start-db:
	@docker run --rm --name $(DB_CONTAINER_NAME) \
	-p $(DB_PORT):5432 \
	-e POSTGRES_USER=$(DB_USER) \
	-e POSTGRES_PASSWORD=$(DB_PASSWORD) \
	-e POSTGRES_DB=$(DB_NAME) \
	-v $(DB_DATA_DIR):/var/lib/postgresql/data \
	-d $(DB_IMAGE)

stop-db:
	@docker kill $(DB_CONTAINER_NAME)

migrate-db:
	goose -dir $(MIGRATION_DIR) postgres "postgres://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)?sslmode=disable" up

run-app:
	go build -o ./builds/$(APP_BINARY) ./cmd
	./builds/$(APP_BINARY)

run: bin-deps start-db migrate-db run-app
