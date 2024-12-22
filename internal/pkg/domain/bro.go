package domain

import "time"

type Bro struct {
	ID        string    `db:"id"`
	GangID    string    `db:"gang_id"`
	Name      string    `db:"name"`
	Color     string    `db:"color"`
	CreatedAt time.Time `db:"created_at"`
}
