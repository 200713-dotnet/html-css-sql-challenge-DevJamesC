--DDL
Create DATABASE ChallengeDB

use ChallengeDB
go;

Create Table Department
(
    id int not null,
    Name NVARCHAR(250) not null,
    Location NVARCHAR(250) not null,
    constraint PK_DepId primary key (id)
);

Create Table Employee
(
    id int not null,
    FirstName NVARCHAR(250) not null,
    LastName NVARCHAR(250) not null,
    SSN int(9) UNIQUE not null,
    depId int not null,
    constraint PK_EmpId primary key (id),
    CONSTRAINT FK_DepId FOREIGN key (depId) REFERENCES Department(id)
);

Create Table EmpDetails
(
    id int not null,
    EmployeeId int not null,
    Salary DECIMAL not null,
    Address1 NVARCHAR(250) not null,
    Address2 NVARCHAR(250),
    City NVARCHAR(250) not null,
    state NVARCHAR(250),
    Country NVARCHAR(250) not null,
    constraint PK_EmpDetailId primary key (id),
    CONSTRAINT FK_EmpId FOREIGN key (EmployeeId) REFERENCES Employee(id)
);

--DML

INSERT into Department(name, location)
Values("Marketing", "New York City"),
("Information Technology", "London"),
("Development", "Bremuda Triangle");

Insert into Employee(FirstName,LastName,SSN,FK_DepId)
values("Tina","Smith",000000000,1),
("John","Derril",000000001,2),
("Morgan","Stark",000000000,3);

insert into EmpDetails(EmployeeId,Salary,Address1,City,State,Country)
values(1,70000,"201 East 4th Ave","New York City", "New York", "USA"),
(1,60000,"221b Baker Street", "London"," ", "England"),
(1,250000,".23 Weast Ln", "unknown","unknown", "unknown");

select * from Employee
join Department on Employee.FK_DepId = Department.PK_DepId
where Department.name="Marketing";

select Sum(salary) from EmpDetails
join Employee on EmpDetails.FK_EmpId = Employee.PK_EmpId
join Department on Employee.FK_DepId = Department.PK_DepId
where Department.name="Marketing";

select Count(id) from Employee
join Department on Employee.FK_DepId = Department.PK_DepId

update EmpDetails 
set Salary = 90000
from EmpDetails
join Employee on EmpDetails.FK_EmpId = Employee.PK_EmpId
where Employee.FirstName="Tina" and Employee.LastName="Smith";