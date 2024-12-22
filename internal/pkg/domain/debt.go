package domain

import "time"

type Debt struct {
	ID         string    `db:"id"`
	CreditorID string    `db:"creditor_id"`
	DebitorID  string    `db:"debitor_id"`
	GangID     string    `db:"gang_id"`
	Amount     int64     `db:"amount"`
	CreatedAt  time.Time `db:"created_at"`
}
