-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 13 feb 2019 om 00:25
-- Serverversie: 10.1.32-MariaDB
-- PHP-versie: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oil`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `countries`
--

INSERT INTO `countries` (`id`, `name`, `flag`, `code`) VALUES
(1, 'Iran', '/img/flags/Iran.gif', 'N9TT-9G0A'),
(2, 'North-Korea', '/img/flags/North_Korea.gif', 'QK6A-JI6S'),
(3, 'USA', '/img/flags/United_States.gif', 'SXFP-CHYK'),
(4, 'Russia', '/img/flags/Russia.gif', 'XNSS-HSJW'),
(5, 'Saudi-Arabia', '/img/flags/Saudi_Arabia.gif', 'NHLE-L6MI'),
(6, 'Mexio', '/img/flags/United_States.gif', ''),
(7, 'Nederland', '/img/flags/United_States.gif', ''),
(8, 'Duitsland', '/img/flags/United_States.gif', ''),
(9, 'Brasil', '/img/flags/United_States.gif', ''),
(10, 'Norge', '/img/flags/United_States.gif', ''),
(11, 'Beglium', '/img/flags/United_States.gif', ''),
(12, 'France', '/img/flags/United_States.gif', ''),
(13, 'Spania', '/img/flags/United_States.gif', ''),
(14, 'Ungarn', '/img/flags/United_States.gif', ''),
(15, 'Portugal', '/img/flags/United_States.gif', ''),
(16, 'England', '/img/flags/United_States.gif', ''),
(17, 'Sweden', '/img/flags/United_States.gif', ''),
(18, 'Denemarken', '/img/flags/United_States.gif', ''),
(19, 'Finland', '/img/flags/United_States.gif', ''),
(20, 'Polen', '/img/flags/United_States.gif', '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2017_06_02_214513_create_tables', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `oil`
--

CREATE TABLE `oil` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `lpm` int(11) NOT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `oil`
--

INSERT INTO `oil` (`id`, `country_id`, `source_id`, `lpm`, `start`, `end`) VALUES
(27, 6, 1, 3, '2019-02-12 19:21:50', '2019-02-12 19:21:51'),
(28, 7, 1, 3, '2019-02-12 19:21:51', '2019-02-12 19:21:53'),
(29, 8, 1, 3, '2019-02-12 19:21:53', '2019-02-12 19:21:54'),
(30, 9, 1, 3, '2019-02-12 19:21:54', '2019-02-12 19:21:55'),
(31, 10, 1, 3, '2019-02-12 19:21:55', '2019-02-12 19:21:57'),
(32, 11, 1, 3, '2019-02-12 19:21:57', '2019-02-12 19:21:59'),
(33, 12, 1, 3, '2019-02-12 19:21:59', '2019-02-12 19:22:01'),
(34, 20, 1, 3, '2019-02-12 19:22:01', '2019-02-12 19:22:02'),
(35, 19, 1, 3, '2019-02-12 19:22:02', '2019-02-12 19:22:04'),
(36, 18, 1, 3, '2019-02-12 19:22:04', '2019-02-12 19:22:05'),
(37, 17, 1, 3, '2019-02-12 19:22:05', '2019-02-12 19:22:07'),
(38, 16, 1, 3, '2019-02-12 19:22:07', '2019-02-12 19:22:08'),
(39, 15, 1, 3, '2019-02-12 19:22:08', '2019-02-12 19:22:10'),
(40, 14, 1, 3, '2019-02-12 19:22:10', '2019-02-12 19:22:12'),
(41, 13, 1, 3, '2019-02-12 19:22:12', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sources`
--

CREATE TABLE `sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` int(2) DEFAULT NULL,
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `lpm` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sources`
--

INSERT INTO `sources` (`id`, `number`, `title`, `owner_id`, `lpm`, `code`) VALUES
(1, 1, 'Nairobi', 13, 3, 'B7FQ-RANC'),
(2, 2, 'Beijing', 2, 4, '7ETR-0A6C'),
(3, 3, 'Tehran', 5, 3, '3NGU-8XTJ'),
(4, 4, 'Yokohama', 2, 4, '4GE4-ETEV'),
(5, 5, 'Casablanca', 4, 4, '33FI-XHV3'),
(6, 6, 'Istanbul', 5, 2, '2YNV-3L4Y');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `oil`
--
ALTER TABLE `oil`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `oil`
--
ALTER TABLE `oil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT voor een tabel `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
