create database [Trade]
go
use [Trade]
go
create table [Role]
(
	RoleID int primary key identity,
	RoleName nvarchar(max) not null
)
go
create table PickupPoints
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
	UserRole int foreign key references [Role](RoleID) not null
)
go
create table [Order]
(
	OrderID int primary key identity,
	OrderDate datetime not null,
	OrderDeliveryDate datetime not null,
	OrderPickupPoint int foreign key references PickupPoints(PickupPointID) not null,
	CostumerCredentials varchar(max),
	OrderDeliveryCode int not null,
	OrderStatus nvarchar(max) not null,
)
go
create table Product
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
	ProductPhotoPath varchar(max) null,
	--ProductStatus nvarchar(max) not null,
)
go
create table OrderProduct
(
	ID int primary key identity,
	OrderID int foreign key references [Order](OrderID) not null,
	ProductArticleNumber nvarchar(100) foreign key references Product(ProductArticleNumber) not null,
	ProductCount int not null,
)
go