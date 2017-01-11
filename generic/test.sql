-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Nov 2016 um 15:01
-- Server-Version: 10.1.16-MariaDB
-- PHP-Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `leanlab`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auftrag`
--

CREATE TABLE `auftrag` (
  `id` varchar(30) NOT NULL,
  `stueck` int(11) NOT NULL,
  `takt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `auftrag`
--

INSERT INTO `auftrag` (`id`, `stueck`, `takt`) VALUES
('LeanLab_1', 20, 10),
('LeanLab_2', 25, 15),
('LeanLab_3', 30, 20),
('LeanLab_4', 35, 25),
('LeanLab_5', 40, 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausschuss`
--

CREATE TABLE `ausschuss` (
  `ausschuss` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ausschuss`
--

INSERT INTO `ausschuss` (`ausschuss`) VALUES
('falsch gebogen'),
('falsch gebohrt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausschuss_detail`
--

CREATE TABLE `ausschuss_detail` (
  `ausschuss` varchar(40) NOT NULL,
  `auftrag` varchar(40) NOT NULL,
  `station` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ausschuss_detail`
--

INSERT INTO `ausschuss_detail` (`ausschuss`, `auftrag`, `station`) VALUES
('falsch gebohrt', 'LeanLab_1', 'Bohren'),
('falsch gebogen', 'LeanLab_1', 'Bohren'),
('falsch gebohrt', 'LeanLab_1', 'Bohren'),
('falsch gebogen', 'LeanLab_1', 'Bohren');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `history`
--

CREATE TABLE `history` (
  `auftrag` varchar(40) NOT NULL,
  `station` varchar(40) NOT NULL,
  `start` int(11) NOT NULL,
  `begin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `history`
--

INSERT INTO `history` (`auftrag`, `station`, `start`, `begin`, `end`) VALUES
('LeanLab_1', 'Bohren', 0, '2016-11-30 13:59:33', '2016-11-30 15:00:19'),
('LeanLab_4', 'Bohren', 0, '2016-11-30 13:59:43', '2016-11-30 14:59:47'),
('LeanLab_2', 'Bohren', 0, '2016-11-30 13:59:52', '2016-11-30 15:00:06'),
('LeanLab_1', 'Bohren', 0, '2016-11-30 14:00:11', '2016-11-30 15:00:19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `station`
--

CREATE TABLE `station` (
  `station` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `station`
--

INSERT INTO `station` (`station`) VALUES
('Bohren'),
('Biegen'),
('Kleben'),
('Lackieren'),
('Montieren');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stdauer`
--

CREATE TABLE `stdauer` (
  `auftrag` int(11) NOT NULL,
  `stoerungid` int(11) NOT NULL,
  `beginn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ende` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stoerung`
--

CREATE TABLE `stoerung` (
  `stoerung` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `stoerung`
--

INSERT INTO `stoerung` (`stoerung`) VALUES
('Bohrer kaputt'),
('kein Strom'),
('Material defekt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stoerung_time`
--

CREATE TABLE `stoerung_time` (
  `stoerung` varchar(30) NOT NULL,
  `begin` datetime NOT NULL,
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `auftrag` varchar(40) NOT NULL,
  `station` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `stoerung_time`
--

INSERT INTO `stoerung_time` (`stoerung`, `begin`, `end`, `auftrag`, `station`) VALUES
('Bohrer kaputt', '2016-11-30 14:59:57', '2016-11-30 13:59:57', 'LeanLab_2', 'Bohren'),
('kein Strom', '2016-11-30 15:00:00', '2016-11-30 14:00:00', 'LeanLab_2', 'Bohren'),
('Material defekt', '2016-11-30 15:00:04', '2016-11-30 14:00:04', 'LeanLab_2', 'Bohren'),
('kein Strom', '2016-11-30 15:00:15', '2016-11-30 14:00:15', 'LeanLab_1', 'Bohren');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `auftrag`
--
ALTER TABLE `auftrag`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `stdauer`
--
ALTER TABLE `stdauer`
  ADD PRIMARY KEY (`auftrag`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
