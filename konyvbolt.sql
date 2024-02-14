-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 14. 19:08
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `konyvbolt`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`user_id`, `fname`, `lname`, `email`, `password`, `rate`) VALUES
(2, 'Ruzsinszki', 'Zita', 'zita@gmail.com', '$2y$10$eRx0dFHQnJcQK1HprQ3CcOnsKPQhVB.O29gtD.Ek80ja2GJvahnKq', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `konyv`
--

CREATE TABLE `konyv` (
  `konyvId` int(11) NOT NULL,
  `konyvCim` varchar(255) DEFAULT NULL,
  `kiadasDatum` int(11) DEFAULT NULL,
  `szerzo` varchar(255) DEFAULT NULL,
  `oldalSzam` int(11) DEFAULT NULL,
  `mufaj` int(11) DEFAULT NULL,
  `ar` int(11) DEFAULT NULL,
  `leiras` varchar(255) DEFAULT NULL,
  `kep` varchar(255) DEFAULT NULL,
  `konyvAllapot` varchar(255) DEFAULT NULL,
  `konyvArusitasiAllapot` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mufajok`
--

CREATE TABLE `mufajok` (
  `mufajId` int(11) NOT NULL,
  `mufajNev` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szerzok`
--

CREATE TABLE `szerzok` (
  `szerzoId` int(11) NOT NULL,
  `szerzoCsaladNev` varchar(255) DEFAULT NULL,
  `szerzoVezetekNev` varchar(255) DEFAULT NULL,
  `szerzoKozepsoNev` varchar(255) DEFAULT NULL,
  `szerzoTitulus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szerzokapcsolo`
--

CREATE TABLE `szerzokapcsolo` (
  `kapcsolasId` int(11) NOT NULL,
  `konyvId` int(11) DEFAULT NULL,
  `szerzoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tranzakciok`
--

CREATE TABLE `tranzakciok` (
  `adasvitelId` int(11) NOT NULL,
  `konyvId` int(11) DEFAULT NULL,
  `felhasznaloId` int(11) DEFAULT NULL,
  `tranzakciokDatum` int(11) DEFAULT NULL,
  `konyvDarab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`user_id`);

--
-- A tábla indexei `konyv`
--
ALTER TABLE `konyv`
  ADD PRIMARY KEY (`konyvId`),
  ADD KEY `mufaj` (`mufaj`);

--
-- A tábla indexei `mufajok`
--
ALTER TABLE `mufajok`
  ADD PRIMARY KEY (`mufajId`);

--
-- A tábla indexei `szerzok`
--
ALTER TABLE `szerzok`
  ADD PRIMARY KEY (`szerzoId`);

--
-- A tábla indexei `szerzokapcsolo`
--
ALTER TABLE `szerzokapcsolo`
  ADD PRIMARY KEY (`kapcsolasId`),
  ADD KEY `szerzoId` (`szerzoId`),
  ADD KEY `konyvId` (`konyvId`);

--
-- A tábla indexei `tranzakciok`
--
ALTER TABLE `tranzakciok`
  ADD PRIMARY KEY (`adasvitelId`),
  ADD KEY `felhasznaloId` (`felhasznaloId`),
  ADD KEY `konyvId` (`konyvId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `konyv`
--
ALTER TABLE `konyv`
  ADD CONSTRAINT `konyv_ibfk_1` FOREIGN KEY (`mufaj`) REFERENCES `mufajok` (`mufajId`),
  ADD CONSTRAINT `konyv_ibfk_2` FOREIGN KEY (`mufaj`) REFERENCES `mufajok` (`mufajId`);

--
-- Megkötések a táblához `szerzokapcsolo`
--
ALTER TABLE `szerzokapcsolo`
  ADD CONSTRAINT `szerzokapcsolo_ibfk_1` FOREIGN KEY (`szerzoId`) REFERENCES `szerzok` (`szerzoId`),
  ADD CONSTRAINT `szerzokapcsolo_ibfk_2` FOREIGN KEY (`konyvId`) REFERENCES `konyv` (`konyvId`);

--
-- Megkötések a táblához `tranzakciok`
--
ALTER TABLE `tranzakciok`
  ADD CONSTRAINT `tranzakciok_ibfk_1` FOREIGN KEY (`felhasznaloId`) REFERENCES `felhasznalok` (`user_id`),
  ADD CONSTRAINT `tranzakciok_ibfk_2` FOREIGN KEY (`konyvId`) REFERENCES `konyv` (`konyvId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
