-- +goose Up
-- +goose StatementBegin
create table if not exists gang (
    id   text primary key,
    name text not null,

    created_at timestamp with time zone default now() not null
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table if exists gang;
-- +goose StatementEnd
