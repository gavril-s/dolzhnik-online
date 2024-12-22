-- +goose Up
-- +goose StatementBegin
create table if not exists debt (
    id          text   primary key,
    creditor_id text   not null,
    debitor_id  text   not null,
    gang_id     text   not null,
    amount      bigint not null,

    created_at timestamp with time zone default now() not null
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
drop table if exists debt;
-- +goose StatementEnd
