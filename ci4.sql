-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 12:24 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dosen`
--

CREATE TABLE `tbl_dosen` (
  `id_dosen` int(11) NOT NULL,
  `kode_dosen` varchar(10) DEFAULT NULL,
  `nidn` varchar(10) DEFAULT NULL,
  `nama_dosen` varchar(50) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pend_terakhir` varchar(25) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` int(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `foto_dosen` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dosen`
--

INSERT INTO `tbl_dosen` (`id_dosen`, `kode_dosen`, `nidn`, `nama_dosen`, `tmp_lahir`, `tgl_lahir`, `pend_terakhir`, `alamat`, `no_hp`, `email`, `foto_dosen`, `password`) VALUES
(1, 'DSN0001', '221101058', 'Taufik, M.Kom', NULL, NULL, NULL, NULL, NULL, NULL, 'dosen.jpg', '1234'),
(2, 'DSN00002', '1111111112', 'Lius, M.Kom', 'Bojonegoro', '1996-12-26', 'S1', 'Jl. Mangga No. 3, Mataram', 895674767, 'taufik@gmail.com', '1703605147_8277de57899c5baa42ca.png', '1234'),
(4, 'DSN00004', '1111111114', 'Luiz, M.Kom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234'),
(5, 'DSN00005', '1111111115', 'Ibrahim, M.Kom.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fakultas`
--

CREATE TABLE `tbl_fakultas` (
  `id_fakultas` int(2) NOT NULL,
  `fakultas` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_fakultas`
--

INSERT INTO `tbl_fakultas` (`id_fakultas`, `fakultas`) VALUES
(1, 'Ilmu Komputer'),
(2, 'Ilmu Ekonomi'),
(3, 'Ilmu Pendidikan'),
(4, 'Ilmu Kesehatan'),
(5, 'Desain Komunikasi Visual');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gedung`
--

CREATE TABLE `tbl_gedung` (
  `id_gedung` int(2) NOT NULL,
  `gedung` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_gedung`
--

INSERT INTO `tbl_gedung` (`id_gedung`, `gedung`) VALUES
(1, 'Gedung A'),
(2, 'Gedung B'),
(3, 'Gedung C'),
(4, 'Gedung D'),
(5, 'Gedung E');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_prodi` int(2) DEFAULT NULL,
  `id_ta` int(4) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_matkul` int(11) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `id_ruangan` int(2) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id_jadwal`, `id_prodi`, `id_ta`, `id_kelas`, `id_matkul`, `id_dosen`, `hari`, `waktu`, `id_ruangan`, `quota`) VALUES
(45, 1, 7, 18, 120, 2, 'Senin', '08:00-10:00', 1, 25),
(46, 3, 7, 16, 121, 1, 'Selasa', '08:00-10:00', 1, 25),
(47, 2, 7, 13, 122, 3, 'Rabu', '08:00-10:00', 1, 25),
(48, 4, 7, 14, 123, 4, 'Kamis', '08:00-10:00', 1, 25),
(49, 6, 7, 15, 124, 5, 'Jumat', '08:00-10:00', 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) DEFAULT NULL,
  `id_prodi` int(2) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `tahun_angkatan` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id_kelas`, `nama_kelas`, `id_prodi`, `id_dosen`, `tahun_angkatan`) VALUES
(13, 'SK-A', 2, 3, 2023),
(14, 'MI-A', 4, 4, 2023),
(15, 'AK-A', 6, 5, 2023),
(16, 'TI-A', 3, 1, 2023),
(18, 'SI-A', 1, 2, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_krs`
--

CREATE TABLE `tbl_krs` (
  `id_krs` int(11) NOT NULL,
  `id_mhs` int(11) DEFAULT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `id_ta` int(11) DEFAULT NULL,
  `p1` int(1) DEFAULT 0,
  `p2` int(1) DEFAULT 0,
  `p3` int(1) DEFAULT 0,
  `p4` int(1) DEFAULT 0,
  `p5` int(1) DEFAULT 0,
  `p6` int(1) DEFAULT 0,
  `p7` int(1) DEFAULT 0,
  `p8` int(1) DEFAULT 0,
  `p9` int(1) DEFAULT 0,
  `p10` int(1) DEFAULT 0,
  `p11` int(1) DEFAULT 0,
  `p12` int(1) DEFAULT 0,
  `p13` int(1) DEFAULT 0,
  `p14` int(1) DEFAULT 0,
  `p15` int(1) DEFAULT 0,
  `p16` int(1) DEFAULT 0,
  `p17` int(1) DEFAULT 0,
  `p18` int(1) DEFAULT 0,
  `nilai_tugas` int(3) DEFAULT 0,
  `nilai_uts` int(3) DEFAULT 0,
  `nilai_uas` int(3) DEFAULT 0,
  `nilai_akhir` int(3) DEFAULT 0,
  `nilai_huruf` varchar(1) DEFAULT '-',
  `bobot` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_krs`
--

INSERT INTO `tbl_krs` (`id_krs`, `id_mhs`, `id_jadwal`, `id_ta`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `p10`, `p11`, `p12`, `p13`, `p14`, `p15`, `p16`, `p17`, `p18`, `nilai_tugas`, `nilai_uts`, `nilai_uas`, `nilai_akhir`, `nilai_huruf`, `bobot`) VALUES
(31, 51, 33, 1, 2, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 90, 80, 80, 78, 'B', 3),
(32, 52, 33, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 90, 80, 72, 'C', 2),
(33, 53, 33, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'E', 0),
(34, 54, 33, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'E', 0),
(35, 55, 33, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'E', 0),
(36, 56, 33, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'E', 0),
(37, 59, 33, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'E', 0),
(38, 61, 34, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'E', 0),
(39, 62, 34, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'E', 0),
(41, 4, 34, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 2, 0, 2, 2, 0, 90, 80, 80, 80, 'B', 3),
(42, 4, 37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 80, 80, 78, 'B', 3),
(43, 4, 38, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 90, 90, 78, 'A', 4),
(44, 4, 39, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 80, 80, 78, 'B', 3),
(45, 4, 40, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 80, 80, 78, 'B', 3),
(46, 4, 41, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 80, 80, 78, 'B', 3),
(47, 4, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 80, 80, 78, 'B', 3),
(48, 4, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 90, 90, 90, 'A', 4),
(49, 34, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '-', 0),
(50, 34, 37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '-', 0),
(51, 98, 44, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '-', 0),
(53, 104, 45, 7, 1, 2, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 70, 80, 70, 'C', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matkul`
--

CREATE TABLE `tbl_matkul` (
  `id_matkul` int(11) NOT NULL,
  `kode_matkul` varchar(10) DEFAULT NULL,
  `matkul` varchar(255) DEFAULT NULL,
  `sks` int(1) DEFAULT NULL,
  `kategori` varchar(10) DEFAULT NULL,
  `smt` int(1) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `id_prodi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_matkul`
--

INSERT INTO `tbl_matkul` (`id_matkul`, `kode_matkul`, `matkul`, `sks`, `kategori`, `smt`, `semester`, `id_prodi`) VALUES
(120, 'SK01', 'manajemen basis data', 3, 'Wajib', 2, 'Genap', 1),
(121, 'TI01', 'Pemograman Web', 3, 'Wajib', 2, 'Genap', 3),
(122, 'SK1', 'pemrograman dekstop', 4, 'Wajib', 2, 'Genap', 2),
(123, 'MI01', 'technopreneur', 4, 'Wajib', 2, 'Genap', 4),
(124, 'AK01', 'MATEMATIKA', 3, 'Wajib', 2, 'Genap', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mhs`
--

CREATE TABLE `tbl_mhs` (
  `id_mhs` int(11) NOT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `nama_mhs` varchar(50) DEFAULT NULL,
  `id_prodi` int(2) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` int(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `foto_mhs` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mhs`
--

INSERT INTO `tbl_mhs` (`id_mhs`, `nim`, `nama_mhs`, `id_prodi`, `alamat`, `no_hp`, `email`, `password`, `foto_mhs`, `id_kelas`) VALUES
(99, '221101000', 'Dusan Vlahovic', 3, '', 0, '', '1234', '1703597777_c1647d15b896050913e0.png', 16),
(101, '221101002', 'Lewis Hall', 2, '', 0, '', '1234', '1703597877_a8a735ca22edc0d847d4.png', 13),
(102, '221101003', 'Florian Wirtz', 4, '', 0, '', '1234', '1703597977_43596fcbbb1f4200b114.png', 14),
(103, '221101004', 'Emil Smith Rowe', 6, '', 0, '', '1234', '1703598069_93a99bfa19c7cb7d84a7.png', 15),
(104, '221101001', 'Federico Chiesa', 1, '', 0, '', '1234', '1703598502_49417f1e82f287213911.png', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prodi`
--

CREATE TABLE `tbl_prodi` (
  `id_prodi` int(2) NOT NULL,
  `id_fakultas` int(2) DEFAULT NULL,
  `kode_prodi` varchar(10) DEFAULT NULL,
  `prodi` varchar(50) DEFAULT NULL,
  `jenjang` varchar(10) NOT NULL,
  `ka_prodi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_prodi`
--

INSERT INTO `tbl_prodi` (`id_prodi`, `id_fakultas`, `kode_prodi`, `prodi`, `jenjang`, `ka_prodi`) VALUES
(1, 1, 'SI', 'Sistem Informasi', 'S1', 'YORI APRIDONAL M, M.Kom.'),
(2, 1, 'SK', 'Sistem Komputer', 'S1', 'SRI REZKI MAULINA AZMI, M.Pd.'),
(3, 1, 'TI', 'Teknik Informatika', 'S1', 'SUCI ANDRIYANI, M.Kom.'),
(4, 1, 'MI', 'Manajemen Informatika', 'D3', 'EDI KURNIAWAN, M.Kom.'),
(6, 2, 'AK', 'Akuntansi', 'S1', 'TIKA CHRISTY, M.Kom.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ruangan`
--

CREATE TABLE `tbl_ruangan` (
  `id_ruangan` int(2) NOT NULL,
  `id_gedung` int(2) DEFAULT NULL,
  `ruangan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ruangan`
--

INSERT INTO `tbl_ruangan` (`id_ruangan`, `id_gedung`, `ruangan`) VALUES
(1, 1, 'A1'),
(2, 1, 'A2'),
(3, 1, 'A3'),
(4, 1, 'A4'),
(5, 1, 'A5'),
(6, 1, 'A6'),
(7, 1, 'Lab A1'),
(8, 1, 'Lab A2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ta`
--

CREATE TABLE `tbl_ta` (
  `id_ta` int(4) NOT NULL,
  `ta` varchar(10) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ta`
--

INSERT INTO `tbl_ta` (`id_ta`, `ta`, `semester`, `status`) VALUES
(6, '2022/2023', 'Ganjil', 0),
(7, '2022/2023', 'Genap', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_user`, `username`, `password`, `foto`) VALUES
(1, 'Taufik', 'admin', 'admin', 'foto.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `tbl_fakultas`
--
ALTER TABLE `tbl_fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `tbl_gedung`
--
ALTER TABLE `tbl_gedung`
  ADD PRIMARY KEY (`id_gedung`);

--
-- Indexes for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  ADD PRIMARY KEY (`id_krs`);

--
-- Indexes for table `tbl_matkul`
--
ALTER TABLE `tbl_matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `tbl_mhs`
--
ALTER TABLE `tbl_mhs`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `tbl_ruangan`
--
ALTER TABLE `tbl_ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `tbl_ta`
--
ALTER TABLE `tbl_ta`
  ADD PRIMARY KEY (`id_ta`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_fakultas`
--
ALTER TABLE `tbl_fakultas`
  MODIFY `id_fakultas` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_gedung`
--
ALTER TABLE `tbl_gedung`
  MODIFY `id_gedung` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tbl_matkul`
--
ALTER TABLE `tbl_matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `tbl_mhs`
--
ALTER TABLE `tbl_mhs`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  MODIFY `id_prodi` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_ruangan`
--
ALTER TABLE `tbl_ruangan`
  MODIFY `id_ruangan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_ta`
--
ALTER TABLE `tbl_ta`
  MODIFY `id_ta` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
