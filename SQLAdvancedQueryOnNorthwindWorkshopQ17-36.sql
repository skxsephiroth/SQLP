/* Solution for SQL Select Workshop */

--Q17
select customerid, count(orderid) as numberOfOrdersMade 
from orders 
group by customerid 

--Q18
select companyname, orderid
from customers join Orders 
on customers.CustomerID = orders.CustomerID 
where customers.customerid = 'bonap'

--Q19a
select count(orderid) as numberOfOrdersMade, customers.CustomerID, companyname
from orders join Customers
on customers.CustomerID = orders.CustomerID
group by customers.CustomerID, companyname
order by numberOfOrdersMade desc

--Q19b
select count(orderid) as numberOfOrdersMade, customers.CustomerID, companyname
from orders join Customers
on customers.CustomerID = orders.CustomerID
where customers.customerid = 'bonap'
group by customers.CustomerID, companyname

--Q19c
select count(orderid) as numberOfOrdersMade, customers.CustomerID, companyname
from orders join Customers
on customers.CustomerID = orders.CustomerID
group by customers.CustomerID, companyname
having count(orderid) > 17
 
--Q20a
select *
from products
where CategoryID = 1 or CategoryID = 2
order by productid, productname

--Q20b
select *
from products
where CategoryID in
	(select CategoryID 
	 from Categories 
	 where categoryname = 'beverages' or categoryname = 'condiments') 
order by productid, productname

select *
from products join Categories 
on products.CategoryID = Categories.CategoryID
where categoryname = 'beverages' or categoryname = 'condiments'
order by productid, productname

--Q21a
select count(*)
from Employees 

--Q21b
select count(*)
from Employees 
where country = 'usa'

--Q22
select *
from orders  
where shipvia = 2 and EmployeeID in
	(select EmployeeID  
	 from Employees  
	 where title = 'sales representative') 

--Q23
select staff.lastname, manager.lastname as manager
from Employees staff left join Employees manager
on staff.reportsto = manager.EmployeeID 

--Q24
select top 5 *
from [Order Details]  
order by discount desc

select productid, unitprice*discount as discountInDollars
from [Order Details]
group by productid, discountInDollar  
order by discountInDollars desc

--Q25
select customers.companyname, suppliers.city
from customers left join suppliers
on customers.city = suppliers.city
where suppliers.city is null

--Q26
select customers.companyname, suppliers.city
from customers join suppliers
on customers.city = suppliers.city

--Q27a
select companyname, address, phone
from customers
union
select companyname, address, phone
from suppliers

--Q27b
select companyname, address, phone
from customers
union
select companyname, address, phone
from suppliers
union
select companyname, null, phone
from shippers

--Q28
select *
from orders
where orderid = 10248

select *
from Employees 
where EmployeeID = 5

select lastname
from Employees 
where employeeid = 2

select manager.lastname
from Employees staff join Employees manager
on staff.ReportsTo = manager.EmployeeID
where staff.reportsto in
	(select ReportsTo
	 from Employees 
	 where employeeid in
		(select employeeid
		 from orders 
		 where orderid = 10248)
	)

--Q29
select *
from products
where unitprice > 
	(select avg(unitprice)
	 from products)

--Q30
select *, unitprice * quantity as amount
from [Order Details] 
where unitprice * quantity > 10000

--Q31
select [Order Details].orderid, unitprice * quantity as amount, customerid
from [Order Details] join Orders 
on [Order Details].orderid = orders.OrderID
where unitprice * quantity > 10000

--Q32
select [Order Details].orderid, unitprice * quantity as amount, orders.customerid, companyname
from [Order Details] join Orders 
on [Order Details].orderid = orders.OrderID 
join customers
on orders.customerid = customers.customerid
where unitprice * quantity > 10000

--Q33
select customerid, sum(unitprice * quantity) as amount
from [Order Details] join Orders 
on [Order Details].orderid = orders.OrderID
group by CustomerID 

--Q34
/*
select avg(amount)
from (
	select orderid, sum(unitprice * quantity) as amount
	from [Order Details]  
	group by orderid
	) as inner_query */ --this gives the average of each order id, not grouped by customer id
select avg(amount)
from (
	 select customerid, sum(unitprice * quantity) as amount
	 from [Order Details] join Orders 
	 on [Order Details].orderid = orders.OrderID
	 group by CustomerID 
	 ) as inner_query

--Q35
select sum(unitprice * quantity) as amount, orders.customerid, companyname
from [Order Details] join Orders 
on [Order Details].orderid = orders.OrderID 
join customers
on orders.customerid = customers.customerid
group by orders.customerid, companyname
having sum(unitprice * quantity) > 15220.6583

--Q36
select customerid, sum(unitprice * quantity) as amount
from [Order Details] join Orders 
on [Order Details].orderid = orders.OrderID
where year(orders.orderdate) = 1997
group by CustomerID 
