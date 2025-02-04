--SQL salvestatud protseduur - funktsioon, mis käivitab serveris mitu SQL tegevust järjest.
Kasutame SQL Server
Create database protseduurLukk;
use protseduurLukk;
create table linn(
linnId int PRIMARY KEY identity(1,1),
linnNimi varchar(30),
rahvaArv int);
SELECT * from linn; 
insert into linn(linnNimi, rahvaArv)
values ('Tartu', 30000),
('Tallinn', 60000),
('Pärnu', 40000);
--protseduuri loomine
--protseduur, mis lisab uus linn ja kohe näitab tabelis

CREATE PROCEDURE lisaLinn
@linnNimi varchar(30),
@rahvaArv int
AS
BEGIN

insert into linn(linnNimi, rahvaArv)
values (@linnNimi, @rahvaArv);
select* from linn;

END

--protseduuri kutse
exec lisaLinn @linnNimi='Paldiski', @rahvaArv=20000
--lihtsam
exec lisaLinn 'Paldiski', 20000;
exec lisaLinn 'Pärnu', 20000;
exec lisaLinn 'Rakvere', 20000;
--KIRJE KUSTUTAMINE
DELEte FROM linn where linnID=7;
--protseduur mis kustutab linn id järgi
create procedure kustutaLinn
@deleteID int
AS
BEGIN
select * from linn;
DELEte FROM linn where linnID=@deleteID;
select * from linn;
END;
--kutse
exec kustutaLinn 5,6;

--Protseduri kustutamine
DROP PROCEDURE kustutaLinn;


--protseduur , mis otsib linn esimese tähte järgi
CREATE PROCEDURE linnaOtsing
@taht char(1)
as
begin
SELECT * FROM linn 
WHERE linnNimi LIKE @taht + '%';
--% - kõik teised tähed
end;
--kutse
exec linnaOtsing T;

--tabeli uuendamine - rahvaarv kasvab 10% võrra
UPDATE linn SET rahvaArv=rahvaArv*1.1
SELECT * FROM linn;
UPDATE linn SET rahvaArv=rahvaArv*1.1
WHERE linnId=8
CREATE PROCEDURE rahvaArvuUuendus
@linnID int,
@koef decimal(2,1)
AS
BEGIN
UPDATE linn SET rahvaArv=rahvaArv*@koef
WHERE linnId=@linnID;
SELECT * FROM linn;
END;

DROP PROCEDURE rahvaArvuUuendus;

EXEC rahvaArvuUuendus 8, 1.2;

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
CREATE PROCEDURE lisaOpilane
@eesnimi varchar(25),
@perenimi varchar(25),
@synniaeg date, 
@stip bit,
@aadress text,
@keskmine_hinne decimal(2,1)

AS
BEGIN
insert into opilane(eesnimi, perenimi, synniaeg, stip, aadress, keskmine_hinne)
values (@eesnimi, @perenimi, @synniaeg, @stip, @aadress, @keskmine_hinne);
select * from opilane;
END;
exec lisaOpilane 'Igor', 'Igor', '2020-8-27', 1, 'treoteptr', 4.2


CREATE PROCEDURE kustutaOpilane
@deleteID int
AS
BEGIN
select * from opilane;
delete from opilane where opilaneID=@deleteID;
select * from opilane;
END;
exec kustutaOpilane 5;

CREATE PROCEDURE opilaneOtsing
@taht char(1)
as
begin
SELECT * FROM opilane WHERE eesnimi LIKE @taht + '%';
end;
exec opilaneOtsing M;

UPDATE opilane set 
select * from opilane;
update opilane set stip=0 where opilaneId=1
CREATE PROCEDURE stipVahetus
@opilaneId int,
@stip bit
AS
BEGIN
UPDATE opilane set stip=1 where opilaneId=@opilaneId
select * from opilane;
END;
EXEC stipVahetus 4, 0;
drop procedure stipVahetus;
------------------------------------------------------------------------------------------------------------------------------------
Kasutame XAMPP / localhost
create table linn(
linnId int PRIMARY KEY AUTO_INCREMENT,
linnNimi varchar(30),
rahvaArv int);

insert into linn(linnNimi, rahvaArv)
values ('Tartu', 30000),
('Tallinn', 60000),
('Pärnu', 40000);

BEGIN

insert into linn(linnNimi, rahvaArv)
values (linnNimi, rahvaArv);
select* from linn;

END



