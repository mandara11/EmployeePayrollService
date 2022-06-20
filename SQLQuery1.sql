create database Emp_service

use Emp_service

create table Emppayroll_services
(
  ID int IDENTITY (1,1) primary key,
  Name varchar(10) NOT null,
  salary int,
  Address varchar(20)
 );

 Insert into Emppayroll_services values( 'Sonal',3000,'Mumbai')
 Insert into Emppayroll_services values( 'Shreya',4000,'Mumbai')
 Insert into Emppayroll_services values( 'ABC',3500,'pune')
 Insert into Emppayroll_services values( 'XYZ',3700,'Mumbai')

 select * from Emppayroll_services

 select * from Emppayroll_services where Name = 'sonal'

 select * from Emppayroll_services where Address = 'pune'

 Insert into Emppayroll_services values( 'PQR',3700,'Banglore')
 Insert into Emppayroll_services values( 'DEF',3700,'abc')

 Alter table Emppayroll_services Add Gender varchar(1)


 update Emppayroll_services set Gender ='M'

 update Emppayroll_services set Gender ='F' where name = 'sonal'

 select sum(salary) from Emppayroll_services

 select min(salary) from Emppayroll_services

 create Table Company
(
ID	int,
CompanyName	varchar(255),
constraint Company_foreign_Key_EmpID foreign key(ID) references Emppayroll(ID) on delete cascade
)
create Table Payrollofemployee
(
ID		int,
BasicPay	int,
Deduction	int,
TaxablePay	int,
IncomeTax	int,
NetPay		int
constraint Payrollofemployee_foreign_Key_ID foreign key(ID) references Emppayroll(ID) on delete cascade
)

--UC7:Ability to find avg,min,max and count
select sum(salary) as total_salary from Emppayroll
select avg(salary) as average_salary from Emppayroll
select min(salary) as min_salary from Emppayroll
select max(salary) as max_salary from Emppayroll
select count(salary) as salary_count from Emppayroll

select Gender, sum(salary) as total_salary from Emppayroll group byte Gender
select Gender, count(salary) as salary_count from Emppayroll group byte Gender
select Gender, max(salary) as max_salary from Emppayroll group byte Gender

--:UC8 Add address and department extend the row
alter table employee_payroll add PhoneNumber bigint, Address varchar(150) default('Mumbai'), Department varchar(50);

--UC9: ability to extend basic pay,deduction,tax pay,Income tax, net pay
alter table Emppayroll add Deduction int, TaxablePay int, IncomeTax int, NetPay int;
EXEC sp_RENAME 'Emppayroll.salary', 'BasicPay', 'column'
alter table Emppayroll add BasicPay int ;

--UC10: Add terissa for marketing and sales
insert into Emppayroll(Name, Basicpay, StartDate, Gender) values
    ('Terissa', 15000, '2019-01-01', 'F');
update Emppayroll set Department = 'sales' where Name = 'Terissa';
insert into Emppayroll(Name, Department) values('Terissa', 'Marketing');

--UC11: Create ER Diagram

create Table Comapany
(
 ID int,
 CompanyName varchar(255),
 constraint Company_foreign_key_EmpID foreign key(ID) references Emppaytoll(ID) on delete cascade
)
insert into Company select ID, Name from Emppayroll;
select* from Company;

create Table payrollofemployee
(
    ID int,
    BasicPay int,
    Deduction int,
    TaxablePay int,
    IncomeTax int,
    NetPay int,
    constraint Payrollofemployee_foreign_key_ID foreign key(ID) references Emppayroll(ID) on delete cascade
)
insert into payrollofemployee select ID, BasicPay, Deduction, TaxablePay, IncomeTax, NetPay from Emppayroll;

select * from Emppayroll;
select* from Payrollofemployee
alter table Emppayroll drop column BasicPay, Deduction, TaxablePay, IncomeTax, NetPay;

create table Departmenttable
(
Id int,
Department varchar (20)
constraint Department_foreign_key_ID foreign key(ID) references Emppayroll(ID) on delete cascade
);

insert into Departmenttable select ID, Department from Emppayroll;
altert table Emppayroll drop column Department;

select* from Departmenttable;

--UC12:Ability to perform previous function
select * from Emppayroll
select BasicPay from Payrollofemployee where ID = (select ID from Emppayroll where Name = 'Terissa')
select* from Emppayroll where StartDate between '2018-01-01' and GETDATE();

select avg(BasicPay) as average_BasicPay from Payrollemployee
select Gender, sum(BasicPay) as total_BasicPay from Payrollemployee, Emppayroll where Payrollemployee.ID = Emppayroll.ID group by Gender
select Gender, count(BasicPay) as salary_BasicPay from Payrollemployee, Emppayroll where Payrollemployee.ID = Emppayroll.ID group by Gender    
select Gender, max(BasicPay) as max_BasicPay from Payrollemployee, Emppayroll where Payrollemployee.ID = Emppayroll.ID group by Gender
select Gender, min(BasicPay) as min_BasicPay from Payrollemployee, Emppayroll where Payrollemployee.ID = Emppayroll.ID group by Gender

use EmpPayroll;
select* from Emppayroll

update Emppayroll set PhonNumber 54321 where = 'dhoni'
select Emppayroll.ID, Name.StartDate, Gender, PhoneNumber, Address, Department, BasicPay, Decduction'
TaxablePay, IncomeTax, NetPay from Emppayroll left join Department on EmpPayroll.ID = Departmenttable.ID
left join Payrollofemployee on Emppayroll.ID = Payrollofemployee.ID;

update Payrollofemployee set BasicPay = 25000;
select* from Payrollofemployee;
update Emppayroll set Gender = 'F' where Name = 'Terissa'
update Payrollofemployee set TaxablePay = 45 where ID = 1;
update Payrollofemployee set TaxablePay = 20 where ID = 2;
update Payrollofemployee set TaxablePay = 15 where ID = 3;
update Payrollofemployee set TaxablePay = 25 where ID = 4;
update Payrollofemployee set TaxablePay = 12 where ID = 5;
update Payrollofemployee set TaxablePay = 14 where ID = 6;
update Payrollofemployee set TaxablePay = 75 where ID = 7;
update Departmenttable set Department = 'Markrting' where ID = 7;
