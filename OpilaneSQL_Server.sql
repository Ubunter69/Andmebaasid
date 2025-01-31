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
