-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2023 at 04:10 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicalnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `is_obat`
--

CREATE TABLE `is_obat` (
  `kode_obat` varchar(7) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user` int(3) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nama_obat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `is_obat`
--

INSERT INTO `is_obat` (`kode_obat`, `harga_beli`, `harga_jual`, `satuan`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`, `nama_obat`) VALUES
('B000001', 10000, 20000, 'Kotak', 0, 1, '2023-05-30 03:45:41', 1, '2023-06-30 15:27:18', 'paramex'),
('B000002', 10000, 30000, 'Botol', 0, 1, '2023-06-12 11:50:46', 1, '2023-07-04 01:57:56', 'parasol');

-- --------------------------------------------------------

--
-- Table structure for table `is_obat_keluar`
--

CREATE TABLE `is_obat_keluar` (
  `kode_transaksi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_obat` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `is_obat_keluar`
--

INSERT INTO `is_obat_keluar` (`kode_transaksi`, `kode_obat`, `jumlah_keluar`, `tanggal_keluar`) VALUES
('TK-2023-0000001', 'B000002', 50, '2023-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `is_obat_masuk`
--

CREATE TABLE `is_obat_masuk` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode_obat` varchar(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `pemasok` varchar(7) NOT NULL,
  `created_user` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `is_obat_masuk`
--

INSERT INTO `is_obat_masuk` (`kode_transaksi`, `tanggal_masuk`, `kode_obat`, `jumlah_masuk`, `pemasok`, `created_user`) VALUES
('TM-2023-0000001', '2023-07-04', 'B000002', 50, 'P000001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `is_pemasok`
--

CREATE TABLE `is_pemasok` (
  `kode_pemasok` varchar(7) NOT NULL,
  `nama_pemasok` varchar(50) NOT NULL,
  `no_hp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `is_pemasok`
--

INSERT INTO `is_pemasok` (`kode_pemasok`, `nama_pemasok`, `no_hp`) VALUES
('P000001', 'kimia farma', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `is_users`
--

CREATE TABLE `is_users` (
  `id_user` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Super Admin','Manajer','Gudang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `is_users`
--

INSERT INTO `is_users` (`id_user`, `username`, `nama_user`, `password`, `email`, `telepon`, `foto`, `hak_akses`) VALUES
(1, 'admin', 'Admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', '085', 'user-default.png', 'Super Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `is_obat`
--
ALTER TABLE `is_obat`
  ADD PRIMARY KEY (`kode_obat`),
  ADD KEY `created_user` (`created_user`),
  ADD KEY `updated_user` (`updated_user`);

--
-- Indexes for table `is_obat_keluar`
--
ALTER TABLE `is_obat_keluar`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `is_obat_keluar_ibfk_1` (`kode_obat`);

--
-- Indexes for table `is_obat_masuk`
--
ALTER TABLE `is_obat_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_barang` (`kode_obat`),
  ADD KEY `created_user` (`created_user`),
  ADD KEY `pemasok` (`pemasok`);

--
-- Indexes for table `is_pemasok`
--
ALTER TABLE `is_pemasok`
  ADD PRIMARY KEY (`kode_pemasok`);

--
-- Indexes for table `is_users`
--
ALTER TABLE `is_users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `level` (`hak_akses`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `is_users`
--
ALTER TABLE `is_users`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `is_obat`
--
ALTER TABLE `is_obat`
  ADD CONSTRAINT `is_obat_ibfk_1` FOREIGN KEY (`created_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `is_obat_ibfk_2` FOREIGN KEY (`updated_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `is_obat_keluar`
--
ALTER TABLE `is_obat_keluar`
  ADD CONSTRAINT `is_obat_keluar_ibfk_1` FOREIGN KEY (`kode_obat`) REFERENCES `is_obat` (`kode_obat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `is_obat_masuk`
--
ALTER TABLE `is_obat_masuk`
  ADD CONSTRAINT `is_obat_masuk_ibfk_1` FOREIGN KEY (`kode_obat`) REFERENCES `is_obat` (`kode_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `is_obat_masuk_ibfk_2` FOREIGN KEY (`created_user`) REFERENCES `is_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
