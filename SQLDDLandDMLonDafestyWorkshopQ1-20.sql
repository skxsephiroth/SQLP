/* Solution for SQL DDL Workshop */

drop table GoodCustomers
drop table MemberCategories 

--Q1
create table MemberCategories
(MemberCategory nvarchar(2) not null,
 MemberCatDescription nvarchar(200) not null,
 primary key (MemberCategory))

--Q2
insert into MemberCategories 
values ('A', 'Class A Members')
insert into MemberCategories 
values ('B', 'Class B Members')
insert into MemberCategories 
values ('C', 'Class C Members')

--Q3
create table GoodCustomers
(CustomerName nvarchar(50) not null,
 Address nvarchar(65),
 PhoneNumber nvarchar(9) not null,
 MemberCategory nvarchar(2),
 primary key (CustomerName, PhoneNumber),
 foreign key (MemberCategory) references MemberCategories)

--Q4
insert into GoodCustomers
(CustomerName, PhoneNumber, MemberCategory)
select CustomerName, PhoneNumber, MemberCategory 
from customers
where MemberCategory in ('A', 'B')

--Q5
insert into GoodCustomers
(CustomerName, PhoneNumber, MemberCategory)
values ('Tracy Tan', 736572, 'B')

--Q6
insert into GoodCustomers
values ('Grace Leong', '15 Bukit Purmei Road, Singapore 0904', 278865, 'A')

--Q7
insert into GoodCustomers
values ('Lynn Lim', '15 Bukit Purmei Road, Singapore 0904', 278865, 'P')
--conflict with foreign key constraint

--Q8
update GoodCustomers 
set address = '22 Bukit Purmei Road, Singapore 0904'
where CustomerName = 'Grace Leong'

--Q9
update GoodCustomers 
set MemberCategory = 'B'
where CustomerName in
				(select CustomerName 
				 from Customers 
				 where customerid = 5108)
				 
--Q10
delete from GoodCustomers 
where CustomerName = 'Grace Leong'

--Q11
delete from GoodCustomers 
where MemberCategory = 'B'

--Q12
alter table GoodCustomers
add FaxNumber nvarchar(25)

--Q13
alter table GoodCustomers
alter column Address nvarchar(80)

--Q14
alter table GoodCustomers
add ICNumber nvarchar(10)

--Q15
create unique index ICIndex on 
GoodCustomers(ICNumber)
-- duplicate key was found

--Q16
create index FaxIndex on 
GoodCustomers(FaxNumber) -- if you see red lines, SQL is not powerful enough to detect table or column recently created.

--Q17
drop index FaxIndex on GoodCustomers

--Q18
alter table GoodCustomers
drop column FaxNumber

--Q19
delete from GoodCustomers

--Q20
drop table GoodCustomers


 