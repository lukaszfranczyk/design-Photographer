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


-- Dumping structure for table photographer.auth_session
DROP TABLE IF EXISTS `auth_session`;
CREATE TABLE IF NOT EXISTS `auth_session` (
  `id_session` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `key` char(32) NOT NULL DEFAULT '0',
  `date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_session`),
  UNIQUE KEY `id_user_unique` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.auth_session: ~0 rows (approximately)
DELETE FROM `auth_session`;
/*!40000 ALTER TABLE `auth_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_session` ENABLE KEYS */;


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
  `thumbSrc` varchar(150) COLLATE utf8_polish_ci NOT NULL,
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
INSERT INTO `gallery_images` (`id_img`, `id_album`, `id_user_added`, `name`, `src`, `thumbSrc`, `disabled`) VALUES
	(1, 1, 1, 'Zdjecie 1', 'public/img/photo1.png', 'public/img/photo1.png', 0),
	(2, 1, 1, 'Zdjecie 2', 'public/img/photo1.png', 'public/img/photo1.png', 0),
	(3, 1, 1, 'Zdjecie 3', 'public/img/photo1.png', 'public/img/photo1.png', 0);
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


-- Dumping structure for table photographer.vcms_privileges
DROP TABLE IF EXISTS `vcms_privileges`;
CREATE TABLE IF NOT EXISTS `vcms_privileges` (
  `id_privilege` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '0',
  `enum_name` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_privilege`),
  UNIQUE KEY `unique_enum_name` (`enum_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.vcms_privileges: ~0 rows (approximately)
DELETE FROM `vcms_privileges`;
/*!40000 ALTER TABLE `vcms_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcms_privileges` ENABLE KEYS */;


-- Dumping structure for table photographer.vcms_usergroups
DROP TABLE IF EXISTS `vcms_usergroups`;
CREATE TABLE IF NOT EXISTS `vcms_usergroups` (
  `id_usergroup` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usergroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.vcms_usergroups: ~0 rows (approximately)
DELETE FROM `vcms_usergroups`;
/*!40000 ALTER TABLE `vcms_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcms_usergroups` ENABLE KEYS */;


-- Dumping structure for table photographer.vcms_usergroup_privilege
DROP TABLE IF EXISTS `vcms_usergroup_privilege`;
CREATE TABLE IF NOT EXISTS `vcms_usergroup_privilege` (
  `id_usergroup` int(10) unsigned NOT NULL,
  `id_privilege` int(10) unsigned NOT NULL,
  KEY `vcms_usergroup_privilege_id_usergroup_FK` (`id_usergroup`),
  KEY `vcms_usergroup_privilege_id_privilege_FK` (`id_privilege`),
  CONSTRAINT `vcms_usergroup_privilege_id_privilege_FK` FOREIGN KEY (`id_privilege`) REFERENCES `vcms_privileges` (`id_privilege`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vcms_usergroup_privilege_id_usergroup_FK` FOREIGN KEY (`id_usergroup`) REFERENCES `vcms_usergroups` (`id_usergroup`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.vcms_usergroup_privilege: ~0 rows (approximately)
DELETE FROM `vcms_usergroup_privilege`;
/*!40000 ALTER TABLE `vcms_usergroup_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcms_usergroup_privilege` ENABLE KEYS */;


-- Dumping structure for table photographer.vcms_users
DROP TABLE IF EXISTS `vcms_users`;
CREATE TABLE IF NOT EXISTS `vcms_users` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `unique_login` (`login`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.vcms_users: ~0 rows (approximately)
DELETE FROM `vcms_users`;
/*!40000 ALTER TABLE `vcms_users` DISABLE KEYS */;
INSERT INTO `vcms_users` (`id_user`, `login`, `password`, `mail`, `first_name`, `last_name`) VALUES
	(1, 'user', 'acf1ade83c1448a75c1a65fee2eadcf8', 'user@local', 'userslaw', 'userowski');
/*!40000 ALTER TABLE `vcms_users` ENABLE KEYS */;


-- Dumping structure for table photographer.vcms_user_privilege
DROP TABLE IF EXISTS `vcms_user_privilege`;
CREATE TABLE IF NOT EXISTS `vcms_user_privilege` (
  `id_user` int(10) unsigned NOT NULL,
  `id_privilege` int(10) unsigned NOT NULL,
  KEY `vcms_user_privilege_id_privilege_FK` (`id_privilege`),
  KEY `vcms_user_privilege_id_user_FK` (`id_user`),
  CONSTRAINT `vcms_user_privilege_id_privilege_FK` FOREIGN KEY (`id_privilege`) REFERENCES `vcms_privileges` (`id_privilege`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vcms_user_privilege_id_user_FK` FOREIGN KEY (`id_user`) REFERENCES `vcms_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.vcms_user_privilege: ~0 rows (approximately)
DELETE FROM `vcms_user_privilege`;
/*!40000 ALTER TABLE `vcms_user_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcms_user_privilege` ENABLE KEYS */;


-- Dumping structure for table photographer.vcms_user_usergroup
DROP TABLE IF EXISTS `vcms_user_usergroup`;
CREATE TABLE IF NOT EXISTS `vcms_user_usergroup` (
  `id_user` int(10) unsigned NOT NULL,
  `id_usergroup` int(10) unsigned NOT NULL,
  KEY `vcms_user_usergroup_id_user_FK` (`id_user`),
  KEY `vcms_user_usergroup_id_usergroup_FK` (`id_usergroup`),
  CONSTRAINT `vcms_user_usergroup_id_user_FK` FOREIGN KEY (`id_user`) REFERENCES `vcms_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vcms_user_usergroup_id_usergroup_FK` FOREIGN KEY (`id_usergroup`) REFERENCES `vcms_usergroups` (`id_usergroup`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table photographer.vcms_user_usergroup: ~0 rows (approximately)
DELETE FROM `vcms_user_usergroup`;
/*!40000 ALTER TABLE `vcms_user_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcms_user_usergroup` ENABLE KEYS */;


-- Dumping structure for view photographer.v_gallery_images
DROP VIEW IF EXISTS `v_gallery_images`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_gallery_images` (
	`id_img` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_polish_ci',
	`src` VARCHAR(150) NOT NULL COLLATE 'utf8_polish_ci',
	`thumbSrc` VARCHAR(150) NOT NULL COLLATE 'utf8_polish_ci',
	`album_name` VARCHAR(50) NULL COLLATE 'utf8_polish_ci',
	`user_added` VARCHAR(30) NULL COLLATE 'utf8_polish_ci'
) ENGINE=MyISAM;


-- Dumping structure for procedure photographer.login
DROP PROCEDURE IF EXISTS `login`;
DELIMITER //
CREATE DEFINER=`vcms`@`localhost` PROCEDURE `login`(IN `login` TEXT, IN `pass` TEXT)
    MODIFIES SQL DATA
proc:BEGIN
DECLARE returnCode TINYINT UNSIGNED DEFAULT 0;
DECLARE _dbPassword CHAR(32);
DECLARE _argPassword CHAR(32) DEFAULT MD5( CONCAT(SHA1(CONCAT(pass, 'oi93a#')), 'OOWOP)@#*(') );
DECLARE _sessKey CHAR(32) DEFAULT MD5( CONCAT(CURRENT_TIMESTAMP, RAND()) );
DECLARE _idUser INT UNSIGNED;
DECLARE _userEmail TEXT;
DECLARE _firstName TEXT;
DECLARE _lastName TEXT;

SELECT 
	id_user, password, mail, first_name, last_name
	INTO _idUser, _dbPassword, _userEmail, _firstName, _lastName
FROM vcms_users u
WHERE u.login = login;


IF _dbPassword IS NULL OR _dbPassword != _argPassword THEN
	SELECT 1 AS return_code;
	LEAVE proc;
END IF;

-- create session
INSERT INTO auth_session (`id_user`, `key`) VALUES (_idUser, _sessKey)
	ON DUPLICATE KEY UPDATE `key` = _sessKey, date_start = CURRENT_TIMESTAMP;

SELECT
	0 AS return_code,
	_idUser AS id_user,
	login AS login,
	_userEmail AS email,
	_firstName AS first_name,
	_lastName AS last_name,
	_sessKey AS session_key
FROM DUAL;

END//
DELIMITER ;


-- Dumping structure for view photographer.v_gallery_images
DROP VIEW IF EXISTS `v_gallery_images`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_gallery_images`;
CREATE ALGORITHM=UNDEFINED DEFINER=`photographer`@`127.0.0.1` VIEW `v_gallery_images` AS SELECT
	i.id_img,
	i.name,
	i.src,
	i.thumbSrc,
	a.name AS album_name,
	u.login AS user_added
FROM gallery_images i
LEFT JOIN gallery_albums a USING (id_album)
LEFT JOIN users u ON i.id_user_added = u.id_user
WHERE a.disabled = 0 AND i.disabled = 0 ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
