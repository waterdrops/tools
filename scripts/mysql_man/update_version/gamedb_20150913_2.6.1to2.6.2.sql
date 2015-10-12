CREATE TABLE IF NOT EXISTS `daily_achieve` (
  `profile_id` bigint(20) NOT NULL,
  `last_act_time` timestamp NOT NULL DEFAULT '2013-12-31 16:00:00',
  `achieve` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;