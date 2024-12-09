-- Adminer 4.8.1 MySQL 10.4.28-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `client` bigint(20) unsigned DEFAULT NULL,
  `admin` bigint(20) unsigned DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `admin` (`admin`),
  CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`client`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activities_ibfk_3` FOREIGN KEY (`admin`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `otp` varchar(50) DEFAULT NULL,
  `otp_sent_on` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admins` (`id`, `first_name`, `role`, `last_name`, `email`, `password`, `phonenumber`, `last_login`, `is_admin`, `otp`, `otp_sent_on`, `token`, `image`, `created_by`, `status`, `address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Globiz', NULL, 'Technology', 'admin@globiz.com', '$2y$10$WAxPi4z50LxTjfQeqoFg4efFdTC6D4yQl2VV4Nh4Mqc.ei.RaA922', '6476775152', '2024-11-27 12:30:31',  1,  NULL, NULL, NULL, '/uploads/admins/17231916531245-pexels-didsss-2423501.jpg', NULL, 1,  '98002 Crown Terrace Dr', NULL, '2023-09-15 09:47:52',  '2024-11-27 07:00:31');

DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) unsigned NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  `mode` enum('listing','create','update','delete') NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permission_id`),
  KEY `admin_id` (`admin_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `admin_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `counry_id` (`country_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE `contact_us` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `contact_us_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `contact_us` (`id`, `first_name`, `last_name`, `company_name`, `country`, `email`, `phonenumber`, `subject`, `message`, `status`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'zxzzx',  'zxzx', 'asas', 'asas', 'dsd@gmail.com',  '6352419870', 'asas', 'asas', 1,  1,  NULL, '2024-08-12 07:37:48',  '2024-08-12 07:37:48'),
(2, 'pooja',  'kharwar',  'asas', 'asas', 'pooja@gmail.com',  '6352419870', 'asas', 'asaas',  1,  1,  NULL, '2024-08-12 07:39:05',  '2024-08-12 07:39:05'),
(3, 'Pooja',  'Kharwar',  'Globiz Technology',  'Ludhiana', 'globiz.pooja@gmail.com', '6352419870', 'Its Just For Testing', 'Its Just For Messages',  1,  1,  NULL, '2024-08-12 07:43:31',  '2024-08-12 07:43:31'),
(4, 'xzxz', 'xzx',  'asas', 'asas', 'zxz@gmail.com',  '6352419870', 'as', 'sasa', 1,  1,  NULL, '2024-08-12 07:43:58',  '2024-08-12 07:43:58'),
(5, 'Pooja',  'Kharwar',  'Globiz Technology',  'Punjab', 'globiz.pooja@gmail.com', '6352419870', 'Its Just for testing', 'Its Just for Messages',  1,  1,  NULL, '2024-08-12 23:35:25',  '2024-08-12 23:35:25'),
(6, 'dfd',  'dfd',  '258',  'Samoa',  'admin@ptepasasancacea.com',  '7888769938', 'dfd',  'dfd',  1,  1,  NULL, '2024-08-13 02:37:51',  '2024-08-13 02:37:51'),
(7, 'zxzx', 'Ahmad',  '258',  'Samoa',  'admin@ptepasasancacea.com',  '7888769938', 'zxz',  'zxzx', 1,  1,  NULL, '2024-08-13 02:40:34',  '2024-08-13 02:40:34'),
(8, 'Demo', 'Ahmad',  '258',  'Samoa',  'admin@ptepasasancacea.com',  '7888769938', 'zxz',  'zxzx', 1,  1,  NULL, '2024-08-13 02:41:05',  '2024-08-13 02:41:05'),
(9, 'Demo', 'xcxc', '258',  'Samoa',  'admin@ptepasasancacea.com',  '7888769938', 'john john',  'xcxxc',  1,  1,  NULL, '2024-08-13 02:41:26',  '2024-08-13 02:41:26'),
(10,  'Demo', 'Ahmad',  '258',  'Samoa',  'kamaldeep@globiztechnology.com', '7888769938', 'Teting', 'ddasdas',  1,  1,  NULL, '2024-08-22 04:54:50',  '2024-08-22 04:54:50'),
(11,  'Demo', 'Kharwar',  '258',  'Samoa',  'kamaldeep@globiztechnology.com', '7888769938', 'dsd',  'dsd',  1,  1,  NULL, '2024-08-22 04:55:41',  '2024-08-22 04:55:41'),
(12,  'Demo', 'Ahmad',  '258',  'Samoa',  'kamaldeep@globiztechnology.com', '7888769938', 'dsdsd',  'asd',  1,  1,  NULL, '2024-08-22 04:58:57',  '2024-08-22 04:58:57'),
(13,  'Demo', 'sdas', '258',  'Samoa',  'kamaldeep@globiztechnology.com', '7888769938', 'dsd',  'dasdas', 1,  1,  NULL, '2024-08-22 05:02:55',  '2024-08-22 05:02:55');

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `long_name` varchar(80) DEFAULT NULL,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(50) DEFAULT NULL,
  `currency_name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `countries` (`id`, `name`, `long_name`, `iso2`, `iso3`, `numcode`, `un_member`, `calling_code`, `cctld`, `currency_code`, `currency_symbol`, `currency_name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan',  'Islamic Republic of Afghanistan',  'AF', 'AFG',  '004',  'yes',  '93', '.af',  'AFN',  NULL, 'Afghani',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(2, 'Albania',  'Republic of Albania',  'AL', 'ALB',  '008',  'yes',  '355',  '.al',  'ALL',  'Lek',  'Lek',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(3, 'Algeria',  'People\'s Democratic Republic of Algeria', 'DZ', 'DZA',  '012',  'yes',  '213',  '.dz',  'DZD',  NULL, 'Algerian Dinar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(4, 'American Samoa', 'American Samoa', 'AS', 'ASM',  '016',  'no', '1+684',  '.as',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(5, 'Andorra',  'Principality of Andorra',  'AD', 'AND',  '020',  'yes',  '376',  '.ad',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(6, 'Angola', 'Republic of Angola', 'AO', 'AGO',  '024',  'yes',  '244',  '.ao',  'AOA',  NULL, 'Kwanza', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(7, 'Anguilla', 'Anguilla', 'AI', 'AIA',  '660',  'no', '1+264',  '.ai',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(8, 'Antarctica', 'Antarctica', 'AQ', 'ATA',  '010',  'no', '672',  '.aq',  NULL, NULL, NULL, 0,  NULL, '2022-04-25 17:26:59',  '2023-08-08 05:39:53'),
(9, 'Antigua And Barbuda',  'Antigua and Barbuda',  'AG', 'ATG',  '028',  'yes',  '1+268',  '.ag',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(10,  'Argentina',  'Argentine Republic', 'AR', 'ARG',  '032',  'yes',  '54', '.ar',  'ARS',  '$',  'Argentine Peso', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(11,  'Armenia',  'Republic of Armenia',  'AM', 'ARM',  '051',  'yes',  '374',  '.am',  'AMD',  NULL, 'Armenian Dram',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(12,  'Aruba',  'Aruba',  'AW', 'ABW',  '533',  'no', '297',  '.aw',  'AWG',  'ƒ',  'Aruban Florin',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(13,  'Australia',  'Commonwealth of Australia',  'AU', 'AUS',  '036',  'yes',  '61', '.au',  'AUD',  '$',  'Australian Dollar',  1,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(14,  'Austria',  'Republic of Austria',  'AT', 'AUT',  '040',  'yes',  '43', '.at',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(15,  'Azerbaijan', 'Republic of Azerbaijan', 'AZ', 'AZE',  '031',  'yes',  '994',  '.az',  'AZN',  NULL, 'Azerbaijanian Manat',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(16,  'Bahamas The',  'Commonwealth of The Bahamas',  'BS', 'BHS',  '044',  'yes',  '1+242',  '.bs',  'BSD',  '$',  'Bahamian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(17,  'Bahrain',  'Kingdom of Bahrain', 'BH', 'BHR',  '048',  'yes',  '973',  '.bh',  'BHD',  NULL, 'Bahraini Dinar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(18,  'Bangladesh', 'People\'s Republic of Bangladesh', 'BD', 'BGD',  '050',  'yes',  '880',  '.bd',  'BDT',  NULL, 'Taka', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(19,  'Barbados', 'Barbados', 'BB', 'BRB',  '052',  'yes',  '1+246',  '.bb',  'BBD',  '$',  'Barbados Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(20,  'Belarus',  'Republic of Belarus',  'BY', 'BLR',  '112',  'yes',  '375',  '.by',  'BYR',  'p.', 'Belarussian Ruble',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(21,  'Belgium',  'Kingdom of Belgium', 'BE', 'BEL',  '056',  'yes',  '32', '.be',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(22,  'Belize', 'Belize', 'BZ', 'BLZ',  '084',  'yes',  '501',  '.bz',  'BZD',  'BZ$',  'Belize Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(23,  'Benin',  'Republic of Benin',  'BJ', 'BEN',  '204',  'yes',  '229',  '.bj',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(24,  'Bermuda',  'Bermuda Islands',  'BM', 'BMU',  '060',  'no', '1+441',  '.bm',  'BMD',  '$',  'Bermudian Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(25,  'Bhutan', 'Kingdom of Bhutan',  'BT', 'BTN',  '064',  'yes',  '975',  '.bt',  'INR',  'Rp', 'Indian Rupee', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(26,  'Bolivia',  'Plurinational State of Bolivia', 'BO', 'BOL',  '068',  'yes',  '591',  '.bo',  'BOB',  '$b', 'Boliviano',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(27,  'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BA', 'BIH',  '070',  'yes',  '387',  '.ba',  'BAM',  'KM', 'Convertible Mark', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(28,  'Botswana', 'Republic of Botswana', 'BW', 'BWA',  '072',  'yes',  '267',  '.bw',  'BWP',  'P',  'Pula', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(29,  'Bouvet Island',  'Bouvet Island',  'BV', 'BVT',  '074',  'no', 'NONE', '.bv',  'NOK',  'kr', 'Norwegian Krone',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(30,  'Brazil', 'Federative Republic of Brazil',  'BR', 'BRA',  '076',  'yes',  '55', '.br',  'BRL',  'R$', 'Brazilian Real', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(31,  'British Indian Ocean Territory', 'British Indian Ocean Territory', 'IO', 'IOT',  '086',  'no', '246',  '.io',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(32,  'Brunei', 'Brunei Darussalam',  'BN', 'BRN',  '096',  'yes',  '673',  '.bn',  'BND',  '$',  'Brunei Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(33,  'Bulgaria', 'Republic of Bulgaria', 'BG', 'BGR',  '100',  'yes',  '359',  '.bg',  'BGN',  NULL, 'Bulgarian Lev',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(34,  'Burkina Faso', 'Burkina Faso', 'BF', 'BFA',  '854',  'yes',  '226',  '.bf',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(35,  'Burundi',  'Republic of Burundi',  'BI', 'BDI',  '108',  'yes',  '257',  '.bi',  'BIF',  NULL, 'Burundi Franc',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(36,  'Cambodia', 'Kingdom of Cambodia',  'KH', 'KHM',  '116',  'yes',  '855',  '.kh',  'KHR',  '៛',  'Riel', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(37,  'Cameroon', 'Republic of Cameroon', 'CM', 'CMR',  '120',  'yes',  '237',  '.cm',  'XAF',  NULL, 'CFA Franc BEAC', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(38,  'Canada', 'Canada', 'CA', 'CAN',  '124',  'yes',  '1',  '.ca',  'CAD',  '$',  'Canadian Dollar',  1,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(39,  'Cape Verde', 'Republic of Cape Verde', 'CV', 'CPV',  '132',  'yes',  '238',  '.cv',  'CVE',  NULL, 'Cabo Verde Escudo',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(40,  'Cayman Islands', 'The Cayman Islands', 'KY', 'CYM',  '136',  'no', '1+345',  '.ky',  'KYD',  '$',  'Cayman Islands Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(41,  'Central African Republic', 'Central African Republic', 'CF', 'CAF',  '140',  'yes',  '236',  '.cf',  'XAF',  NULL, 'CFA Franc BEAC', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(42,  'Chad', 'Republic of Chad', 'TD', 'TCD',  '148',  'yes',  '235',  '.td',  'XAF',  NULL, 'CFA Franc BEAC', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(43,  'Chile',  'Republic of Chile',  'CL', 'CHL',  '152',  'yes',  '56', '.cl',  'CLP',  '$',  'Chilean Peso', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(44,  'China',  'People\'s Republic of China',  'CN', 'CHN',  '156',  'yes',  '86', '.cn',  'CNY',  '¥',  'Yuan Renminbi',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(45,  'Christmas Island', 'Christmas Island', 'CX', 'CXR',  '162',  'no', '61', '.cx',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(46,  'Cocos (Keeling) Islands',  'Cocos (Keeling) Islands',  'CC', 'CCK',  '166',  'no', '61', '.cc',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(47,  'Colombia', 'Republic of Colombia', 'CO', 'COL',  '170',  'yes',  '57', '.co',  'COP',  '$',  'Colombian Peso', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(48,  'Comoros',  'Union of the Comoros', 'KM', 'COM',  '174',  'yes',  '269',  '.km',  'KMF',  NULL, 'Comoro Franc', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(49,  'Republic Of The Congo',  'Republic of the Congo',  'CG', 'COG',  '178',  'yes',  '242',  '.cg',  'XAF',  NULL, 'CFA Franc BEAC', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(50,  'Democratic Republic Of The Congo', 'Democratic Republic of the Congo', 'CD', 'COD',  '180',  'yes',  '243',  '.cd',  NULL, NULL, NULL, 0,  NULL, '2022-04-25 17:26:59',  '2023-08-08 05:39:53'),
(51,  'Cook Islands', 'Cook Islands', 'CK', 'COK',  '184',  'some', '682',  '.ck',  'NZD',  '$',  'New Zealand Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(52,  'Costa Rica', 'Republic of Costa Rica', 'CR', 'CRI',  '188',  'yes',  '506',  '.cr',  'CRC',  '₡',  'Costa Rican Colon',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(53,  'Cote D\'Ivoire (Ivory Coast)', 'Republic of C&ocirc;te D\'Ivoire (Ivory Coast)', 'CI', 'CIV',  '384',  'yes',  '225',  '.ci',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(54,  'Croatia (Hrvatska)', 'Republic of Croatia',  'HR', 'HRV',  '191',  'yes',  '385',  '.hr',  'HRK',  'kn', 'Croatian Kuna',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(55,  'Cuba', 'Republic of Cuba', 'CU', 'CUB',  '192',  'yes',  '53', '.cu',  'CUP',  '₱',  'Cuban Peso', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(56,  'Cyprus', 'Republic of Cyprus', 'CY', 'CYP',  '196',  'yes',  '357',  '.cy',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(57,  'Czech Republic', 'Czech Republic', 'CZ', 'CZE',  '203',  'yes',  '420',  '.cz',  'CZK',  'Kč', 'Czech Koruna', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(59,  'Djibouti', 'Republic of Djibouti', 'DJ', 'DJI',  '262',  'yes',  '253',  '.dj',  'DJF',  NULL, 'Djibouti Franc', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(60,  'Dominica', 'Commonwealth of Dominica', 'DM', 'DMA',  '212',  'yes',  '1+767',  '.dm',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(61,  'Dominican Republic', 'Dominican Republic', 'DO', 'DOM',  '214',  'yes',  '1+809, 8', '.do',  'DOP',  'RD$',  'Dominican Peso', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(62,  'East Timor', '', 'TP', NULL, NULL, NULL, '670',  NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(63,  'Ecuador',  'Republic of Ecuador',  'EC', 'ECU',  '218',  'yes',  '593',  '.ec',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(64,  'Egypt',  'Arab Republic of Egypt', 'EG', 'EGY',  '818',  'yes',  '20', '.eg',  'EGP',  '£',  'Egyptian Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(65,  'El Salvador',  'Republic of El Salvador',  'SV', 'SLV',  '222',  'yes',  '503',  '.sv',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(66,  'Equatorial Guinea',  'Republic of Equatorial Guinea',  'GQ', 'GNQ',  '226',  'yes',  '240',  '.gq',  'XAF',  NULL, 'CFA Franc BEAC', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(67,  'Eritrea',  'State of Eritrea', 'ER', 'ERI',  '232',  'yes',  '291',  '.er',  'ERN',  NULL, 'Nakfa',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(68,  'Estonia',  'Republic of Estonia',  'EE', 'EST',  '233',  'yes',  '372',  '.ee',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(69,  'Ethiopia', 'Federal Democratic Republic of Ethiopia',  'ET', 'ETH',  '231',  'yes',  '251',  '.et',  'ETB',  NULL, 'Ethiopian Birr', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(70,  'External Territories of Australia',  '', 'XA', NULL, NULL, NULL, '61', NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(71,  'Falkland Islands', 'The Falkland Islands (Malvinas)',  'FK', 'FLK',  '238',  'no', '500',  '.fk',  'FKP',  '£',  'Falkland Islands Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(72,  'Faroe Islands',  'The Faroe Islands',  'FO', 'FRO',  '234',  'no', '298',  '.fo',  'DKK',  'kr', 'Danish Krone', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(73,  'Fiji Islands', 'Republic of Fiji', 'FJ', 'FJI',  '242',  'yes',  '679',  '.fj',  'FJD',  '$',  'Fiji Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(74,  'Finland',  'Republic of Finland',  'FI', 'FIN',  '246',  'yes',  '358',  '.fi',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(75,  'France', 'French Republic',  'FR', 'FRA',  '250',  'yes',  '33', '.fr',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(76,  'French Guiana',  'French Guiana',  'GF', 'GUF',  '254',  'no', '594',  '.gf',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(77,  'French Polynesia', 'French Polynesia', 'PF', 'PYF',  '258',  'no', '689',  '.pf',  'XPF',  NULL, 'CFP Franc',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(78,  'French Southern Territories',  'French Southern Territories',  'TF', 'ATF',  '260',  'no', NULL, '.tf',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(79,  'Gabon',  'Gabonese Republic',  'GA', 'GAB',  '266',  'yes',  '241',  '.ga',  'XAF',  NULL, 'CFA Franc BEAC', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(80,  'Gambia The', 'Republic of The Gambia', 'GM', 'GMB',  '270',  'yes',  '220',  '.gm',  'GMD',  NULL, 'Dalasi', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(81,  'Georgia',  'Georgia',  'GE', 'GEO',  '268',  'yes',  '995',  '.ge',  'GEL',  NULL, 'Lari', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(82,  'Germany',  'Federal Republic of Germany',  'DE', 'DEU',  '276',  'yes',  '49', '.de',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(83,  'Ghana',  'Republic of Ghana',  'GH', 'GHA',  '288',  'yes',  '233',  '.gh',  'GHS',  NULL, 'Ghana Cedi', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(84,  'Gibraltar',  'Gibraltar',  'GI', 'GIB',  '292',  'no', '350',  '.gi',  'GIP',  '£',  'Gibraltar Pound',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(85,  'Greece', 'Hellenic Republic',  'GR', 'GRC',  '300',  'yes',  '30', '.gr',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(86,  'Greenland',  'Greenland',  'GL', 'GRL',  '304',  'no', '299',  '.gl',  'DKK',  'kr', 'Danish Krone', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(87,  'Grenada',  'Grenada',  'GD', 'GRD',  '308',  'yes',  '1+473',  '.gd',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(88,  'Guadeloupe', 'Guadeloupe', 'GP', 'GLP',  '312',  'no', '590',  '.gp',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(89,  'Guam', 'Guam', 'GU', 'GUM',  '316',  'no', '1+671',  '.gu',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(90,  'Guatemala',  'Republic of Guatemala',  'GT', 'GTM',  '320',  'yes',  '502',  '.gt',  'GTQ',  'Q',  'Quetzal',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(91,  'Guernsey and Alderney',  '', 'XU', NULL, NULL, NULL, '44', NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(92,  'Guinea', 'Republic of Guinea', 'GN', 'GIN',  '324',  'yes',  '224',  '.gn',  'GNF',  NULL, 'Guinea Franc', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(93,  'Guinea-Bissau',  'Republic of Guinea-Bissau',  'GW', 'GNB',  '624',  'yes',  '245',  '.gw',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(94,  'Guyana', 'Co-operative Republic of Guyana',  'GY', 'GUY',  '328',  'yes',  '592',  '.gy',  'GYD',  '$',  'Guyana Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(95,  'Haiti',  'Republic of Haiti',  'HT', 'HTI',  '332',  'yes',  '509',  '.ht',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(96,  'Heard and McDonald Islands', 'Heard Island and McDonald Islands',  'HM', 'HMD',  '334',  'no', 'NONE', '.hm',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(97,  'Honduras', 'Republic of Honduras', 'HN', 'HND',  '340',  'yes',  '504',  '.hn',  'HNL',  'L',  'Lempira',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(98,  'Hong Kong S.A.R.', 'Hong Kong',  'HK', 'HKG',  '344',  'no', '852',  '.hk',  'HKD',  '$',  'Hong Kong Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(99,  'Hungary',  'Hungary',  'HU', 'HUN',  '348',  'yes',  '36', '.hu',  'HUF',  'Ft', 'Forint', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(100, 'Iceland',  'Republic of Iceland',  'IS', 'ISL',  '352',  'yes',  '354',  '.is',  'ISK',  'kr', 'Iceland Krona',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(101, 'India',  'Republic of India',  'IN', 'IND',  '356',  'yes',  '91', '.in',  'INR',  'Rp', 'Indian Rupee', 1,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(102, 'Indonesia',  'Republic of Indonesia',  'ID', 'IDN',  '360',  'yes',  '62', '.id',  'IDR',  'Rp', 'Rupiah', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(103, 'Iran', 'Islamic Republic of Iran', 'IR', 'IRN',  '364',  'yes',  '98', '.ir',  'IRR',  '﷼',  'Iranian Rial', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(104, 'Iraq', 'Republic of Iraq', 'IQ', 'IRQ',  '368',  'yes',  '964',  '.iq',  'IQD',  NULL, 'Iraqi Dinar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(105, 'Ireland',  'Ireland',  'IE', 'IRL',  '372',  'yes',  '353',  '.ie',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(106, 'Israel', 'State of Israel',  'IL', 'ISR',  '376',  'yes',  '972',  '.il',  'ILS',  '₪',  'New Israeli Sheqel', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(107, 'Italy',  'Italian Republic', 'IT', 'ITA',  '380',  'yes',  '39', '.jm',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(108, 'Jamaica',  'Jamaica',  'JM', 'JAM',  '388',  'yes',  '1+876',  '.jm',  'JMD',  'J$', 'Jamaican Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(109, 'Japan',  'Japan',  'JP', 'JPN',  '392',  'yes',  '81', '.jp',  'JPY',  '¥',  'Yen',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(110, 'Jersey', '', 'XJ', NULL, NULL, NULL, '44', NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(111, 'Jordan', 'Hashemite Kingdom of Jordan',  'JO', 'JOR',  '400',  'yes',  '962',  '.jo',  'JOD',  NULL, 'Jordanian Dinar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(112, 'Kazakhstan', 'Republic of Kazakhstan', 'KZ', 'KAZ',  '398',  'yes',  '7',  '.kz',  'KZT',  'лв', 'Tenge',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(113, 'Kenya',  'Republic of Kenya',  'KE', 'KEN',  '404',  'yes',  '254',  '.ke',  'KES',  NULL, 'Kenyan Shilling',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(114, 'Kiribati', 'Republic of Kiribati', 'KI', 'KIR',  '296',  'yes',  '686',  '.ki',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(115, 'Korea North',  'Democratic People\'s Republic of Korea', 'KP', 'PRK',  '408',  'yes',  '850',  '.kp',  'KPW',  '₩',  'North Korean Won', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(116, 'Korea South',  'Republic of Korea',  'KR', 'KOR',  '410',  'yes',  '82', '.kr',  'KRW',  '₩',  'Won',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(117, 'Kuwait', 'State of Kuwait',  'KW', 'KWT',  '414',  'yes',  '965',  '.kw',  'KWD',  NULL, 'Kuwaiti Dinar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(118, 'Kyrgyzstan', 'Kyrgyz Republic',  'KG', 'KGZ',  '417',  'yes',  '996',  '.kg',  'KGS',  'лв', 'Som',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(119, 'Laos', 'Lao People\'s Democratic Republic',  'LA', 'LAO',  '418',  'yes',  '856',  '.la',  'LAK',  '₭',  'Kip',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(120, 'Latvia', 'Republic of Latvia', 'LV', 'LVA',  '428',  'yes',  '371',  '.lv',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(121, 'Lebanon',  'Republic of Lebanon',  'LB', 'LBN',  '422',  'yes',  '961',  '.lb',  'LBP',  '£',  'Lebanese Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(122, 'Lesotho',  'Kingdom of Lesotho', 'LS', 'LSO',  '426',  'yes',  '266',  '.ls',  'ZAR',  'R',  'Rand', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(123, 'Liberia',  'Republic of Liberia',  'LR', 'LBR',  '430',  'yes',  '231',  '.lr',  'LRD',  '$',  'Liberian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(124, 'Libya',  'Libya',  'LY', 'LBY',  '434',  'yes',  '218',  '.ly',  'LYD',  NULL, 'Libyan Dinar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(125, 'Liechtenstein',  'Principality of Liechtenstein',  'LI', 'LIE',  '438',  'yes',  '423',  '.li',  'CHF',  'CHF',  'Swiss Franc',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(126, 'Lithuania',  'Republic of Lithuania',  'LT', 'LTU',  '440',  'yes',  '370',  '.lt',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(127, 'Luxembourg', 'Grand Duchy of Luxembourg',  'LU', 'LUX',  '442',  'yes',  '352',  '.lu',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(128, 'Macau S.A.R.', 'The Macao Special Administrative Region',  'MO', 'MAC',  '446',  'no', '853',  '.mo',  'MOP',  NULL, 'Pataca', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(129, 'Macedonia',  'The Former Yugoslav Republic of Macedonia',  'MK', 'MKD',  '807',  'yes',  '389',  '.mk',  'MKD',  'ден',  'Denar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(130, 'Madagascar', 'Republic of Madagascar', 'MG', 'MDG',  '450',  'yes',  '261',  '.mg',  'MGA',  NULL, 'Malagasy Ariary',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(131, 'Malawi', 'Republic of Malawi', 'MW', 'MWI',  '454',  'yes',  '265',  '.mw',  'MWK',  NULL, 'Kwacha', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(132, 'Malaysia', 'Malaysia', 'MY', 'MYS',  '458',  'yes',  '60', '.my',  'MYR',  'RM', 'Malaysian Ringgit',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(133, 'Maldives', 'Republic of Maldives', 'MV', 'MDV',  '462',  'yes',  '960',  '.mv',  'MVR',  NULL, 'Rufiyaa',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(134, 'Mali', 'Republic of Mali', 'ML', 'MLI',  '466',  'yes',  '223',  '.ml',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(135, 'Malta',  'Republic of Malta',  'MT', 'MLT',  '470',  'yes',  '356',  '.mt',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(136, 'Man (Isle of)',  '', 'XM', NULL, NULL, NULL, '44', NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(137, 'Marshall Islands', 'Republic of the Marshall Islands', 'MH', 'MHL',  '584',  'yes',  '692',  '.mh',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(138, 'Martinique', 'Martinique', 'MQ', 'MTQ',  '474',  'no', '596',  '.mq',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(139, 'Mauritania', 'Islamic Republic of Mauritania', 'MR', 'MRT',  '478',  'yes',  '222',  '.mr',  'MRO',  NULL, 'Ouguiya',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:22:22'),
(140, 'Mauritius',  'Republic of Mauritius',  'MU', 'MUS',  '480',  'yes',  '230',  '.mu',  'MUR',  '₨',  'Mauritius Rupee',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(141, 'Mayotte',  'Mayotte',  'YT', 'MYT',  '175',  'no', '262',  '.yt',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(142, 'Mexico', 'United Mexican States',  'MX', 'MEX',  '484',  'yes',  '52', '.mx',  'MXN',  NULL, 'Mexican Peso', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(143, 'Micronesia', 'Federated States of Micronesia', 'FM', 'FSM',  '583',  'yes',  '691',  '.fm',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(144, 'Moldova',  'Republic of Moldova',  'MD', 'MDA',  '498',  'yes',  '373',  '.md',  'MDL',  NULL, 'Moldovan Leu', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(145, 'Monaco', 'Principality of Monaco', 'MC', 'MCO',  '492',  'yes',  '377',  '.mc',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(146, 'Mongolia', 'Mongolia', 'MN', 'MNG',  '496',  'yes',  '976',  '.mn',  'MNT',  '₮',  'Tugrik', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(147, 'Montserrat', 'Montserrat', 'MS', 'MSR',  '500',  'no', '1+664',  '.ms',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(148, 'Morocco',  'Kingdom of Morocco', 'MA', 'MAR',  '504',  'yes',  '212',  '.ma',  'MAD',  NULL, 'Moroccan Dirham',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(149, 'Mozambique', 'Republic of Mozambique', 'MZ', 'MOZ',  '508',  'yes',  '258',  '.mz',  'MZN',  NULL, 'Mozambique Metical', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(150, 'Myanmar',  'Republic of the Union of Myanmar', 'MM', 'MMR',  '104',  'yes',  '95', '.mm',  'MMK',  NULL, 'Kyat', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(151, 'Namibia',  'Republic of Namibia',  'NA', 'NAM',  '516',  'yes',  '264',  '.na',  'ZAR',  'R',  'Rand', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(152, 'Nauru',  'Republic of Nauru',  'NR', 'NRU',  '520',  'yes',  '674',  '.nr',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(153, 'Nepal',  'Federal Democratic Republic of Nepal', 'NP', 'NPL',  '524',  'yes',  '977',  '.np',  'NPR',  '₨',  'Nepalese Rupee', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(154, 'Netherlands Antilles', '', 'AN', NULL, NULL, NULL, '599',  NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(155, 'Netherlands The',  'Kingdom of the Netherlands', 'NL', 'NLD',  '528',  'yes',  '31', '.nl',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(156, 'New Caledonia',  'New Caledonia',  'NC', 'NCL',  '540',  'no', '687',  '.nc',  'XPF',  NULL, 'CFP Franc',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(157, 'New Zealand',  'New Zealand',  'NZ', 'NZL',  '554',  'yes',  '64', '.nz',  'NZD',  '$',  'New Zealand Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(158, 'Nicaragua',  'Republic of Nicaragua',  'NI', 'NIC',  '558',  'yes',  '505',  '.ni',  'NIO',  'C$', 'Cordoba Oro',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(159, 'Niger',  'Republic of Niger',  'NE', 'NER',  '562',  'yes',  '227',  '.ne',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(160, 'Nigeria',  'Federal Republic of Nigeria',  'NG', 'NGA',  '566',  'yes',  '234',  '.ng',  'NGN',  NULL, 'Naira',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(161, 'Niue', 'Niue', 'NU', 'NIU',  '570',  'some', '683',  '.nu',  'NZD',  '$',  'New Zealand Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(162, 'Norfolk Island', 'Norfolk Island', 'NF', 'NFK',  '574',  'no', '672',  '.nf',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(163, 'Northern Mariana Islands', 'Northern Mariana Islands', 'MP', 'MNP',  '580',  'no', '1+670',  '.mp',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(164, 'Norway', 'Kingdom of Norway',  'NO', 'NOR',  '578',  'yes',  '47', '.no',  'NOK',  'kr', 'Norwegian Krone',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(165, 'Oman', 'Sultanate of Oman',  'OM', 'OMN',  '512',  'yes',  '968',  '.om',  'OMR',  '﷼',  'Rial Omani', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(166, 'Pakistan', 'Islamic Republic of Pakistan', 'PK', 'PAK',  '586',  'yes',  '92', '.pk',  'PKR',  '₨',  'Pakistan Rupee', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(167, 'Palau',  'Republic of Palau',  'PW', 'PLW',  '585',  'yes',  '680',  '.pw',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(168, 'Palestinian Territory Occupied', 'State of Palestine (or Occupied Palestinian Territory)', 'PS', 'PSE',  '275',  'some', '970',  '.ps',  NULL, NULL, NULL, 0,  NULL, '2022-04-25 17:26:59',  '2023-08-08 05:39:53'),
(169, 'Panama', 'Republic of Panama', 'PA', 'PAN',  '591',  'yes',  '507',  '.pa',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(170, 'Papua new Guinea', 'Independent State of Papua New Guinea',  'PG', 'PNG',  '598',  'yes',  '675',  '.pg',  'PGK',  NULL, 'Kina', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(171, 'Paraguay', 'Republic of Paraguay', 'PY', 'PRY',  '600',  'yes',  '595',  '.py',  'PYG',  'Gs', 'Guarani',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(172, 'Peru', 'Republic of Peru', 'PE', 'PER',  '604',  'yes',  '51', '.pe',  'PEN',  NULL, 'Nuevo Sol',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(173, 'Philippines',  'Republic of the Philippines',  'PH', 'PHL',  '608',  'yes',  '63', '.ph',  'PHP',  'Php',  'Philippine Peso',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(174, 'Pitcairn Island',  'Pitcairn', 'PN', 'PCN',  '612',  'no', 'NONE', '.pn',  'NZD',  '$',  'New Zealand Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(175, 'Poland', 'Republic of Poland', 'PL', 'POL',  '616',  'yes',  '48', '.pl',  'PLN',  NULL, 'Zloty',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(176, 'Portugal', 'Portuguese Republic',  'PT', 'PRT',  '620',  'yes',  '351',  '.pt',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(177, 'Puerto Rico',  'Commonwealth of Puerto Rico',  'PR', 'PRI',  '630',  'no', '1+939',  '.pr',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(178, 'Qatar',  'State of Qatar', 'QA', 'QAT',  '634',  'yes',  '974',  '.qa',  'QAR',  '﷼',  'Qatari Rial',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(179, 'Reunion',  'R&eacute;union', 'RE', 'REU',  '638',  'no', '262',  '.re',  'EUR',  '€',  'Euro', 1,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(180, 'Romania',  'Romania',  'RO', 'ROU',  '642',  'yes',  '40', '.ro',  'RON',  NULL, 'New Romanian Leu', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(181, 'Russia', 'Russian Federation', 'RU', 'RUS',  '643',  'yes',  '7',  '.ru',  'RUB',  'руб',  'Russian Ruble',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(182, 'Rwanda', 'Republic of Rwanda', 'RW', 'RWA',  '646',  'yes',  '250',  '.rw',  'RWF',  NULL, 'Rwanda Franc', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(183, 'Saint Helena', 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN',  '654',  'no', '290',  '.sh',  'SHP',  '£',  'Saint Helena Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(184, 'Saint Kitts And Nevis',  'Federation of Saint Christopher and Nevis',  'KN', 'KNA',  '659',  'yes',  '1+869',  '.kn',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(185, 'Saint Lucia',  'Saint Lucia',  'LC', 'LCA',  '662',  'yes',  '1+758',  '.lc',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(186, 'Saint Pierre and Miquelon',  'Saint Pierre and Miquelon',  'PM', 'SPM',  '666',  'no', '508',  '.pm',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(187, 'Saint Vincent And The Grenadines', 'Saint Vincent and the Grenadines', 'VC', 'VCT',  '670',  'yes',  '1+784',  '.vc',  'XCD',  '$',  'East Caribbean Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(188, 'Samoa',  'Independent State of Samoa', 'WS', 'WSM',  '882',  'yes',  '685',  '.ws',  'WST',  NULL, 'Tala', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(189, 'San Marino', 'Republic of San Marino', 'SM', 'SMR',  '674',  'yes',  '378',  '.sm',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(190, 'Sao Tome and Principe',  'Democratic Republic of S&atilde;o Tom&eacute; and Pr&iacute;ncipe',  'ST', 'STP',  '678',  'yes',  '239',  '.st',  'STD',  NULL, 'Dobra',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:22:22'),
(191, 'Saudi Arabia', 'Kingdom of Saudi Arabia',  'SA', 'SAU',  '682',  'yes',  '966',  '.sa',  'SAR',  '﷼',  'Saudi Riyal',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(192, 'Senegal',  'Republic of Senegal',  'SN', 'SEN',  '686',  'yes',  '221',  '.sn',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(193, 'Serbia', 'Republic of Serbia', 'RS', 'SRB',  '688',  'yes',  '381',  '.rs',  'RSD',  'Дин.', 'Serbian Dinar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(194, 'Seychelles', 'Republic of Seychelles', 'SC', 'SYC',  '690',  'yes',  '248',  '.sc',  'SCR',  '₨',  'Seychelles Rupee', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(195, 'Sierra Leone', 'Republic of Sierra Leone', 'SL', 'SLE',  '694',  'yes',  '232',  '.sl',  'SLL',  NULL, 'Leone',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(196, 'Singapore',  'Republic of Singapore',  'SG', 'SGP',  '702',  'yes',  '65', '.sg',  'SGD',  '$',  'Singapore Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(197, 'Slovakia', 'Slovak Republic',  'SK', 'SVK',  '703',  'yes',  '421',  '.sk',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(198, 'Slovenia', 'Republic of Slovenia', 'SI', 'SVN',  '705',  'yes',  '386',  '.si',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(199, 'Smaller Territories of the UK',  '', 'XG', NULL, NULL, NULL, '44', NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(200, 'Solomon Islands',  'Solomon Islands',  'SB', 'SLB',  '090',  'yes',  '677',  '.sb',  'SBD',  '$',  'Solomon Islands Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(201, 'Somalia',  'Somali Republic',  'SO', 'SOM',  '706',  'yes',  '252',  '.so',  'SOS',  'S',  'Somali Shilling',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(202, 'South Africa', 'Republic of South Africa', 'ZA', 'ZAF',  '710',  'yes',  '27', '.za',  'ZAR',  'R',  'Rand', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(203, 'South Georgia',  'South Georgia and the South Sandwich Islands', 'GS', 'SGS',  '239',  'no', '500',  '.gs',  NULL, NULL, NULL, 0,  NULL, '2022-04-25 17:26:59',  '2023-08-08 05:39:53'),
(204, 'South Sudan',  'Republic of South Sudan',  'SS', 'SSD',  '728',  'yes',  '211',  '.ss',  'SSP',  NULL, 'South Sudanese Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(205, 'Spain',  'Kingdom of Spain', 'ES', 'ESP',  '724',  'yes',  '34', '.es',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(206, 'Sri Lanka',  'Democratic Socialist Republic of Sri Lanka', 'LK', 'LKA',  '144',  'yes',  '94', '.lk',  'LKR',  '₨',  'Sri Lanka Rupee',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(207, 'Sudan',  'Republic of the Sudan',  'SD', 'SDN',  '729',  'yes',  '249',  '.sd',  'SDG',  NULL, 'Sudanese Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(208, 'Suriname', 'Republic of Suriname', 'SR', 'SUR',  '740',  'yes',  '597',  '.sr',  'SRD',  '$',  'Surinam Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(209, 'Svalbard And Jan Mayen Islands', 'Svalbard and Jan Mayen', 'SJ', 'SJM',  '744',  'no', '47', '.sj',  'NOK',  'kr', 'Norwegian Krone',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(210, 'Swaziland',  'Kingdom of Swaziland', 'SZ', 'SWZ',  '748',  'yes',  '268',  '.sz',  'SZL',  NULL, 'Lilangeni',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(211, 'Sweden', 'Kingdom of Sweden',  'SE', 'SWE',  '752',  'yes',  '46', '.se',  'SEK',  'kr', 'Swedish Krona',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(212, 'Switzerland',  'Swiss Confederation',  'CH', 'CHE',  '756',  'yes',  '41', '.ch',  'CHF',  'CHF',  'Swiss Franc',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(213, 'Syria',  'Syrian Arab Republic', 'SY', 'SYR',  '760',  'yes',  '963',  '.sy',  'SYP',  '£',  'Syrian Pound', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(214, 'Taiwan', 'Republic of China (Taiwan)', 'TW', 'TWN',  '158',  'former', '886',  '.tw',  'TWD',  'NT$',  'New Taiwan Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(215, 'Tajikistan', 'Republic of Tajikistan', 'TJ', 'TJK',  '762',  'yes',  '992',  '.tj',  'TJS',  NULL, 'Somoni', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(216, 'Tanzania', 'United Republic of Tanzania',  'TZ', 'TZA',  '834',  'yes',  '255',  '.tz',  'TZS',  NULL, 'Tanzanian Shilling', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(217, 'Thailand', 'Kingdom of Thailand',  'TH', 'THA',  '764',  'yes',  '66', '.th',  'THB',  '฿',  'Baht', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(218, 'Togo', 'Togolese Republic',  'TG', 'TGO',  '768',  'yes',  '228',  '.tg',  'XOF',  NULL, 'CFA Franc BCEAO',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(219, 'Tokelau',  'Tokelau',  'TK', 'TKL',  '772',  'no', '690',  '.tk',  'NZD',  '$',  'New Zealand Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(220, 'Tonga',  'Kingdom of Tonga', 'TO', 'TON',  '776',  'yes',  '676',  '.to',  'TOP',  NULL, 'Pa’anga',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(221, 'Trinidad And Tobago',  'Republic of Trinidad and Tobago',  'TT', 'TTO',  '780',  'yes',  '1+868',  '.tt',  'TTD',  'TT$',  'Trinidad and Tobago Dollar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(222, 'Tunisia',  'Republic of Tunisia',  'TN', 'TUN',  '788',  'yes',  '216',  '.tn',  'TND',  NULL, 'Tunisian Dinar', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(223, 'Turkey', 'Republic of Turkey', 'TR', 'TUR',  '792',  'yes',  '90', '.tr',  'TRY',  'TL', 'Turkish Lira', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(224, 'Turkmenistan', 'Turkmenistan', 'TM', 'TKM',  '795',  'yes',  '993',  '.tm',  'TMT',  NULL, 'Turkmenistan New Manat', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(225, 'Turks And Caicos Islands', 'Turks and Caicos Islands', 'TC', 'TCA',  '796',  'no', '1+649',  '.tc',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(226, 'Tuvalu', 'Tuvalu', 'TV', 'TUV',  '798',  'yes',  '688',  '.tv',  'AUD',  '$',  'Australian Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(227, 'Uganda', 'Republic of Uganda', 'UG', 'UGA',  '800',  'yes',  '256',  '.ug',  'UGX',  NULL, 'Uganda Shilling',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(228, 'Ukraine',  'Ukraine',  'UA', 'UKR',  '804',  'yes',  '380',  '.ua',  'UAH',  '₴',  'Hryvnia',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(229, 'United Arab Emirates', 'United Arab Emirates', 'AE', 'ARE',  '784',  'yes',  '971',  '.ae',  'AED',  NULL, 'UAE Dirham', 1,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(230, 'United Kingdom', 'United Kingdom of Great Britain and Nothern Ireland',  'GB', 'GBR',  '826',  'yes',  '44', '.uk',  'GBP',  '£',  'Pound Sterling', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(231, 'United States',  'United States of America', 'US', 'USA',  '840',  'yes',  '1',  '.us',  'USD',  '$',  'US Dollar',  1,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(232, 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'UM', 'UMI',  '581',  'no', 'NONE', 'NONE', 'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(233, 'Uruguay',  'Eastern Republic of Uruguay',  'UY', 'URY',  '858',  'yes',  '598',  '.uy',  'UYU',  '$U', 'Peso Uruguayo',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(234, 'Uzbekistan', 'Republic of Uzbekistan', 'UZ', 'UZB',  '860',  'yes',  '998',  '.uz',  'UZS',  'лв', 'Uzbekistan Sum', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(235, 'Vanuatu',  'Republic of Vanuatu',  'VU', 'VUT',  '548',  'yes',  '678',  '.vu',  'VUV',  NULL, 'Vatu', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:22:22'),
(236, 'Vatican City State (Holy See)',  'State of the Vatican City',  'VA', 'VAT',  '336',  'no', '39', '.va',  'EUR',  '€',  'Euro', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(237, 'Venezuela',  'Bolivarian Republic of Venezuela', 'VE', 'VEN',  '862',  'yes',  '58', '.ve',  'VEF',  'Bs', 'Bolivar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(238, 'Vietnam',  'Socialist Republic of Vietnam',  'VN', 'VNM',  '704',  'yes',  '84', '.vn',  'VND',  '₫',  'Dong', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(239, 'Virgin Islands (British)', 'British Virgin Islands', 'VG', 'VGB',  '092',  'no', '1+284',  '.vg',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(240, 'Virgin Islands (US)',  'Virgin Islands of the United States',  'VI', 'VIR',  '850',  'no', '1+340',  '.vi',  'USD',  '$',  'US Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27'),
(241, 'Wallis And Futuna Islands',  'Wallis and Futuna',  'WF', 'WLF',  '876',  'no', '681',  '.wf',  'XPF',  NULL, 'CFP Franc',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(242, 'Western Sahara', 'Western Sahara', 'EH', 'ESH',  '732',  'no', '212',  '.eh',  'MAD',  NULL, 'Moroccan Dirham',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(243, 'Yemen',  'Republic of Yemen',  'YE', 'YEM',  '887',  'yes',  '967',  '.ye',  'YER',  '﷼',  'Yemeni Rial',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:26'),
(244, 'Yugoslavia', '', 'YU', NULL, NULL, NULL, '38', NULL, NULL, NULL, NULL, 0,  NULL, NULL, '2023-08-08 05:39:53'),
(245, 'Zambia', 'Republic of Zambia', 'ZM', 'ZMB',  '894',  'yes',  '260',  '.zm',  'ZMW',  NULL, 'Zambian Kwacha', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:40:23'),
(246, 'Zimbabwe', 'Republic of Zimbabwe', 'ZW', 'ZWE',  '716',  'yes',  '263',  '.zw',  'ZWL',  NULL, 'Zimbabwe Dollar',  0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:22:22'),
(247, 'Denmark',  'Kingdom of Denmark', 'DK', 'DNK',  '208',  'yes',  '45', '.dk',  'DKK',  'kr', 'Danish Krone', 0,  NULL, '2022-04-25 17:26:59',  '2024-05-16 07:45:27');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `faqs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `faqs` (`id`, `title`, `slug`, `description`, `status`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'What is an emission test?',  'what-is-an-emission-test-jML0M0',  '<ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><span lang=\"fr\" dir=\"ltr\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong></span></span><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" lang=\"fr\" dir=\"ltr\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></span></li><li style=\"text-align:justify;\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</span></span></li><li style=\"text-align:justify;\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</span></span></li></ul>',  1,  1,  NULL, '2024-08-12 04:24:54',  '2024-08-13 04:49:39'),
(2, 'Why do vehicles need emission tests?', 'why-do-vehicles-need-emission-tests-dMwgMy', '<ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><span lang=\"fr\" dir=\"ltr\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong></span></span><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" lang=\"fr\" dir=\"ltr\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></span></li><li style=\"text-align:justify;\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</span></span></li><li style=\"text-align:justify;\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</span></span></li></ul>',  1,  1,  NULL, '2024-08-12 04:25:24',  '2024-08-13 04:49:39'),
(3, 'How often do vehicles need emission tests?', 'how-often-do-vehicles-need-emission-tests-qZ0vMA', '<ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><span lang=\"fr\" dir=\"ltr\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong></span></span><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" lang=\"fr\" dir=\"ltr\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></span></li><li style=\"text-align:justify;\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</span></span></li><li style=\"text-align:justify;\"><strong style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Lorem Ipsum</strong><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book</span></span></li></ul>',  1,  1,  NULL, '2024-08-12 04:25:48',  '2024-08-13 04:49:39'),
(4, 'How We Can Make More Feel Positive', 'how-we-can-make-more-feel-positive-3ZgAMN',  '<p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1,  1,  '2024-11-26 05:59:32',  '2024-08-13 00:08:50',  '2024-11-26 00:29:32'),
(5, 'zxzx', 'zxzx-vRKya7',  '<p>zxzxzxzxzxzx</p>',  1,  1,  '2024-08-13 05:40:22',  '2024-08-13 00:09:58',  '2024-08-13 00:10:22'),
(6, 'Lorem Lpsd-2', 'lorem-lpsd-0RVJRV',  'lore-2', 1,  1,  NULL, '2024-11-26 00:08:52',  '2024-11-26 00:29:21');

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table',  1),
(4, '2024_07_23_104957_create_personal_access_tokens_table',  2);

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pages` (`id`, `title`, `slug`, `description`, `image`, `meta_title`, `meta_keywords`, `meta_description`, `status`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', 'privacy-policy', '<div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);float:left;font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 14.3906px 0px 28.7969px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:436.797px;word-spacing:0px;\"><p style=\"margin:0px 0px 15px;padding:0px;text-align:justify;\"><strong style=\"margin:0px;padding:0px;\">Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);float:right;font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 28.7969px 0px 14.3906px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:436.797px;word-spacing:0px;\"><h2 style=\"font-family:DauphinPlain;font-size:24px;font-weight:400;line-height:24px;margin:0px 0px 10px;padding:0px;text-align:left;\">Why do we use it?</h2><p style=\"margin:0px 0px 15px;padding:0px;text-align:justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><p><br>&nbsp;</p><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);float:left;font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 14.3906px 0px 28.7969px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:436.797px;word-spacing:0px;\"><h2 style=\"font-family:DauphinPlain;font-size:24px;font-weight:400;line-height:24px;margin:0px 0px 10px;padding:0px;text-align:left;\">Where does it come from?</h2><p style=\"margin:0px 0px 15px;padding:0px;text-align:justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p></div>',  '/uploads/pages/17235355025335-1704868452304-rectangle-217.png',  'privacy Policy', 'privacy Policy Keywords',  'privacy Policy Descrption',  1,  1,  NULL, '2024-08-13 00:39:20',  '2024-08-13 02:21:44'),
(2, 'CA Privacy  Noticy', 'privacy-noticy', '<h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/uploads/pages/17235354881339-1705390823799-group-116294.png', 'Privacy Policy', 'Privacy Policy Keywords',  'Privacy Policy Description', 1,  1,  NULL, '2024-08-13 00:41:34',  '2024-08-13 02:21:30'),
(3, 'Terms Of Use', 'terms-and-condition',  '<h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"font-family:\'Courier New\', Courier, monospace;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</span></p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</span></p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"font-family:\'Trebuchet MS\', Helvetica, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</span></p>', '/uploads/pages/17235354689897-s-17053089492844-toronto.png', 'Terms and condition',  'Terms and condition Keywords', 'Descrption', 1,  1,  NULL, '2024-08-13 00:42:59',  '2024-08-13 02:21:10'),
(4, 'Cookies Setting',  'cookies',  '<h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>1914 translation by H. Rackham</strong></h3><figure class=\"table\" style=\"width:100%;\"><table class=\"ck-table-resized\"><colgroup><col style=\"width:52.63%;\"><col style=\"width:47.37%;\"></colgroup><tbody><tr><td>Hello</td><td>Nanacy</td></tr></tbody></table></figure><pre style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:15px;margin-right:0px;margin-top:0px;orphans:2;padding:0px;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><code class=\"language-plaintext\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</code></pre><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;margin:15px 0px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>',  '/uploads/pages/17235354487822-aim.png',  'Cookies',  'Cookies Keywords', 'Cookies Description',  1,  1,  NULL, '2024-08-13 00:44:05',  '2024-08-13 02:20:51');

DROP TABLE IF EXISTS `pages_content`;
CREATE TABLE `pages_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `type` enum('home') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pages_content` (`id`, `page_id`, `type`, `name`, `data`) VALUES
(42,  NULL, 'home', 'meta', '{\"title\":\"Home Pages\",\"keywords\":\"Home Pages Keywords\",\"description\":\"Home Pages Description\"}'),
(45,  NULL, 'home', 'banner', '{\"title\":\"Your dream is our motivation\",\"description\":\"Play like a pro and get your degree. This is College SportsWelcome to the place to achieve your dream of studying and playing at an American university.\"}'),
(46,  NULL, 'home', 'banner_img', '/uploads/home/17326079268788-dogimage.jpg'),
(47,  NULL, 'home', 'sports', '{\"title\":\"pick your sport\",\"description\":\"Discover your passion by choosing your favorite sport and dive into a world of thrilling action, competitive spirit, and tailored experiences just for you.\"}'),
(48,  NULL, 'home', 'team', '{\"title\":\"loem-lipsum\"}'),
(49,  NULL, 'home', 'team_img', '[\"\\/uploads\\/home\\/17326073601542-pexels-danishsaifi0112-8294215.jpg\",\"\\/uploads\\/home\\/17326073544767-internation-mens-day.png\"]'),
(50,  NULL, 'home', 'journey',  '{\"title\":\"Lorem-journey\"}'),
(51,  NULL, 'home', 'journey_img',  '/uploads/home/17326078979656-pexels-biferyal-50615412-7649850.jpg'),
(52,  NULL, 'home', 'degree', '{\"title\":\"collage degree\",\"description\":\"Loremsassdf\"}'),
(53,  NULL, 'home', 'degree_img', '/uploads/home/17326079918573-image-removebg-preview-5-1.png'),
(54,  NULL, 'home', 'contact_us', '{\"title\":\"cxcxc\",\"sub_title\":\"xcx\"}');

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `permissions` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('XgxuVaJfg3YSYr7q8EbXyJURwV6REsjQD95V2sf0',  NULL, '::1',  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',  'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTGFxSlg5T2RMSEVPTjVkb29rZGQxeUtGaXFaZ29SZjVPY2xNYk9qbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3QvUG9vamEvbGFyYXZlbC9TcG9ydHMtQ29ubmVjdGlvbi9wdWJsaWMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUyOiJsb2dpbl9hZG1pbl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1732713228);

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL COMMENT 'resize_method = aspect_ratio, crop',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'company_name', 'Sports'),
(2, 'currency_symbol',  '₹'),
(3, 'currency_code',  'INR'),
(4, 'developby',  'javascript:;'),
(5, 'company_address',  '2nd Floor, Plot No. 13067, Lane No. 11, Vishwakarma Colony, Opp. Industrial Estate B, Ludhiana- 141003, Punjab( INDIA)'),
(6, 'favicon',  '/uploads/logos/17235271897105-shield-1-1-traced.png'),
(7, 'logo', '/uploads/logos/17235271774953-group-59.png'),
(8, 'admin_notification_email', 'irfan.ahmad@globiztechnology.com'),
(9, 'date_format',  'd-m-Y'),
(10,  'time_format',  'h:iA'),
(11,  'bulk_actions', '1'),
(12,  'email_method', 'smtp'),
(13,  'smtp_port',  '465'),
(14,  'smtp_username',  'globiznotification@gmail.com'),
(15,  'smtp_email', 'globiznotification@gmail.com'),
(16,  'smtp_password',  'mmcxulnkhaxcngqo'),
(17,  'smtp_host',  'smtp.gmail.com'),
(18,  'from_email', 'globiznotification@gmail.com'),
(19,  'sendgrid_email', 'globiznotification@gmail.com'),
(20,  'sendgrid_api_key', 'asdasdas'),
(21,  'recaptcha_key',  '6LeYGOMpAAAAADuBISpm0mVqq1E80YjqkDwN8S72'),
(22,  'recaptcha_secret', '6LeYGOMpAAAAAAIgVu2x_itHY1J0OshWcAOqxe8i'),
(23,  'admin_recaptcha',  '1'),
(24,  'admin_second_auth_factor', ''),
(25,  'smtp_encryption',  'ssl'),
(26,  'company_email',  'info@domain.com'),
(27,  'company_phone',  '9872128652'),
(28,  'company_website',  'https://globiztechnology.com/'),
(29,  'company_facebook', '#'),
(30,  'company_twitter',  '#'),
(31,  'company_instagram',  '#'),
(32,  'company_youtube',  '#'),
(33,  'company_linkedin', '#'),
(34,  'pagination_limit', '10'),
(35,  'stripe_key', ''),
(36,  'stripe_public_key',  ''),
(37,  'resize_method',  'crop'),
(38,  'pagination_method',  'scroll'),
(39,  'client_recaptcha', '0'),
(40,  'client_second_auth_factor',  '0'),
(41,  'client_multi_device_logins', '0'),
(42,  'timestamps', '0'),
(43,  'sub_category_enable',  '0'),
(44,  'session_web_expires_in_minutes', '100'),
(45,  'block_email_domains',  'mailinator.com'),
(46,  'session_app_expires_in_minutes', '1000'),
(47,  'geolocation_api',  'dd6760cf6ec1456d9f514ac801b3457e'),
(48,  'ips',  '210.89.63.90,38.137.56.154,59.183.158.85,127.0.0.1,::1,203.115.73.218'),
(49,  'default_address',  '{\"city\":{\"names\":{\"en\":\"Ludhiana (Aggar Nagar - B Block)\"},\"name\":\"Ludhiana (Aggar Nagar - B Block)\"},\"continent\":{\"code\":\"AS\",\"geoname_id\":6255147,\"names\":{\"de\":\"Asien\",\"en\":\"Asia\",\"es\":\"Asia\",\"fa\":\" \\u0622\\u0633\\u06cc\\u0627\",\"fr\":\"Asie\",\"ja\":\"\\u30a2\\u30b8\\u30a2\\u5927\\u9678\",\"ko\":\"\\uc544\\uc2dc\\uc544\",\"pt-BR\":\"\\u00c1sia\",\"ru\":\"\\u0410\\u0437\\u0438\\u044f\",\"zh-CN\":\"\\u4e9a\\u6d32\"},\"name\":\"Asia\"},\"country\":{\"geoname_id\":1269750,\"iso_code\":\"IN\",\"names\":{\"de\":\"Indien\",\"en\":\"India\",\"es\":\"India\",\"fa\":\"\\u0647\\u0646\\u062f\",\"fr\":\"Inde\",\"ja\":\"\\u30a4\\u30f3\\u30c9\",\"ko\":\"\\uc778\\ub3c4\",\"pt-BR\":\"\\u00cdndia\",\"ru\":\"\\u0418\\u043d\\u0434\\u0438\\u044f\",\"zh-CN\":\"\\u5370\\u5ea6\"},\"name\":\"India\",\"name_native\":\"\\u092d\\u093e\\u0930\\u0924\",\"phone_code\":\"91\",\"capital\":\"New Delhi\",\"currency\":\"INR\",\"flag\":\"\\ud83c\\uddee\\ud83c\\uddf3\",\"languages\":[{\"iso_code\":\"hi\",\"name\":\"Hindi\",\"name_native\":\"\\u0939\\u093f\\u0928\\u094d\\u0926\\u0940\"},{\"iso_code\":\"en\",\"name\":\"English\",\"name_native\":\"English\"}]},\"location\":{\"latitude\":21.9974,\"longitude\":79.0011},\"subdivisions\":[{\"names\":{\"en\":\"Punjab\"}}],\"state\":{\"name\":\"Punjab\"},\"datasource\":[{\"name\":\"IP to City Lite\",\"attribution\":\"<a href=\'https:\\/\\/db-ip.com\'>IP Geolocation by DB-IP<\\/a>\",\"license\":\"Creative Commons Attribution License\"}],\"ip\":\"38.137.56.154\"}'),
(50,  'production_hour',  '08:00:00'),
(51,  'wallet', '6239'),
(52,  'company_phonenumber',  '6352419870'),
(53,  'company_timing', 'From Monday to Friday: 12:00-17:00'),
(54,  'frontend_recaptcha', '1');

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `sliders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sliders` (`id`, `title`, `slug`, `url`, `description`, `image`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'sds',  'sds-jML0M0', '', 'dsdsd',  '[\"/uploads/sports/17326024564631-pexels-danishsaifi0112-8294215.jpg\",\"/uploads/sports/17326024495321-internation-mens-day.png\"]',  NULL, NULL, NULL, 0,  1,  NULL, '2024-11-26 00:57:40',  '2024-11-26 00:57:40');

DROP TABLE IF EXISTS `sports`;
CREATE TABLE `sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `sports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `sports` (`id`, `title`, `description`, `image`, `status`, `slug`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'xzx',  'zxzxzx', '[\"/uploads/sports/17326025527728-internation-mens-day.png\"]',  1,  NULL, 1,  NULL, '2024-11-26 00:59:44',  '2024-11-26 00:59:44'),
(2, 'lorem Lipsum -1',  'lorem Lipsum -2',  '[\"/uploads/sports/17326027581771-pexels-danishsaifi0112-8294215.jpg\",\"/uploads/sports/17326027522632-internation-mens-day.png\"]',  1,  'xzx-dMwgMy', 1,  NULL, '2024-11-26 01:00:03',  '2024-11-26 01:17:51');

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state_code` varchar(50) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `latitude` decimal(8,5) DEFAULT NULL,
  `longitude` decimal(8,5) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `name` (`name`),
  CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `states` (`id`, `name`, `state_code`, `country_id`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Punjab', NULL, 1,  NULL, NULL, 1,  '2023-11-08 13:45:06',  '2023-11-08 13:45:06');

DROP TABLE IF EXISTS `success`;
CREATE TABLE `success` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `success_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `success` (`id`, `title`, `sub_title`, `slug`, `description`, `image`, `meta_title`, `meta_keywords`, `meta_description`, `status`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'sdsd', 'sdsd', 'sdsd-jML0M0',  'sds',  '/uploads/success/17327126655926-about-img.png',  NULL, NULL, NULL, 1,  1,  NULL, '2024-11-26 01:51:59',  '2024-11-27 07:34:28');

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `testimonials_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `testimonials` (`id`, `title`, `slug`, `description`, `image`, `designation`, `location`, `rating`, `status`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'John Cemla', 'john-cemla-jML0M0',  'lorem Lipsum', NULL, 'tranie', NULL, 1,  1,  1,  NULL, '2024-08-12 04:49:09',  '2024-08-13 02:31:20'),
(2, 'Michelle Morrone', 'michelle-morrone-dMwgMy',  'Lorem ipsum dolor sit amet consectetur. Vel in in donec eget diam. Nullam arcu purus libero elementum pellentesque molestie enim viverra. Nec orci potenti pulvinar at faucibus diam ut varius. Quam urna facilisis senectus in massa enim nisl id ac.', NULL, 'Developer',  NULL, 1,  1,  1,  NULL, '2024-08-12 04:58:48',  '2024-08-13 02:31:20'),
(3, 'Malinaaa', 'malinaaa-qZ0vMA',  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', NULL, 'Doctor\'s',  NULL, 1,  1,  1,  NULL, '2024-08-13 00:11:14',  '2024-08-13 02:31:20'),
(4, 'Dr Parmod',  'dr-parmod-3ZgAMN', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum.',  NULL, 'Doctor', NULL, 1,  1,  1,  NULL, '2024-08-13 00:12:00',  '2024-08-13 02:31:20'),
(5, 'Lorem-23', 'lorem-vRKya7', NULL, '/uploads/athletes/17326040724190-pexels-danishsaifi0112-8294215.jpg',  NULL, NULL, NULL, 1,  1,  NULL, '2024-11-26 01:24:37',  '2024-11-26 01:24:45');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `email_otp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phonenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_set` tinyint(1) DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `zipcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` enum('customer') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'customer',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  KEY `city_id` (`city_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `email_verified_at`, `email_otp`, `phonenumber`, `phone_verified_at`, `otp`, `password`, `password_set`, `gender`, `address`, `dob`, `image`, `session_id`, `country_id`, `state_id`, `city_id`, `zipcode`, `user_type`, `token`, `remember_token`, `status`, `created_by`, `last_login`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'Irfan',  'Ahmad',  'irfan.ahmad.p1xl1w', 'irfan.ahmad1@globiztechnology.com',  '2023-12-16 06:52:34',  NULL, '9872128652', '2023-12-16 06:52:34',  NULL, '$2a$10$ILfuDWU0KePfm3VIMNptC.fXcC.oqdCUVZEt/wQNx8rKKuT.7O3BO', NULL, 'male', 'House no. 77, Street no. 4, ward no 7, Near Bhai Dya Ram Singh Hospital, Tibba Road, Ludhiana.', '1990-11-13', '/uploads/user/17218969678300-screenshot-10.png', 'hX3BRuI2Xadd29lYnyoEXVG58RhexEIO8k8E6iel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1,  1,  '2024-07-25 06:03:58',  NULL, '2023-12-16 06:52:34',  '2024-07-25 03:12:47'),
(58,  'Irfan',  'Ahmad',  'irfan.ahmad.gzegkm', 'irfan.ahmad@globiztechnology.com', '2024-08-06 02:34:03',  NULL, '7888769938-',  '2024-08-06 02:57:10',  NULL, '$2y$12$JgzvEQkVM7irkDCOoYH9OunCq0qVCqNW55VicZQaPk3GIJRlFknFa', 1,  NULL, NULL, NULL, '/uploads/user/17229417885766-three-statistics-that-will-make-you-rethink-your-professional-profile-picture-1024x1024.jpg', 'Xqxz8MwsECOqmKW2bipbAqFjZx64yv0talYPxQ9L', NULL, NULL, NULL, NULL, 'customer', '78qQ8XEcabx70Wyw9hNPoZfvt3oHKN6D1ilgaBQtVRaEOBAp8MaGu5KD5OSAj2Q2', NULL, 1,  NULL, '2024-08-06 02:57:51',  NULL, '2024-08-06 01:21:44',  '2024-08-06 05:37:43');

DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE `user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(200) NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device_type` enum('android','ios','web') DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `fcm_token` text DEFAULT NULL,
  `expire_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `user_tokens` (`id`, `user_id`, `token`, `device_id`, `device_type`, `device_name`, `fcm_token`, `expire_on`, `created_at`, `updated_at`) VALUES
(1, 4,  'VKgDqvR3ksDSbJFEiTKrkVUFnUXCV5Cm4SC8WzyR2Wuty6pFdforh7AEnPqCNG7W', NULL, 'web',  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',  NULL, '2024-07-25 07:26:37',  '2024-07-25 05:46:37',  '2024-07-25 05:46:37'),
(3, 58, '3leUFVns4whK8Nr3ON7G4EdYhCFL2bKQ5OaI4mWQWCdICS9D4fJR3QNIqMz3olzQ', NULL, 'web',  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36',  NULL, '2024-08-06 06:51:35',  '2024-08-06 05:11:35',  '2024-08-06 05:11:35');

-- 2024-11-27 13:14:00
