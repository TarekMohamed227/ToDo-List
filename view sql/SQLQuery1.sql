--1
create table instructor( ins_id int identity primary key ,ins_fname varchar(20) ,ins_lname varchar(20) 
,BD date ,overtime int unique
, salary int default 3000 check (salary between 1000 and 50000)
,hiredate date default getdate()
, address varchar(50) check (address in ('alex','cairo')))
 
 alter table instructor
add  netsalary as   salary + overtime

alter table instructor
add  age as  year(getdate())-year(bd)

create table course ( cid int identity primary key , c_name varchar(20) , duration int unique)


create table lab (
lid int identity,cid int foreign key references Course(Cid) on update cascade on delete cascade,
location varchar(20),Capacity int check (Capacity <20),primary key (cid, lid))
  

  create table teach (
  primary key (ins_id,cid) , ins_id int foreign key references instructor (ins_id) on delete cascade on update cascade,
  cid int foreign key references course(cid) on delete cascade on update cascade)


  
