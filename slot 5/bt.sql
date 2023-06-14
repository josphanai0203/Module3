create database demo;
use demo;
create table Products(
Id int primary key,
productCode int not null,
productName varchar(45),
productPrice double,
productAmount double,
productDescription varchar(255),
productStatus varchar(45));

insert into products values(2,2,"Vui",40,500,"asddfb","qttym");
create unique index productcode on  Products(productCode);
create unique index ProductNamePrice on  Products( productName,productPrice);
explain select productCode from Products;

create view info as select productCode, productName, productPrice, productStatus from products;
update info
set productName = "Dell"
where productCode = 2;
drop view info;

delimiter //
create procedure allInfo()
begin
select * from products;
end //
delimiter ;
call allInfo();

delimiter //
create procedure InsertProduct(in id int,in codeP int,in nameP varchar(45) ,in productPrice double,in productAmount double,in productDescription varchar(255) , in productStatus varchar(45))
begin
insert into products values(id,codeP,nameP,productPrice,productAmount,productDescription,productStatus);
end //
delimiter ;
call InsertProduct(3,3,"HP",70,800,"jdis","djsijd");
call allInfo();

