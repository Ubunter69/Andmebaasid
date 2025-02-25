CREATE DATABASE autodLukk;
USE autodLukk;
create table autod(
autoId int primary key identity (1,1),
Mark varchar(50),
regnumber varchar(100),
aasta int, 
reg int);
select * from autod;
insert into Autod(Mark, regnumber, aasta, regPiirk)
values
('Audi', '123 ABC', 2000, 1), ('Ford', '777 AAA ', 1988, 2),
('Ford', 'FIN 772', 2002, 1), ('Nissan', '111 CCC', 2006, 1),
('Toyota','128 HGF', 2003, 1), ('VAZ', '544 CCH', 1960, 2);
drop table autod;
insert into Autod (Mark, regnumber, aasta, reg) values ('Kia', '#d005c1', 2011, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Toyota', '#ebc815', 2008, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Mitsubishi', '#0da2cd', 1994, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Land Rover', '#b0a04b', 2010, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Jaguar', '#12daa7', 2006, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Chrysler', '#a2407e', 2002, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Ford', '#3af77e', 2010, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Mitsubishi', '#1b1097', 1995, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Chevrolet', '#7e7200', 2009, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Subaru', '#52ad21', 2006, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Mercury', '#d854c7', 2000, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Chevrolet', '#acc558', 1997, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Subaru', '#089d94', 2013, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Isuzu', '#9f0e46', 2002, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Lexus', '#34c98d', 2004, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Holden', '#5b8c90', 1995, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Dodge', '#02608a', 2003, 2);
insert into Autod (Mark, regnumber, aasta, reg) values ('Honda', '#44cc3f', 1998, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('GMC', '#338f28', 1993, 1);
insert into Autod (Mark, regnumber, aasta, reg) values ('Ford', '#dc979e', 2007, 2);
select * from autod order by aasta DESC;
SELECT DISTINCT mark FROM Autod;
select regnumber from autod where aasta < 1993 order by regnumber;
select min(aasta) from autod;
update autod set regnumber='333 KKK' WHERE autoID=3;
DELETE FROM Autod where autoID=4;
select * from autod;

insert into Autod(Mark, regnumber, aasta, reg) values ('Nissan', '555 NNN', '2000', 2);
 select count(*) from autod;
 select * from autod where reg='1';
 select mark, aasta from Autod where reg = 2;
 --SQL Server
 --Security-->Login-->new login
--anname õigis kasutajale opilaneMarek vaadata tabeli auto sisu--
GRANT SELECT ON autod TO opilaneMarek;--разрешение для пользователя
GRANT Update On autod to opilaneMarek;--разрешение для пользователя
