package db

type Test struct {
	ID       		string `gorm:"primary_key;unique;type:varchar(64);"`
	Name     		string `gorm:"not null;unique;type:varchar(100);"`
	CreateAt     	uint64
	CreateDate     	int64 `gorm:"not null;"`
	UpdateAt     	uint64
	UpdateDate     	int64 `gorm:"not null;"`
}