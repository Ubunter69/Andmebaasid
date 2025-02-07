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
CREATE DATABASE protseduurLukk;
use protseduurLukk;
create table linn(
linnId int PRIMARY KEY identity(1,1),
linnNimi varchar(30),
rahvaArv int);
SELECT * from linn; 
insert into linn(linnNimi, rahvaArv)
values ('Tartu', 30000);

--('Tallinn', 60000), ('Pärnu', 40000), ('Narva', 35000);
CREATE PROCEDURE lisaLinn
@linnNimi varchar(30),
@rahvaArv int
AS
BEGIN

insert into linn(linnNimi, rahvaArv)
values (@linnNimi, @rahvaArv);
select* from linn;

END
exec lisaLinn Pldiski, 36362

--uue Veeru Lisamine
ALTER TABLE linn ADD test int;
--veeru kustutamine
ALTER TABLE linn drop COLUMN test;

create procedure veeruLisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tüüp varchar (20) =null

AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE linn ADD ', @veerunimi, ' ', @tüüp)
when @valik='drop' then concat('ALTER TABLE linn DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
begin
EXEC (@sqltegevus);
END;
END;

--KUTSE
EXEC veeruLisaKustuta @valik='add', @veerunimi='test3', @tüüp='int';
select * from linn;

EXEC veeruLisaKustuta @valik='drop', @veerunimi='test3';
select * from linn;

create procedure veeruLisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tüüp varchar (20) =null

AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tüüp)
when @valik='drop' then concat('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
begin
EXEC (@sqltegevus);
END;
END;
--KUTSE
EXEC veeruLisaKustutaTabelis @valik='add', @tabelinimi='linn', @veerunimi='test3', @tüüp='int';
select * from linn;

EXEC veeruLisaKustutaTabelis @valik='drop', @tabelinimi='linn', @veerunimi='test3';
select * from linn;
DROP PROCEDURE veeruLisaKustutaTabelis;

--protseduur tingimusega
CREATE PROCEDURE rahvaHinnang
@piir int


AS
BEGIN
SELECT linnNimi, rahvaArv, IIF(rahvaArv<@piir, 'Väike linn', 'Suur linn') as Hinnang
FROM linn;


END;
drop procedure rahvaHinnang;
exec rahvaHinnang 60000;
--Agregaat fumktsioonid: sum(), AVG(), MIN(), MAX(), COUNT()

CREATE PROCEDURE KokkuRahvaarv



AS
BEGIN
SELECT SUM(rahvaArv) AS 'kokku rahvaarv', AVG(rahvaarv) as 'keskmine rahvaArv', count(*) AS 'linnade arv'
from linn;
END;
--через AS можно давать новое название столбцу
--count(*) звездочка считает количество заполненных строчек

EXEC KokkuRahvaarv;
drop procedure KokkuRahvaarv;
-------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SteamMangija(
MängijaId int primary key identity(1,1),
nimi varchar(30),
vanus int,
linn varchar(30),
lemmikmäng varchar(30)
);
select *from SteamMangija;
DROP TABLE SteamMangija;
INSERT INTO SteamMangija(nimi, vanus, linn, lemmikmäng)
values ('Maksim', 16, 'Tallinn', 'Dota2'), 
('Artjom', 20, 'Tallinn', 'ARK'), 
('Martin', 16, 'Tallinn', 'Dota2'), 
('Mark', 10, 'Narva', 'Roblox'),
('Marek', 19, 'Pärnu', 'Dota2');

CREATE PROCEDURE lisaMängija
@nimi varchar(20),
@vanus int,
@linn varchar(20),
@lemmikmäng varchar(30)

AS
BEGIN
insert into SteamMangija(nimi, vanus, linn, lemmikmäng)
values (@nimi, @vanus, @linn, @lemmikmäng);
select * from SteamMangija;
END;

exec lisaMängija 'Ilja', 13, 'Tartu', 'Cs2'

CREATE PROCEDURE kustutaMängija
@deleteID int
AS
BEGIN
select * from SteamMangija;
delete from SteamMangija where MängijaID=@deleteID
select * from SteamMangija;
END;

EXEC kustutaMängija 7;

CREATE PROCEDURE MängijaOtsing
@taht char(1)
as
begin
SELECT * FROM SteamMangija WHERE nimi LIKE @taht + '%';
end;
exec MängijaOtsing A;

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


Syntax
