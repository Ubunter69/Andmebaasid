--AB loomine
Create database LukkBaas;
--identity(1,1) - для автоматической нумерации
use LukkBaas;
CREATE TABLE opilane(
opilaneId int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date, 
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane(
eesnimi,
perenimi,
synniaeg,
stip,
aadress,
keskmine_hinne)
VALUES(
'Marek',
'Lukk',
'2004-10-27',
1,
'aadress',
4.5),
(
'Pork',
'Maksonik',
'2004-10-27',
1,
'aadress',
4.2),
(
'Pork',
'Maksonik',
'2004-10-27',
1,
'aadress',
4.4),
(
'Mark',
'Gabella',
'2000-4-20',
1,
'aadress',
4.4)

--tabeli kustutamine
drop table opilane;
--rida kustutamine, kus on opilaneID=2
DELETE FROM opilane WHERE opilaneId=2;
select * from opilane;

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
WHERE opilaneId=3
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

  CREATE DATABASE epoodLukk
use epoodLukk

CREATE TABLE Category (
idCategory int primary key identity(1,1),
CategoryName varchar(25) UNIQUE
);
SELECT * FROM Category;
INSERT INTO Category (CategoryName)
values ('jook'), ('söök')

--TABELI struktuuri muutmine-->uue veergu lisamine
ALTER TABLE Category ADD test int;

--TABELI struktuuri muutmine-->VEERGU KUSTUTAMINE
ALTER TABLE Category drop column test;

Create table Product ( 
idProduct int primary key identity(1,1),
ProductName varchar(20) UNIQUE,
idCategory int ,
Foreign key (idCategory) references Category(idcategory),
Price DECIMAL(5,2)
);
SELECT * FROM Category;
SELECT *FROM product;
drop table Product;
insert into Product (ProductName, idCategory, Price)
VALUES ('SakuMõdu',1, 0.99)

ALTER TABLE Category ADD Mööbel varchar(20);
ALTER TABLE Category drop column Mööbel;
alter TABLE Category ADD Mööbel varchar(20);
--INSERT INTO Category (Mööbel)
--VALUES ('Toolid'), ('Diivanid');

CREATE TABLE Sale (
idSale int primary key identity(1,1),
idProduct INT,
Foreign key (idProduct) references Product (idProduct),
idCustomer INT,
Count_ INT,
DateOfSale date);


 
--Kustutab kõik kirjed
----Foreign key (idCustomer) references Customer(idCustomer),
DELETE FROM table sale
CREATE TABLE Customer (
IdCustomer int primary key identity(1,1),
Name varchar(25),
contact text)
--tabeli muutmine -->FK lisamine
alter table sale add foreign key (idCustomer) references Customer(idCustomer)
INSERT INTO Customer(Name,contact)
VALUES('Martin', '+3743531634')

INSERT INTO Sale (idProduct, idCustomer, Count_, DateOfSale)
values ('5','3','3','2018-11-10'),
(5,2,10,'2018-11-11')
  
  ----------------------------------------------------------------------------
  Vigane kood
Create table oppimine(
oppimineId int primary key identity(1,1),
aine varchar(12) not null,
aasta date not null,
opetaja varchar(10),
opilaneId int,
Foreign key (opilaneId) references Language(ID),
hinne int,
)
INSERT INTO oppimine(
aine,
aasta,
opetaja,
opilaneId,
hinne)

VALUES('Keemia', 2020-10-25,'Merkulova', '2', 5)
select * from oppimine

drop table oppimine;
