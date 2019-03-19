-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2018 at 04:31 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `id_kategorije` int(11) NOT NULL,
  `naziv` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `aktivnost` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id_kategorije`, `naziv`, `aktivnost`) VALUES
(1, 'Laptop', 1),
(2, 'Mobitel', 1),
(3, 'PC', 1),
(4, 'Tablet', 1),
(5, 'TV prijemnik', 1),
(29, 'mandarina', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kosarica`
--

CREATE TABLE `kosarica` (
  `id_kosarica` int(11) NOT NULL,
  `datum` date NOT NULL,
  `cijena` float NOT NULL,
  `fk_blagajnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kosarica`
--

INSERT INTO `kosarica` (`id_kosarica`, `datum`, `cijena`, `fk_blagajnik`) VALUES
(92, '2018-04-15', 4301.8, 27),
(93, '2018-04-15', 1600.9, 27),
(94, '2018-04-15', 3380.9, 36),
(95, '2018-04-15', 2200, 28),
(96, '2018-04-15', 1200, 28);

-- --------------------------------------------------------

--
-- Table structure for table `osoba`
--

CREATE TABLE `osoba` (
  `id_osoba` int(11) NOT NULL,
  `ime` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `e_mail` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lozinka` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `administrator` tinyint(1) NOT NULL,
  `aktivnost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `osoba`
--

INSERT INTO `osoba` (`id_osoba`, `ime`, `prezime`, `e_mail`, `lozinka`, `administrator`, `aktivnost`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '12345', 1, 1),
(27, 'Matej', 'Pilekic', 'matej@gmail.com', 'matej123', 0, 1),
(28, 'Marko', 'Maric', 'marko@hotmail.com', '123456', 0, 1),
(30, 'ivana', 'vikic', 'ivana@hotmail.com', '123456', 0, 0),
(36, 'Zvonko', 'Cavar', 'zvonimir@gmail.com', '12345', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prodaje`
--

CREATE TABLE `prodaje` (
  `id_prodaje` int(11) NOT NULL,
  `fk_proizvod` int(11) NOT NULL,
  `fk_kosarica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prodaje`
--

INSERT INTO `prodaje` (`id_prodaje`, `fk_proizvod`, `fk_kosarica`) VALUES
(152, 23, 92),
(153, 29, 92),
(154, 29, 92),
(155, 29, 93),
(156, 26, 94),
(157, 26, 94),
(158, 29, 94),
(159, 23, 95),
(160, 23, 95),
(161, 19, 96);

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

CREATE TABLE `proizvod` (
  `id_proizvoda` int(11) NOT NULL,
  `ime` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `kolicina` int(11) NOT NULL,
  `cijena` float NOT NULL,
  `fk_kategorija` int(11) NOT NULL,
  `aktivnost` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `proizvod`
--

INSERT INTO `proizvod` (`id_proizvoda`, `ime`, `kolicina`, `cijena`, `fk_kategorija`, `aktivnost`) VALUES
(19, 'Acer E15', 8, 1200, 1, 1),
(20, 'Huawei P9 Lite', 12, 500, 2, 1),
(21, 'Iphone X', 5, 2000, 2, 1),
(22, 'Alienware Alpha gaming PC', 11, 900, 3, 1),
(23, 'Acer Aspire Nitro 5', 17, 1100, 3, 1),
(24, 'Tesla TV 32\'\' HD', 8, 400, 5, 1),
(25, 'SONY 55XE7005 4K SMART TV', 8, 1339.95, 5, 1),
(26, 'Lenovo IdeaPad 320', 21, 890, 1, 1),
(27, 'panasonic', 5, 30, 5, 0),
(28, 'mardarina', 2, 2, 29, 0),
(29, 'Samsung S9', 29, 1600.9, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`id_kategorije`);

--
-- Indexes for table `kosarica`
--
ALTER TABLE `kosarica`
  ADD PRIMARY KEY (`id_kosarica`),
  ADD KEY `fk_blagajnik` (`fk_blagajnik`);

--
-- Indexes for table `osoba`
--
ALTER TABLE `osoba`
  ADD PRIMARY KEY (`id_osoba`);

--
-- Indexes for table `prodaje`
--
ALTER TABLE `prodaje`
  ADD PRIMARY KEY (`id_prodaje`),
  ADD KEY `fk_proizvod` (`fk_proizvod`),
  ADD KEY `fk_kosarica` (`fk_kosarica`);

--
-- Indexes for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD PRIMARY KEY (`id_proizvoda`),
  ADD KEY `fk_kategorija` (`fk_kategorija`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `id_kategorije` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `kosarica`
--
ALTER TABLE `kosarica`
  MODIFY `id_kosarica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `osoba`
--
ALTER TABLE `osoba`
  MODIFY `id_osoba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `prodaje`
--
ALTER TABLE `prodaje`
  MODIFY `id_prodaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `proizvod`
--
ALTER TABLE `proizvod`
  MODIFY `id_proizvoda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kosarica`
--
ALTER TABLE `kosarica`
  ADD CONSTRAINT `kosarica_ibfk_1` FOREIGN KEY (`fk_blagajnik`) REFERENCES `osoba` (`id_osoba`) ON UPDATE CASCADE;

--
-- Constraints for table `prodaje`
--
ALTER TABLE `prodaje`
  ADD CONSTRAINT `prodaje_ibfk_2` FOREIGN KEY (`fk_proizvod`) REFERENCES `proizvod` (`id_proizvoda`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prodaje_ibfk_3` FOREIGN KEY (`fk_kosarica`) REFERENCES `kosarica` (`id_kosarica`) ON UPDATE CASCADE;

--
-- Constraints for table `proizvod`
--
ALTER TABLE `proizvod`
  ADD CONSTRAINT `proizvod_ibfk_1` FOREIGN KEY (`fk_kategorija`) REFERENCES `kategorija` (`id_kategorije`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
