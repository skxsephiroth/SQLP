/* Solution for SQL Select Workshop */

--Q1a
select *
from shippers

--Q1b
select *
from shippers
order by CompanyName

--Q2a
select FirstName, LastName, Title, BirthDate, City
from employees

--Q2b
select distinct Title
from employees

--Q3
select *
from orders
where orderdate = '1997-05-19'

--Q4
select *
from customers
where city = 'london' or city = 'madrid'

--Q5
select CustomerID, CompanyName
from customers
where country = 'uk'
order by CompanyName

--Q6
select OrderID, OrderDate
from orders
where CustomerID = 'hanar'

--Q7
select TitleOfCourtesy+ FirstName+ LastName as FullyQualifiedName
from employees
order by LastName

--Q8
select orderid, orderdate
from orders
where customerid = 'maisd'

--Q9
select *
from products
where productname like '%lager%'

--Q10
select customerid, contactname
from customers
where customerid not in 
(select customerid
from orders)
/*
select customerid, ContactName
from customers
where customerid in
(select customerid
from orders
where orderid in
(select orderid
from [Order Details]
where productid in
(select productid
from products
where Unitsonorder = 0)))
*/

--Q11
select avg(unitprice)
from products

--Q12
select distinct city
from customers

--Q13
select count(distinct customerid)
from orders

--Q14
select companyname, phone 
from customers
where fax is null

--Q15
select sum(UnitPrice * Quantity) as TotalPrice
from [Order Details];

--Q16
select * 
from orders
where customerid in
(select customerid
from customers
where companyname = 'alan out' or companyname = 'blone coy')
