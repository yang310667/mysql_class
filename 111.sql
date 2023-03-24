CREATE DATABASE `Company`;
USE `Company`;
/*Create table Department*/
CREATE TABLE Department
(  Dname     Varchar(100)  Not Null,
   Dnumber   char(1)       Not Null,
   MgrSSN    char(9)       Not Null DEFAULT'888665555',
   MgrStartDate Date       Not Null,
   Unique(Dname)
);
INSERT INTO `Department` Values
 ('Research',5,333445555,'1988-05-22'),
 ('Administration',4,987654321,'1995-01-01'),
 ('Headquarters',1,888665555,'1981-06-19');
 /*Set the primary and foreign key(the foreign set after set table Employee)*/
Alter Table Company.Department ADD Primary Key (Dnumber);
Alter Table Company.Department ADD Constraint Depfk Foreign KEY(MgrSSN) references Employee(Ssn) On UpDATE cascade;


/*Create the table Employee*/
CREATE TABLE Employee
(  Fname     Varchar(20)   Not NULL,
   Mint      Varchar(1)            ,
   Lname     Varchar(20)   Not NULL,
   Ssn       char(9)       Not NULL,
   Bdate     Date          Not NULL,
   Address   VarChar(100)  Not NULL,
   Sex       Char(1)       Not NULL,
   Salary    Int           Not NULL,
   Sper_ssn  Char(9)       Default'888665555',
   Dno       Char(1)       Not NULL
);
INSERT INTO `Employee` Values
('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston, TX','M',30000,333445555,5),
('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5),
('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4),
('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4),
('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);
Select * From `Employee`; 

ALTER TABLE Company.Employee ADD  PRIMARY KEY(Ssn);
Alter Table Company.Employee ADD Constraint Emfk Foreign KEY(Dno) references Department(Dnumber) On UpDATE cascade;
/**Create Table DEPT_Locarions*/
CREATE TABLE DEPT_Locations
(  Dnumber   Char(1)       Not NULL,
   Dlocation VarChar(100)  Not NULL
);

INSERT INTO `DEPT_Locations` VALUES 
(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'), 
(5,'Houston');
ALTER TABLE Company.DEPT_Locations ADD Primary Key(Dnumber,Dlocation);
Alter Table Company.DEPT_Locations ADD Constraint Deptfk Foreign KEY(Dnumber) references Department(Dnumber) On UpDATE cascade;



CREATE TABLE Project
(  Pname     VarChar(100)  Not NULL,     
   Pnumber   Int           Not NULL,
   Plocation VarChar(100)  Not NULL,
   Dnum      Char(1)       Not NULL
);

INSERT INTO `Project` Values
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);

Alter Table Company.Project ADD primary key (Pnumber);
Alter Table Company.Project ADD Constraint Prfk Foreign KEY(Dnum) references Department(Dnumber) On UpDATE cascade;

CREATE TABLE Works_on
(   Essn      Char(9) NOT NULL,
    Pno       Int     NOT NULL,
    Hours     DEC(4,1)
);
INSERT INTO `Works_on` Values
(123456789,1,32.5),
(123456789,2,7.5),
(666884444,3,40.0),
(453453453,1,20.0),
(453453453,2,20.0),
(333445555,2,10.0),
(333445555,3,10.0),
(333445555,10,10.0),
(333445555,20,10.0),
(999887777,30,30.0),
(999887777,10,10.0),
(987987987,10,35.0),
(987987987,30,5.0),
(987654321,30,20.0),
(987654321,20,15.0),
(888665555,20,null);

Alter Table Company.Works_on ADD primary key (Essn,Pno);
Alter Table Company.Works_on ADD Constraint Wofk_1 Foreign KEY(Essn) references Employee(Ssn) On UpDATE cascade;
Alter Table Company.Works_on ADD Constraint Wofk_2 Foreign KEY(Pno) references Project (Pnumber) On UpDATE cascade;

CREATE TABLE Dependent
(   Essn     Char(9)  NOT NULL,
    Dependent_name VarChar(100) NOT NULL,
    Sex      Char(1)  NOT NULL,
    Bdate    Date     NOT NULL,
    Relationship   VarChar(100) NOT NULL
);

INSERT INTO `Dependent` Values
(333445555,'Alice','F','1986-04-04','Daughter'),
(333445555,'John','M','1983-10-25','Son'),
(333445555,'Joy','F','1958-05-03','Spouse'),
(987654321,'Abner','M','1942-02-28','Spouse'),
(123456789,'Michael','M','1988-01-04','Son'),
(123456789,'Alice','F','1988-12-30','Daughter'),
(123456789,'Elizabeth','F','1967-05-05','Spouse');
ALTER TABLE Company.Dependent ADD  PRIMARY KEY(Essn,Dependent_name);
Alter Table Company.Dependent ADD Constraint Defk Foreign KEY(Essn) references Employee (Ssn) On UpDATE cascade;

Select * From `Dependent` 



