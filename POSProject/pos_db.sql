-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2023 at 05:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(8) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama`, `harga`) VALUES
('BA123456', 'Beras 1kg', 10000),
('BU789012', 'Buah Segar 1kg', 10000),
('DA567890', 'Daging Ayam 1kg', 30000),
('GP987654', 'Gula Pasir 1kg', 12000),
('IS456789', 'Ikan Segar 1kg', 40000),
('KB789012', 'Kopi Bubuk 250 gram', 35000),
('KC123456', 'Keju Cheddar 1kg', 50000),
('KM234567', 'Kecap Manis 1 Botol', 10000),
('MG234567', 'Minyak Goreng 1L', 20000),
('MI567890', 'Mie Instan ', 3500),
('RT456789', 'Roti Tawar 1 Loaf', 10000),
('SO345678', 'Sambal Oelek 1 Botol', 5000),
('SS876543', 'Susu Sapi Segar 1L', 15000),
('SY234567', 'Sayuran Segar 1kg', 5000),
('TA345678', 'Telur Ayam 1 Butir', 2500);

-- --------------------------------------------------------

--
-- Table structure for table `itemtransaksi`
--

CREATE TABLE `itemtransaksi` (
  `id_item` int(11) NOT NULL,
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga_satuan` float NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_total` float NOT NULL,
  `id_transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itemtransaksi`
--

INSERT INTO `itemtransaksi` (`id_item`, `id_barang`, `nama_barang`, `harga_satuan`, `jumlah_barang`, `harga_total`, `id_transaksi`) VALUES
(27, 'BA123456', 'Beras 1kg', 10000, 10, 100000, 1),
(28, 'BA123456', 'Beras 1kg', 10000, 10, 100000, 2),
(29, 'BA123456', 'Beras 1kg', 10000, 10, 100000, 3),
(30, 'BA123456', 'Beras 1kg', 10000, 10, 100000, 4),
(31, 'BA123456', 'Beras 1kg', 10000, 2, 20000, 5),
(32, 'BU789012', 'Buah Segar 1kg', 10000, 3, 30000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `username`, `password`) VALUES
(1, 'hiskia', 'kelompokpbo'),
(2, 'john', 'kelompokpbo'),
(3, 'zwingli', 'kelompokpbo'),
(4, 'agus', 'kelompokpbo'),
(5, 'fadhlur', 'kelompokpbo');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `total_harga` float NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `total_harga`, `date`) VALUES
(1, 1, 100000, '27/04/2023 14:32:54'),
(2, 2, 100000, '27/04/2023 15:30:07'),
(3, 3, 100000, '27/04/2023 22:12:31'),
(4, 4, 100000, '27/04/2023 22:18:47'),
(5, 5, 50000, '28/04/2023 02:23:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `itemtransaksi`
--
ALTER TABLE `itemtransaksi`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `itemtransaksi`
--
ALTER TABLE `itemtransaksi`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
