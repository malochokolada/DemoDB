create database [TradeThree]
go


create table [OrderStatus] /*������ ������*/
(
	OrderStatusID int primary key identity,
	OrderStatus nvarchar(max) not null
)

create table [City]
(
	CityID int primary key identity,
	CityName nvarchar(max) not null
)

create table [OrderPickupPoint] /*����� ������ �������*/
(
	OrderPickupPointID int primary key identity,
	Postcode int not null, /*�������� ������*/
	CityID int foreign key references [City](CityID) not null,
	StreetName nvarchar(max) not null, /*�������� �����*/
	HouseNumber int not null /*����� ���� */
)


create table [Role] /*����*/
(
	RoleID int primary key identity,
	RoleName nvarchar(100) not null
)




create table [ProductName] /*�������� ��������*/
(
	ProductNameID int primary key identity,
	ProductName nvarchar(100) not null
)

create table [ProductCategory] /*��������� ��������*/
(
	ProductCategoryID int primary key identity,
	ProductCategory nvarchar(100) not null
)

create table [ProductManufacturer] /*������������� ��������*/
(
	ProductManufacturerID int primary key identity,
	ProductManufacturer nvarchar(max) not null
)

create table [ProductSupplier] /*������������� ��������*/
(
	ProductSupplierID int primary key identity,
	ProductSupplier nvarchar(max) not null
)





create table Product /*�������*/
(
	ProductArticleNumber nvarchar(100) primary key, /*������� ��������*/

	ProductNameID int foreign key references [ProductName](ProductNameID) not null, /*�������� ��������*/

	ProductDescription nvarchar(max) not null, /*�������� ��������*/

	ProductCategory int foreign key references [ProductCategory](ProductCategoryID) not null, /*��������� ��������*/

	ProductPhoto image not null, /*���� ��������*/

	ProductManufacturer int foreign key references [ProductManufacturer](ProductManufacturerID) not null, /*������������� ��������*/

	ProductSupplier int foreign key references [ProductSupplier](ProductSupplierID) not null, /*��������� �������� ��������*/

	ProductCost  decimal(19,4) not null, /*��������� ��������*/ 

	ProductDiscountAmount tinyint null,  /*����� ������ �� �������*/

	ProductQuantityInStock int not null, /*���������� ������ �� ������*/

	ProductStatus nvarchar(max) not null, /*������ ��������. ��� ������ ����???*/
	)



create table [User] /*������������*/
(
	UserID int primary key identity,

	UserSurname nvarchar(100) not null,

	UserName nvarchar(100) not null,

	UserPatronymic nvarchar(100) not null,

	UserLogin nvarchar(max) not null,

	UserPassword nvarchar(max) not null,

	UserRole int foreign key references [Role](RoleID) not null
)

create table [InformationOfOrder] /*���������� � ������*/
(
	InformationOfOrderID int primary key identity,
	UserID int foreign key references [User](UserID) not null,
	OrderDatedatetime datetime not null, /*���� ������*/
	ProductArticleNumber nvarchar(100) foreign key references [Product](ProductArticleNumber) not null,/*������� ��������*/
	ProductQuantity int not null,
	Amount tinyint null, /*������*/
)

create table [Order] /*�����*/
(
	OrderID int primary key identity, /*id ������*/
	InformationOfOrderID int foreign key references [InformationOfOrder](InformationOfOrderID) not null, /*���������� � ������*/
    OrderStatusID int foreign key references [OrderStatus](OrderStatusID) not null, /*������ ������*/
	OrderDeliveryDate datetime not null, /*���� �������� ������*/
	OrderPickupPointID int foreign key references [OrderPickupPoint](OrderPickupPointID) not null, /*����� ������ �������*/

	
)

