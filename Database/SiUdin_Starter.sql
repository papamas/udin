-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: udin
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `id_level` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `app_users_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level_app_user` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997',1,1,'2018-03-06 10:59:39'),(2,'monitor','9796809f7dae482d3123c16585f2b60f97407796',1,2,'2018-03-06 10:59:39'),(3,'register','13a2828b3adecc1c32ea3888d08afa51e147b3f3',1,3,'2018-03-20 03:04:20');
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_soal`
--

DROP TABLE IF EXISTS `bank_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_soal` (
  `id_bank_soal` int(11) NOT NULL AUTO_INCREMENT,
  `id_ujian_dinas` int(11) NOT NULL,
  `question` text NOT NULL,
  `id_materi` int(11) NOT NULL,
  `id_submateri` int(11) NOT NULL,
  `answer` varchar(1) DEFAULT NULL,
  `kode_instansi` varchar(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bank_soal`),
  KEY `id_materi` (`id_materi`),
  KEY `id_submateri` (`id_submateri`),
  KEY `id_ujian_dinas` (`id_ujian_dinas`),
  CONSTRAINT `bank_soal_ibfk_1` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id_materi`),
  CONSTRAINT `bank_soal_ibfk_2` FOREIGN KEY (`id_submateri`) REFERENCES `sub_materi` (`id_submateri`),
  CONSTRAINT `bank_soal_ibfk_3` FOREIGN KEY (`id_ujian_dinas`) REFERENCES `ujian_dinas` (`id_ujian_dinas`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_soal`
--

LOCK TABLES `bank_soal` WRITE;
/*!40000 ALTER TABLE `bank_soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grup_soal`
--

DROP TABLE IF EXISTS `grup_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grup_soal` (
  `id_grup_soal` int(11) NOT NULL AUTO_INCREMENT,
  `id_ujian_dinas` int(11) NOT NULL,
  `id_materi` int(11) NOT NULL,
  `id_sub_materi` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `nilai_benar` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_grup_soal`),
  UNIQUE KEY `id_ujian_dinas` (`id_ujian_dinas`,`id_materi`,`id_sub_materi`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grup_soal`
--

LOCK TABLES `grup_soal` WRITE;
/*!40000 ALTER TABLE `grup_soal` DISABLE KEYS */;
INSERT INTO `grup_soal` VALUES (1,1,6,1,10,5,'2018-03-19 03:05:04','2018-03-19 03:05:04'),(3,1,6,2,10,5,'2018-03-19 03:05:35','2018-03-19 03:05:35'),(5,1,6,18,10,5,'2018-03-19 03:06:14','2018-03-19 03:06:14'),(6,1,7,19,10,5,'2018-03-19 03:06:29','2018-03-19 03:06:29'),(7,1,7,20,10,5,'2018-03-19 03:06:34','2018-03-19 03:06:34'),(8,1,8,21,10,5,'2018-03-19 03:06:51','2018-03-19 03:06:51'),(10,1,9,23,10,5,'2018-03-19 03:07:25','2018-03-19 03:07:25'),(11,1,9,24,10,5,'2018-03-19 03:07:32','2018-03-19 03:07:32'),(12,1,10,5,10,5,'2018-03-19 03:07:46','2018-03-19 03:07:46'),(13,1,10,22,10,5,'2018-03-19 03:07:59','2018-03-19 03:07:59'),(14,2,6,1,10,5,'2018-03-19 03:08:27','2018-03-19 03:08:27'),(15,2,6,2,10,5,'2018-03-19 03:08:35','2018-03-19 03:08:35'),(16,2,6,18,10,5,'2018-03-19 03:08:51','2018-03-19 03:08:51'),(17,2,7,19,10,5,'2018-03-19 03:09:08','2018-03-19 03:09:08'),(18,2,7,20,10,5,'2018-03-19 03:09:12','2018-03-19 03:09:12'),(19,2,8,21,10,5,'2018-03-19 03:09:24','2018-03-19 03:09:24'),(20,2,8,25,10,5,'2018-03-19 03:09:35','2018-03-19 03:09:35'),(21,2,9,23,10,5,'2018-03-19 03:09:47','2018-03-19 03:09:47'),(22,2,9,24,10,5,'2018-03-19 03:09:51','2018-03-19 03:09:51'),(23,2,10,5,10,5,'2018-03-19 03:10:03','2018-03-19 03:10:03'),(24,2,10,22,10,5,'2018-03-19 03:10:17','2018-03-19 03:10:17'),(25,3,1,1,5,5,'2018-03-19 03:11:35','2018-03-19 03:11:35'),(26,3,1,2,5,5,'2018-03-19 03:11:39','2018-03-19 03:11:39'),(27,3,1,3,5,5,'2018-03-19 03:11:43','2018-03-19 03:11:43'),(28,3,1,4,5,5,'2018-03-19 03:11:48','2018-03-19 03:11:48'),(29,3,1,5,5,5,'2018-03-19 03:11:51','2018-03-19 03:11:51'),(30,3,1,6,5,5,'2018-03-19 03:11:56','2018-03-19 03:11:56'),(31,3,2,8,10,5,'2018-03-19 03:12:17','2018-03-19 03:12:17'),(32,3,2,9,10,5,'2018-03-19 03:12:23','2018-03-19 03:12:23'),(33,3,2,10,10,5,'2018-03-19 03:12:27','2018-03-19 03:12:27'),(34,3,3,11,4,5,'2018-03-19 03:13:33','2018-03-19 03:13:33'),(35,3,3,12,4,5,'2018-03-19 03:13:44','2018-03-19 03:13:44'),(36,3,3,13,4,5,'2018-03-19 03:13:48','2018-03-19 03:13:48'),(37,3,3,14,4,5,'2018-03-19 03:13:55','2018-03-19 03:13:55'),(38,3,3,15,4,5,'2018-03-19 03:13:59','2018-03-19 03:13:59'),(39,3,4,16,10,5,'2018-03-19 03:14:20','2018-03-19 03:14:20'),(40,3,5,17,10,5,'2018-03-19 03:14:28','2018-03-19 03:14:28'),(41,4,1,1,5,5,'2018-03-19 03:17:16','2018-03-19 03:17:16'),(42,4,1,2,5,5,'2018-03-19 03:17:20','2018-03-19 03:17:20'),(43,4,1,3,5,5,'2018-03-19 03:17:32','2018-03-19 03:17:32'),(44,4,1,4,5,5,'2018-03-19 03:17:38','2018-03-19 03:17:38'),(45,4,1,5,5,5,'2018-03-19 03:17:50','2018-03-19 03:17:50'),(46,4,1,6,5,5,'2018-03-19 03:18:01','2018-03-19 03:18:01'),(47,4,1,7,10,5,'2018-03-19 03:18:11','2018-03-19 03:18:11'),(48,4,2,8,10,5,'2018-03-19 03:18:40','2018-03-19 03:18:40'),(49,4,2,9,10,5,'2018-03-19 03:18:46','2018-03-19 03:18:46'),(50,4,2,10,10,5,'2018-03-19 03:18:54','2018-03-19 03:18:54'),(51,4,3,11,4,5,'2018-03-19 03:19:30','2018-03-19 03:19:30'),(52,4,3,12,4,5,'2018-03-19 03:19:40','2018-03-19 03:19:40'),(53,4,3,13,4,5,'2018-03-19 03:19:48','2018-03-19 03:19:48'),(54,4,3,14,4,5,'2018-03-19 03:19:54','2018-03-19 03:19:54'),(55,4,3,15,4,5,'2018-03-19 03:20:01','2018-03-19 03:20:01'),(56,4,4,16,10,5,'2018-03-19 03:20:37','2018-03-19 03:20:37'),(57,4,5,17,10,5,'2018-03-19 03:20:57','2018-03-19 03:20:57'),(60,2,7,1,10,5,'2019-02-12 01:18:13','2019-02-12 01:18:13');
/*!40000 ALTER TABLE `grup_soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instansi`
--

DROP TABLE IF EXISTS `instansi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instansi` (
  `kode_instansi` varchar(5) NOT NULL DEFAULT '',
  `nama_instansi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kode_instansi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instansi`
--

LOCK TABLES `instansi` WRITE;
/*!40000 ALTER TABLE `instansi` DISABLE KEYS */;
INSERT INTO `instansi` VALUES ('1010','Kementerian Koordinator Bidang Politik, Hukum dan Keamanan'),('1020','Kementerian Koordinator Bidang Perekonomian'),('1030','Kementerian Koordinator Bidang Pembangunan Manusia dan Kebudayaan'),('1040','Kementerian Koordinator Bidang Kemaritiman'),('2000','Kementerian Riset, Teknologi, dan Pendidikan Tinggi'),('2010','Kementerian Koperasi dan Usaha Kecil dan Menengah'),('2020','Kementerian Lingkungan Hidup'),('2040','Kementerian Badan Usaha Milik Negara'),('2050','Kementerian Pemberdayaan Perempuan dan Perlindungan Anak'),('2060','Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi'),('2100','Kementerian Pemuda dan Olahraga'),('2110','Kementerian Perumahan Rakyat'),('2120','Kementerian Desa, Pembangunan Daerah Tertinggal dan Transmigrasi'),('3001','Kementerian Dalam Negeri'),('3002','Kementerian Luar Negeri'),('3003','Kementerian Pertahanan'),('3004','Kementerian Hukum dan Hak Asasi Manusia'),('3005','Kementerian Keuangan'),('3006','Kementerian Pertanian'),('3008','Kementerian Energi dan Sumber Daya Mineral'),('3009','Kementerian Perhubungan'),('3010','Kementerian Pendidikan dan Kebudayaan'),('3011','Kementerian Kesehatan'),('3012','Kementerian Agama'),('3013','Kementerian Ketenagakerjaan'),('3014','Kementerian Sosial'),('3015','Kementerian Lingkungan Hidup dan Kehutanan'),('3016','Kementerian Kelautan dan Perikanan'),('3018','Kementerian Komunikasi dan Informatika'),('3019','Kementerian Perdagangan'),('3020','Kementerian Perindustrian'),('3021','Kementerian Pekerjaan Umum dan Perumahan Rakyat'),('3022','Kementerian Pariwisata'),('4001','Kementerian Sekretariat Negara'),('4002','Kejaksaan Agung'),('4003','Badan Intelijen Negara'),('4004','Sekretariat Jenderal MPR'),('4005','Setjen DPA'),('4006','Sekretariat Jenderal DPR RI'),('4007','Mahkamah Agung RI'),('4008','Badan Pemeriksa Keuangan '),('4009','Setjen WANTANNAS'),('4010','Lembaga Sandi Negara'),('4011','Badan Kepegawaian Negara'),('4012','Lembaga Administrasi Negara '),('4013','Lembaga Penerbangan dan Antariksa Nasional'),('4014','Lembaga Ilmu Pengetahuan Indonesia'),('4015','Badan Tenaga Nuklir Nasional '),('4016','Badan Pusat Statistik '),('4017','Kementerian Perencanaan Pembangunan Nasional/Bappenas'),('4018','Arsip Nasional Republik Indonesia '),('4019','Badan Informasi Geospasial'),('4020','Badan Kependudukan dan Keluarga Berencana Nasional'),('4021','Badan Koordinasi Penanaman Modal'),('4022','Badan Pengkajian dan Penerapan Teknologi'),('4023','Badan Pengawasan Keuangan dan Pembangunan'),('4024','Kementerian Agraria dan Tata Ruang/Badan Pertanahan Nasional'),('4025','Perpustakaan Nasional RI'),('4027','Badan Standardisasi Nasional '),('4028','Badan Pengawas Tenaga Nuklir '),('4031','Badan Pengawas Obat dan Makanan '),('4032','Lembaga Ketahanan Nasional RI'),('4033','Kepolisian Negara'),('4034','MABES TNI'),('4035','Badan Meteorologi, Klimatologi dan Geofisika'),('4036','Sekretariat Kabinet '),('4037','Sekretariat Presiden'),('4038','Sekretariat Wakil Presiden'),('4039','Sekretariat Militer'),('4040','Badan Narkotika Nasional'),('4041','Setjen Komisi Pemilihan Umum'),('4043','Badan Nasional Penanggulangan Bencana'),('4044','Setjen KOMNAS HAM'),('4045','Badan Pengusahaan Kawasan Perdagangan Bebas dan Pelabuhan Bebas Batam'),('4046','Kepaniteraan dan Sekretariat Jenderal Mahkamah Konstitusi RI'),('4047','Setjen Komisi Pemberantasan Korupsi'),('4048','Setjen KORPRI'),('4049','Sekretariat Jenderal Komisi Yudisial'),('4050','Setjen Dewan Perwakilan Daerah'),('4051','Badan Nasional Penempatan Perlindungan TKI'),('4052','Badan Keamanan Laut RI'),('4053','Badan SAR Nasional'),('4054','Lembaga Kebijakan Pengadaan Barang/Jasa Pemerintah'),('4055','Pusat Pelaporan dan Analisis Transaksi Keuangan'),('4056','Ombudsman Republik Indonesia'),('4057','TELEVISI REPUBLIK INDONESIA'),('4058','RADIO REPUBLIK INDONESIA'),('4059','Badan Nasional Pengelola Perbatasan'),('4060','Badan Nasional Penanggulangan Terorisme'),('4061','Setjen Komisi Pengawas Persaingan Usaha'),('4062','Badan Pengawas Pemilihan Umum'),('4063','Komisi Aparatur Sipil Negara'),('4064','Badan Ekonomi Kreatif'),('5100','Pemerintah Aceh'),('5101','Pemerintah Kab. Aceh Besar'),('5102','Pemerintah Kab. Pidie'),('5103','Pemerintah Kab. Aceh Utara'),('5104','Pemerintah Kab. Aceh Timur'),('5105','Pemerintah Kab. Aceh Selatan'),('5106','Pemerintah Kab. Aceh Barat'),('5107','Pemerintah Kab. Aceh Tengah'),('5108','Pemerintah Kab. Aceh Tenggara'),('5109','Pemerintah Kab. Simeulue'),('5110','Pemerintah Kab. Bireuen'),('5111','Pemerintah Kab. Aceh Singkil'),('5112','Pemerintah Kab. Aceh Barat Daya'),('5113','Pemerintah Kab. Gayo Lues'),('5114','Pemerintah Kab. Aceh Tamiang'),('5115','Pemerintah Kab. Nagan Raya'),('5116','Pemerintah Kab. Aceh Jaya'),('5117','Pemerintah Kab. Bener Meriah'),('5118','Pemerintah Kab. Pidie Jaya'),('5171','Pemerintah Kota Sabang'),('5172','Pemerintah Kota Banda Aceh'),('5173','Pemerintah Kota Langsa'),('5174','Pemerintah Kota Lhokseumawe'),('5175','Pemerintah Kota Subulussalam'),('5200','Pemerintah Provinsi Sumatera Utara'),('5201','Pemerintah Kab. Deli Serdang'),('5202','Pemerintah Kab. Karo'),('5203','Pemerintah Kab. Langkat'),('5204','Pemerintah Kab. Tapanuli Tengah'),('5205','Pemerintah Kab. Simalungun'),('5206','Pemerintah Kab. Labuhanbatu'),('5207','Pemerintah Kab. Dairi'),('5208','Pemerintah Kab. Tapanuli Utara'),('5209','Pemerintah Kab. Tapanuli Selatan'),('5210','Pemerintah Kab. Asahan'),('5211','Pemerintah Kab. Nias'),('5212','Pemerintah Kab. Toba Samosir'),('5213','Pemerintah Kab. Mandailing Natal'),('5214','Pemerintah Kab. Nias Selatan'),('5215','Pemerintah Kab. Humbang Hasundutan'),('5216','Pemerintah Kab. Pakpak Bharat'),('5217','Pemerintah Kab. Samosir'),('5218','Pemerintah Kab. Serdang Bedagai'),('5219','Pemerintah Kab. Padang Lawas'),('5220','Pemerintah Kab. Padang Lawas Utara'),('5221','Pemerintah Kab. Batubara'),('5222','Pemerintah Kab. Labuhanbatu Selatan'),('5223','Pemerintah Kab. Labuhanbatu Utara'),('5224','Pemerintah Kab. Nias Barat'),('5225','Pemerintah Kab. Nias Utara'),('5271','Pemerintah Kota Medan'),('5272','Pemerintah Kota Tebing Tinggi'),('5273','Pemerintah Kota Binjai'),('5274','Pemerintah Kota Pematangsiantar'),('5275','Pemerintah Kota Tanjungbalai'),('5276','Pemerintah Kota Sibolga'),('5277','Pemerintah Kota Padangsidimpuan'),('5278','Pemerintah Kota Gunung Sitoli'),('5300','Pemerintah Provinsi Riau'),('5301','Pemerintah Kab. Kampar'),('5302','Pemerintah Kab. Bengkalis'),('5304','Pemerintah Kab. Indragiri Hulu'),('5305','Pemerintah Kab. Indragiri Hilir'),('5306','Pemerintah Kab. Pelalawan'),('5307','Pemerintah Kab. Rokan Hulu'),('5308','Pemerintah Kab. Rokan Hilir'),('5309','Pemerintah Kab. Siak'),('5312','Pemerintah Kab. Kuantan Singingi'),('5313','Pemerintah Kab. Kepulauan Meranti'),('5371','Pemerintah Kota Pekanbaru'),('5373','Pemerintah Kota Dumai'),('5400','Pemerintah Provinsi Sumatera Barat'),('5401','Pemerintah Kab. Agam'),('5402','Pemerintah Kab. Pasaman'),('5403','Pemerintah Kab. Limapuluh Kota'),('5404','Pemerintah Kab. Solok'),('5405','Pemerintah Kab. Padang Pariaman'),('5406','Pemerintah Kab. Pesisir Selatan'),('5407','Pemerintah Kab. Tanah Datar'),('5408','Pemerintah Kab. Sijunjung'),('5409','Pemerintah Kab. Kep. Mentawai'),('5410','Pemerintah Kab. Solok Selatan'),('5411','Pemerintah Kab. Dharmasraya'),('5412','Pemerintah Kab. Pasaman Barat'),('5471','Pemerintah Kota Bukittinggi'),('5472','Pemerintah Kota Padang Panjang'),('5473','Pemerintah Kota Sawahlunto'),('5474','Pemerintah Kota Solok'),('5475','Pemerintah Kota Padang'),('5476','Pemerintah Kota Payakumbuh'),('5477','Pemerintah Kota Pariaman'),('5500','Pemerintah Provinsi Jambi'),('5501','Pemerintah Kab. Batang Hari'),('5502','Pemerintah Kab. Tanjung Jabung Barat'),('5503','Pemerintah Kab. Bungo'),('5504','Pemerintah Kab. Merangin'),('5505','Pemerintah Kab. Kerinci'),('5506','Pemerintah Kab. Sarolangun'),('5507','Pemerintah Kab. Tebo'),('5508','Pemerintah Kab. Muaro Jambi'),('5509','Pemerintah Kab. Tanjung Jabung Timur'),('5571','Pemerintah Kota Jambi'),('5572','Pemerintah Kota Sungai Penuh'),('5600','Pemerintah Provinsi Sumatera Selatan'),('5601','Pemerintah Kab. Musi Banyuasin'),('5602','Pemerintah Kab. Ogan Komering Ulu'),('5603','Pemerintah Kab. Muara Enim'),('5604','Pemerintah Kab. Lahat'),('5605','Pemerintah Kab. Musi Rawas'),('5606','Pemerintah Kab. Ogan Komering Ilir'),('5607','Pemerintah Kab. Banyuasin'),('5608','Pemerintah Kab. Ogan Komering Ulu Timur'),('5609','Pemerintah Kab. Ogan Komering Ulu Sel.'),('5610','Pemerintah Kab. Ogan Ilir'),('5611','Pemerintah Kab. Empat Lawang'),('5612','Pemerintah Kab. Musi Rawas Utara'),('5671','Pemerintah Kota Palembang'),('5672','Pemerintah Kota Pagar Alam'),('5673','Pemerintah Kota Lubuk Linggau'),('5674','Pemerintah Kota Prabumulih'),('5675','Pemerintah Kab. Penukal Abab Lematang Ilir'),('5700','Pemerintah Provinsi Kep. Bangka Belitung'),('5701','Pemerintah Kab. Bangka'),('5702','Pemerintah Kab. Belitung'),('5703','Pemerintah Kab. Bangka Barat'),('5704','Pemerintah Kab. Bangka Tengah'),('5705','Pemerintah Kab. Bangka Selatan'),('5706','Pemerintah Kab. Belitung Timur'),('5771','Pemerintah Kota Pangkal Pinang'),('5800','Pemerintah Provinsi Bengkulu'),('5801','Pemerintah Kab. Bengkulu Utara'),('5802','Pemerintah Kab. Bengkulu Selatan'),('5803','Pemerintah Kab. Rejang Lebong'),('5804','Pemerintah Kab. Kaur'),('5805','Pemerintah Kab. Seluma'),('5806','Pemerintah Kab. Mukomuko'),('5807','Pemerintah Kab. Kepahiang'),('5808','Pemerintah Kab. Lebong'),('5809','Pemerintah Kab. Bengkulu Tengah'),('5871','Pemerintah Kota Bengkulu'),('5900','Pemerintah Provinsi Lampung'),('5901','Pemerintah Kab. Lampung Selatan'),('5902','Pemerintah Kab. Lampung Tengah'),('5903','Pemerintah Kab. Lampung Utara'),('5904','Pemerintah Kab. Lampung Barat'),('5905','Pemerintah Kab. Tulang Bawang'),('5906','Pemerintah Kab. Tanggamus'),('5907','Pemerintah Kab. Way Kanan'),('5908','Pemerintah Kab. Lampung Timur'),('5909','Pemerintah Kab. Pesawaran'),('5910','Pemerintah Kab. Tulang Bawang Barat'),('5911','Pemerintah Kab. Pringsewu'),('5912','Pemerintah Kab. Mesuji'),('5913','Pemerintah Kab. Pesisir Barat'),('5971','Pemerintah Kota Metro'),('5972','Pemerintah Kota Bandar Lampung'),('6000','Pemerintah Provinsi Daerah Khusus Ibukota Jakarta'),('6001','Kab. Kepulauan Seribu'),('6100','Pemerintah Provinsi Jawa Barat'),('6101','Pemerintah Kab. Bogor'),('6102','Pemerintah Kab. Sukabumi'),('6103','Pemerintah Kab. Cianjur'),('6104','Pemerintah Kab. Bekasi'),('6105','Pemerintah Kab. Karawang'),('6106','Pemerintah Kab. Purwakarta'),('6107','Pemerintah Kab. Subang'),('6108','Pemerintah Kab. Bandung'),('6109','Pemerintah Kab. Sumedang'),('6110','Pemerintah Kab. Garut'),('6111','Pemerintah Kab. Tasikmalaya'),('6112','Pemerintah Kab. Ciamis'),('6113','Pemerintah Kab. Cirebon'),('6114','Pemerintah Kab. Kuningan'),('6115','Pemerintah Kab. Indramayu'),('6116','Pemerintah Kab. Majalengka'),('6117','Pemerintah Kab. Bandung Barat'),('6118','Pemerintah Kab. Pangandaran'),('6171','Pemerintah Kota Bandung'),('6172','Pemerintah Kota Bogor'),('6173','Pemerintah Kota Sukabumi'),('6174','Pemerintah Kota Cirebon'),('6175','Pemerintah Kota Bekasi'),('6176','Pemerintah Kota Depok'),('6177','Pemerintah Kota Cimahi'),('6178','Pemerintah Kota Tasikmalaya'),('6179','Pemerintah Kota Banjar'),('6200','Pemerintah Provinsi Banten'),('6201','Pemerintah Kab. Serang'),('6202','Pemerintah Kab. Pandeglang'),('6203','Pemerintah Kab. Lebak'),('6204','Pemerintah Kab. Tangerang'),('6271','Pemerintah Kota Tangerang'),('6272','Pemerintah Kota Cilegon'),('6273','Pemerintah Kota Serang'),('6274','Pemerintah Kota Tangerang Selatan'),('6300','Pemerintah Daerah D I Yogyakarta'),('6301','Pemerintah Kab. Bantul'),('6302','Pemerintah Kab. Sleman'),('6303','Pemerintah Kab. Gunung Kidul'),('6304','Pemerintah Kab. Kulon Progo'),('6371','Pemerintah Kota Yogyakarta'),('6400','Pemerintah Provinsi Jawa Tengah'),('6401','Pemerintah Kab. Semarang'),('6402','Pemerintah Kab. Kendal'),('6403','Pemerintah Kab. Demak'),('6404','Pemerintah Kab. Grobogan'),('6405','Pemerintah Kab. Pekalongan'),('6406','Pemerintah Kab. Batang'),('6407','Pemerintah Kab. Tegal'),('6408','Pemerintah Kab. Brebes'),('6409','Pemerintah Kab. Pati'),('6410','Pemerintah Kab. Kudus'),('6411','Pemerintah Kab. Pemalang'),('6412','Pemerintah Kab. Jepara'),('6413','Pemerintah Kab. Rembang'),('6414','Pemerintah Kab. Blora'),('6415','Pemerintah Kab. Banyumas'),('6416','Pemerintah Kab. Cilacap'),('6417','Pemerintah Kab. Purbalingga'),('6418','Pemerintah Kab. Banjarnegara'),('6419','Pemerintah Kab. Magelang'),('6420','Pemerintah Kab. Temanggung'),('6421','Pemerintah Kab. Wonosobo'),('6422','Pemerintah Kab. Purworejo'),('6423','Pemerintah Kab. Kebumen'),('6424','Pemerintah Kab. Klaten'),('6425','Pemerintah Kab. Boyolali'),('6426','Pemerintah Kab. Sragen'),('6427','Pemerintah Kab. Sukoharjo'),('6428','Pemerintah Kab. Karanganyar'),('6429','Pemerintah Kab. Wonogiri'),('6471','Pemerintah Kota Semarang'),('6472','Pemerintah Kota Salatiga'),('6473','Pemerintah Kota Pekalongan'),('6474','Pemerintah Kota Tegal'),('6475','Pemerintah Kota Magelang'),('6476','Pemerintah Kota Surakarta'),('6500','Pemerintah Provinsi Jawa Timur'),('6501','Pemerintah Kab. Gresik'),('6502','Pemerintah Kab. Mojokerto'),('6503','Pemerintah Kab. Sidoarjo'),('6504','Pemerintah Kab. Jombang'),('6505','Pemerintah Kab. Sampang'),('6506','Pemerintah Kab. Pamekasan'),('6507','Pemerintah Kab. Sumenep'),('6508','Pemerintah Kab. Bangkalan'),('6509','Pemerintah Kab. Bondowoso'),('6510','Pemerintah Kab. Situbondo'),('6511','Pemerintah Kab. Banyuwangi'),('6512','Pemerintah Kab. Jember'),('6513','Pemerintah Kab. Malang'),('6514','Pemerintah Kab. Pasuruan'),('6515','Pemerintah Kab. Probolinggo'),('6516','Pemerintah Kab. Lumajang'),('6517','Pemerintah Kab. Kediri'),('6518','Pemerintah Kab. Tulungagung'),('6519','Pemerintah Kab. Nganjuk'),('6520','Pemerintah Kab. Trenggalek'),('6521','Pemerintah Kab. Blitar'),('6522','Pemerintah Kab. Madiun'),('6523','Pemerintah Kab. Ngawi'),('6524','Pemerintah Kab. Magetan'),('6525','Pemerintah Kab. Ponorogo'),('6526','Pemerintah Kab. Pacitan'),('6527','Pemerintah Kab. Bojonegoro'),('6528','Pemerintah Kab. Tuban'),('6529','Pemerintah Kab. Lamongan'),('6571','Pemerintah Kota Surabaya'),('6572','Pemerintah Kota Mojokerto'),('6573','Pemerintah Kota Malang'),('6574','Pemerintah Kota Pasuruan'),('6575','Pemerintah Kota Probolinggo'),('6576','Pemerintah Kota Blitar'),('6577','Pemerintah Kota Kediri'),('6578','Pemerintah Kota Madiun'),('6579','Pemerintah Kota Batu'),('6600','Pemerintah Provinsi Kalimantan Barat'),('6601','Pemerintah Kab. Sambas'),('6602','Pemerintah Kab. Sanggau'),('6603','Pemerintah Kab. Sintang'),('6604','Pemerintah Kab. Mempawah'),('6605','Pemerintah Kab. Kapuas Hulu'),('6606','Pemerintah Kab. Ketapang'),('6607','Pemerintah Kab. Bengkayang'),('6608','Pemerintah Kab. Landak'),('6609','Pemerintah Kab. Melawi'),('6610','Pemerintah Kab. Sekadau'),('6611','Pemerintah Kab. Kubu Raya'),('6612','Pemerintah Kab. Kayong Utara'),('6671','Pemerintah Kota Pontianak'),('6672','Pemerintah Kota Singkawang'),('6700','Pemerintah Provinsi Kalimantan Tengah'),('6701','Pemerintah Kab. Kapuas'),('6702','Pemerintah Kab. Barito Utara'),('6703','Pemerintah Kab. Barito Selatan'),('6704','Pemerintah Kab. Kotawaringin Timur'),('6705','Pemerintah Kab. Kotawaringin Barat'),('6706','Pemerintah Kab. Pulang Pisau'),('6707','Pemerintah Kab. Gunung Mas'),('6708','Pemerintah Kab. Lamandau'),('6709','Pemerintah Kab. Sukamara'),('6710','Pemerintah Kab. Murung Raya'),('6711','Pemerintah Kab. Katingan'),('6712','Pemerintah Kab. Seruyan'),('6713','Pemerintah Kab. Barito Timur'),('6771','Pemerintah Kota Palangka Raya'),('6800','Pemerintah Provinsi Kalimantan Selatan'),('6801','Pemerintah Kab. Banjar'),('6802','Pemerintah Kab. Tanah Laut'),('6803','Pemerintah Kab. Tapin'),('6804','Pemerintah Kab. Hulu Sungai Selatan'),('6805','Pemerintah Kab. Hulu Sungai Tengah'),('6806','Pemerintah Kab. Barito Kuala'),('6807','Pemerintah Kab. Tabalong'),('6808','Pemerintah Kab. Kotabaru'),('6809','Pemerintah Kab. Hulu Sungai Utara'),('6810','Pemerintah Kab. Tanah Bumbu'),('6811','Pemerintah Kab. Balangan'),('6871','Pemerintah Kota Banjarmasin'),('6872','Pemerintah Kota Banjarbaru'),('6900','Pemerintah Provinsi Kalimantan Timur'),('6901','Pemerintah Kab. Kutai Kartanegara'),('6902','Pemerintah Kab. Paser'),('6904','Pemerintah Kab. Berau'),('6907','Pemerintah Kab. Kutai Barat'),('6908','Pemerintah Kab. Kutai Timur'),('6910','Pemerintah Kab. Penajam Paser Utara'),('6912','Pemerintah Kab. Mahakam Ulu'),('6971','Pemerintah Kota Samarinda'),('6972','Pemerintah Kota Balikpapan'),('6973','Pemerintah Kota Bontang'),('7000','Pemerintah Provinsi Sulawesi Utara'),('7001','Pemerintah Kab. Minahasa'),('7002','Pemerintah Kab. Bolaang Mongondow'),('7003','Pemerintah Kab. Kepulauan Sangihe'),('7004','Pemerintah Kab. Minahasa Selatan'),('7005','Pemerintah Kab. Kepulauan Talaud'),('7006','Pemerintah Kab. Minahasa Utara'),('7007','Pemerintah Kab. Bolaang Mongondow Utara'),('7008','Pemerintah Kab. Siau Tagulandang Biaro'),('7009','Pemerintah Kab. Minahasa Tenggara'),('7012','Pemerintah Kab. Bolaang Mongondow Selatan'),('7013','Pemerintah Kab. Bolaang Mongondow Timur'),('7071','Pemerintah Kota Manado'),('7072','Pemerintah Kota Bitung'),('7073','Pemerintah Kota Tomohon'),('7074','Pemerintah Kota KotaMobagu'),('7100','Pemerintah Provinsi Gorontalo'),('7101','Pemerintah Kab. Gorontalo'),('7102','Pemerintah Kab. Boalemo'),('7103','Pemerintah Kab. Pohuwato'),('7104','Pemerintah Kab. Bone Bolango'),('7105','Pemerintah Kab. Gorontalo Utara'),('7171','Pemerintah Kota Gorontalo'),('7200','Pemerintah Provinsi Sulawesi Tengah'),('7201','Pemerintah Kab. Poso'),('7202','Pemerintah Kab. Donggala'),('7203','Pemerintah Kab. Tolitoli'),('7204','Pemerintah Kab. Banggai'),('7205','Pemerintah Kab. Buol'),('7206','Pemerintah Kab. Morowali'),('7207','Pemerintah Kab. Banggai Kepulauan'),('7208','Pemerintah Kab. Parigi Moutong'),('7209','Pemerintah Kab. Tojo Una Una'),('7210','Pemerintah Kab. Sigi'),('7211','Pemerintah Kab. Banggai Laut'),('7212','Pemerintah Kab. Morowali Utara'),('7271','Pemerintah Kota Palu'),('7300','Pemerintah Provinsi Sulawesi Selatan'),('7301','Pemerintah Kab. Pinrang'),('7302','Pemerintah Kab. Gowa'),('7303','Pemerintah Kab. Wajo'),('7305','Pemerintah Kab. Bone'),('7306','Pemerintah Kab. Tana Toraja'),('7307','Pemerintah Kab. Maros'),('7309','Pemerintah Kab. Luwu'),('7310','Pemerintah Kab. Sinjai'),('7311','Pemerintah Kab. Bulukumba'),('7312','Pemerintah Kab. Bantaeng'),('7313','Pemerintah Kab. Jeneponto'),('7314','Pemerintah Kab. Kepulauan Selayar'),('7315','Pemerintah Kab. Takalar'),('7316','Pemerintah Kab. Barru'),('7317','Pemerintah Kab. Sidenreng Rappang'),('7318','Pemerintah Kab. Pangkajene dan Kepulauan'),('7319','Pemerintah Kab. Soppeng'),('7321','Pemerintah Kab. Enrekang'),('7322','Pemerintah Kab. Luwu Utara'),('7325','Pemerintah Kab. Luwu Timur'),('7326','Pemerintah Kab. Toraja Utara'),('7371','Pemerintah Kota Makassar'),('7372','Pemerintah Kota Parepare'),('7373','Pemerintah Kota Palopo'),('7400','Pemerintah Provinsi Sulawesi Tenggara'),('7401','Pemerintah Kab. Konawe'),('7402','Pemerintah Kab. Buton'),('7403','Pemerintah Kab. Muna'),('7404','Pemerintah Kab. Kolaka'),('7405','Pemerintah Kab. Konawe Selatan'),('7406','Pemerintah Kab. Kolaka Utara'),('7407','Pemerintah Kab. Bombana'),('7408','Pemerintah Kab. Wakatobi'),('7410','Pemerintah Kab. Buton Utara'),('7411','Pemerintah Kab. Konawe Utara'),('7412','Pemerintah Kab. Kolaka Timur'),('7413','Pemerintah Kab. Konawe Kepulauan'),('7414','Pemerintah Kab. Buton Selatan'),('7415','Pemerintah Kab. Buton Tengah'),('7416','Pemerintah Kab. Muna Barat'),('7471','Pemerintah Kota Kendari'),('7472','Pemerintah Kota Baubau'),('7500','Pemerintah Provinsi Bali'),('7501','Pemerintah Kab. Buleleng'),('7502','Pemerintah Kab. Jembrana'),('7503','Pemerintah Kab. Klungkung'),('7504','Pemerintah Kab. Gianyar'),('7505','Pemerintah Kab. Karangasem'),('7506','Pemerintah Kab. Bangli'),('7507','Pemerintah Kab. Badung'),('7508','Pemerintah Kab. Tabanan'),('7571','Pemerintah Kota Denpasar'),('7600','Pemerintah Provinsi NTB'),('7601','Pemerintah Kab. Lombok Barat'),('7602','Pemerintah Kab. Lombok Tengah'),('7603','Pemerintah Kab. Lombok Timur'),('7604','Pemerintah Kab. Bima'),('7605','Pemerintah Kab. Sumbawa'),('7606','Pemerintah Kab. Dompu'),('7607','Pemerintah Kab. Sumbawa Barat'),('7608','Pemerintah Kab. Lombok Utara'),('7671','Pemerintah Kota Mataram'),('7672','Pemerintah Kota Bima'),('7700','Pemerintah Provinsi NTT'),('7701','Pemerintah Kab. Kupang'),('7702','Pemerintah Kab. Belu'),('7703','Pemerintah Kab. Timor Tengah Utara'),('7704','Pemerintah Kab. Timor Tengah Selatan'),('7705','Pemerintah Kab. Alor'),('7706','Pemerintah Kab. Sikka'),('7707','Pemerintah Kab. Flores Timur'),('7708','Pemerintah Kab. Ende'),('7709','Pemerintah Kab. Ngada'),('7710','Pemerintah Kab. Manggarai'),('7711','Pemerintah Kab. Sumba Timur'),('7712','Pemerintah Kab. Sumba Barat'),('7713','Pemerintah Kab. Lembata'),('7714','Pemerintah Kab. Rote Ndao'),('7715','Pemerintah Kab. Manggarai Barat'),('7716','Pemerintah Kab. Manggarai Timur'),('7717','Pemerintah Kab. Sumba Barat Daya'),('7718','Pemerintah Kab. Nagekeo'),('7719','Pemerintah Kab. Sumba Tengah'),('7720','Pemerintah Kab. Sabu Raijua'),('7721','Pemerintah Kab. Malaka'),('7771','Pemerintah Kota Kupang'),('7800','Pemerintah Provinsi Maluku'),('7801','Pemerintah Kab. Maluku Tengah'),('7802','Pemerintah Kab. Maluku Tenggara'),('7803','Pemerintah Kab. Buru'),('7804','Pemerintah Kab. Maluku Tenggara Barat'),('7805','Pemerintah Kab. Kepulauan Aru'),('7806','Pemerintah Kab. Seram Bagian Barat'),('7807','Pemerintah Kab. Seram Bagian Timur'),('7808','Pemerintah Kab. Buru Selatan'),('7809','Pemerintah Kab. Maluku Barat Daya'),('7871','Pemerintah Kota Ambon'),('7872','Pemerintah Kota Tual'),('7900','Pemerintah Provinsi Maluku Utara'),('7901','Pemerintah Kab. Halmahera Barat'),('7902','Pemerintah Kab. Halmahera Tengah'),('7903','Pemerintah Kab. Kepulauan Sula'),('7904','Pemerintah Kab. Halmahera Selatan'),('7905','Pemerintah Kab. Halmahera Utara'),('7906','Pemerintah Kab. Halmahera Timur'),('7907','Pemerintah Kab. Pulau Morotai'),('7908','Pemerintah Kab. Pulau Taliabu'),('7971','Pemerintah Kota Ternate'),('7972','Pemerintah Kota Tidore Kepulauan'),('8000','Pemerintah Provinsi Papua'),('8001','Pemerintah Kab. Jayapura'),('8002','Pemerintah Kab. Biak Numfor'),('8004','Pemerintah Kab. Kepulauan Yapen '),('8007','Pemerintah Kab. Merauke'),('8008','Pemerintah Kab. Jayawijaya'),('8009','Pemerintah Kab. Nabire'),('8010','Pemerintah Kab. Puncak Jaya'),('8011','Pemerintah Kab. Paniai'),('8012','Pemerintah Kab. Mimika'),('8013','Pemerintah Kab. Boven Digoel'),('8014','Pemerintah Kab. Mappi'),('8015','Pemerintah Kab. Asmat'),('8016','Pemerintah Kab. Yahukimo'),('8017','Pemerintah Kab. Pegunungan Bintang'),('8018','Pemerintah Kab. Tolikara'),('8019','Pemerintah Kab. Sarmi'),('8020','Pemerintah Kab. Keerom'),('8026','Pemerintah Kab. Waropen'),('8027','Pemerintah Kab. Supiori'),('8028','Pemerintah Kab. Mamberamo Raya'),('8029','Pemerintah Kab. Mamberamo Tengah'),('8030','Pemerintah Kab. Lanny Jaya'),('8031','Pemerintah Kab. Yalimo'),('8032','Pemerintah Kab. Nduga'),('8033','Pemerintah Kab. Dogiyai'),('8035','Pemerintah Kab. Puncak'),('8036','Pemerintah Kab. Deiyai'),('8037','Pemerintah Kab. Intan Jaya'),('8072','Pemerintah Kota Jayapura'),('8100','Pemerintah Provinsi Kepulauan Riau'),('8101','Pemerintah Kab. Bintan'),('8102','Pemerintah Kab. Karimun'),('8103','Pemerintah Kab. Natuna'),('8104','Pemerintah Kab. Lingga'),('8105','Pemerintah Kab. Kepulauan Anambas'),('8171','Pemerintah Kota Batam'),('8172','Pemerintah Kota Tanjungpinang'),('8200','Pemerintah Provinsi Papua Barat'),('8201','Pemerintah Kab. Sorong'),('8202','Pemerintah Kab. Sorong Selatan'),('8203','Pemerintah Kab. Raja Ampat'),('8204','Pemerintah Kab. Manokwari'),('8205','Pemerintah Kab. Teluk Bintuni'),('8206','Pemerintah Kab. Teluk Wondama'),('8207','Pemerintah Kab. Fak-Fak'),('8208','Pemerintah Kab. Kaimana'),('8210','Pemerintah Kab. Tambrauw'),('8211','Pemerintah Kab. Maybrat'),('8212','Pemerintah Kab. Pegunungan Arfak'),('8213','Pemerintah Kab. Manokwari Selatan'),('8271','Pemerintah Kota Sorong'),('8300','Pemerintah Provinsi Sulawesi Barat'),('8301','Pemerintah Kab. Mamuju Utara'),('8302','Pemerintah Kab. Mamuju'),('8303','Pemerintah Kab. Mamasa'),('8304','Pemerintah Kab. Polewali Mandar'),('8305','Pemerintah Kab. Majene'),('8306','Pemerintah Kab. Mamuju Tengah'),('8400','Pemerintah Provinsi Kalimantan Utara'),('8401','Pemerintah Kab. Bulungan'),('8402','Pemerintah Kab. Malinau'),('8403','Pemerintah Kab. Nunukan'),('8404','Pemerintah Kab. Tana Tidung'),('8471','Pemerintah Kota Tarakan'),('8810','BUMN'),('8820','BUMD'),('8830','SWASTA'),('9910','Luar Negeri'),('9999','Lain-Lain');
/*!40000 ALTER TABLE `instansi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawaban_soal`
--

DROP TABLE IF EXISTS `jawaban_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jawaban_soal` (
  `id_jawaban_soal` int(11) NOT NULL AUTO_INCREMENT,
  `id_peserta` int(11) NOT NULL,
  `id_bank_soal` int(11) NOT NULL,
  `id_paket_soal` int(11) NOT NULL,
  `answer_peserta` varchar(1) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jawaban_soal`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_bank_soal` (`id_bank_soal`),
  KEY `id_paket_soal` (`id_paket_soal`),
  CONSTRAINT `jawaban_soal_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `jawaban_soal_ibfk_2` FOREIGN KEY (`id_bank_soal`) REFERENCES `bank_soal` (`id_bank_soal`),
  CONSTRAINT `jawaban_soal_ibfk_3` FOREIGN KEY (`id_paket_soal`) REFERENCES `paket_soal` (`id_paket_soal`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawaban_soal`
--

LOCK TABLES `jawaban_soal` WRITE;
/*!40000 ALTER TABLE `jawaban_soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawaban_soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komputer`
--

DROP TABLE IF EXISTS `komputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komputer` (
  `id_komputer` int(11) NOT NULL AUTO_INCREMENT,
  `ip_komputer` varchar(25) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_komputer`),
  UNIQUE KEY `ip_komputer` (`ip_komputer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komputer`
--

LOCK TABLES `komputer` WRITE;
/*!40000 ALTER TABLE `komputer` DISABLE KEYS */;
INSERT INTO `komputer` VALUES (1,'::1','1','2018-03-18 09:11:27','2018-03-18 09:11:55'),(2,'127.0.0.1','1','2018-03-25 23:39:54','2018-03-26 05:16:24'),(3,'178.100.211.222','1','2019-02-11 02:48:23','2019-03-13 22:56:47');
/*!40000 ALTER TABLE `komputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_app_user`
--

DROP TABLE IF EXISTS `level_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level_app_user` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_app_user`
--

LOCK TABLES `level_app_user` WRITE;
/*!40000 ALTER TABLE `level_app_user` DISABLE KEYS */;
INSERT INTO `level_app_user` VALUES (1,'Administrator','2018-03-20 03:01:39','2018-03-20 03:01:39'),(2,'Monitoring','2018-03-20 03:01:39','2018-03-20 03:01:39'),(3,'Registrasi','2018-03-20 03:01:50','2018-03-20 03:01:50');
/*!40000 ALTER TABLE `level_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `id_license` int(11) NOT NULL AUTO_INCREMENT,
  `key_license` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_license`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_per_sesi`
--

DROP TABLE IF EXISTS `login_per_sesi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_per_sesi` (
  `id_login_per_sesi` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesi` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_login_per_sesi`),
  KEY `id_sesi` (`id_sesi`),
  KEY `id_peserta` (`id_peserta`),
  CONSTRAINT `login_per_sesi_ibfk_2` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `login_per_sesi_ibfk_3` FOREIGN KEY (`id_sesi`) REFERENCES `sesi_ujian` (`id_sesi_ujian`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_per_sesi`
--

LOCK TABLES `login_per_sesi` WRITE;
/*!40000 ALTER TABLE `login_per_sesi` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_per_sesi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materi` (
  `id_materi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_materi` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_ujian_dinas_1` int(11) DEFAULT NULL,
  `id_ujian_dinas_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
INSERT INTO `materi` VALUES (1,'Pengetahuan Umum','2018-03-06 09:32:03','2019-02-12 00:58:00',3,4),(2,'Bakat Skolastik','2018-03-06 09:32:03','2019-02-12 00:58:00',3,4),(3,'Skala Kematangan','2018-03-06 09:34:31','2019-02-12 00:58:00',3,4),(4,'Substantif Daerah','2018-03-06 09:34:31','2019-02-12 00:58:00',3,4),(5,'Tupoksi Daerah','2018-03-06 09:35:09','2019-02-12 00:58:00',3,4),(6,'Kelompok A','2018-03-12 00:22:16','2019-02-12 00:58:00',1,2),(7,'Kelompok B','2018-03-12 00:22:16','2019-02-12 00:58:00',1,2),(8,'Kelompok C','2018-03-12 00:23:10','2019-02-12 00:58:00',1,2),(9,'Kelompok D','2018-03-12 00:23:10','2019-02-12 00:58:00',1,2),(10,'Kelompok E','2018-03-12 00:23:10','2019-02-12 00:58:00',1,2);
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paket_soal`
--

DROP TABLE IF EXISTS `paket_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paket_soal` (
  `id_paket_soal` int(11) NOT NULL AUTO_INCREMENT,
  `id_ujian_dinas` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `id_bank_soal` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paket_soal`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_bank_soal` (`id_bank_soal`),
  KEY `id_ujian_dinas` (`id_ujian_dinas`),
  CONSTRAINT `paket_soal_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `paket_soal_ibfk_2` FOREIGN KEY (`id_bank_soal`) REFERENCES `bank_soal` (`id_bank_soal`),
  CONSTRAINT `paket_soal_ibfk_3` FOREIGN KEY (`id_ujian_dinas`) REFERENCES `ujian_dinas` (`id_ujian_dinas`)
) ENGINE=InnoDB AUTO_INCREMENT=16981 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paket_soal`
--

LOCK TABLES `paket_soal` WRITE;
/*!40000 ALTER TABLE `paket_soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paket_soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peserta`
--

DROP TABLE IF EXISTS `peserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peserta` (
  `id_peserta` int(11) NOT NULL AUTO_INCREMENT,
  `user_peserta` varchar(255) NOT NULL,
  `pass_peserta` varchar(255) NOT NULL,
  `nama_peserta` varchar(200) NOT NULL,
  `nomor_identitas` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` tinyint(1) NOT NULL,
  `kode_instansi` varchar(5) NOT NULL,
  `id_ujian_dinas` int(11) NOT NULL,
  `ujian_status` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_peserta`),
  UNIQUE KEY `user_peserta` (`user_peserta`),
  UNIQUE KEY `nomor_identitas` (`nomor_identitas`),
  KEY `kode_instansi` (`kode_instansi`),
  KEY `id_ujian_dinas` (`id_ujian_dinas`),
  CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`kode_instansi`) REFERENCES `instansi` (`kode_instansi`),
  CONSTRAINT `peserta_ibfk_2` FOREIGN KEY (`id_ujian_dinas`) REFERENCES `ujian_dinas` (`id_ujian_dinas`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peserta`
--

LOCK TABLES `peserta` WRITE;
/*!40000 ALTER TABLE `peserta` DISABLE KEYS */;
/*!40000 ALTER TABLE `peserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihan_ganda`
--

DROP TABLE IF EXISTS `pilihan_ganda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilihan_ganda` (
  `id_pilihan_ganda` int(11) NOT NULL AUTO_INCREMENT,
  `id_bank_soal` int(11) NOT NULL,
  `pilihan` varchar(255) NOT NULL,
  `nilai_pilihan` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pilihan_ganda`),
  KEY `id_bank_soal` (`id_bank_soal`),
  CONSTRAINT `pilihan_ganda_ibfk_1` FOREIGN KEY (`id_bank_soal`) REFERENCES `bank_soal` (`id_bank_soal`)
) ENGINE=InnoDB AUTO_INCREMENT=2753 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihan_ganda`
--

LOCK TABLES `pilihan_ganda` WRITE;
/*!40000 ALTER TABLE `pilihan_ganda` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilihan_ganda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesi_ujian`
--

DROP TABLE IF EXISTS `sesi_ujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesi_ujian` (
  `id_sesi_ujian` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sesi` varchar(11) NOT NULL,
  `pin_sesi` varchar(6) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sesi_ujian`),
  UNIQUE KEY `nama_sesi_UNIQUE` (`nama_sesi`),
  KEY `id_ujian_dinas` (`nama_sesi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesi_ujian`
--

LOCK TABLES `sesi_ujian` WRITE;
/*!40000 ALTER TABLE `sesi_ujian` DISABLE KEYS */;
INSERT INTO `sesi_ujian` VALUES (2,'1','5313',NULL,'2019-03-14 00:03:23','2019-03-14 00:03:23');
/*!40000 ALTER TABLE `sesi_ujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sisa_waktu`
--

DROP TABLE IF EXISTS `sisa_waktu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sisa_waktu` (
  `id_sisa_waktu` int(11) NOT NULL AUTO_INCREMENT,
  `id_ujian_dinas` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL,
  `sisa` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sisa_waktu`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_ujian_dinas` (`id_ujian_dinas`),
  KEY `id_ujian_dinas_2` (`id_ujian_dinas`),
  CONSTRAINT `sisa_waktu_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `sisa_waktu_ibfk_2` FOREIGN KEY (`id_ujian_dinas`) REFERENCES `ujian_dinas` (`id_ujian_dinas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sisa_waktu`
--

LOCK TABLES `sisa_waktu` WRITE;
/*!40000 ALTER TABLE `sisa_waktu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sisa_waktu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_materi`
--

DROP TABLE IF EXISTS `sub_materi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_materi` (
  `id_submateri` int(11) NOT NULL AUTO_INCREMENT,
  `nama_submateri` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_submateri`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_materi`
--

LOCK TABLES `sub_materi` WRITE;
/*!40000 ALTER TABLE `sub_materi` DISABLE KEYS */;
INSERT INTO `sub_materi` VALUES (1,'Pancasila','2018-03-06 09:36:27','2018-03-06 09:44:45'),(2,'UUD 1945','2018-03-06 09:36:27','2018-03-06 09:44:51'),(3,'Sejarah','2018-03-06 09:38:37','2018-03-06 09:44:58'),(4,'Sistem Tata Negara','2018-03-06 09:38:37','2018-03-06 09:45:05'),(5,'Bahasa Indonesia','2018-03-06 09:38:37','2018-03-06 09:45:13'),(6,'Politik Dalam dan Luar Negeri','2018-03-06 09:38:37','2018-03-06 09:45:20'),(7,'Bahasa Inggris','2018-03-06 09:38:37','2018-03-06 09:40:26'),(8,'Kemampuan Verbal','2018-03-06 09:46:48','2018-03-06 09:46:48'),(9,'Kemampuan Berpikir Analitis','2018-03-06 09:46:48','2018-03-06 09:46:48'),(10,'Kemampuan Berpikir Logis','2018-03-06 09:47:16','2018-03-06 09:47:16'),(11,'Kemampuan Beradaptasi','2018-03-06 09:48:36','2018-03-06 09:48:36'),(12,'Pengendalian Diri','2018-03-06 09:48:36','2018-03-06 09:48:36'),(13,'Semangat Berprestasi','2018-03-06 09:49:52','2018-03-06 09:49:52'),(14,'Integritas','2018-03-06 09:49:52','2018-03-06 09:49:52'),(15,'Inisiatif','2018-03-06 09:49:52','2018-03-06 09:49:52'),(16,'Rencana Strategis Instansi','2018-03-06 09:51:31','2018-03-12 02:37:49'),(17,'Struktur Organisasi dan Tata Kerja','2018-03-06 09:51:31','2018-03-12 02:38:17'),(18,'Rencana Pembangunan Jangka Menengah (RPJM)','2018-03-12 00:25:41','2018-03-12 00:25:41'),(19,'Kepegawaian','2018-03-12 00:25:41','2018-03-12 00:25:41'),(20,'KORPRI','2018-03-12 00:28:02','2018-03-12 00:28:02'),(21,'Pengetahuan Perkantoran','2018-03-12 00:28:02','2018-03-12 00:28:02'),(22,'Sejarah Indonesia','2018-03-12 00:29:35','2018-03-12 00:29:35'),(23,'Subtantif Daerah','2018-03-12 00:29:35','2018-03-12 00:29:35'),(24,'Tupoksi Daerah','2018-03-12 00:29:48','2018-03-12 00:29:48'),(25,'Kepemimpinan','2018-03-12 02:24:39','2018-03-12 02:24:39');
/*!40000 ALTER TABLE `sub_materi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujian_dinas`
--

DROP TABLE IF EXISTS `ujian_dinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujian_dinas` (
  `id_ujian_dinas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ujian` varchar(100) NOT NULL,
  `waktu` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ujian_dinas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian_dinas`
--

LOCK TABLES `ujian_dinas` WRITE;
/*!40000 ALTER TABLE `ujian_dinas` DISABLE KEYS */;
INSERT INTO `ujian_dinas` VALUES (1,'UJIAN DINAS TINGKAT I',90,'2018-03-12 01:54:50','2018-03-15 07:40:31'),(2,'UJIAN DINAS TINGKAT II',90,'2018-03-12 01:54:50','2018-03-15 07:40:37'),(3,'UJIAN PENYESUAIAN KENAIKAN PANGKAT PNS (SD, SMP, SMA, S1)',90,'2018-03-12 01:55:18','2019-03-18 05:15:16'),(4,'UJIAN PENYESUAIAN KENAIKAN PANGKAT PNS (S2)',90,'2018-03-14 09:51:57','2018-03-15 07:40:49');
/*!40000 ALTER TABLE `ujian_dinas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19  7:57:37
