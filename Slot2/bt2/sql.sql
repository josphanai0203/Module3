create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int primary key,
CName varchar(50),
cAge int,
check (cAge >=18)
);
create table Product(
pID int primary key,
pName varchar(50),
pPrice double
);
create table `Order`(
oID int primary key,
cID int ,
oDate date,
oTotalPrice double,
foreign key (cID) references Customer(cID)
);
create table OrderDetail(
oID int,
pID int,
odQTY varchar(255),
primary key (oID,pID),
foreign key (oID) references `Order`(oID),
foreign key (pID) references Product(pID)
);