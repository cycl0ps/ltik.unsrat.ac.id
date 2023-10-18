-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 04, 2013 at 06:31 PM
-- Server version: 5.0.95
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ltik_labis`
--

-- --------------------------------------------------------

--
-- Table structure for table `asisten`
--

CREATE TABLE IF NOT EXISTS `asisten` (
  `id_asisten` int(11) NOT NULL auto_increment,
  `nim_asisten` varchar(15) NOT NULL,
  `id_praktikum` int(11) NOT NULL,
  PRIMARY KEY  (`id_asisten`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `asisten`
--

INSERT INTO `asisten` (`id_asisten`, `nim_asisten`, `id_praktikum`) VALUES
(1, '100216063', 1),
(2, '100216077', 1),
(3, '100216038', 1),
(4, '100216034', 1),
(5, '100216047', 1),
(6, '100216082', 1),
(7, '100216064', 1),
(8, '100216060', 1),
(9, '100216003', 1),
(10, '100216076', 1),
(11, '100216071', 1),
(12, '100216054', 1),
(13, '090213035', 2),
(14, '090213050', 2),
(15, '090213004', 2),
(16, '090213016', 2),
(17, '090213034', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `id_dosen` int(11) NOT NULL auto_increment,
  `nip_dosen` varchar(20) NOT NULL,
  `id_praktikum` int(11) NOT NULL,
  PRIMARY KEY  (`id_dosen`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip_dosen`, `id_praktikum`) VALUES
(1, '197711202010121002', 1),
(2, '197711202010121002', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_praktikum`
--

CREATE TABLE IF NOT EXISTS `kelompok_praktikum` (
  `id_kelompok` int(11) NOT NULL auto_increment,
  `id_praktikum` int(11) NOT NULL,
  `nama_kelompok` int(11) NOT NULL,
  `nim_asisten` varchar(15) default NULL,
  PRIMARY KEY  (`id_kelompok`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `koordinator`
--

CREATE TABLE IF NOT EXISTS `koordinator` (
  `id_koordinator` int(11) NOT NULL auto_increment,
  `nim_koordinator` varchar(15) NOT NULL,
  `id_praktikum` int(11) NOT NULL,
  PRIMARY KEY  (`id_koordinator`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `koordinator`
--

INSERT INTO `koordinator` (`id_koordinator`, `nim_koordinator`, `id_praktikum`) VALUES
(1, '100216047', 1),
(2, '090213016', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id_matakuliah` int(11) NOT NULL auto_increment,
  `nama_matakuliah` varchar(50) NOT NULL,
  `deskripsi_matakuliah` text NOT NULL,
  `kode_matakuliah` varchar(15) NOT NULL,
  `sem_matakuliah` int(5) NOT NULL,
  `tipesem_matakuliah` enum('Ganjil','Genap') NOT NULL,
  PRIMARY KEY  (`id_matakuliah`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_matakuliah`, `nama_matakuliah`, `deskripsi_matakuliah`, `kode_matakuliah`, `sem_matakuliah`, `tipesem_matakuliah`) VALUES
(1, 'Praktikum Pengantar Teknologi Informasi', '', 'IFC1521', 1, 'Ganjil'),
(2, 'Praktikum Algoritma dan Pemrograman', '', 'IFC2521', 2, 'Genap'),
(3, 'Praktikum Struktur Data', '', 'IFC3521', 3, 'Ganjil'),
(4, 'Praktikum Jaringan Komputer', '', 'IFC3522', 3, 'Ganjil'),
(5, 'Praktikum Metode Numerik', '', 'IFC4521', 4, 'Genap'),
(6, 'Praktikum Sistem Basis Data', '', 'IFC4522', 4, 'Genap'),
(7, 'Praktikum Sistem Operasi', '', 'IFC5521', 5, 'Ganjil');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id_member` int(11) NOT NULL auto_increment,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `angkatan` year(4) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` char(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `tgl_update` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `isPraktikan` tinyint(1) NOT NULL default '0',
  `isAsisten` tinyint(1) NOT NULL default '0',
  `isKoordinator` tinyint(1) NOT NULL default '0',
  `isDosen` tinyint(1) NOT NULL default '0',
  `isAdmin` tinyint(1) NOT NULL default '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_member`),
  UNIQUE KEY `nim` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=260 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama`, `username`, `angkatan`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `email`, `tgl_daftar`, `tgl_update`, `foto`, `isPraktikan`, `isAsisten`, `isKoordinator`, `isDosen`, `isAdmin`, `password`) VALUES
(1, 'Administrator', 'admin', 0000, '', '1900-01-01', '', '', '', '', '2013-02-23', '2013-02-23', 'admin.jpg', 1, 1, 1, 0, 1, 'a774eda49e9eee544d3e2cc2dec2d6e1'),
(2, 'Deddy Christoper Kakunsi', '090213016', 2009, 'Manado', '1991-12-05', 'Laki-Laki', 'Paniki Bawah Lingk. VI, Kecamatan Mapanget', '+6282347643198', 'deddy.kakunsi@gmail.com', '2013-02-27', '2013-02-27', '', 0, 1, 1, 0, 0, '17097783ba913edc3671e738eecf1b1b'),
(3, 'Arifializevic Marthen Maribondang', '100216082', 2010, 'Bitung', '1993-04-05', 'Laki-Laki', 'Perum. Lembah Nyiur Kairagi Mas, Kec. Mapanger, Kel. Kairagi 2', '085240229993', 'ariethen93@yahoo.co.id', '2013-02-27', '2013-02-27', '100216082.jpg', 0, 1, 0, 0, 0, '827ccb0eea8a706c4c34a16891f84e7b'),
(4, 'Michello Suwandi', '100216060', 2010, 'Manado', '1992-10-15', 'Laki-Laki', 'Kleak', '085657322492', 'micey_pippo.milan@yahoo.com', '2013-02-27', '2013-02-27', '', 0, 1, 0, 0, 0, '438ef815b5c68cf99742a9a2f237b544'),
(5, 'Billy Marentek', '100216063', 2010, 'Manado', '1993-10-12', 'Laki-Laki', 'Karombasan', '081244121045', 'bmarentek@yahoo.com', '2013-02-27', '2013-02-27', '', 0, 1, 0, 0, 0, 'bfacebdf561a01b422af948306a9df03'),
(6, 'Jenry Jimmy Masudara', '100216064', 2010, 'Manado', '1992-06-15', 'Laki-Laki', 'Wanea Lingkungan IV No.121', '089698123101', 'jenrymasudara@ymail.com', '2013-02-27', '2013-02-27', '100216064.jpg', 0, 1, 0, 0, 0, 'fb87aa0232412a4c298e98f2e8e22558'),
(7, 'Eko Grand Pandara', '100216034', 2010, 'Bahoi', '1992-06-02', 'Laki-Laki', 'Bahu link 2', '085341075544', 'ekopandara@ymail.com', '2013-02-27', '2013-02-27', '', 0, 1, 0, 0, 0, '45ca96fdaea1653800dd7a9006bb644f'),
(8, 'Fanno Hizkia Tulangow', '100216038', 2010, 'Manado', '1992-10-04', 'Laki-Laki', 'Malalayang 1 Lingkungan 3 Manado', '089698144244', 'fanno.tulangow@yahoo.com', '2013-02-27', '2013-02-27', '', 0, 1, 0, 0, 0, '38899f10b65ff7c314a69755ace09553'),
(9, 'Bayu Sy. Kurniawan', '110216016', 2011, 'Manado', '1994-03-24', 'Laki-Laki', 'Singkil 2 Link.II Manado', '089697982382', 'bayulasahido@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '2bda16b15a2e3ee198a440257b5b175a'),
(10, 'Kelvin Herdiando Wijaya', '100216077', 2010, 'Manado', '1993-03-07', 'Laki-Laki', 'Batu Kota Lingkungan 1 Manado', '085342167770', 'kelvin.Hwijaya@gmail.com', '2013-02-27', '2013-02-27', '', 0, 1, 0, 0, 0, '8c4f88e5260b1aea75d6675c81858956'),
(11, 'Linda Jayanti', '110216014', 2011, 'Berau', '1993-10-16', 'Perempuan', 'Malalayang', '082157099984', 'lindajayanti14@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'acb1fd6048557c5b24d4d8ab3f16fe51'),
(12, 'Jos Forman Tompoh', '110216120', 2011, 'Tobelo', '1992-06-04', 'Laki-Laki', 'Bahu Lingkungan II', '085240077717', 'josh.tompoh@windowslive.com', '2013-02-27', '2013-02-27', '110216120.jpg', 1, 0, 0, 0, 0, '789c8ac4ec47c28e752efde78ca37ff6'),
(13, 'Mohamad Harly Jamad Hamzah', '110216036', 2011, 'GORONTALO', '1992-03-10', 'Laki-Laki', 'KEL. AMURANG LINGK. 1 KEC. AMURANG KAB. MINAHASA SELATAN', '089632353655', 'ahrlee21@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '973696ef07947fe7d3f6fa2b354580ed'),
(14, 'Amartia Constantine Langi', '110216002', 2011, 'Pune', '1993-06-15', 'Perempuan', 'Teling Atas Lingkungan V', '089636841185', 'amoreoika@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'daabdee58cf0c123aa239859fe7c2090'),
(15, 'Lisnawati Riadi', '110216150', 2011, 'Manado', '1993-09-20', 'Perempuan', 'Perkamil,Sapta Marga 5 No.5 Ling 2  - Manado', '082195277274', 'lisnariadi@gmail.com', '2013-02-27', '2013-02-27', '110216150.jpg', 1, 0, 0, 0, 0, '2ffd7b2ddb781c01d1fc09487f5fe683'),
(16, 'Frincy Tedy Poluan', '100216003', 2010, 'Tomohon', '1993-02-01', 'Laki-Laki', 'Woloan Satu, Tomohon Barat, Tomohon', '085656592022', 'frinsipoluan@gmail.com', '2013-02-27', '2013-02-27', '', 0, 1, 0, 0, 0, '95385a1de43e30d00a9e7dfa835232f1'),
(17, 'Novianti Soleman', '110216116', 2011, 'Manado', '1993-11-06', 'Perempuan', 'Maasing Ling 3', '082189746174', 'opiie.suleman@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '77888cfbac9c525ab73e89cf103ff726'),
(18, 'Sutrisno Adam', '090213050', 2009, 'Sarongsong1', '1991-05-21', 'Laki-Laki', 'Airmadidi', '085342559444', 'ninoadams2@yahoo.co.id', '2013-02-27', '2013-02-27', '090213050.jpg', 0, 1, 0, 0, 0, '8d75345fcdd782a0be0fb2f36de273d0'),
(19, 'Dewi Hardiyanti Dai', '110216054', 2011, 'Manado', '1993-10-04', 'Perempuan', 'Perkamil Kec.Tikala', '089664916696', 'hardiyanti041093@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '799d6232c921455e27d0a049e96308a0'),
(20, 'Rini Indrawati Manopo', '110216031', 2011, 'Manado', '1993-09-24', 'Perempuan', 'Banjer Lingkungan VII', '085298233127', 'rini.manpo@ymail.com', '2013-02-27', '2013-02-27', '110216031.jpg', 1, 0, 0, 0, 0, '469b9a7c030b5c022bc8b8aacecaf1f6'),
(21, 'Firginia Laras B. Putri', '110216003', 2011, 'Manado', '1994-04-15', 'Perempuan', 'Kampus Barat', '081244959603', 'firginiaputri@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '265f46a91783b6111f069d1d3866a6fb'),
(22, 'Isnainie Baaman', '110216035', 2011, 'Manado', '1993-04-19', 'Laki-Laki', 'Perkamil, Jln.Manguni 17 Ling 4', '081356937794', 'isnaini_baaman@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'd5b963d345beeb7ca4ca92b15f10ce70'),
(23, 'Lorenzo Maximilian Kasenda', '110216119', 2011, 'Remboken', '1993-08-09', 'Laki-Laki', 'Kleak Link 1', '+6282347545409', 'lorenzokasenda@yahoo.com', '2013-02-27', '2013-02-27', '110216119.jpg', 1, 0, 0, 0, 0, '4628039e4f6caccee5fd86c430959f4c'),
(24, 'Olivia Hasan', '110216155', 2011, 'Manado', '1993-10-26', 'Perempuan', 'Teling Atas Link 1', '+6289662759642', 'olivia_hasan26@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'f1999581a712fcc62cdf0e9838998e1e'),
(25, 'Erin Ariandis Baura', '110216064', 2011, 'Tobelo', '1993-09-25', 'Laki-Laki', 'bahu', '081241478725', 'erinbaura@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '3e7c189fdd6a44dfbf3e7bda2d82e1a1'),
(26, 'Arif Hidayatulloh', '110216069', 2011, 'Manado', '1993-07-19', 'Laki-Laki', 'Desa Tateli Jaga IV', '+628971079712', 'kamikazeariefh@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '2919c4ed8636625030b795be93ae5634'),
(27, 'Gabriella Shella Antameng', '110216011', 2011, 'Manado', '1994-08-15', 'Perempuan', 'Tuminting Lingkungan V', '089698546594', 'gabriellaantameng@ymail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '77ccc55d9b13cdadf005a0f0a2038288'),
(28, 'Dadang Hermanto Makalalag', '110216091', 2011, 'Maelang', '1993-10-06', 'Laki-Laki', 'Kleak', '081244017116', 'Dadang.chota@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'ee79bf5b02ad571e414830541eb13c18'),
(29, 'Elia Limbong', '110216007', 2011, 'Biak', '1992-07-04', 'Laki-Laki', 'Bahu', '085256924567', 'elialimbong@gmail.com', '2013-02-27', '2013-02-27', '110216007.jpg', 1, 0, 0, 0, 0, 'a1903e765356f553a34748c8006ccddf'),
(30, 'Trisnawati Makmur', '110216111', 2011, 'Tomohon', '1993-03-09', 'Perempuan', 'Tuminting Lingkungan V', '082393023667', 'trisna_makmur@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'b917debc76b13d6bba5674a015f6921f'),
(31, 'Indira Wowiling', '110216143', 2011, 'Tondano', '1993-04-13', 'Perempuan', 'Taas Lingkungan V', '085341128456', 'indira_1309@yahoo.co.id', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'f80d42cf929b5ba7d7e70994f46dd2dc'),
(32, 'sintia dewi dalalu', '110216008', 2011, 'Manado', '1993-09-14', 'Perempuan', 'banjer', '085256934561', 'sintiadewi0709@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '89fe029c46da5c24288c2961728b1135'),
(33, 'Marceland Karundeng', '110216020', 2011, 'Manado', '1994-03-10', 'Laki-Laki', 'Bahu, jln.kampus barat', '085222194594', 'marcelkarundeng@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'c8c605999f3d8352d7bb792cf3fdb25b'),
(34, 'Revangga Christovel Kolantung', '110216029', 2011, 'Manado', '1993-08-03', 'Laki-Laki', 'Bahu Ling.8 no 85 kecamatan malalayang', '085340338238', 'revanggachristovel@ymail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '9ec5a1e2620e5e8c87b9c4b0abd0b190'),
(35, 'Octavianus Elricht Waters Modami', '110216122', 2011, 'Denpasar', '1993-10-18', 'Laki-Laki', 'jln. Samratulangi II no 51', '081999377268', 'm.elricht@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '5dd6f72e0f486d84948c2e1d712da934'),
(36, 'Erlandy Aristianto', '110216051', 2011, 'Manado', '1994-03-28', 'Laki-Laki', 'Paal 2 Beringin Indah blok C no.1', '089896531776', 'erlandyaristianto@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '0afcca29630a96841c905f9b86806867'),
(37, 'Regina Prisilia Saerang', '110216087', 2011, 'Manado', '1993-05-23', 'Perempuan', 'Wanea Lingkungan IV, No. 32', '082344202923', 'reginasaerang2@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'fec5ef67375711b5d1ac1ed57a10fc12'),
(38, 'Evangelista Mariance Takasana', '110216086', 2011, 'Manado', '1993-05-25', 'Perempuan', 'Kombos Barat Linkungan 1 Manado', '08981653436', 'evangelistatakasana@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'a1d6b5694b31e76b8c226d4be6b26093'),
(39, 'Brian Grand Kolinug', '110216154', 2011, 'Kotamobagu', '1994-01-07', 'Laki-Laki', 'Wanea', '085756039638', 'ayenbrian@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '759a8b5adb473207854ac4cb62bdef03'),
(40, 'Astrid Asisia Ayun Makiolor', '110216045', 2011, 'Tondano', '1994-04-23', 'Perempuan', 'Tondano ', '082347883868', 'astridmakiolor@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '071312a38e8b340ec45d24e80049ace1'),
(41, 'Kristopper Morris Rompis', '110216100', 2011, 'Imandi', '1991-12-06', 'Laki-Laki', 'Bahu Kampus', '085657423602', 'kakbassistcakep@gmail.com', '2013-02-27', '2013-02-27', '110216100.JPG', 1, 0, 0, 0, 0, '0838ecfb969d782bae32f24d02057e26'),
(42, 'Billy Brayen Sumolang', '110216059', 2011, 'Manado', '1993-01-24', 'Laki-Laki', 'Karombasan', '085398413102', 'billysumolang@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '1c76ca361e732433945f3c6ed10d954a'),
(43, 'Marasi Akbar Manik', '110216033', 2011, 'Ambon', '1993-05-30', 'Laki-Laki', 'Batun Kota', '081244535580', 'Marasimanik@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'd94e54fea796d5691aede347b10b14ef'),
(44, 'Friky Ismael Luntungan', '110216063', 2011, 'likupang', '1993-02-11', 'Laki-Laki', 'likupang', '085219006669', 'frikyl@ymail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'a8886e6b5fc2c580297300af5bb2e1e5'),
(45, 'Welhimson Sehang', '110216080', 2011, 'Ternate', '1993-11-19', 'Laki-Laki', 'Bahu', '085340338712', 'welhimsonsehang@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '6bf7e6b588946a606c392f78bcf4991e'),
(46, 'Billy Hudson Sorsery', '110216021', 2011, 'Ambon', '1992-08-24', 'Laki-Laki', 'Kleak, Ling. 5', '085217454131', 'billysorsery24@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '1f1b34c911ef86c4303613703f25b636'),
(47, 'Andri Novriadi Lomboan', '110216097', 2011, 'Kotamobagu', '1993-11-04', 'Laki-Laki', 'Bahu Kampus', '082187220193', 'Andri_lomboan@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'b7065cba08c4e53d77a26957555211ef'),
(48, 'Karter Putung', '110216110', 2011, 'Paslaten', '1989-11-05', 'Laki-Laki', 'Kleak', '085240334248', 'karterputung@gmail.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '3636da2bce0c2af7df8b3b17be39a01c'),
(49, 'Kelvin Wong', '110216019', 2011, 'Ternate', '1993-01-22', 'Laki-Laki', 'Malalayang 1 no 37', '085298977903', 'wongkelvinwong@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '8636b3397469bcf80b5fdea66c4dd9b9'),
(50, 'I made Andika sanjaya', '110216117', 2011, 'dondomon', '1993-01-16', 'Laki-Laki', 'batu kota', '081356010009', 'imadeandikasanjaya93@yahoo.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '427e7bd8e4d163d0ed04efa740dfc053'),
(51, 'Victor Waeo', '110216001', 2011, 'Balikpapan', '1993-10-06', 'Laki-Laki', 'MAlalayang 1', '081311287640', 'victor.waeo93@gmail.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '3c2dcae30872098ebce860b9d822340b'),
(52, 'Oletta Eugenie Mambu', '110216023', 2011, 'Tondano', '1993-10-13', 'Perempuan', 'Paal 4 Lingkungan 1 Manado', '08975488136', 'olettamambu@gmail.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '6dc6375f44add88b3dbbc4df400ca259'),
(53, 'Cindy Aumelia Pabalik', '110216025', 2011, 'sorong', '1992-08-07', 'Perempuan', 'Bahu', '085244618180', 'cindy.pabalik@yahoo.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '561918f13a2832726ec7f2e16ecd76c1'),
(54, 'Nora Eligia Christian', '110216005', 2011, 'Singkawang', '1993-11-07', 'Perempuan', 'Malalayang 1 Barat', '08982282428', 'nora.eligia.christian@gmail.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '941350cb5afb6eb8e7b7fe60c35a218e'),
(55, 'Bagio Rio Murtopo', '110216079', 2011, 'Karanganyar', '1992-10-11', 'Laki-Laki', 'manado, perkamil, jln. camar atas, ling.5', '082343162632', 'riomurtopo@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '766bba93be38b08d2b67833fb8ed8eb8'),
(56, 'Youri Januardy Basselo Toreh', '110216153', 2011, 'Rantepao', '1994-01-04', 'Laki-Laki', 'Kleak', '088804615034', 'torehyouri@yahoo.com', '2013-02-27', '2013-02-27', '110216153.jpg', 1, 0, 0, 0, 0, 'be5deaaebeeb03a6bddcfb3154caae68'),
(57, 'Martina K. E. T. Dundu', '110216125', 2011, 'Manado', '1990-03-21', 'Perempuan', 'Bahu Ling. VIII no. 14', '085312675986', 'martina.karen@gmail.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '5d98f4138502fd39813fd633addd861f'),
(58, 'Shalahudin A.P Djafar', '100216047', 2010, 'Manado', '1993-06-21', 'Laki-Laki', 'Perkamil Lingk.2 Manado', '085256408312', 'shalahudin.djafar@yahoo.com', '2013-02-27', '2013-03-04', '100216047.JPG', 0, 1, 1, 0, 0, '75b61b07186194234e7ff1a95f650f40'),
(59, 'Andre Dio Octavianus Loupatty', '110216157', 2011, 'Manado', '1992-02-12', 'Laki-Laki', 'Bailang Lingkungan 3', '08991686002', 'Redfield.andre@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, '5fd7be7e105e1dcaf362eb9d66911479'),
(60, 'Peres Sampebua', '110216009', 2011, 'Rantepao', '1993-12-12', 'Laki-Laki', 'Bahu Ling. V no. 34', '085396508631', 'perespamassangan@yahoo.com', '2013-02-27', '2013-02-27', '110216009.jpg', 1, 0, 0, 0, 0, '2218848b2ea404e992f4946b44474379'),
(61, 'Naftali A Ratu', '110216137', 2011, 'Popareng', '1993-10-20', 'Laki-Laki', 'TINCEP', '085341156957', 'michael.yaruka@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'c4be2d8672820ff24877dde65c3b4de7'),
(62, 'Yerismus Lantaa', '110216073', 2011, 'miangas', '1993-05-25', 'Laki-Laki', 'perkamil', '081356050980', 'muslantaa@yahoo.com', '2013-02-27', '2013-02-27', '', 1, 0, 0, 0, 0, 'b6ca87b71c9b62b268904dfbbb055036'),
(63, 'Abraham Yano Suharmanto', '110216061', 2011, 'Manado', '1992-05-29', 'Laki-Laki', 'Tomohon Kamasi Ling V', '082188444963', 'south.ridder@gmail.com', '2013-02-27', '2013-03-01', '', 1, 0, 0, 0, 0, '1b66962ce5cfe1e8af5e49189efe9ba3'),
(64, 'Krisnobel Maholle Karetji', '110216065', 2011, 'Soakonora', '1994-11-07', 'Laki-Laki', 'Malalayang', '+6289615027476', 'krisnobel@gmail.com', '2013-02-27', '2013-02-27', '', 0, 0, 0, 0, 0, '82905523023e1634baef7f2126dd7a93'),
(65, 'Cheren Willsen Tiwow', '110216060', 2011, 'Remboken', '1993-12-13', 'Laki-Laki', 'Desa Tampusu Kec. Remboken', '08981689299', 'willsengeorge@gmail.com', '2013-02-28', '2013-02-28', '', 0, 0, 0, 0, 0, 'cd95f6004f8579820968de3838bba588'),
(66, 'Ester Kojongian', '110216094', 2011, 'Langowan', '1994-02-15', 'Perempuan', 'Ranotana', '085341690609', 'esterhelent@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'ced0f2ed55cdb41d9a049662e54b4357'),
(67, 'Refly Ch. Mandag', '110216056', 2011, 'Tobelo', '1994-01-24', 'Laki-Laki', 'kleak', '085240167330', 'reflymandag@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '4a40bab039541b6bbb15f50c90c23e1e'),
(68, 'jhordy william sikape', '110216042', 2011, 'tahuna', '1993-06-28', 'Laki-Laki', 'Kleak', '082344142293', 'jhordysikape@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '399831f56af028232e7797461d98b678'),
(69, 'Rendy Pangalila', '110216135', 2011, 'Tincep', '1991-12-30', 'Laki-Laki', 'Tincep', '088804616781', 'rendyp4ngalila@gmail.com', '2013-03-01', '2013-03-01', '110216135.jpg', 1, 0, 0, 0, 0, 'e3f2b41b873d72a4dd0b7b33f007a966'),
(70, 'Bianto Aluano', '110216081', 2011, 'Adean', '1992-11-19', 'Laki-Laki', 'Sumompo', '085341291726', 'Bianto.aluano@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '95e99ce5329942b4e48a91262bbd44da'),
(71, 'Risandi Piterson Wongkar', '110216112', 2011, 'pineleng', '1993-10-31', 'Laki-Laki', 'kali', '087846331083', 'pieterwongkar@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '954e8a704e92d51afacc75d9feac1d28'),
(72, 'Robert sembihingan', '110216071', 2011, 'Tahuna', '1993-11-26', 'Laki-Laki', 'bahu link 4', '085242365313', 'robertsevenfold@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '243d607541100c2bf653c4636e56f2aa'),
(73, 'Samuel Pojoh', '110216037', 2011, 'Manado', '1993-07-23', 'Laki-Laki', 'Malalayang 1 Timur Ling. IV', '081342788681', 'samuelpojoh037@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '0701ce505b4c920b2d48bc88a4c89094'),
(74, 'Bahmid Hadi', '110216105', 2011, 'Marekofo', '1992-04-05', 'Laki-Laki', 'Jln. Samrat No.17', '082191598792', 'bahmid_h@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '7a8f57aa60e1acebcd849a215546191b'),
(75, 'Fahri Ramadhan Daud', '110216093', 2011, 'Manado', '1994-02-17', 'Laki-Laki', 'Perkamil', '085340081404', 'fahridaud@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'cf9b6a6b0714a92e4424dd02d3122e25'),
(76, 'Indra Christian Petra Palendeng', '110216114', 2011, 'Manado', '1993-08-13', 'Laki-Laki', 'Tuminting', '085298311693', 'Indra.Palendeng@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '7ff135854376850e9711bd75ce942e07'),
(77, 'fadli umafagur', '110216089', 2011, 'waibau', '1989-09-06', 'Laki-Laki', 'kleak', '082343875506', 'fadlyfaldyumafagur@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '002e134d58ad1013bacb60d49f69b858'),
(78, 'Dewa Ayu Rai Ariantini', '110216022', 2011, 'kembang mertha', '1993-08-24', 'Perempuan', 'bahu', '082191245975', 'ayuraiariantini@yahoo.co.id', '2013-03-01', '2013-03-01', '110216022.JPG', 1, 0, 0, 0, 0, '1a7a4bdc308d6499684c19f066af609f'),
(79, 'Rian T. Tjioetama', '110216129', 2011, 'Manado', '1983-01-12', 'Laki-Laki', 'Tumumpa 1 Lingkungan II', '085399582038', 'riantjioetama@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'e391a9c5918584d93b00dedbb6057f92'),
(80, 'Pricilia R.A Rompas', '110216062', 2011, 'Manado', '1993-08-22', 'Perempuan', 'Maumby, watutumou III', '082346014186', 'pricilia_hijau22@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '4fada5a7eafea2f0c806096b8a9ec3c1'),
(81, 'Prilly Aprilia Sulo', '110216146', 2011, 'Jakarta', '1993-04-04', 'Perempuan', 'Airmadidi', '085398770053', 'prillysulo@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '16ab02c96f88c9d05ddd45eac8a70ede'),
(82, 'Nofli K. Staal', '110216028', 2011, 'Kwandang', '1990-11-18', 'Laki-Laki', 'Amurang, Lewet lingk. III', '085340000836', 'justfly028@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '92aa6f8fba6451e226093433af92d63f'),
(83, 'Dea Adelia Tolawo', '100216076', 2010, 'Manado', '1991-06-17', 'Perempuan', 'Malendeng Lingk.8', '085298989548', 'dea.tolawo17@gmail.com', '2013-03-01', '2013-03-01', '', 0, 1, 0, 0, 0, '6e009c4edbe800815e006270ebcb32f4'),
(84, 'Marcelina Pangemanan', '110216131', 2011, 'Taratara', '1993-03-05', 'Perempuan', 'Tomohon', '082349059051', 'pangemananmarcelina@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '599e22d0f44bb557bf43af549792a46d'),
(85, 'Lady Octavia Kasema', '110216106', 2011, 'Palu', '1993-10-02', 'Perempuan', 'JL. Samrat 19', '082346777704', 'ladykasema@yahoo.com', '2013-03-01', '2013-03-01', '', 0, 0, 0, 0, 0, 'a99cd9c787ba20ad70cae36c33c814c5'),
(86, 'William Dave Wenno', '110216004', 2011, 'Ambon', '1993-03-08', 'Laki-Laki', 'Bumi Beringin, Manado', '081247400560', 'williamwenno@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '4f78625cd2d2251472af996a2ba1f7cc'),
(87, 'Hermawan Lalompoh', '110216098', 2011, 'Melonguane', '1993-06-28', 'Laki-Laki', 'Malalayang 1 Timur', '085298480884', 'hermawanlalompoh06@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '03e5cc7dd9a67e8219b004fe2aeba1f3'),
(88, 'Edvin Batuwael', '110216030', 2011, 'Ambon', '1993-03-22', 'Laki-Laki', 'tumumpa 1 lingkungan 2, Tuminting', '08981650026', 'edvinbatuwael@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '691a9561279b7838e0017f2c85c18221'),
(89, 'Yoshiko Tanaka Lumintang', '100216054', 2010, 'Tincep', '1992-12-15', 'Laki-Laki', 'Sonder', '088888888888', 'yoshi@yahoo.com', '2013-03-01', '2013-03-01', '', 0, 1, 0, 0, 0, 'e343209b176e662c5c28e714638a58d5'),
(90, 'I Wayan Suastha Adhi Mukti', '100216071', 2010, 'Manado', '1992-09-14', 'Laki-Laki', 'Sea', '088888888888', 'adhi@yahoo.com', '2013-03-01', '2013-03-01', '', 0, 1, 0, 0, 0, 'b45816572ebf92fe2e00ec8d910c2894'),
(91, 'Tedi Sahbudin Agoan', '110216142', 2011, 'Bintau', '1992-09-24', 'Laki-Laki', 'Jl. Krida, Malalayang 1 Timur ( samping Stikom)', '085657382969', 'tediagn@gmail.com', '2013-03-01', '2013-03-01', '110216142.jpg', 1, 0, 0, 0, 0, '5a7234ef1954332620499f893228c409'),
(92, 'Harnolus Koyuko', '110216134', 2011, 'Manado', '1992-10-29', 'Laki-Laki', 'Pandu, lingkungan V Kec.Mapanget', '081245039229', 'harnokoyuko@gmail.com', '2013-03-01', '2013-03-01', '110216134.jpg', 1, 0, 0, 0, 0, 'ede9e84c5bdab62a13b5a7288db56b5a'),
(93, 'Sumosor L E Rau', '110216068', 2011, 'Suluun', '1993-05-03', 'Laki-Laki', 'Winangun', '082347599622', 'sumosor.rau@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '38c18133fc54acad116d6d0f09ce67f7'),
(94, 'Fernando D. Sawel', '110216048', 2011, 'Manado', '1992-11-30', 'Laki-Laki', 'Perumahan CHT Blok E. No.2', '087846846202', 'nandosawel@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '7051a199ad1c899d8a7d8bc3d63ff4d4'),
(95, 'Harris Adhi Oktaviantho Suparno', '110216084', 2011, 'Manado', '1993-10-13', 'Laki-Laki', 'Pakowa Lingkungan 3', '08973766710', 'harris.adhi@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '35cced069f104a94322883156c1d8c0b'),
(96, 'Abdul Kader Alhabsyi', '110216113', 2011, 'Tutuyan', '1993-08-31', 'Laki-Laki', 'Banjer Ling V', '085396538258', 'kaderhabsyi@gmail.com', '2013-03-01', '2013-03-01', '110216113.jpg', 1, 0, 0, 0, 0, 'e1c7361e2d7add2f31630de68ba62b19'),
(97, 'Ryan H. F. Kontu', '090213035', 2009, 'Manado', '1992-02-20', 'Laki-Laki', 'Malalayang 1', '08971219131', 'ryan_juventus@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 1, 0, 0, 0, 'c6ffc1fecd10961c196cd3183360bd0b'),
(98, 'Brian Melky Saragih', '110216049', 2011, 'Bitung', '1993-05-01', 'Laki-Laki', 'Kleak Lingkungan 3', '085255857508', 'brianipadelapan@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '1958a07a42dcf5ad55585cdffa3f2a8e'),
(99, 'Bramwell Kasaedja', '090213004', 2009, 'Palu', '1991-04-05', 'Laki-Laki', 'Jl. Ahmad Yani No. 15', '085298060239', 'bramwell.kasaedja@gmail.com', '2013-03-01', '2013-03-01', '090213004.jpg', 0, 1, 0, 0, 0, 'dc78a864667ccd6bc0352b3bd026df62'),
(100, 'Rivaldi Masuara', '090213034', 2009, 'Manado', '1991-12-16', 'Laki-Laki', 'Malalayang 1 Timur Linkungan V', '082194826478', 'rivaldi_masuara09@ymail.com', '2013-03-01', '2013-03-01', '', 0, 1, 0, 0, 0, 'e3422f3ab64d352ea31ef82937e6d06d'),
(101, 'Marlika Tosani Pallangan', '110216010', 2011, 'sorong', '1994-03-12', 'Perempuan', 'bahu ling.8', '085218474089', 'lpallangan@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'e37f02aba106b7267bf6cce95110a472'),
(102, 'Maria Ursula Kawulur', '110216024', 2011, 'Biak', '1993-10-05', 'Perempuan', 'Jln. P Sulawesi, Bahu', '082399243293', 'mariaursulakawulur@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'ac43724f16e9241d990427ab7c8f4228'),
(103, 'Donna Ariance Mailuhu', '110216006', 2011, 'Masohi', '1993-10-21', 'Perempuan', 'Jl. Tg. Torowitan, Bahu', '082198972877', 'ariance.donna@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '76bf3147cdbe57431d41906e086038fa'),
(104, 'Bravera Maha Danta', '120216025', 2012, 'Paniai', '1995-11-08', 'Laki-Laki', 'Jl. Pulau Sumatra, No 83, Bahu Ling.III, Manado', '+6285254956179', 'bravera48@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '8fa456c1f7e5ba4d4d13d3961b959e0a'),
(105, 'Ekshelsyor C.P.F Defretes', '120216148', 2012, 'Jakarta', '1994-05-12', 'Laki-Laki', 'Talikuran Sonder Minahasa', '082196890312', 'eksheldefretes@gmail.com', '2013-03-01', '2013-03-01', '120216148.jpg', 1, 0, 0, 0, 0, '638f2afcb9dae990120ba13a91621afb'),
(106, 'Luisan William Alexander', '120216002', 2012, 'Manado', '1995-03-08', 'Laki-Laki', 'Malendeng, Jln.Camar Atas', '+6287846792361', 'williamluisan@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'ec47a78b2e98c6e84227968cf4f82f88'),
(107, 'Johan', '120216103', 2012, 'Jambi', '1994-09-15', 'Laki-Laki', 'ITC Marina plaza B1', '082349664240', 'johan189@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a407cfb7920db3694927e7cd850fd71a'),
(108, 'Brian Gamaliel', '120216019', 2012, 'palu', '1994-07-21', 'Laki-Laki', 'jln kampus kleak no 72', '087844171000', 'briangamaliel@gmail.com', '2013-03-01', '2013-03-01', '120216019.jpg', 1, 0, 0, 0, 0, '30cee2789831a980419bc9cb1b61ddd6'),
(109, 'Calvin Romario Kaunang', '120216062', 2012, 'Manado', '1994-07-15', 'Laki-Laki', 'Bahu lingkungan VI', '+6285240861994', 'ckaunang25@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '097c0c4dc01741d670d9cb55477709a5'),
(110, 'Felix Hartanto', '120216012', 2012, 'Makkasar', '1995-09-14', 'Laki-Laki', 'Jl. Samrat No. 85', '082192841714', 'blackseifer11@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '6db866064ebcd10d92e0ac9c2e074ca1'),
(111, 'Sumayku P.F Waraney', '120216032', 2012, 'Manado', '1994-09-16', 'Laki-Laki', 'Jl. Kampus Utara no.03', '085398961116', 'patriasumayku@yahoo.com', '2013-03-01', '2013-03-01', '120216032.jpg', 1, 0, 0, 0, 0, '780a29fb43025446f0541cc5874d5ea0'),
(112, 'sandy runtuwailan', '120216144', 2012, 'manado', '1994-11-30', 'Laki-Laki', 'malalayang 1', '082345060250', 'runtuwailan@gmail.com', '2013-03-01', '2013-03-01', '120216144.jpg', 1, 0, 0, 0, 0, '7d608bc3e0f8971b94d183eb226726de'),
(113, 'Louis George Lamonge', '120216135', 2012, 'Manado', '1994-11-06', 'Laki-Laki', 'Batu Kota Lingkungan 1', '+6285343535450', 'l_meil@ymail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a728b890027140045dbeb3750c0a0f27'),
(114, 'Rizky Mazwar Pratama', '120216070', 2012, 'Palembang', '1994-11-23', 'Laki-Laki', 'Jln. Pumorouw 5 Lingkungan 1, Banjer, Tikala, RW 001', '+6282187827512', 'rizkymazwarpratama@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '086e1b7e1c12ba37cd473670b3a15214'),
(115, 'Allan Riedel Mandagi', '120216016', 2012, 'Tomohon', '1994-06-15', 'Laki-Laki', 'Jl. Bete-bete no.19 Kendari', '085298344626', 'kronoz1506@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'f645ad996ab1961621c95631386fd49c'),
(116, 'eric reza ryan saranaung', '120216125', 2012, 'Manado', '1992-04-27', 'Laki-Laki', 'Tuminting ling 3', '089631620601', 'ericsaranaung@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'eea7cb4a9a5df383c02c1f19a0081f2e'),
(117, 'Wisnu Wardhana Adiel Umboh', '120216009', 2012, 'Manado', '1994-10-16', 'Laki-Laki', 'Batu Kota Lingkungan 9', '+6285298691119', 'evolut1on_points@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '7c5abfe5dbe893f8053833464f554b71'),
(118, 'Juan Ryan Rarumangkay', '120216093', 2012, 'Tondano', '1994-06-24', 'Laki-Laki', 'Winangun 2', '085342086524', 'rarumangkayjuanryan@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '90f4ce280b11bcfecc05671c9539b10d'),
(119, 'virggi eko jacob', '120216145', 2012, 'manado', '1994-03-20', 'Laki-Laki', 'paal 2 link. 10', '085394997911', 'virggijacob@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '92db82566e6be7d2484a758a6234b179'),
(120, 'Hendra Claus Elia Purnomo', '120216051', 2012, 'Manado', '1994-12-06', 'Laki-Laki', 'Jaga XV Kel.Mapanget Kec. Talawaan', '089698554086', 'clauspurnomo@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '07ea587d7d30fd64b3ef9026d2478428'),
(121, 'Toar Anthonius Paulus', '120216150', 2012, 'Bitung', '1992-04-06', 'Laki-Laki', 'Malalayang Satu', '085398764093', 'paulustoar@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '2ed9d4a0f414586d51bf75a492f1b35f'),
(122, 'RIKI SATRIA WATULINGAS', '120216131', 2012, 'MINAHASA', '1995-08-31', 'Laki-Laki', 'PALDUA LINK. IX', '08988161495', 'riki_watulingas@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a74d8032928094eb03539348c1c32d81'),
(123, 'Rian Andika Polakitan', '120216123', 2012, 'Tomohon', '1993-03-04', 'Laki-Laki', 'Tomohon', '08984757789', 'prinzpoldi4@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'def50815eb0efa5d8283b7925bb77ef0'),
(124, 'Budianto Karim', '120216053', 2012, 'Manado', '1995-04-23', 'Laki-Laki', 'Kel. Ternate Baru Lingk 2 No. 135 Kec. Singkil - Manado', '089698150897', 'budiantokarim@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '0d3466084689432e6afa924b987d336d'),
(125, 'Basten Frans Ratu', '120216097', 2012, 'Manado', '1994-03-30', 'Laki-Laki', 'Malalayang 1 Timur', '0897658822', 'bastenratu@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '45457657b0c6e01e3fea1e0a10828bca'),
(126, 'Andi Tarrmizy Wijaya', '110216118', 2011, 'Manado', '1993-09-29', 'Laki-Laki', 'Jln. Pumorouw 5 Lingkungan 1, Banjer', '085240785435', 'Anditarmizyw@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'f873b0ebdc1649b3d1ce78dba3d0cac2'),
(127, 'Stephanie Prisma Walingkas', '120216020', 2012, 'Sorong', '1994-09-08', 'Perempuan', 'Mapanget', '085343305035', 'stephaniewalingkas@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '8ee91e7bbb3dee22be133b8c3c1b333d'),
(128, 'Suhardi Tani', '120216057', 2012, 'Elusan', '1994-02-25', 'Laki-Laki', 'Bahu link.IX', '082346324411', 'suharditani@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'c1bbd234acfe707518318afbbda5116c'),
(129, 'David Lumingkewas', '120216072', 2012, 'Remboken', '1995-05-12', 'Laki-Laki', 'Karombasan Selatan Lingkungan 1', '081933996101', 'lumingkewas.david@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'faef03e5d2f4c43ebb49d37690067132'),
(130, 'Riansyah Labagow', '120216055', 2012, 'Manado', '1994-09-21', 'Laki-Laki', 'Kel. Ternate Baru Lingk 2 Kec. Singkil - Manado', '089698101576', 'ryanlabagow@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a37b4c9287f08f2ab2cbacc851a8186e'),
(131, 'Vidi Timoti Polla', '120216068', 2012, 'Dili', '1995-01-31', 'Laki-Laki', 'Paal 2 beringin indah blok A/1 lingkungan VI', '087846982432', 'vidi.polla@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'b39fe8baaf7f4c490c7ed741f9be0d5f'),
(132, 'Ruspandi Reynaldi Benedictus', '120216004', 2012, 'Manado', '1994-10-03', 'Laki-Laki', 'Perum Kombos Permai Blok C No. 9 Manado', '085756079625', 'reynaldiruspandi@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '9ba6b33d57f819e9407e256c6538f998'),
(133, 'Theodorus Carlo Ngadino', '120216061', 2012, 'manado', '1995-07-01', 'Laki-Laki', 'tikala baru lingkungan 5 manado', '089698006034', 'carlomalfoy0@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '77aa63a1c06293cf6629db29cd38da8d'),
(134, 'Vicky S Gunawan', '120216151', 2012, 'Babang', '1994-12-30', 'Laki-Laki', 'Kleak link. 4', '085757143513', 'jowy.atreides21@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '557b1f8ee2e46c8e21fda05296fbf4b6'),
(135, 'M Tasyrik Ando', '120216048', 2012, 'Galela', '1994-05-17', 'Laki-Laki', 'Kleak', '085396832718', 'ikhyando@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '668e35edc788dc0211313715829ad953'),
(136, 'Tinton Abadi', '120216040', 2012, 'Manado', '1994-12-20', 'Laki-Laki', 'Malalayang 1 Lingkungan 11 Manado', '082346351260', 'tinthonabadhy@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '069a6a9ccaaca7967a0c43cb5e161187'),
(137, 'Muhamad Nur hamzah', '120216083', 2012, 'Manado', '1995-01-11', 'Laki-Laki', 'Jln. Pumorouw  No,58 Banjer Lingkunan 2', '082187296399', 'Muh.nur.Hamzah11@Gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '0d4e753ccaadb8100695f46986f295eb'),
(138, 'MOHAMAD REZA NURKAMIDEN', '120216005', 2012, 'manado', '1994-01-30', 'Laki-Laki', 'jalan wolter monginsidi malalayang 1 ', '085398883294', 'reza.nurkamiden504@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a0f3d4084a4ed1aa6058fceb9ecc7959'),
(139, 'Rayditto Makalalag', '120216028', 2012, 'Manado', '1995-06-23', 'Laki-Laki', 'Malalayang Satu Perum. Allandrew Permai blok Z 15 no.VII', '085395650206', 'rayditto.a.makalalag@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '057829fa5a65fc1ace408f490be486ac'),
(140, 'Stevanus Ch D Rengkung', '120216084', 2012, 'Manado', '1993-09-01', 'Laki-Laki', 'Desa SEA kecamatan Pineleng', '089647350084', 'ivan_rengkung@yahoo.co.id', '2013-03-01', '2013-03-04', '', 1, 0, 0, 0, 0, 'e991a82d9a0687427a17610e034656c3'),
(141, 'Andri Kulung', '120216128', 2012, 'Manado', '1995-02-02', 'Laki-Laki', 'jl. pomorow lingkungan 2 lorong SDN 9', '089676760733', 'andriwijaya67@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '6bbd667ecf1899fd1055393560e1f93d'),
(142, 'Anggara vickly saputra Lekitonu', '120216059', 2012, 'Ujung Pandang', '1993-05-26', 'Laki-Laki', 'Kawangkoan', '08114807988', 'vickysaputra99@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '0941f32da851b84a91770b6ca07a4f23'),
(143, 'Suzanna Edith Manabung', '120216043', 2012, 'Ujung Pandang', '1994-06-12', 'Perempuan', 'Bahu lingkungan 8, malalayang', '085256298487', 'edithmanabung@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a1f7284769968e7bd642dd31cc4f22c1'),
(144, 'Gratia C. Pondaag', '120216045', 2012, 'Amurang', '1995-01-19', 'Perempuan', 'Perum wenwin blok F21 no.15', '085256918040', 'gratiac.pondaag@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '0272eb062320085e291b5cbcb9ccf50d'),
(145, 'Ade Priscillia Novianty Tirie', '120216036', 2012, '23', '1994-11-23', 'Perempuan', 'Jln. Kembang Sario ', '085756234932', 'adepritie23@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '442790c49402040e5e663eaaa4ed1e7e'),
(146, 'JEKLLY HONGRY SAMBUAGA', '120216133', 2012, 'MATUNGKAS', '1993-06-28', 'Laki-Laki', 'MATUNGKAS LINGKUNGAN 2', '082195490721', 'Hongrysambuaga@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '00d3b45e47503b521bb226edac776a43'),
(147, 'Rizky Michael Kalengke', '120216029', 2012, 'Tahuna', '1994-05-25', 'Laki-Laki', 'Bahu', '085298017000', 'rizky.kalengke@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'daff31bd43564c54bb8a8eaa7084e6d8'),
(148, 'cristh valentino kawilarang', '120216108', 2012, 'tondano', '1994-12-10', 'Laki-Laki', 'tondano', '085244852991', 'cristhkawilarang12@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '50b483d799f6b531772078e9cd0fa509'),
(149, 'Alwi Irpansyah Manurung', '120216129', 2012, '21 Juni 1995', '1995-06-21', 'Laki-Laki', 'Kleak', '085240656123', 'chandrajoseph21@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'ce59c650fbf2d5547ffacb5207d7fe03'),
(150, 'Midel N. Sarlout', '120216024', 2012, 'Sorong ', '1993-06-29', 'Laki-Laki', 'Bahu', '085255443734', 'midelsarlout@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '6473dec93ea1e38771011166bd9ccb8b'),
(151, 'Andreas Ch. Maliombo', '120216037', 2012, 'Ambon', '1993-09-02', 'Laki-Laki', 'malalayang 1', '08984491421', 'anm4710@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'dcb76da384ae3028d6aa9b2ebcea01c9'),
(152, 'George M. Latupeirissa', '120216022', 2012, 'Merauke', '1994-11-23', 'Laki-Laki', 'Bahu', '085243525185', 'michael_6301293@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '20aa663e918667d7932b5e472f72a64b'),
(153, 'Andika D.L. Tumuli', '120216027', 2012, 'Manado', '1994-08-17', 'Laki-Laki', 'Bahu', '085230840043', 'leonardo.the_spy@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'ce22c27f9cf67f58d458bb6bd002282c'),
(154, 'Chandra E. Joseph', '120216138', 2012, '21 Juni 1995', '1995-06-21', 'Laki-Laki', 'Kleak', '085240656123', 'chandrajoseph21@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'ce59c650fbf2d5547ffacb5207d7fe03'),
(155, 'Benni Parluhutan Pane', '120216060', 2012, 'Sorong', '1994-04-30', 'Laki-Laki', 'Bahu', '085254576106', 'Benpane28@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '26b8a8f82e4b952e41ae77eba4697f0b'),
(156, 'Billie Ewaldo Bitjoli', '120216095', 2012, 'Tobelo', '1994-12-12', 'Laki-Laki', 'Wonasa Kapleng', '081317460220', 'billie_bitjoli@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '89b9229f82f43d520e1fc89e606b8536'),
(157, 'Aryando Giovani Rumondor', '120216046', 2012, 'Minahasa', '1994-10-17', 'Laki-Laki', 'Wanea. Rike', '089698146187', 'aryandorumondor@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '7cf3818e42af7b19aeb23c9ed0de1435'),
(158, 'winda anastasya waloni', '120216106', 2012, 'tahuna', '1994-10-03', 'Perempuan', 'malalayang 1 barat ling.7', '081244322624', 'Anastasya_waloni@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '221977b43ca0364289b6ce67a927bc81'),
(159, 'gitadea laksono', '120216146', 2012, 'manado', '1994-08-30', 'Perempuan', 'jl.pumorow banjer ling 2', '082347525694', 'gitadealaksono@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '32af443553e4f26e561ddca414327ce8'),
(160, 'Ahmad Sadik Djamar', '120216081', 2012, 'Manado', '1994-12-16', 'Laki-Laki', 'Banjer', '081340830927', 'Ahmadsadik988@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '91cd23186aa531ce365e1a2a7d83ed53'),
(161, 'Ahmad Rizky Bachmid', '120216034', 2012, 'Manado', '1994-06-15', 'Laki-Laki', 'Kampung Arab', '085657442537', 'kikibachmid@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'dabd615f674a8fea27eb0b2e479f7393'),
(162, 'juwita kila', '120216113', 2012, 'tobelo', '1994-01-31', 'Perempuan', 'kleak', '081356421515', 'juwitakila@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'f09696910bdd874a99cd74c8f05b5c44'),
(163, 'Rendy Frits Raranta', '120216096', 2012, 'Manado', '1994-07-15', 'Laki-Laki', 'Malalayang 1 Timur ', '0878465662994', 'rendyraranta15@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'a51869e3cd11b01bfe5e1c07031c63ef'),
(164, 'hikmawaty', '120216118', 2012, 'ternate', '1995-06-25', 'Perempuan', 'jl. torowitan bahu', '081934070288', 'hikmawatymima@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '5212621f9b847bac59acb43f2e03e0c1'),
(165, 'Raven Jelsy Breemer', '120216109', 2012, 'Ambon', '1993-12-26', 'Laki-Laki', 'Bahu, malalayang', '082141168323', 'ravenbreemer@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '8cd8b67ae7df1d5cb5442554776a4e87'),
(166, 'Josten Van Her Sadouw', '120216094', 2012, 'soatobaru', '1993-01-10', 'Laki-Laki', 'Bahu ling. 2 ', '085241070998', 'vansadouw@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '5a26c09ce44e0c23567d917779d1759e'),
(167, 'Rivaldy Abraham Michael Tulung', '120216017', 2012, 'Tomohon', '1995-04-22', 'Laki-Laki', 'Malalayang 1 Barat', '08991675232', 'tulungmichael@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '50514967d49dbd319df4b378cc01f4fc'),
(168, 'muzliah rizka hamadi', '120216015', 2012, 'manado', '1994-05-24', 'Perempuan', 'ranomut. marco duta blok k no.8', '081356754400', 'riskahamadi@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '134f5a5e5b195ac93472890f1e4d840f'),
(169, 'dina corputty', '120216126', 2012, 'Rumahkay', '1995-04-14', 'Perempuan', 'kleak', '082399539268', 'diandinaandicorputty@yahoo.co.id', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '513c12f4a6c5ed8b11f71010f125ccd7'),
(170, 'Kuhu Chyntia Angelina', '120216104', 2012, 'manado', '1994-12-06', 'Perempuan', 'jln manguni, perkamil', '082348928455', 'angelina.chyntia@yahoo.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(171, 'Yudhi Pratama Tanjung', '120216098', 2012, 'Ternate', '1995-06-18', 'Laki-Laki', 'Watutumou 3 kecamatan Kalawat,Minut', '087846353232', 'yudhitanjung.18@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'e46e195d591e3f563e87cc4d1547ed14'),
(172, 'Edward Zefanya Theo Awuy', '120216154', 2012, 'Lembean', '1995-04-18', 'Laki-Laki', 'Lapangan perum CBA Gold', '082192660303', 'edward.ebony99@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, 'f42546e3ff4f0bca8a5e2da4f18c580a'),
(173, 'Kaseger Arthur Farly', '120216110', 2012, 'Manado', '1995-02-14', 'Laki-Laki', 'Malalayang 1, jln sea lingk V', '089610965213', 'arthurkaseger14@gmail.com', '2013-03-01', '2013-03-01', '', 1, 0, 0, 0, 0, '89f3530117b4f6a1e212574ef718124e'),
(174, 'Bintang Yeheskiel Pratama Muroso', '120216007', 2012, 'Manado', '1995-05-30', 'Laki-Laki', 'JL. Hassanuddin no 5 Lingkungan 2', '089669562965', 'bintangmuroso@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b4ff50728e741d811a10d6cc1af1f966'),
(175, 'Rivaldo  Frenklin Sompotan', '120216117', 2012, 'Tomohon ', '1994-09-19', 'Laki-Laki', 'Tomohon Kakaskasen 1 lingk. 6', '089634304626', 'rivaldosompotan@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '96a65896135baacb8298fb1fc708a768'),
(176, 'Jacsen.R.J.Nayoan', '110216151', 2011, 'Manado', '1993-06-14', 'Laki-Laki', 'wanea,buminyiur ling v', '085156731788', 'nayoanjacsen@ymail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '2ed56452f9ebaabb839ea4af484a0d6f'),
(177, 'Marfel Axel Kaseger', '110216099', 2011, 'talaud', '1994-03-04', 'Laki-Laki', 'Bailang ling.4', '085394952000', 'axel9403@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '6f7cd236cf8ce870cfb8f364915b9600'),
(178, 'Abdul Latif Limbanadi', '110216043', 2011, 'Kotamobagu', '1993-05-16', 'Laki-Laki', 'Kleak', '08974058828', 'egigitaris@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'c77c4903a3dd9f167835cf452a4fc181'),
(179, 'Ghadafi katili', '110216115', 2011, 'Tanamon', '1994-04-24', 'Laki-Laki', 'Malalayang 1 Timur', '082187829028', 'katilighadafi@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '26e7e54646b8433a5af7653ff7299d3f'),
(180, 'Roland Teodice Lolowang', '120216073', 2012, 'Manado', '1995-08-28', 'Laki-Laki', 'Kawangkoan', '085399559528', 'rolandteodice@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '50ccc1245d56e551cf82bbaead2f5fab'),
(181, 'Jufly Visi Sangkoy', '120216143', 2012, 'Popontolen', '1994-07-25', 'Laki-Laki', 'Amurang, Desa Popontolen.', '082189777228', 'juvly.sangkoy@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '46c8786ec2919c789703e10a6a5983a4'),
(182, 'Christofel renaldo manopo', '120216147', 2012, 'Tomohon', '1992-12-08', 'Laki-Laki', 'Tomohon kel.kinilow', '08984737756', 'christofelmanopo@ymail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b92fac917eb531ce80b658c47c097078'),
(183, 'Irfan Setiawan H. Thaib', '120216071', 2012, 'manado', '1994-04-10', 'Laki-Laki', 'malalayang 1', '081340188820', 'irfan_thaib71@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'c5191f2b46ccfcc448437b530ce296e3'),
(184, 'Reyski Alfret Basaen', '120216066', 2012, 'Talaud', '1991-04-18', 'Laki-Laki', 'Bahu ling. 6', '082196901879', 'alpretbasaen@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b8764b6fbf71bee77418ba08581ac1b5'),
(185, 'Brian Risky Dendy Hosang', '120216116', 2012, 'manado', '1994-12-11', 'Laki-Laki', 'Ratahan', '087846879701', 'brian.hosang11@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '25f9e794323b453885f5181f1b624d0b'),
(186, 'fernando gerald jacob', '120216089', 2012, 'jayapura', '1995-02-03', 'Laki-Laki', 'tikala kumaraka', '089676722334', 'fjacob33@ymail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '2b0cfb1e00009da880aac5e8fdba0c88'),
(187, 'Huzairi A. Marasabessy', '120216067', 2012, 'Ternate', '1994-12-30', 'Laki-Laki', 'Malalayang', '085396278719', 'huzairimarasabessy@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'a88adf07c4f98c4b7352f08a3174ec40'),
(188, 'Refco Mamaghe', '120216078', 2012, 'Manado', '1994-09-09', 'Laki-Laki', 'jl. sea malalayang 1 ', '089601535638', 'r_mamaghe@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'd804c0f379c822123c2a321273b5abe7'),
(189, 'Zainal Amin', '120216076', 2012, 'Ternate', '1995-01-29', 'Laki-Laki', 'jln. Samrat', '085340342579', 'zainalamin76@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '7282d6fdf08ca7baac3dfd7c69f82abb'),
(190, 'Akhir Agus Kristianto', '120216018', 2012, 'Poso', '1994-08-31', 'Laki-Laki', 'Kleak, Manado', '085241253605', 'all.about.akhir@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'ae4aa4dc722b7d27322775f4af966aed'),
(191, 'Tri Wenda Ginting', '120216008', 2012, 'Kuta Buluh', '1993-08-07', 'Laki-Laki', 'Malalayang', '089697972301', 'triwendaginting@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'f81d774ee0cdd79f60c256e6b235c9c9'),
(192, 'Elsa Patricia Senduk', '120216042', 2012, 'Manado', '1994-05-07', 'Perempuan', 'Jl Pramuka 16 Ling IV Sakobar', '085340372271', 'elsapatriciasenduk@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '5cb17ca59d1fd0403dc053e6411a0261'),
(193, 'Mentari Putri Ambat', '120216056', 2012, 'tahuna', '1994-07-18', 'Perempuan', 'teling pomorow', '085398011518', 'putriambat@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b64365ebdf8a057632e457cb99dd770e'),
(194, 'Christman Toding', '120216035', 2012, 'Palu', '1994-12-26', 'Laki-Laki', 'Bahu', '085242758762', 'christmantoding@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b7992ff3493fecc14d26de0948eaba21'),
(195, 'Monica Gabriela Tangui', '120216014', 2012, 'Manado', '1995-02-01', 'Perempuan', 'wonasa tengah', '085256257134', 'monicagabrielatangui@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'ddd6881be9696fee23ceca6e82be9b22'),
(196, 'Sheila Claudy Riady', '120216006', 2012, 'Manado', '1994-05-04', 'Perempuan', 'Malalayang 1', '089651589990', 'sheila_riady@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '2095694711fde9c2f5c62059ad1192aa'),
(197, 'Jecklyn Sophia Rondonuwu', '120216092', 2012, 'Palu', '1994-06-28', 'Perempuan', 'Kleak, Manado', '082349189547', 'jecklynrondonuwu@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'bb80ea6308931200e1e7e698b3a3e480'),
(198, 'Christovel Sumolang', '120216102', 2012, 'manado', '1994-07-19', 'Laki-Laki', 'Ranotana', '085342197565', 'csumolang@rocketmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b75d68e7ee318a2e4b5b2bb0438d0570'),
(199, 'Mario Robert Walingkas', '110216085', 2011, 'Langowan', '1993-03-25', 'Laki-Laki', 'Batu kota', '089610345667', 'oiram.rw@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '61fba3eed2de046b7427c73370c91d25'),
(200, 'Ishak Untung Saputra', '120216085', 2012, 'Makassar', '1995-03-07', 'Laki-Laki', 'Perkamil', '085243284158', 'trashcore242@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '602ec80964035f6d147b0b43fcc62712'),
(201, 'Relevando Nainggolan', '120216044', 2012, 'Jakarta', '1995-02-17', 'Laki-Laki', 'jalan samratulangi no.16', '081311297293', 'relevando17@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '06d49c3236e34bf07d00f8e8d77fefdc'),
(202, 'Andrew Putera Subario', '120216080', 2012, 'Manado', '1995-02-20', 'Laki-Laki', 'Banjer ling.VI', '081244243431', 'andrew.jacob19@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '827ccb0eea8a706c4c34a16891f84e7b'),
(203, 'Yunita Caroline Umpenawany', '120216010', 2012, 'Tidore', '1995-06-08', 'Perempuan', 'Teling Tingkulu', '081356715530', 'yuni_caroline10@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'f67d25f06e26a325ec5e965ac6926525'),
(204, 'Judif Hiskia Nongka', '120216064', 2012, 'Tondano', '1994-07-10', 'Laki-Laki', 'Winangun II lingk IV', '089652367107', 'judifnongka@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '7b224fe76690433aafb14beadc3678fb'),
(205, 'Christy Laura Kilmanun', '120216026', 2012, 'Ambon', '1994-12-21', 'Perempuan', 'Bahu', '085243312342', 'christy.kilmanun@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '998af74c6010498b4a89b1d2c9d8e49c'),
(206, 'Reskyana Tanggo', '120216001', 2012, 'Sorong', '1995-01-03', 'Perempuan', 'Jl kampus timur Kleak ling II', '085244215217', 'kikiana_03@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '186b0d8e1a6927518f8c4a991cba82f0'),
(207, 'Chaynel Willie Lumendek', '120216112', 2012, 'Manado', '1994-08-09', 'Laki-Laki', 'Kleak, Manado', '082349055711', 'Lumendeke@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '5df1289b8b7104bee648baef14ef699d'),
(208, 'Lourent Stefano Mongi', '120216090', 2012, 'Manado', '1994-07-10', 'Laki-Laki', 'Jln. Arnold Mononutu Pakowaa Lingkungan II No.5', '085256770950', 'Gentaria.fvck@windowslive.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '125a93783410cd37aa79467725e0a96b'),
(209, 'Mongan Winny Amelia', '120216039', 2012, 'Manado', '1994-07-15', 'Perempuan', 'Malalayang 1', '081340490104', 'mongan.winny@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'af715a6f54cecc23b6c312a74fa233e3'),
(210, 'Yuliani Yesinia Ivanna Kaawoan', '120216049', 2012, 'Manado', '1995-07-25', 'Perempuan', 'teling Atas', '087846370072', 'yesiniaivanna@ymail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b8d656d4bf74bedae289f4c628b6bcf2'),
(211, 'Efrat A Runtuwarow', '120216124', 2012, 'Tomohon', '1994-04-18', 'Perempuan', 'Warembungan', '085215425925', 'efrat.anastasia@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '3f60af792528cbe6de7b1c9693739fa5'),
(212, 'Sumendap Ricky Bonifasius', '12026074', 2012, 'Manado', '1994-08-09', 'Laki-Laki', 'Taas', '082122248989', 'rickysumendap@yahoo.com', '2013-03-04', '2013-03-04', '', 0, 0, 0, 0, 0, '7c50afe1d8e6ee4cea552132d50dc461');
INSERT INTO `member` (`id_member`, `nama`, `username`, `angkatan`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `email`, `tgl_daftar`, `tgl_update`, `foto`, `isPraktikan`, `isAsisten`, `isKoordinator`, `isDosen`, `isAdmin`, `password`) VALUES
(213, 'Sumendap Ricky Bonifasius', '120216074', 2012, 'Manado', '1994-08-09', 'Laki-Laki', 'Taas', '082122248989', 'rickysumendap@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '7c50afe1d8e6ee4cea552132d50dc461'),
(214, 'Tegar Alfa Pamungkas Putra', '120216152', 2012, 'Langowan', '1995-01-15', 'Laki-Laki', 'Ranotana', '089685265395', 'pamungkasalfa@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '56aed7e7485ff03d5605b885b86e947e'),
(215, 'Rifandy Karinda', '120216047', 2012, 'Manado', '1994-07-19', 'Laki-Laki', 'banjer', '085340501538', 'jovkarinda@yahoo.com', '2013-03-04', '2013-03-04', '', 0, 0, 0, 0, 0, '2ecbef5ad4850593d18df6bde62c2ca0'),
(216, 'Reinheart A G Mangala', '120216136', 2012, 'Manado', '1994-08-26', 'Laki-Laki', 'Teling Atas', '085342812900', 'andremangala@gmail.com', '2013-03-04', '2013-03-04', '', 0, 0, 0, 0, 0, '0c92c1437d38ae07332eeb6bb7aeb04f'),
(217, 'Xenna Semuel Rambing', '120216127', 2012, 'Lembean', '1994-07-05', 'Laki-Laki', 'Pineleng,Sea1', '082195557794', 'xennarambing@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'baedd4ac976906903247454f827a4615'),
(218, 'Regina Pricilia Robot', '120216031', 2012, 'Amurang', '1995-04-01', 'Perempuan', 'Jl.Sea, Malalayang', '082345020393', 'ginarobot69@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '89b83719e0ccf3dd8b25405dc65cdfa4'),
(219, 'Matthew. A. Alexander', '120216054', 2012, 'Manado', '1994-03-31', 'Laki-Laki', 'Malalayang 1 barat lingkungan 5', '085240611813', 'matthewkalele@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'ac9b4e0b6a21758534db2a6324d34a54'),
(220, 'Ryane Manuho', '120216023', 2012, 'Siau', '1994-02-20', 'Perempuan', 'Sumompo', '085240520820', 'ryanemanuho20@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'de206e7606e50cd4c104f8c1a5bd7a39'),
(221, 'Jean M.J. Wakari', '120216130', 2012, 'Manado', '1994-06-29', 'Laki-Laki', 'Perkamil', '082344143006', 'jean.wakari@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '121c60df0c03083d2693c251f15fdfb2'),
(222, 'Yudhy Lady Joane', '120216101', 2012, 'Palu', '1993-08-09', 'Perempuan', 'Politeknik.komp BTN AL', '085240460101', 'yudithudithdith@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '0f7012783c3498c938a3249726091139'),
(223, 'Ricky Iferdy Mamahit', '120216003', 2012, 'Mogolaing', '1994-07-07', 'Laki-Laki', 'Manado', '085343957727', 'rickymamahit77@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '3bc61de95966c9ff9423c595cacc697b'),
(224, 'Inke Yenny Sumendap', '120216069', 2012, 'Gorontalo', '1994-06-10', 'Perempuan', 'Kampus, Bahu', '085240115444', 'iinkeys@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'd468c868bd70154f396deeb214305a43'),
(225, 'Hendra Sandy Mokoginta', '120216114', 2012, 'Jayapura', '1995-01-15', 'Laki-Laki', 'Jl. Kembang', '085796240376', 'sandyhendra021@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'a1b7eb592c8aae0da483c3981e6f5ef2'),
(226, 'Venny Ansye Sangeroki', '120216139', 2012, 'Ambon', '1993-04-14', 'Perempuan', 'Jl. Yos Sudarso 3 No. 5 ling 2 paal 2', '082148600966', 'venny1404@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '4ab8ee3e65a24b074f21bb5fec997ff7'),
(227, 'Brando Brily Fredrik', '120216011', 2012, 'Manado', '1994-11-25', 'Laki-Laki', 'Sumompo', '082344121752', 'brando_bhoover17@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '831c3da08fc01e711f124e21abe03fcc'),
(228, 'Christoffel Joman Kelung', '120216077', 2012, 'Manado', '1994-05-07', 'Laki-Laki', 'Ranotana Weru', '085244624646', 'itoxshadow@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '601d46c346fc56535e0c1c7d526e4afc'),
(229, 'Kezia Elsa Eunike Ondang', '120216099', 2012, 'Manado', '1994-11-02', 'Perempuan', 'Sam Ratulangi 10, No. 6, Manado', '085256274571', 'ondangkezia@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '22996880e5eb90a0968890ffdb9221d2'),
(230, 'Muhammad rizal', '120216075', 2012, 'Manado', '1994-01-11', 'Laki-Laki', 'Tuminting', '089698471177', 'muhammadrizal@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '7f54b6ada7f574d6856d176f7f828430'),
(231, 'Claudio Robert Putra Bernadus', '120216030', 2012, 'Manado', '1995-01-05', 'Laki-Laki', 'Manado', '089698510510', 'dioxider08@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '4941b455f6aac9c31bcb260a1257af6e'),
(232, 'Trifenna Podung', '120216134', 2012, 'Lembean', '1994-08-06', 'Perempuan', 'Manado', '085657268706', 'fennapodung@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '981a501fc1c94be8587d4a57c6ab40de'),
(233, 'Bryant Rino Samuel Ngongoloy', '120216120', 2012, 'Manado', '1994-11-28', 'Laki-Laki', 'Perum Minanga Indah, Blok F, no 17', '085240066514', 'skybryant88@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '2c542ee33b327108fb96ee0473b0ff38'),
(234, 'Evert steven Tangkudung', '120216132', 2012, 'Manado', '1993-09-17', 'Laki-Laki', 'matungkas', '085757294667', 'evertredsunz@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '6ed61d4b80bb0f81937b32418e98adca'),
(235, 'Pricilia Stevany Sumigar', '120216013', 2012, 'Koyawas', '1994-12-21', 'Perempuan', 'Manado', '085256935443', 'priciliasumigar@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '14d7086a85c7149a53546366fe0f4850'),
(236, 'Indra Saputra Boham', '120216052', 2012, 'Manado', '1995-02-04', 'Laki-Laki', 'Perum Wamaru, blok C, no. 25', '089698551070', 'indraboham@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '0f93c54dc4781c348f94f7415c0a649b'),
(237, 'yanuar dwi allando', '120216105', 2012, 'jakarta', '1995-01-25', 'Laki-Laki', 'paslaten kec.kakas', '081398745455', 'yanuarkarauwan@hotmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'cbf80df28f807e85b5c73765ee69d942'),
(238, 'Stefani Asri Wowiling', '120216111', 2012, 'kawangkoan', '1995-07-26', 'Perempuan', 'manado', '085394496805', 'stevannywowiling@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '9e4e6ca705494ee92caf8899dff1040d'),
(239, 'I Made Tisna Gunadiyasa', '120216033', 2012, 'Kotamobagu', '1994-09-17', 'Laki-Laki', 'Manado', '08991694737', 'madetisna09@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '0e5ab1985be3ff7cb47d25236bfba3be'),
(240, 'Moh Aswar K Hilipito', '120216088', 2012, 'Kotamobagu', '1994-04-19', 'Laki-Laki', 'Malalayang', '085656597476', 'aswarhilipito94@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '9a396f8fc1090f3a40ab7ee8d0d6e585'),
(241, 'Agus Adhi Sumitro', '120216087', 2012, 'Kotamobagu', '1995-08-03', 'Laki-Laki', 'Manado', '082271115593', 'dhie.sumitro@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'b3a17c21e6853e9d213f4bb0c6075629'),
(242, 'Meinhard Christian Niclas Sanggel', '100216046', 2010, 'Lemoh', '1992-04-17', 'Laki-Laki', 'Sea Satu Jaga 8', '081244397902', 'myathnz@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '2d66c545de1134f49ed70d2f4513ac60'),
(243, 'Istam Chaidir Ishak', '100216019', 2010, 'Tidore', '1992-07-14', 'Laki-Laki', 'Kleak.Ling V', '085340451015', 'chaidir.qalam@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '1361b394e5781ea6261ecfeb8c4abd91'),
(244, 'Mudiyanto Setiawan ', '090213101', 2009, 'Kotamobagu', '1991-09-30', 'Laki-Laki', 'Kombos Holy Lestari', '085256699303', 'mudiyantos@gmail.com', '2013-03-04', '2013-03-04', '090213101.jpg', 0, 0, 0, 0, 0, 'bb67e80618049e11df96d9d9a4d0b1da'),
(245, 'Zwingly Christopper Rawis', '120216058', 2012, 'Manado', '1994-10-19', 'Laki-Laki', 'Jalan Sea Malalayang 1 Barat', '085241852778', 'Chzrawis@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'f89ccbe82777fd085b1546da9c96f99a'),
(246, 'Edwina Siska Pusparini ', '090213006', 2009, 'Jakarta', '1992-06-11', 'Perempuan', 'Mapanget Barat', '08991674535', 'naru.lynx92@gmail.com', '2013-03-04', '2013-03-04', '090213006.jpg', 0, 0, 0, 0, 0, '6d1ce7aa0a1d988dc96a2abcd187b45a'),
(247, 'Tryputra Eddo Runtuwene', '120216149', 2012, 'Manado', '1994-07-20', 'Laki-Laki', 'Ranotana weru lingkungan 4', '089698515670', 'tryputrar@yahoo.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '7d8c37497b080623eedce879608f6a89'),
(248, 'Dianto Glery Thomas', '120216091', 2012, 'Manado', '1992-12-31', 'Laki-Laki', 'Malalayang', '085396685008', 'antothomas54@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '1fdd1c1c5f68ac7d2345e168d9d59214'),
(249, 'Richard Albert Salendah', '120216041', 2012, 'Lirung', '1994-09-09', 'Laki-Laki', 'Tuminting', '085298374102', 'richardsalendah@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '44b1d5cea1d7722ee64a96186a6243f6'),
(250, 'safrudin lampah', '110216092', 2011, 'tidore', '1994-08-25', 'Laki-Laki', 'batu kota', '087846380079', 'decosauza@ymail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '7e14f6aed1770df04122da815f5b650d'),
(251, 'Cheril Mouren Lengkong', '120216079', 2012, 'Rumengkor', '1994-09-25', 'Perempuan', 'Rumengkor Kec. Tombulu', '085256498515', 'Mourencheril@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'bf186811ef94bd63560b8cf3ad1c480a'),
(252, 'Clarissa Moniaga', '120216063', 2012, 'Gorontalo', '1995-01-23', 'Perempuan', 'Jl. kampus barat', '085340455091', 'clarissa_moniaga@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'e011467c2f53cb1ad3100b224b429497'),
(253, 'Kauntu Natasya Novia Febrianna', '120216065', 2012, 'Manado', '1994-11-06', 'Perempuan', 'Winangun 2 Lingk, IV Manado', '082194465208', 'natasyakauntu@gmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'fb264f1004a339006271421444c3c0d0'),
(254, 'Gennady Kamansi', '100216039', 2010, 'manado', '1988-09-24', 'Laki-Laki', 'Tikala Kumaraka Ling 2', '081356872425', 'gennadykamans88@gamil.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '6f38c8c3dc7b9abee5c3a16c3d99bb34'),
(255, 'Fajar Pratama Pongsapan', '090213083', 2009, 'Ujung Pandang', '1992-04-09', 'Laki-Laki', 'Jl. Roring II no. 154 Bahu', '085255111890', 'internisti083@gmail.com', '2013-03-04', '2013-03-04', '090213083.jpg', 0, 0, 0, 0, 0, 'f018e0bc631564a9eb99e11fe811f5c9'),
(256, 'Sumual David John', '120216038', 2012, 'Manado', '1995-09-14', 'Laki-Laki', 'malalayang 2 ling 2', '085215938933', 'sumual_d@yahoo.co.id', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, '003a2e347a33aa980ee8a4995a54ed08'),
(257, 'Khevin Riando Lumempow', '100216037', 2010, 'manado', '1993-04-16', 'Laki-Laki', 'Bahu', '085256860111', 'miranthy@hotmail.com', '2013-03-04', '2013-03-04', '', 1, 0, 0, 0, 0, 'f0d92bf8e499cdd3a704321fc0410c0d'),
(258, 'Gorby Jeinner Pitoi', '090213038', 2009, 'Tomohon', '1991-01-30', 'Laki-Laki', 'Jl. Winalian No.10 Ling VI Kel.Walian', '+6281343750646', 'gorbypitoi@gmail.com', '2013-03-04', '2013-03-04', '090213038.jpg', 0, 0, 0, 0, 0, 'bf65417dcecc7f2b0006e1f5793b7143'),
(259, 'Xaverius B.N. Najoan', '197711202010121002', 0000, '', '0000-00-00', '', '', '', '', '0000-00-00', '0000-00-00', '', 0, 0, 0, 1, 1, 'a774eda49e9eee544d3e2cc2dec2d6e1');

-- --------------------------------------------------------

--
-- Table structure for table `praktikan`
--

CREATE TABLE IF NOT EXISTS `praktikan` (
  `id_praktikan` int(11) NOT NULL auto_increment,
  `nim_praktikan` varchar(15) NOT NULL,
  `praktikan_pd_praktikum` varchar(10) NOT NULL,
  `id_praktikum` int(11) NOT NULL,
  `kelompok_praktikum` int(10) default NULL,
  PRIMARY KEY  (`id_praktikan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=258 ;

--
-- Dumping data for table `praktikan`
--

INSERT INTO `praktikan` (`id_praktikan`, `nim_praktikan`, `praktikan_pd_praktikum`, `id_praktikum`, `kelompok_praktikum`) VALUES
(1, '110216016', 'IFC4522', 2, NULL),
(2, '110216014', 'IFC4522', 2, NULL),
(3, '110216036', 'IFC4522', 2, NULL),
(4, '110216120', 'IFC4522', 2, NULL),
(5, '110216002', 'IFC4522', 2, NULL),
(6, '110216150', 'IFC4522', 2, NULL),
(7, '110216116', 'IFC4522', 2, NULL),
(8, '110216054', 'IFC4522', 2, NULL),
(9, '110216031', 'IFC4522', 2, NULL),
(10, '110216003', 'IFC4522', 2, NULL),
(11, '110216035', 'IFC4522', 2, NULL),
(12, '110216119', 'IFC4522', 2, NULL),
(13, '110216155', 'IFC4522', 2, NULL),
(14, '110216069', 'IFC4522', 2, NULL),
(15, '110216011', 'IFC4522', 2, NULL),
(16, '110216064', 'IFC4522', 2, NULL),
(17, '110216091', 'IFC4522', 2, NULL),
(18, '110216007', 'IFC4522', 2, NULL),
(19, '110216007', 'IFC4521', 0, NULL),
(20, '110216091', 'IFC4521', 0, NULL),
(21, '110216111', 'IFC4522', 2, NULL),
(22, '110216143', 'IFC4522', 2, NULL),
(23, '110216143', 'IFC4521', 0, NULL),
(24, '110216008', 'IFC4522', 2, NULL),
(25, '110216020', 'IFC4522', 2, NULL),
(26, '110216020', 'IFC4521', 0, NULL),
(27, '110216029', 'IFC4522', 2, NULL),
(28, '110216029', 'IFC4521', 0, NULL),
(29, '110216122', 'IFC4522', 2, NULL),
(30, '110216051', 'IFC4521', 0, NULL),
(31, '110216051', 'IFC4522', 2, NULL),
(32, '110216087', 'IFC4522', 2, NULL),
(33, '110216087', 'IFC4521', 0, NULL),
(34, '110216086', 'IFC4522', 2, NULL),
(35, '110216154', 'IFC4522', 2, NULL),
(36, '110216045', 'IFC4522', 2, NULL),
(37, '110216045', 'IFC4521', 0, NULL),
(38, '110216100', 'IFC4521', 0, NULL),
(39, '110216100', 'IFC4522', 2, NULL),
(40, '110216059', 'IFC4522', 2, NULL),
(41, '110216033', 'IFC4522', 2, NULL),
(42, '110216033', 'IFC4521', 0, NULL),
(43, '110216063', 'IFC4521', 0, NULL),
(44, '110216063', 'IFC4522', 2, NULL),
(45, '110216080', 'IFC4522', 2, NULL),
(46, '110216021', 'IFC4522', 2, NULL),
(47, '110216021', 'IFC4521', 0, NULL),
(48, '110216097', 'IFC4521', 0, NULL),
(49, '110216097', 'IFC4522', 2, NULL),
(50, '110216019', 'IFC4522', 2, NULL),
(51, '110216019', 'IFC4521', 0, NULL),
(52, '110216079', 'IFC4521', 0, NULL),
(53, '110216079', 'IFC4522', 2, NULL),
(54, '110216125', 'IFC4522', 2, NULL),
(55, '110216125', 'IFC4521', 0, NULL),
(56, '110216157', 'IFC4522', 2, NULL),
(57, '110216009', 'IFC4522', 2, NULL),
(58, '110216009', 'IFC4521', 0, NULL),
(59, '110216137', 'IFC4522', 2, NULL),
(60, '110216073', 'IFC4522', 2, NULL),
(61, '110216094', 'IFC4522', 2, NULL),
(62, '110216042', 'IFC4522', 2, NULL),
(63, '110216112', 'IFC4522', 2, NULL),
(64, '110216056', 'IFC4522', 2, NULL),
(65, '110216071', 'IFC4522', 2, NULL),
(66, '110216105', 'IFC4522', 2, NULL),
(67, '110216093', 'IFC4522', 2, NULL),
(68, '110216081', 'IFC4522', 2, NULL),
(69, '110216135', 'IFC4522', 2, NULL),
(70, '110216135', 'IFC4521', 0, NULL),
(71, '110216061', 'IFC4522', 2, NULL),
(72, '110216114', 'IFC4522', 2, NULL),
(73, '110216037', 'IFC4522', 2, NULL),
(74, '110216089', 'IFC4522', 2, NULL),
(75, '110216129', 'IFC4522', 2, NULL),
(76, '110216146', 'IFC4522', 2, NULL),
(77, '110216028', 'IFC4522', 2, NULL),
(78, '110216131', 'IFC4522', 2, NULL),
(79, '110216004', 'IFC4522', 2, NULL),
(80, '110216098', 'IFC4522', 2, NULL),
(81, '110216030', 'IFC4522', 2, NULL),
(82, '110216142', 'IFC4522', 2, NULL),
(83, '110216134', 'IFC4522', 2, NULL),
(84, '110216048', 'IFC4521', 0, NULL),
(85, '110216048', 'IFC4522', 2, NULL),
(86, '110216068', 'IFC4521', 0, NULL),
(87, '110216068', 'IFC4522', 2, NULL),
(88, '110216022', 'IFC4522', 2, NULL),
(89, '110216014', 'IFC4521', 0, NULL),
(90, '110216084', 'IFC4522', 2, NULL),
(91, '110216062', 'IFC4522', 2, NULL),
(92, '110216084', 'IFC4521', 0, NULL),
(93, '110216080', 'IFC4521', 0, NULL),
(94, '110216061', 'IFC4521', 0, NULL),
(95, '110216113', 'IFC4522', 2, NULL),
(96, '090213035', 'IFC4522', 2, NULL),
(97, '110216049', 'IFC4522', 2, NULL),
(98, '110216049', 'IFC4521', 0, NULL),
(99, '110216010', 'IFC4522', 2, NULL),
(100, '110216010', 'IFC4521', 0, NULL),
(101, '110216024', 'IFC4522', 2, NULL),
(102, '110216024', 'IFC4521', 0, NULL),
(103, '110216006', 'IFC4522', 2, NULL),
(104, '110216006', 'IFC4521', 0, NULL),
(105, '120216025', 'IFC2521', 1, NULL),
(106, '120216148', 'IFC2521', 1, NULL),
(107, '120216002', 'IFC2521', 1, NULL),
(108, '120216103', 'IFC2521', 1, NULL),
(109, '120216062', 'IFC2521', 1, NULL),
(110, '120216012', 'IFC2521', 1, NULL),
(111, '120216144', 'IFC2521', 1, NULL),
(112, '120216135', 'IFC2521', 1, NULL),
(113, '120216070', 'IFC2521', 1, NULL),
(114, '120216125', 'IFC2521', 1, NULL),
(115, '120216009', 'IFC2521', 1, NULL),
(116, '120216145', 'IFC2521', 1, NULL),
(117, '120216051', 'IFC2521', 1, NULL),
(118, '120216150', 'IFC2521', 1, NULL),
(119, '120216123', 'IFC2521', 1, NULL),
(120, '120216131', 'IFC2521', 1, NULL),
(121, '120216097', 'IFC2521', 1, NULL),
(122, '110216118', 'IFC2521', 1, NULL),
(123, '120216032', 'IFC2521', 1, NULL),
(124, '120216093', 'IFC2521', 1, NULL),
(125, '120216020', 'IFC2521', 1, NULL),
(126, '120216057', 'IFC2521', 1, NULL),
(127, '120216072', 'IFC2521', 1, NULL),
(128, '120216055', 'IFC2521', 1, NULL),
(129, '120216068', 'IFC2521', 1, NULL),
(130, '120216053', 'IFC2521', 1, NULL),
(131, '120216004', 'IFC2521', 1, NULL),
(132, '120216061', 'IFC2521', 1, NULL),
(133, '120216016', 'IFC2521', 1, NULL),
(134, '120216151', 'IFC2521', 1, NULL),
(135, '120216048', 'IFC2521', 1, NULL),
(136, '120216040', 'IFC2521', 1, NULL),
(137, '120216019', 'IFC2521', 1, NULL),
(138, '120216083', 'IFC2521', 1, NULL),
(139, '120216005', 'IFC2521', 1, NULL),
(140, '120216028', 'IFC2521', 1, NULL),
(141, '120216084', 'IFC2521', 1, NULL),
(142, '120216128', 'IFC2521', 1, NULL),
(143, '120216059', 'IFC2521', 1, NULL),
(144, '120216043', 'IFC2521', 1, NULL),
(145, '120216045', 'IFC2521', 1, NULL),
(146, '120216036', 'IFC2521', 1, NULL),
(147, '120216029', 'IFC2521', 1, NULL),
(148, '120216133', 'IFC2521', 1, NULL),
(149, '120216108', 'IFC2521', 1, NULL),
(150, '120216095', 'IFC2521', 1, NULL),
(151, '120216138', 'IFC2521', 1, NULL),
(152, '120216037', 'IFC2521', 1, NULL),
(153, '120216046', 'IFC2521', 1, NULL),
(154, '120216106', 'IFC2521', 1, NULL),
(155, '120216146', 'IFC2521', 1, NULL),
(156, '120216081', 'IFC2521', 1, NULL),
(157, '120216060', 'IFC2521', 1, NULL),
(158, '120216034', 'IFC2521', 1, NULL),
(159, '120216024', 'IFC2521', 1, NULL),
(160, '120216113', 'IFC2521', 1, NULL),
(161, '120216118', 'IFC2521', 1, NULL),
(162, '120216027', 'IFC2521', 1, NULL),
(163, '120216022', 'IFC2521', 1, NULL),
(164, '120216109', 'IFC2521', 1, NULL),
(165, '120216017', 'IFC2521', 1, NULL),
(166, '120216015', 'IFC2521', 1, NULL),
(167, '120216096', 'IFC2521', 1, NULL),
(168, '120216094', 'IFC2521', 1, NULL),
(169, '120216126', 'IFC2521', 1, NULL),
(170, '120216104', 'IFC2521', 1, NULL),
(171, '120216098', 'IFC2521', 1, NULL),
(172, '120216154', 'IFC2521', 1, NULL),
(173, '120216110', 'IFC2521', 1, NULL),
(174, '110216153', 'IFC4522', 2, NULL),
(175, '120216007', 'IFC2521', 1, NULL),
(176, '110216151', 'IFC4521', 0, NULL),
(177, '110216151', 'IFC4522', 2, NULL),
(178, '110216099', 'IFC4522', 2, NULL),
(179, '110216043', 'IFC4522', 2, NULL),
(180, '110216043', 'IFC2521', 1, NULL),
(181, '110216115', 'IFC4522', 2, NULL),
(182, '110216089', 'IFC4521', 0, NULL),
(183, '120216073', 'IFC2521', 1, NULL),
(184, '120216143', 'IFC2521', 1, NULL),
(185, '120216147', 'IFC2521', 1, NULL),
(186, '120216071', 'IFC2521', 1, NULL),
(187, '120216066', 'IFC2521', 1, NULL),
(188, '120216116', 'IFC2521', 1, NULL),
(189, '120216089', 'IFC2521', 1, NULL),
(190, '120216067', 'IFC2521', 1, NULL),
(191, '120216078', 'IFC2521', 1, NULL),
(192, '120216076', 'IFC2521', 1, NULL),
(193, '120216018', 'IFC2521', 1, NULL),
(194, '120216008', 'IFC2521', 1, NULL),
(195, '120216042', 'IFC2521', 1, NULL),
(196, '120216056', 'IFC2521', 1, NULL),
(197, '120216035', 'IFC2521', 1, NULL),
(198, '120216014', 'IFC2521', 1, NULL),
(199, '120216006', 'IFC2521', 1, NULL),
(200, '120216092', 'IFC2521', 1, NULL),
(201, '120216102', 'IFC2521', 1, NULL),
(202, '120216044', 'IFC2521', 1, NULL),
(203, '120216085', 'IFC2521', 1, NULL),
(204, '110216085', 'IFC4522', 2, NULL),
(205, '120216010', 'IFC2521', 1, NULL),
(206, '120216064', 'IFC2521', 1, NULL),
(207, '120216026', 'IFC2521', 1, NULL),
(208, '120216001', 'IFC2521', 1, NULL),
(209, '120216112', 'IFC2521', 1, NULL),
(210, '120216090', 'IFC2521', 1, NULL),
(211, '120216039', 'IFC2521', 1, NULL),
(212, '120216049', 'IFC2521', 1, NULL),
(213, '120216080', 'IFC2521', 1, NULL),
(214, '120216124', 'IFC2521', 1, NULL),
(215, '120216074', 'IFC2521', 1, NULL),
(216, '120216152', 'IFC2521', 1, NULL),
(217, '120216127', 'IFC2521', 1, NULL),
(218, '120216031', 'IFC2521', 1, NULL),
(219, '120216054', 'IFC2521', 1, NULL),
(220, '120216023', 'IFC2521', 1, NULL),
(221, '120216130', 'IFC2521', 1, NULL),
(222, '120216101', 'IFC2521', 1, NULL),
(223, '120216117', 'IFC2521', 1, NULL),
(224, '120216003', 'IFC2521', 1, NULL),
(225, '120216069', 'IFC2521', 1, NULL),
(226, '120216114', 'IFC2521', 1, NULL),
(227, '120216139', 'IFC2521', 1, NULL),
(228, '120216011', 'IFC2521', 1, NULL),
(229, '120216077', 'IFC2521', 1, NULL),
(230, '120216099', 'IFC2521', 1, NULL),
(231, '120216075', 'IFC2521', 1, NULL),
(232, '120216030', 'IFC2521', 1, NULL),
(233, '120216134', 'IFC2521', 1, NULL),
(234, '120216120', 'IFC2521', 1, NULL),
(235, '120216132', 'IFC2521', 1, NULL),
(236, '120216013', 'IFC2521', 1, NULL),
(237, '120216129', 'IFC2521', 1, NULL),
(238, '120216052', 'IFC2521', 1, NULL),
(239, '120216033', 'IFC2521', 1, NULL),
(240, '120216111', 'IFC2521', 1, NULL),
(241, '120216105', 'IFC2521', 1, NULL),
(242, '120216088', 'IFC2521', 1, NULL),
(243, '120216087', 'IFC2521', 1, NULL),
(244, '100216046', 'IFC2521', 1, NULL),
(245, '100216019', 'IFC2521', 1, NULL),
(246, '120216149', 'IFC2521', 1, NULL),
(247, '120216091', 'IFC2521', 1, NULL),
(248, '120216041', 'IFC2521', 1, NULL),
(249, '110216092', 'IFC2521', 1, NULL),
(250, '110216122', 'IFC4521', 0, NULL),
(251, '120216079', 'IFC2521', 1, NULL),
(252, '120216063', 'IFC2521', 1, NULL),
(253, '120216065', 'IFC2521', 1, NULL),
(254, '120216038', 'IFC2521', 1, NULL),
(255, '120216058', 'IFC2521', 1, NULL),
(256, '100216037', 'IFC2521', 1, NULL),
(257, '100216039', 'IFC2521', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `praktikum`
--

CREATE TABLE IF NOT EXISTS `praktikum` (
  `id_praktikum` int(11) NOT NULL auto_increment,
  `kode_praktikum` varchar(10) NOT NULL,
  `tahun_praktikum` year(4) NOT NULL,
  PRIMARY KEY  (`id_praktikum`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `praktikum`
--

INSERT INTO `praktikum` (`id_praktikum`, `kode_praktikum`, `tahun_praktikum`) VALUES
(1, 'IFC2521', 2013),
(2, 'IFC4522', 2013);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id_theme` int(11) NOT NULL auto_increment,
  `nama_theme` varchar(100) NOT NULL,
  `path_theme` varchar(50) NOT NULL,
  `deskripsi_theme` text NOT NULL,
  `creator_theme` varchar(50) NOT NULL,
  `status_theme` enum('active','deactive') NOT NULL default 'deactive',
  PRIMARY KEY  (`id_theme`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id_theme`, `nama_theme`, `path_theme`, `deskripsi_theme`, `creator_theme`, `status_theme`) VALUES
(1, 'original', 'themes/original', 'This is original themes', 'Ari Maribondang', 'active'),
(2, 'deep_blue', 'themes/deep_blue', 'Where something gone wrong.', 'cyclops', 'deactive');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
