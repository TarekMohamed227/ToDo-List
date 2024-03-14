--1
create procedure st_dept as
begin
select dept_name ,count(st_id)"students"
from student s, department d
where d.dept_id=s.dept_id
group by dept_name
end

execute st_dept



--2
go

create procedure emp_pjt as
begin
declare @num int =(select count(ssn)
from employee,works_for,project
where essn=ssn and pnumber=pno and pname='AL Solimaniah')
if @num>3 
select 'The number of employees in the project p1 is 3 or more'
else
select 'The following employees work for the project p1' "Message" , Fname, Lname
from employee,works_for,project
where essn=ssn and pnumber=pno and pname='AL Solimaniah'
end
execute emp_pjt

--3
go
alter procedure emp (@oldempnumber int,@newempnumber int, @projectnumber int) as
begin

delete from works_for
where essn=@newempnumber and pno=@projectnumber and essn=@oldempnumber and pno=@projectnumber 
end
execute emp @oldempnumber = 112233, @newempnumber=113344, @projectnumber = 100

--4
go
alter table project
add budjet int 

create table (ProjectNo int, UserName varchar(20),
ModifiedDate datetime, Budget_Old int, Budget_New int) 

go
creat trigger UpdateTrigger on Project after update as
begin
if update (Budget)
insert into audit
select d.Pnumber, suser_name(), getdate(), d.budget, i.budget
from deleted d, inserted i
end

update project set budget = 5000 where pnumber = 600






--5
go create trigger dept on departments instead of insert as
begin
select 'You cannot insert a new record in Department'
from inserted
end 

insert into departments values ( 'dp11',22,115588,10-5-1999)



--6
go
create trigger emp_date on employee instead of insert as
begin
declare @month varchar(20) =month(getdate())
if @month ='march'
select ' you can not add any employee in march'
else 
insert into employee
select* from inserted
end

insert into employee (ssn ,fname ,lname ,bdate)
values (117744,'tarek','mohamed',22-7-1997)



--7
go
create table st_Audit (ServerUserName varchar(50), Date datetime, Note varchar(100))

create trigger audit on student after insert as
begin
insert into st_audit
select suser_name(),getdate()
concat(suser_name(), ' Insert New Row with Key= ',st_id, ' in table Student') "Note"
from inserted 
end

insert into student values (10,'tarek','mohamed',15,null,null)


--8
go
create trigger del_st on student instead of  delete as
begin
insert into st_audit
select suser_name(),getdate(),concat('try to delete Row with Key= ',st_id)
from deleted
end
delete from student where st_id=5

--------------------------------------------------------------------
 --cursor


 --1
 go

 declare c1 cursor
for select salary from employee where salary is not null
for update
declare @s int
open c1
fetch c1 into @s
while @@fetch_status=0
begin
if @s<3000
update employee
set salary=@s*1.10
where current of c1
else
update employee
set salary=@s*1.20
where current of c1
fetch c1 into @s
end
close
deallocate c1


--2
go

declare c2 cursor 
for select ins_name ,dept_name from instructor,departments
where dept_manager=ins_id
declare @ins varchar(20) 
declare @dept varchar(50)
open c2
fetch c2 into @ins,@dept
while @@fetch_status=0
begin
select @ins,@dept
fetch c2 into @ins,@dept
end
close c2
deallocate c2

--3


declare @Names varchar(max) = ' '
declare @Current varchar(20)
declare c3 Cursor for
select St_Fname from Student
open c3
fetch c3 into @current
while @@FETCH_STATUS = 0
begin
  set @Names = CONCAT(@Names, ' , ', @current)
fetch c3 into @current;
end
close c3
deallocate c3
select @Names as NameList

--4
backup database Company_SD to disk = 'D:\CompanySD_FULL.bak'
backup database Company_SD to disk = 'D:\CompanySD_DIFF.bak' with differential






