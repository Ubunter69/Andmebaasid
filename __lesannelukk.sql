-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 18, 2025 kell 02:01 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `ülesannelukk`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutamangija` (IN `deleteID` INT)   BEGIN
select * from SteamMangija;
delete from SteamMangija where MängijaID=deleteID;
select * from SteamMangija;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaKoostis` (IN `kogus` INT, IN `retsept_retsept_id` INT, IN `toiduaine_id` INT, IN `yhik_id` INT)   BEGIN

insert into koostis(kogus, retsept_retsept_id, toiduaine_id, yhik_id)
values (kogus, retsept_retsept_id, toiduaine_id, yhik_id);
select* from koostis;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LisaMangija` (IN `Nimi` VARCHAR(30), IN `Vanus` INT, IN `Linn` VARCHAR(30), IN `LemmikMang` VARCHAR(30))   BEGIN
insert into SteamMangija(nimi, vanus, linn, lemmikmäng)
values (nimi, vanus, linn, lemmikmäng);
select * from SteamMangija;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaRetsept` (IN `retsepti_nimi` VARCHAR(100), IN `kirjeldus` VARCHAR(500), IN `juhend` VARCHAR(500), IN `sisestatud_kp` DATE, IN `kasutaja_id` INT, IN `kategooria_id` INT)   BEGIN

insert into Retsept(retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
values (retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id);
select* from Retsept;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mangijaotsing` (IN `taht` CHAR(1))   BEGIN

SELECT * FROM SteamMangija
WHERE nimi LIKE CONCAT(taht, '%');

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kasutaja`
--

CREATE TABLE `kasutaja` (
  `kasutaja_id` int(11) NOT NULL,
  `eesnimi` varchar(50) DEFAULT NULL,
  `perenimi` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kasutaja`
--

INSERT INTO `kasutaja` (`kasutaja_id`, `eesnimi`, `perenimi`, `email`) VALUES
(1, 'Nikita', 'Nikita', 'nikita@tthk.ee'),
(2, 'Mark', 'Mark', 'Mark@tthk.ee'),
(3, 'Roman', 'Roman', 'Roman@tthk.ee'),
(4, 'Maksim', 'Maksim', 'Maksim@tthk.ee'),
(5, 'Marek', 'Marek', 'Marek@tthk.ee');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kategooria`
--

CREATE TABLE `kategooria` (
  `kategooria_id` int(11) NOT NULL,
  `kategooria_Nimi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kategooria`
--

INSERT INTO `kategooria` (`kategooria_id`, `kategooria_Nimi`) VALUES
(1, 'Suppid'),
(2, 'Magusad'),
(3, 'Road'),
(4, 'Koogiviljad'),
(5, 'Juurviljad');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `koostis`
--

CREATE TABLE `koostis` (
  `koostis_id` int(11) NOT NULL,
  `kogus` int(11) DEFAULT NULL,
  `retsept_retsept_id` int(11) DEFAULT NULL,
  `toiduaine_id` int(11) DEFAULT NULL,
  `yhik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `koostis`
--

INSERT INTO `koostis` (`koostis_id`, `kogus`, `retsept_retsept_id`, `toiduaine_id`, `yhik_id`) VALUES
(1, 1, 4, 2, 1),
(2, 1, 3, 3, 1),
(3, 1, 1, 2, 1),
(4, 1, 1, 3, 1),
(5, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `retsept`
--

CREATE TABLE `retsept` (
  `retsept_id` int(11) NOT NULL,
  `retsepti_nimi` varchar(100) DEFAULT NULL,
  `kirjeldus` varchar(200) DEFAULT NULL,
  `juhend` varchar(500) DEFAULT NULL,
  `sisestatud_kp` date DEFAULT NULL,
  `kasutaja_id` int(11) DEFAULT NULL,
  `kategooria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `retsept`
--

INSERT INTO `retsept` (`retsept_id`, `retsepti_nimi`, `kirjeldus`, `juhend`, `sisestatud_kp`, `kasutaja_id`, `kategooria_id`) VALUES
(1, 'Pasta', 'Keeda vett', 'Kasuta elektri pliit', '2024-12-10', 2, 2),
(2, 'Šokolaadiküpsised', 'Maitsvad ja pehmed šokolaadiküpsised, mis sulavad suus', 'Sega kausis omavahel jahu, küpsetuspulber ja sool', '2024-09-10', 3, 3),
(3, 'Pannkoogid', 'ideaalne hommikuks või magustoiduks', 'Klopi munad ja suhkur kausis ühtlaseks', '2024-12-10', 4, 4),
(4, 'Smuuti', 'Kiire ja maitsev smuuti', 'Lõika banaan, õun ja mõned marjad', '2022-09-10', 5, 5),
(5, 'KanaSupp', 'Lõika köögiviljad ja küpseta kana', 'Kasuta elektri pliit', '2025-10-10', 1, 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `steammangija`
--

CREATE TABLE `steammangija` (
  `MängijaId` int(11) NOT NULL,
  `nimi` varchar(30) DEFAULT NULL,
  `vanus` int(11) DEFAULT NULL,
  `linn` varchar(30) DEFAULT NULL,
  `lemmikmäng` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `steammangija`
--

INSERT INTO `steammangija` (`MängijaId`, `nimi`, `vanus`, `linn`, `lemmikmäng`) VALUES
(1, 'Maksim', 16, 'Tallinn', 'Dota2'),
(2, 'Artjom', 20, 'Tallinn', 'ARK'),
(3, 'Martin', 16, 'Tallinn', 'Dota2'),
(4, 'Mark', 10, 'Narva', 'Roblox'),
(5, 'Marek', 19, 'Pärnu', 'Dota2');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tehtud`
--

CREATE TABLE `tehtud` (
  `tehtud_id` int(11) NOT NULL,
  `tehtud_kp` date DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tehtud`
--

INSERT INTO `tehtud` (`tehtud_id`, `tehtud_kp`, `retsept_id`) VALUES
(1, '2025-10-27', 1),
(2, '2025-01-01', 2),
(3, '2024-11-10', 3),
(4, '2025-10-27', 4),
(5, '2023-10-27', 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `toiduaine`
--

CREATE TABLE `toiduaine` (
  `toiduaine_id` int(11) NOT NULL,
  `toiduaine_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `toiduaine`
--

INSERT INTO `toiduaine` (`toiduaine_id`, `toiduaine_nimi`) VALUES
(1, 'Sibul'),
(2, 'Porgant'),
(3, 'Liha'),
(4, 'Kartul'),
(5, 'Juust'),
(6, 'Sibul');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `yhik`
--

CREATE TABLE `yhik` (
  `yuhik_id` int(11) NOT NULL,
  `yhik_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `yhik`
--

INSERT INTO `yhik` (`yuhik_id`, `yhik_nimi`) VALUES
(1, 'ml'),
(2, 'g'),
(3, 'kg'),
(4, 'tl'),
(5, 'sl');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  ADD PRIMARY KEY (`kasutaja_id`);

--
-- Indeksid tabelile `kategooria`
--
ALTER TABLE `kategooria`
  ADD PRIMARY KEY (`kategooria_id`);

--
-- Indeksid tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD PRIMARY KEY (`koostis_id`),
  ADD KEY `retsept_retsept_id` (`retsept_retsept_id`),
  ADD KEY `toiduaine_id` (`toiduaine_id`),
  ADD KEY `yhik_id` (`yhik_id`);

--
-- Indeksid tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD PRIMARY KEY (`retsept_id`),
  ADD KEY `kasutaja_id` (`kasutaja_id`),
  ADD KEY `kategooria_id` (`kategooria_id`);

--
-- Indeksid tabelile `steammangija`
--
ALTER TABLE `steammangija`
  ADD PRIMARY KEY (`MängijaId`);

--
-- Indeksid tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD PRIMARY KEY (`tehtud_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  ADD PRIMARY KEY (`toiduaine_id`);

--
-- Indeksid tabelile `yhik`
--
ALTER TABLE `yhik`
  ADD PRIMARY KEY (`yuhik_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  MODIFY `kasutaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `kategooria`
--
ALTER TABLE `kategooria`
  MODIFY `kategooria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `koostis`
--
ALTER TABLE `koostis`
  MODIFY `koostis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `retsept`
--
ALTER TABLE `retsept`
  MODIFY `retsept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `steammangija`
--
ALTER TABLE `steammangija`
  MODIFY `MängijaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `tehtud`
--
ALTER TABLE `tehtud`
  MODIFY `tehtud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  MODIFY `toiduaine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `yhik`
--
ALTER TABLE `yhik`
  MODIFY `yuhik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD CONSTRAINT `koostis_ibfk_1` FOREIGN KEY (`retsept_retsept_id`) REFERENCES `retsept` (`retsept_id`),
  ADD CONSTRAINT `koostis_ibfk_2` FOREIGN KEY (`toiduaine_id`) REFERENCES `toiduaine` (`toiduaine_id`),
  ADD CONSTRAINT `koostis_ibfk_3` FOREIGN KEY (`yhik_id`) REFERENCES `yhik` (`yuhik_id`);

--
-- Piirangud tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD CONSTRAINT `retsept_ibfk_1` FOREIGN KEY (`kasutaja_id`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `retsept_ibfk_2` FOREIGN KEY (`kategooria_id`) REFERENCES `kategooria` (`kategooria_id`);

--
-- Piirangud tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD CONSTRAINT `tehtud_ibfk_1` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
