create table Product
(
	id int primary key identity (1,1),
	ProductName varchar (50)

)

alter table Product 
add Price float;


select *from Product
insert into Product (ProductName, Price) values ('Baseball', 5.95);
insert into Product (ProductName, Price) values ('Bat',6.25);

Create table Orders 
(
	OrderID int primary key identity (1,1),
	OrderDate Datetime,
	CustomerID int, 
	ProductID int
)
select * from Orders;
select * from Product;
select*from Customer;


delete Orders 
where OrderId=21;

insert into Orders (OrderDate, CustomerId,ProductID) values (GETDATE(),
8, 2);