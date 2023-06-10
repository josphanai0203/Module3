use quanlybanhang;
select o.oID , o.odate, sum(p.pPrice * ord.odQTY) as oPrice from orderdetail ord
inner join product p on ord.pID = p.pID
inner join `order` o on ord.oID = o.oID
group by o.oID;
select c.cName, p.pName from `order` o
inner join customer c on c.cID = o.cId 
inner join orderdetail ord on o.oId = ord.oID
inner join product p on p.pID = ord.pID
order by c.cID;
select c.cName from `order` o 
right join customer c on c.cID = o.cID
where o.cID is null



