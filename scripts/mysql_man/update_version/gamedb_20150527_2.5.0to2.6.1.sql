DROP TABLE IF EXISTS `receipt_bonus_01`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_01` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_02`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_02` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_03`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_03` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_04`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_04` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_05`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_05` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_06`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_06` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_07`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_07` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_08`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_08` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_09`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_09` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_10`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_10` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_11`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_11` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `receipt_bonus_12`;
CREATE TABLE IF NOT EXISTS `receipt_bonus_12` (
  `no` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gem` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1.2.0',
  PRIMARY KEY (`no`),
  KEY `profile_id` (`profile_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `cost_celebration`;
CREATE TABLE IF NOT EXISTS `cost_celebration` (
  `profile_id` bigint(20) NOT NULL,
  `last_cost_time` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00',
  `last_act_time` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00',
  `got_bonus_index` int(11) NOT NULL,
  `cost_gem` int(11) NOT NULL,
  `cost_free` int(11) NOT NULL,
  `cost_paid` int(11) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE  `new_year_2015` ADD  `last_act_time` TIMESTAMP NOT NULL DEFAULT  '2014-01-01 00:00:00' after `last_finish_riddle_time`;
