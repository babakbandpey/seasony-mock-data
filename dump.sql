/*
SQLyog Trial v13.1.5  (64 bit)
MySQL - 10.3.16-MariaDB : Database - seasony
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`seasony` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `seasony`;

/*Table structure for table `area_material_logs` */

DROP TABLE IF EXISTS `area_material_logs`;

CREATE TABLE `area_material_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_batch_area_crop_stage_id` int(11) NOT NULL,
  `fk_area_material_id` int(11) NOT NULL,
  `entry` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_area_material_id` (`fk_area_material_id`),
  KEY `fk_batch_area_crop_stage_id` (`fk_batch_area_crop_stage_id`),
  CONSTRAINT `area_material_logs_ibfk_1` FOREIGN KEY (`fk_area_material_id`) REFERENCES `area_materials` (`id`),
  CONSTRAINT `area_material_logs_ibfk_2` FOREIGN KEY (`fk_batch_area_crop_stage_id`) REFERENCES `batch_area_crop_stages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `area_material_logs` */

/*Table structure for table `area_materials` */

DROP TABLE IF EXISTS `area_materials`;

CREATE TABLE `area_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_area_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_area_id` (`fk_area_id`),
  CONSTRAINT `area_materials_ibfk_1` FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `area_materials` */

/*Table structure for table `area_users` */

DROP TABLE IF EXISTS `area_users`;

CREATE TABLE `area_users` (
  `area_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_area_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`area_user_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `fk_area_id` (`fk_area_id`),
  CONSTRAINT `area_users_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `area_users_ibfk_2` FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `area_users` */

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_parent_area_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `areas` */

insert  into `areas`(`id`,`name`,`fk_parent_area_id`,`created_at`,`updated_at`,`deleted`) values 
(1,'area 1',NULL,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(2,'green house 1',1,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(3,'room 1',2,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(4,'stand 1',3,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(5,'tray 1',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(6,'tray 2',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(7,'tray 3',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(8,'tray 4',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(9,'tray 5',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(10,'tray 6',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(11,'tray 7',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(12,'tray 8',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(13,'tray 9',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(14,'tray 10',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(15,'tray 11',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(16,'tray 12',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(17,'tray 13',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(18,'tray 14',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(19,'tray 15',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(20,'tray 16',4,'2020-03-14 13:43:07','2020-03-14 13:43:07',0);

/*Table structure for table `batch_area_crop_stages` */

DROP TABLE IF EXISTS `batch_area_crop_stages`;

CREATE TABLE `batch_area_crop_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_crop_id` int(11) NOT NULL,
  `fk_crop_stage_id` int(11) NOT NULL,
  `fk_batch_area_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_crop_stage_id` (`fk_crop_stage_id`),
  KEY `fk_batch_area_id` (`fk_batch_area_id`),
  CONSTRAINT `batch_area_crop_stages_ibfk_1` FOREIGN KEY (`fk_crop_stage_id`) REFERENCES `crop_stages` (`id`),
  CONSTRAINT `batch_area_crop_stages_ibfk_2` FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `batch_area_crop_stages` */

/*Table structure for table `batch_area_nonreusable_resource_consumption` */

DROP TABLE IF EXISTS `batch_area_nonreusable_resource_consumption`;

CREATE TABLE `batch_area_nonreusable_resource_consumption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_batch_area_id` int(11) NOT NULL,
  `fk_material_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_batch_area_id` (`fk_batch_area_id`),
  KEY `fk_material_id` (`fk_material_id`),
  CONSTRAINT `batch_area_nonreusable_resource_consumption_ibfk_1` FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`id`),
  CONSTRAINT `batch_area_nonreusable_resource_consumption_ibfk_2` FOREIGN KEY (`fk_material_id`) REFERENCES `materials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `batch_area_nonreusable_resource_consumption` */

/*Table structure for table `batch_area_status` */

DROP TABLE IF EXISTS `batch_area_status`;

CREATE TABLE `batch_area_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_batch_area_id` int(11) NOT NULL,
  `stage` enum('seeding','propagation','maturity','harvest','storage','delivery','gone_bad') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_batch_area_id` (`fk_batch_area_id`),
  CONSTRAINT `batch_area_status_ibfk_1` FOREIGN KEY (`fk_batch_area_id`) REFERENCES `batch_areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `batch_area_status` */

/*Table structure for table `batch_areas` */

DROP TABLE IF EXISTS `batch_areas`;

CREATE TABLE `batch_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_batch_id` int(11) NOT NULL,
  `fk_area_id` int(11) NOT NULL,
  `number_of_pots` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_batch_id` (`fk_batch_id`),
  KEY `fk_area_id` (`fk_area_id`),
  CONSTRAINT `batch_areas_ibfk_1` FOREIGN KEY (`fk_batch_id`) REFERENCES `batches` (`id`),
  CONSTRAINT `batch_areas_ibfk_2` FOREIGN KEY (`fk_area_id`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `batch_areas` */

/*Table structure for table `batches` */

DROP TABLE IF EXISTS `batches`;

CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_crop_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seeding_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_crop_id` (`fk_crop_id`),
  CONSTRAINT `batches_ibfk_1` FOREIGN KEY (`fk_crop_id`) REFERENCES `crops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `batches` */

/*Table structure for table `crop_stage_defaults` */

DROP TABLE IF EXISTS `crop_stage_defaults`;

CREATE TABLE `crop_stage_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_crop_id` int(11) NOT NULL,
  `fk_crop_stage_id` int(11) NOT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_value` double NOT NULL,
  `optimum_value` double NOT NULL,
  `max_value` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_crop_id` (`fk_crop_id`),
  KEY `fk_crop_stage_id` (`fk_crop_stage_id`),
  CONSTRAINT `crop_stage_defaults_ibfk_1` FOREIGN KEY (`fk_crop_id`) REFERENCES `crops` (`id`),
  CONSTRAINT `crop_stage_defaults_ibfk_2` FOREIGN KEY (`fk_crop_stage_id`) REFERENCES `crop_stages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crop_stage_defaults` */

insert  into `crop_stage_defaults`(`id`,`fk_crop_id`,`fk_crop_stage_id`,`parameter`,`min_value`,`optimum_value`,`max_value`,`created_at`,`updated_at`,`deleted`) values 
(1,1,1,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(2,1,1,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(3,1,1,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(4,1,1,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(5,1,1,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(6,1,2,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(7,1,2,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(8,1,2,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(9,1,2,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(10,1,2,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(11,1,3,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(12,1,3,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(13,1,3,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(14,1,3,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(15,1,3,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(16,1,4,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(17,1,4,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(18,1,4,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(19,1,4,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(20,1,4,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(21,1,5,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(22,1,5,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(23,1,5,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(24,1,5,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(25,1,5,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(26,2,1,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(27,2,1,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(28,2,1,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(29,2,1,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(30,2,1,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(31,2,2,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(32,2,2,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(33,2,2,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(34,2,2,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(35,2,2,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(36,2,3,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(37,2,3,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(38,2,3,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(39,2,3,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(40,2,3,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(41,2,4,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(42,2,4,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(43,2,4,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(44,2,4,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(45,2,4,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(46,2,5,'temperature',20,22,25,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(47,2,5,'humidity',70,80,90,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(48,2,5,'ph',7,7,7,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(49,2,5,'ec',700,900,1120,'2020-03-11 00:00:00','2020-03-11 00:00:00',0),
(50,2,5,'water_level',150,500,900,'2020-03-11 00:00:00','2020-03-11 00:00:00',0);

/*Table structure for table `crop_stages` */

DROP TABLE IF EXISTS `crop_stages`;

CREATE TABLE `crop_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` enum('seeding','propagation','maturity','harvest','storage','delivery','gone_bad') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crop_stages` */

insert  into `crop_stages`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'seeding','2020-03-14 13:43:09','2020-03-14 13:43:09'),
(2,'propagation','2020-03-14 13:43:09','2020-03-14 13:43:09'),
(3,'maturity','2020-03-14 13:43:09','2020-03-14 13:43:09'),
(4,'harvest','2020-03-14 13:43:09','2020-03-14 13:43:09'),
(5,'storage','2020-03-14 13:43:09','2020-03-14 13:43:09'),
(6,'delivery','2020-03-14 13:43:09','2020-03-14 13:43:09'),
(7,'','2020-03-14 13:43:09','2020-03-14 13:43:09');

/*Table structure for table `crops` */

DROP TABLE IF EXISTS `crops`;

CREATE TABLE `crops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plant_variety` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crops` */

insert  into `crops`(`id`,`name`,`plant_variety`,`created_at`,`updated_at`,`deleted`) values 
(1,'Lettuce ','Asteraceae','2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(2,'Shiso ','Lamiaceae','2020-03-14 13:43:09','2020-03-14 13:43:09',0);

/*Table structure for table `materials` */

DROP TABLE IF EXISTS `materials`;

CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_unit_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_unit_id` (`fk_unit_id`),
  CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`fk_unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `materials` */

insert  into `materials`(`id`,`name`,`company_name`,`fk_unit_id`,`created_at`,`updated_at`,`deleted`) values 
(1,'ANTIMONY TRISULFIDE','Homeocare Laboratories',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(2,'Diethylpropion hydrochloride','PD-Rx Pharmaceuticals, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(3,'ALCOHOL','Triad Group',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(4,'Benzocain','Eau Zone Oils and Fragrances LTD',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(5,'Benazepril hydrochloride','Trigen Laboratories, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(6,'Mineral Oil','Best Choice',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(7,'Atomoxetine hydrochloride','Eli Lilly and Company',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(8,'Hydrochlorothiazide','Macleods Pharmaceuticals Limited',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(9,'TITANIUM DIOXIDE','Laboratoires Clarins S.A.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(10,'loxapine succinate','Watson Pharma, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(11,'OCTINOXATE','Ventura Corporation (San Juan, P.R)',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(12,'Aralia racemosa','Apotheca Company',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(13,'Montelukast','Bryant Ranch Prepack',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(14,'Ranitidine','Walgreen Company',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(15,'Isopropyl Alcohol','Wal-Mart Stores Inc',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(16,'LIDOCAINE HYDROCHLORIDE','APP Pharmaceuticals, LLC',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(17,'OCTISALATE','ORIGINS NATURAL RESOURCES INC.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(18,'sodium fluoride','Chattem, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(19,'Fentanyl Citrate','Cantrell Drug Company',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(20,'Acetaminophen, Diphenhydramine HCl','Supervalu Inc',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(21,'CINCHONA OFFICINALIS BARK','Washington Homeopathic Products',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(22,'TOPICAL STARCH','KJI Industrial Co Ltd',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(23,'Levetiracetam','American Health Packaging',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(24,'Prochlorperazine Maleate','Northwind Pharmaceuticals',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(25,'adenosine','IASO Inc',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(26,'zolpidem tartrate','REMEDYREPACK INC.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(27,'Oxycodone Hydrochloride','Zydus Pharmaceuticals (USA) Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(28,'CLONAZEPAM','Caraco Pharmaceutical Laboratories, Ltd.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(29,'IBUPROFEN','Costco Wholesale',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(30,'ONDANSETRON','Rebel Distributors Corp',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(31,'CHLORHEXIDINE GLUCONATE, ETHYL ALCOHOL','MKR International Inc',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(32,'EUPHRASIA STRICTA','Natural Health Supply',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(33,'risperidone','Cardinal Health',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(34,'TRICLOSAN','Volume Distributors, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(35,'PANAX GINSENG FRUIT','Korea Genetic Pharm Co., Ltd',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(36,'Octinoxate and Oxybenzone','Ventura Corporation LTD',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(37,'Sodium Citrate','Alva-Amco Pharmacal Companies, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(38,'PHENTERMINE HYDROCHLORIDE','Apotheca, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(39,'levocetirizine dihydrochloride','UCB, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(40,'Tolnaftate','Perrigo New York Inc',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(41,'Oxygen','Coastal Med Tech, Inc.',1,'2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(42,'temprature_sensor','Quaxo',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(43,'humidity_sensor','Rhyloo',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(44,'co2_sensor','Katz',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(45,'gas_sensor','Voomm',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(46,'water_level_sensor','Topicware',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(47,'smoke_sensor','Cogidoo',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(48,'big_tray','Izio',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(49,'big_pot','Talane',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(50,'small_tray','Oyope',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(51,'small_pot','Skipstorm',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(52,'light_bulb','Dynabox',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(53,'soil','Dabvine',14,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(54,'paper_bag','Eayo',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(55,'plastic_bag','Twimm',13,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(56,'Lettuce_seed','Natural One',3,'2020-03-14 13:43:09','2020-03-14 13:43:09',0),
(57,'Shiso_seed','Natural One',3,'2020-03-14 13:43:09','2020-03-14 13:43:09',0);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'super_admin','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(2,'admin','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(3,'user','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(4,'purchase','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(5,'sale','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(6,'production','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(7,'sensor','2020-03-14 13:43:07','2020-03-14 13:43:07');

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `units` */

insert  into `units`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'milligram','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(2,'gram','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(3,'kilogram','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(4,'millimeter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(5,'centimeter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(6,'meter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(7,'centigrade','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(8,'fahrenheit','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(9,'milliliter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(10,'centiliter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(11,'deciliter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(12,'liter','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(13,'piece','2020-03-14 13:43:07','2020-03-14 13:43:07'),
(14,'cubic_meter','2020-03-14 13:43:07','2020-03-14 13:43:07');

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_role_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `fk_role_id` (`fk_role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`fk_role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_roles` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`created_at`,`updated_at`,`deleted`) values 
(1,'Nalani Ingry','ningry0@csmonitor.com','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(2,'Valaria Southeran','vsoutheran1@amazon.co.uk','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(3,'Oralia Hallatt','ohallatt2@aboutads.info','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(4,'Diane Woloschin','dwoloschin3@taobao.com','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(5,'Vasily Trenouth','vtrenouth4@vimeo.com','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(6,'Fara Spire','fspire5@nps.gov','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(7,'Moshe Foresight','mforesight6@smh.com.au','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(8,'Carree Camin','ccamin7@springer.com','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(9,'Betti Smowton','bsmowton8@va.gov','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(10,'Stanley Langton','slangton9@mapy.cz','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(11,'Caterina Easlea','ceasleaa@joomla.org','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(12,'Florie Wehner','fwehnerb@amazonaws.com','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(13,'Georgine Manshaw','gmanshawc@cnet.com','2020-03-14 13:43:07','2020-03-14 13:43:07',0),
(14,'Laughton O\'Doohaine','lodoohained@printfriendly.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(15,'Wally Adnet','wadnete@fc2.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(16,'Rowena Mitrovic','rmitrovicf@hc360.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(17,'Aloysius Brigham','abrighamg@google.co.uk','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(18,'Joan Shirer','jshirerh@com.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(19,'Lavinie Godlonton','lgodlontoni@icio.us','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(20,'Agretha Blanchard','ablanchardj@msn.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(21,'Ase Gartshore','agartshorek@is.gd','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(22,'Jolie Mordey','jmordeyl@over-blog.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(23,'Candy McCurdy','cmccurdym@blogspot.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(24,'Niven Brunsden','nbrunsdenn@cbc.ca','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(25,'Boote Pinnell','bpinnello@wix.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(26,'Minor Bliven','mblivenp@scribd.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(27,'Timmi Cawson','tcawsonq@1und1.de','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(28,'Cinderella Brailsford','cbrailsfordr@webs.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(29,'Heywood Osipenko','hosipenkos@cbsnews.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0),
(30,'Gale Osgar','gosgart@jimdo.com','2020-03-14 13:43:08','2020-03-14 13:43:08',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
