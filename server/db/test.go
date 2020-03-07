package db

type Test struct {
	ID         string `gorm:"primary_key;unique;type:varchar(64)" json:"id"`
	Name       string `gorm:"not null;unique;type:varchar(100);" json:"name"`
	CreateAt   uint64 `json:"create_at"`
	CreateDate int64  `gorm:"not null;" json:"create_date"`
	UpdateAt   uint64 `json:"update_at"`
	UpdateDate int64  `gorm:"not null;" json:"update_date"`
}
