package db

type Dict struct {
	ID          string `gorm:"primary_key;unique;type:varchar(64)" json:"id"`
	Name        string `gorm:"not null;unique;type:varchar(100);" json:"name"`
	Description string `gorm:"type:varchar(255);" json:"description"`
	CreateAt    uint64 `gorm:"type:varchar(64)" json:"create_at"`
	CreateDate  int64  `gorm:"not null;" json:"create_date"`
	UpdateAt    uint64 `gorm:"type:varchar(64)" json:"update_at"`
	UpdateDate  int64  `gorm:"not null;" json:"update_date"`

	Value []Value `gorm:"many2many:dict_value;"`
}

type Value struct {
	ID          string `gorm:"primary_key;unique;type:varchar(64)" json:"id"`
	Name        string `gorm:"not null;unique;type:varchar(100);" json:"name"`
	Sort        int    `gorm:"type:int(10)" json:"sort"`
	CreateAt    uint64 `gorm:"type:varchar(64)" json:"create_at"`
	CreateDate  int64  `gorm:"not null;" json:"create_date"`
	UpdateAt    uint64 `gorm:"type:varchar(64)" json:"update_at"`
	UpdateDate  int64  `gorm:"not null;" json:"update_date"`
}