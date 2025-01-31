CREATE TABLE opilane(
opilaneId int primary key AUTO_INCREMENT,
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date, 
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
);

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

CREATE TABLE language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
insert into keelevalik(valikuNimetus, opilaneId, language)
values
('valik B', 1, 2), ('valik D', 1, 4),
('valik A', 2, 1), ('valik B', 2, 2),
('valik C', 3, 3), ('valik D', 3, 4),
('valik A', 4, 1), ('valik D', 4, 4)

