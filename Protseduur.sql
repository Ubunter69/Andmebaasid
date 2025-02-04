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



