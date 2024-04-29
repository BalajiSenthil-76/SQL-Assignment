drop database if exists  techshop;
create database techshop;
use  techshop;

drop table if exists customers;

create table customers
(
customerID int primary key ,
firstname varchar(30),
lastname varchar(35),
email varchar(30),
phone varchar(30),
address varchar(100));

Desc customers; 

create table products
(productid int primary key ,
productname varchar(30),
description varchar(150),
price numeric(10,3));

desc products;

create table orders
(
orderid int primary key auto_increment,
customerID int,
orderdate date,
totalamount numeric(10,3),
foreign key(customerID) references  customers(customerID));

desc orders;



create table orderdetails
(
Orderdetail_ID int primary key ,
orderid int auto_increment,
productid int,
quantity int,
foreign key(orderid) references orders(orderid),
foreign key(productid) references products(productid));

desc orderdetails;

create table inventory
(inventoryid int primary key auto_increment,
productid int,
quantityinStock int,
laststockUpdate date,
foreign key(productid) references products(productid));

desc inventory;

insert into customers (CustomerID,firstname,lastname,email,phone,address)
values(101,'Amal','Davis','am567@gmail.com',9685123457,'4/124, vivekanandar steet,Chennai'),
(102,'Reenu','M','rnu65@gmail.com',9654712764,'no.420, Abbas nagar,Thiruvallur'),
(103,'karthiga','k','kgi597@gmail.com',9651548237,'18/9 ramlal steet,poonamalle'),
(104,'Aathi','R','armv457@gmail.com',8645759532,'23/4, Red rose street,Guindy'),
(105,'Sachin','Santhosh','SRM2@gmail.com',7339123739,'17/5, naachiyaar steet,kundrathur'),
(106,'Thomas','j','tom124@gmail.com',6562359865,'57/6, nambiyaarr steet,Mylapore'),
(107,'Niharika','w','nrvi64@gmail.com',9865004291,'3/18, Majeeth steet,porur'),
(108,'subin','sm','Snu45@gmail.com',8508424791,'5/45, thiruvalluvar steet,Saidapet'),
(109,'Vikas','m','vurum122@gmail.com',8778947054,'65/8, pillaiyar kovil street,vadapalani'),
(110,'Shoby','Chand','sbim56@gmail.com',8778047281,'98/56, aandal sannidhi street,vpaakam');

select* from customers;

insert into products(productid,productname,description,price)
values
(6500,'Laptop 1', '15.6" Intel Core i3, 4GB RAM, 512GB HDD', 1299.99),
(6501,'Laptop', '15.6" Intel Core i7, 16GB RAM, 512GB SSD', 1299.99),
(6502,'Smartphone', '6.5" OLED Display, 128GB Storage, 5G', 899.50),
(6503,'Headphones', 'Wireless Bluetooth Headphones with Noise Cancellation', 149.95),
(6504,'Smartwatch', 'Fitness Tracker with Heart Rate Monitor', 1999.99),
(6505,'Tablet', '10.2" Retina Display, 128GB Storage', 8450.75),
(6506,'Camera', '20MP DSLR Camera with 18-55mm Lens Kit', 799.00),
(6507,'Speaker', 'Wireless Bluetooth Speaker with 360-degree Sound', 9950.99),
(6508,'Monitor', '27" QHD IPS Monitor with HDR Support', 10549.50),
(6509,'Keyboard', 'Mechanical Gaming Keyboard with RGB Backlighting', 799.95),
(6510,'Mouse', 'Wireless Optical Mouse with Programmable Buttons', 390.99);

select * from products;


-- for performing delete operation-- 

insert into orders ( customerID,orderdate, totalamount) values
(101,'2024-04-01', 2398.50),
(102,'2024-04-02', 59700.75),
(103,'2024-04-03', 3596.00),
(104,'2024-04-04', 50700.99),
(105,'2024-04-05', 2397.25),
(106,'2024-04-06', 5593.00),
(107,'2024-04-07', 42196.95),
(108,'2024-04-08', 11691.50),
(109,'2024-04-09', 596.99),
(110,'2024-04-10', 3998.00);

select * from orders;

insert into orderdetails (Orderdetail_ID,productid,quantity)
values(1111,6501,2),
(1112,6507,6),
(1113,6502,4),
(1114,6505,6),
(1115,6506,3),
(1116,6509,7),
(1117,6508,4),
(1118,6501,9),
(1119,6503,4),
(1120,6504,2);
select * from orderdetails;

insert into inventory(inventoryid,productid,quantityinStock,laststockUpdate)
VALUES
(9801, 6501, 5,'2024-04-01'),
(9802, 6502, 9,'2024-04-02'),
(9803, 6503, 7,'2024-04-03'),
(9804, 6504, 6,'2024-04-04'),
(9805, 6505, 7,'2024-04-05'),
(9806, 6506, 6,'2024-04-06'),
(9807, 6507, 15,'2024-04-07'),
(9808, 6508, 20,'2024-04-08'),
(9809, 6509, 15,'2024-04-09'),
(9810, 6510, 20,'2024-04-10');

select*from inventory;

create table orderscopy
(
orderid int primary key auto_increment,
customerID int,
orderdate date,
totalamount numeric(10,3),
foreign key(customerID) references  customers(customerID));
desc orderscopy;

insert into orderscopy ( customerID,orderdate, totalamount) values
(101,'2024-04-01', 2398.50),
(102,'2024-04-02', 59700.75),
(103,'2024-04-03', 3596.00),
(104,'2024-04-04', 50700.99),
(105,'2024-04-05', 2397.25),
(106,'2024-04-06', 5593.00),
(107,'2024-04-07', 42196.95),
(108,'2024-04-08', 11691.50),
(109,'2024-04-09', 596.99),
(110,'2024-04-10', 3998.00);

select * from orderscopy;

create table orderdetailscopy
(
Orderdetail_ID int primary key ,
orderid int auto_increment,
productid int,
quantity int,
foreign key(orderid) references orders(orderid),
foreign key(productid) references products(productid));

desc orderdetailscopy;
insert into orderdetailscopy (Orderdetail_ID,productid,quantity)
values(1111,6501,2),
(1112,6507,6),
(1113,6502,4),
(1114,6505,6),
(1115,6506,3),
(1116,6509,7),
(1117,6508,4),
(1118,6501,9),
(1119,6503,4),
(1120,6504,2);
select * from orderdetailscopy;

