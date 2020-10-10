-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 10 Okt 2020 pada 05.09
-- Versi server: 10.1.46-MariaDB
-- Versi PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--
-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `bukti` text NOT NULL,
  `tgl_invoice` date NOT NULL,
  `status` enum('pending','approve') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `member_id`, `deposit`, `bukti`, `tgl_invoice`, `status`) VALUES
(138, 132, 20, '', '2020-10-10', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `saldo` int(11) NOT NULL,
  `last_login` date NOT NULL,
  `tgl_registrasi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan`
--

CREATE TABLE `pengaturan` (
  `pengaturan_id` int(11) NOT NULL,
  `nama_perusahaan` varchar(50) NOT NULL,
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_author` text NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `mode_maintenance` enum('0','1') NOT NULL DEFAULT '0',
  `mode_register` enum('0','1') NOT NULL DEFAULT '1',
  `user_admin` varchar(50) NOT NULL,
  `pass_admin` varchar(100) NOT NULL,
  `last_login` date NOT NULL,
  `bank_account` text NOT NULL,
  `mata_uang` enum('Rp','RM') NOT NULL DEFAULT 'Rp'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengaturan`
--

INSERT INTO `pengaturan` (`pengaturan_id`, `nama_perusahaan`, `meta_title`, `meta_description`, `meta_keyword`, `meta_author`, `alamat`, `email`, `no_hp`, `mode_maintenance`, `mode_register`, `user_admin`, `pass_admin`, `last_login`, `bank_account`, `mata_uang`) VALUES
(1, 'PandaEver', 'SSH Provider', 'Provider SSH Terpercaya', 'SSH Provider', 'PandaEver.com', 'Perawas,TanjungPandan,Belitung,Kep.BangkaBelitung', 'justpandaevers@gmail.com', '082278103764', '0', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2020-10-09', 'DANA: 082278103764<br>\r\nGopay: 082278103764', 'Rp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `server`
--

CREATE TABLE `server` (
  `server_id` int(11) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `ip_server` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `link_config` text NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Struktur dari tabel `t_account`
--

CREATE TABLE `t_account` (
  `account_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `username_ssh` varchar(50) NOT NULL,
  `password_ssh` varchar(50) NOT NULL,
  `tgl_buat` date NOT NULL,
  `expired_account` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--
--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indeks untuk tabel `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD PRIMARY KEY (`pengaturan_id`);

--
-- Indeks untuk tabel `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`server_id`);

--
-- Indeks untuk tabel `t_account`
--
ALTER TABLE `t_account`
  ADD PRIMARY KEY (`account_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--
--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `pengaturan`
--
ALTER TABLE `pengaturan`
  MODIFY `pengaturan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `server`
--
ALTER TABLE `server`
  MODIFY `server_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `t_account`
--
ALTER TABLE `t_account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
