-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for photographer
DROP DATABASE IF EXISTS `photographer`;
CREATE DATABASE IF NOT EXISTS `photographer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `photographer`;


-- Dumping structure for table photographer.gallery_albums
DROP TABLE IF EXISTS `gallery_albums`;
CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id_album` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user_added` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_album`),
  KEY `gallery_albums_id_user_fk` (`id_user_added`),
  CONSTRAINT `gallery_albums_id_user_fk` FOREIGN KEY (`id_user_added`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Dumping data for table photographer.gallery_albums: ~1 rows (approximately)
DELETE FROM `gallery_albums`;
/*!40000 ALTER TABLE `gallery_albums` DISABLE KEYS */;
INSERT INTO `gallery_albums` (`id_album`, `id_user_added`, `name`, `disabled`) VALUES
	(1, 1, 'Glowny album', 0);
/*!40000 ALTER TABLE `gallery_albums` ENABLE KEYS */;


-- Dumping structure for table photographer.gallery_images
DROP TABLE IF EXISTS `gallery_images`;
CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id_img` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_album` int(11) unsigned DEFAULT NULL,
  `id_user_added` int(11) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `src` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_img`),
  KEY `gallery_images_id_album_fk` (`id_album`),
  KEY `gallery_images_id_user_added_fk` (`id_user_added`),
  CONSTRAINT `gallery_images_id_album_fk` FOREIGN KEY (`id_album`) REFERENCES `gallery_albums` (`id_album`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `gallery_images_id_user_added_fk` FOREIGN KEY (`id_user_added`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Dumping data for table photographer.gallery_images: ~3 rows (approximately)
DELETE FROM `gallery_images`;
/*!40000 ALTER TABLE `gallery_images` DISABLE KEYS */;
INSERT INTO `gallery_images` (`id_img`, `id_album`, `id_user_added`, `name`, `src`, `disabled`) VALUES
	(1, 1, 1, 'Zdjecie 1', 'public/img/photo1.png', 0),
	(2, 1, 1, 'Zdjecie 2', 'public/img/photo1.png', 0),
	(3, 1, 1, 'Zdjecie 3', 'public/img/photo1.png', 0);
/*!40000 ALTER TABLE `gallery_images` ENABLE KEYS */;


-- Dumping structure for table photographer.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8_polish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Dumping data for table photographer.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id_user`, `login`) VALUES
	(1, 'admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for view photographer.v_gallery_images
DROP VIEW IF EXISTS `v_gallery_images`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_gallery_images` (
	`id_img` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_polish_ci',
	`src` VARCHAR(150) NOT NULL COLLATE 'utf8_polish_ci',
	`album_name` VARCHAR(50) NULL COLLATE 'utf8_polish_ci',
	`user_added` VARCHAR(30) NULL COLLATE 'utf8_polish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view photographer.v_gallery_images
DROP VIEW IF EXISTS `v_gallery_images`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_gallery_images`;
CREATE ALGORITHM=UNDEFINED DEFINER=`photographer`@`127.0.0.1` VIEW `v_gallery_images` AS SELECT
	i.id_img,
	i.name,
	i.src,
	a.name AS album_name,
	u.login AS user_added
FROM gallery_images i
LEFT JOIN gallery_albums a USING (id_album)
LEFT JOIN users u ON i.id_user_added = u.id_user
WHERE a.disabled = 0 AND i.disabled = 0 ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
