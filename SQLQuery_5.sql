create table Persons(
    Id int primary key identity(1,1),
    Name nvarchar(50) not null,
    Address nvarchar(50) not null,
    Birthday date not null
);
create table Contacts(
    Id int primary key identity(1,1),
    Tel varchar(15) not null,
    IdPerson int not null
);
create table Lists(
    Id int primary key identity(1,1),
    IdPerson int not null unique,
    IdContact int not null unique
);
drop table Lists;
drop table Persons;
drop table Contacts;

insert into Persons(Name,Address,Birthday)
values(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18'),
(N'Nguyễn Văn Bách',N'112 Nguyễn Trãi, Thanh Xuân, Hà Nội','2009-12-12'),
(N'Hà Thị Cúc',N'113 Nguyễn Trãi, Thanh Xuân, Hà Nội','2003-09-13');
select * from Persons;

insert into Contacts(Tel,IdPerson)
values('987654321',1),('09873452',1),('09832323',1),('09434343',1),('123456789',2),('34567891',3),('4539876',3);
select * from Contacts;



insert into Lists(IdPerson,IdContact)
values(1,1),(2,2),(3,3);
select * from Lists;

select * from Persons B
left join Contacts A on B.Id = A.IdPerson;

--4
select distinct Name from Persons B left join Contacts A on B.Id = A.IdPerson;
select Tel from Persons B left join Contacts A on B.Id = A.IdPerson;
--5
select distinct Name from Persons B left join Contacts A on B.Id = A.IdPerson order by Name asc;
select Tel from Persons B left join Contacts A on B.Id = A.IdPerson where Name like N'Nguyễn Văn An';
select Name from Persons B left join Contacts A on B.Id = A.IdPerson where Birthday like '2009-12-12';
--6
select count(IdPerson) as SoSoDT from Persons B left join Contacts A on B.Id = A.IdPerson group by IdPerson;
select count(IdPerson) as SoNguoiSinhT12 from Persons B left join Contacts A on B.Id = A.IdPerson where Birthday like '%-12-%';
select * from Persons B left join Contacts A on B.Id = A.IdPerson;
select * from Persons B left join Contacts A on B.Id = A.IdPerson where Tel like '123456789';
--7
alter table Persons add check(Birthday < getdate());

alter table Persons add NgayBatDauLL date;
--8
create index IX_HoTen on Persons(Name);
create index IX_SoDienThoai on Contacts(Tel);
