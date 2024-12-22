-- +goose Up
-- +goose StatementBegin
create table if not exists bro (
    id      text primary key,
    gang_id text not null,
    name    text not null,
    color   text not null,

    created_at timestamp with time zone default now() not null
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table if exists bro;
-- +goose StatementEnd
