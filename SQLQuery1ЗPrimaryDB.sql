create database [TradeThree]
go


create table [OrderStatus] /*статус заказа*/
(
	OrderStatusID int primary key identity,
	OrderStatus nvarchar(max) not null
)

create table [City]
(
	CityID int primary key identity,
	CityName nvarchar(max) not null
)

create table [OrderPickupPoint] /*Пункт выдачи заказов*/
(
	OrderPickupPointID int primary key identity,
	Postcode int not null, /*почтовый индекс*/
	CityID int foreign key references [City](CityID) not null,
	StreetName nvarchar(max) not null, /*название улицы*/
	HouseNumber int not null /*номер дома */
)


create table [Role] /*роль*/
(
	RoleID int primary key identity,
	RoleName nvarchar(100) not null
)




create table [ProductName] /*название продукта*/
(
	ProductNameID int primary key identity,
	ProductName nvarchar(100) not null
)

create table [ProductCategory] /*категория продукта*/
(
	ProductCategoryID int primary key identity,
	ProductCategory nvarchar(100) not null
)

create table [ProductManufacturer] /*Производитель продукта*/
(
	ProductManufacturerID int primary key identity,
	ProductManufacturer nvarchar(max) not null
)

create table [ProductSupplier] /*Производитель продукта*/
(
	ProductSupplierID int primary key identity,
	ProductSupplier nvarchar(max) not null
)





create table Product /*продукт*/
(
	ProductArticleNumber nvarchar(100) primary key, /*Артикул продукта*/

	ProductNameID int foreign key references [ProductName](ProductNameID) not null, /*название продукта*/

	ProductDescription nvarchar(max) not null, /*описание продукта*/

	ProductCategory int foreign key references [ProductCategory](ProductCategoryID) not null, /*категория продукта*/

	ProductPhoto image not null, /*фото продукта*/

	ProductManufacturer int foreign key references [ProductManufacturer](ProductManufacturerID) not null, /*Производитель продукта*/

	ProductSupplier int foreign key references [ProductSupplier](ProductSupplierID) not null, /*поставщик продукта продукта*/

	ProductCost  decimal(19,4) not null, /*стоимость продукта*/ 

	ProductDiscountAmount tinyint null,  /*Сумма скидки на продукт*/

	ProductQuantityInStock int not null, /*Количество товара на складе*/

	ProductStatus nvarchar(max) not null, /*Статус продукта. Оно вообще надо???*/
	)



create table [User] /*пользователь*/
(
	UserID int primary key identity,

	UserSurname nvarchar(100) not null,

	UserName nvarchar(100) not null,

	UserPatronymic nvarchar(100) not null,

	UserLogin nvarchar(max) not null,

	UserPassword nvarchar(max) not null,

	UserRole int foreign key references [Role](RoleID) not null
)

create table [InformationOfOrder] /*ИНОФРМАЦИЯ О ЗАКАЗЕ*/
(
	InformationOfOrderID int primary key identity,
	UserID int foreign key references [User](UserID) not null,
	OrderDatedatetime datetime not null, /*Дата заказа*/
	ProductArticleNumber nvarchar(100) foreign key references [Product](ProductArticleNumber) not null,/*Артикул продукта*/
	ProductQuantity int not null,
	Amount tinyint null, /*скидка*/
)

create table [Order] /*заказ*/
(
	OrderID int primary key identity, /*id заказа*/
	InformationOfOrderID int foreign key references [InformationOfOrder](InformationOfOrderID) not null, /*ИНФОРМАЦИЯ О ЗАКАЗЕ*/
    OrderStatusID int foreign key references [OrderStatus](OrderStatusID) not null, /*статус заказа*/
	OrderDeliveryDate datetime not null, /*Дата доставки заказа*/
	OrderPickupPointID int foreign key references [OrderPickupPoint](OrderPickupPointID) not null, /*Пункт выдачи заказов*/

	
)

