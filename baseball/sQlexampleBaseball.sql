alter table orders
add foreign key (Customerid) references Customer (id);

alter table orders
add foreign key (ProductId) references Product (id);