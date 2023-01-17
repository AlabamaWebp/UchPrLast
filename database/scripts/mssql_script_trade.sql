create database [Trade]
go
use [Trade]
go
create table [UserRoles]
(
	RoleID int primary key identity,
	RoleName varchar(max) not null,
)
go
create table [PickupPoints]
(
	PickupPointID int primary key identity,
	PickupPointName varchar(max),
)
go
create table [User]
(
	UserID int primary key identity,
	UserSurname nvarchar(100) not null,
	UserName nvarchar(100) not null,
	UserPatronymic nvarchar(100) not null,
	UserLogin nvarchar(max) not null,
	UserPassword nvarchar(max) not null,
	UserRoleID int foreign key references UserRoles(RoleID) not null,
)
go
create table [Product]
(
	ProductArticleNumber nvarchar(100) primary key,
	ProductName nvarchar(max) not null,
	ProductUnits nvarchar(max) not null,
	ProductCost decimal(19,4) not null,
	ProductMaxDiscount int default(0),
	ProductManufacturer nvarchar(max) not null,
	ProductRetailer nvarchar(max) not null,
	ProductCategory nvarchar(max) not null,
	ProductDiscountAmount int default(0),
	ProductQuantityInStock int not null,
	ProductDescription nvarchar(max) not null,
	ProductPhotoPath varchar(max) default(null),
)
go
create table [Order]
(
	OrderID int primary key identity,
	OrderContainer varchar(max) not null,
	OrderUserID int foreign key references [User](UserID) default(null),
	OrderPickupPoint int foreign key references PickupPoints(PickupPointID) not null,
	OrderTotal int not null,
	OrderDeliveryCode int not null,
	OrderDate datetime not null,
	OrderDeliveryDate datetime not null,
	OrderStatus nvarchar(max) not null,
)
go
create table [OrderProduct]
(
	ID int primary key identity,
	OrderID int foreign key references [Order](OrderID) not null,
	ProductArticleNumber nvarchar(100) foreign key references Product(ProductArticleNumber) not null,
	ProductCount int not null,
)
go
create table [Cart]
(
	OrderID int primary key identity,
	OrderContainer varchar(max) not null,
	OrderUserID int foreign key references [User](UserID) default(null),
	OrderTotal int not null,
)
go