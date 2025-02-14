CREATE DATABASE retseptiRaamatLukk; 
use retseptiRaamatLukk;
CREATE TABLE kasutaja(
kasutaja_id int primary key identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
email varchar(150));

select * from kasutaja;
insert into kasutaja(eesnimi, perenimi, email)
values('Nikita', 'Nikita', 'nikita@tthk.ee'),
('Mark', 'Mark', 'Mark@tthk.ee'),
('Roman', 'Roman', 'Roman@tthk.ee'),
('Maksim', 'Maksim', 'Maksim@tthk.ee'),
('Marek', 'Marek', 'Marek@tthk.ee');
select * from kasutaja;
select * from kategooria;
CREATE TABLE kategooria(
kategooria_id int primary key identity(1,1),
kategooria_Nimi varchar(50));
INSERT INTO kategooria(kategooria_Nimi)
values ('Suppid'),
('Magusad'),
('Road'),
('Koogiviljad'),
('Juurviljad');

CREATE TABLE toiduaine(
toiduaine_id int primary key identity(1,1),
toiduaine_nimi varchar(100));
insert into toiduaine(toiduaine_nimi)
values ('Sibul'),
('Porgant'),
('Liha'),
('Kartul'),
('Juust'),
('Sibul');
select * from toiduaine;
DELETE FROM toiduaine where toiduaine_id=5

create table yhik(
yuhik_id int primary key identity(1,1),
yhik_nimi varchar(100));
insert into yhik(yhik_nimi)
values 
('ml'),
('g'),
('kg'),
('tl'),
('sl');

select * from yhik;

CREATE TABLE Retsept(
retsept_id int primary key identity(1,1),
retsepti_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp date,
kasutaja_id int,
foreign key(kasutaja_id) references kasutaja(kasutaja_id),
kategooria_id int,
foreign key(kategooria_id) references kategooria(kategooria_id));

select * from Retsept;
insert into Retsept(retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
values
('Pasta', 'Keeda vett', 'Kasuta elektri pliit', '2024-12-10', 2, 2),
('Šokolaadiküpsised', 'Maitsvad ja pehmed šokolaadiküpsised, mis sulavad suus', 'Sega kausis omavahel jahu, küpsetuspulber ja sool', '2024-9-10', 3, 3),
('Pannkoogid', 'ideaalne hommikuks või magustoiduks', 'Klopi munad ja suhkur kausis ühtlaseks', '2024-12-10', 4, 4),
('Smuuti', 'Kiire ja maitsev smuuti', 'Lõika banaan, õun ja mõned marjad', '2022-9-10', 5, 5),
('KanaSupp', 'Lõika köögiviljad ja küpseta kana', 'Kasuta elektri pliit', '2025-10-10', 1 , 1);

select * from kasutaja;
select * from kategooria;
select * from toiduaine;
select * from yhik;
select * from Retsept;
select * from koostis;
delete from Retsept where retsept_id=6;

CREATE TABLE koostis(
koostis_id int primary key identity(1,1),
kogus int,
retsept_retsept_id int,
toiduaine_id int,
yhik_id int,
foreign key (retsept_retsept_id) references retsept(retsept_id),
foreign key (toiduaine_id) references toiduaine(toiduaine_id),
foreign key (yhik_id) references yhik(yuhik_id));

insert into koostis(kogus, retsept_retsept_id, toiduaine_id, yhik_id)
values (1, 4, 2, 1),
(1, 3, 3, 1),
(1, 1, 2, 1),
(1, 1, 3, 1),
(1, 1, 1, 1);
ALTER TABLE toiduaine ADD porgant varchar(20);
ALTER TABLE toiduaine ADD sibul varchar(20);
delete from toiduaine where porgant;
ALTER TABLE toiduaine drop column sibul;

CREATE TABLE tehtud(
tehtud_id int primary key identity(1,1),
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id));

insert into tehtud(tehtud_kp, retsept_id)
values ('2025-10-27', 1),
('2025-1-1', 2),
('2024-11-10', 3),
('2025-10-27', 4),
('2023-10-27', 5);
select * from tehtud;
