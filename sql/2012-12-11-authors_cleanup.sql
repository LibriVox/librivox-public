CREATE TABLE `librivox_catalog_new`.`authors_cleanup` (
`id` int( 11 ) NOT NULL AUTO_INCREMENT ,
`first_name` varchar( 55 ) DEFAULT NULL ,
`last_name` varchar( 55 ) NOT NULL ,
`psuedo_first_name` varchar( 55 ) DEFAULT NULL ,
`psuedo_last_name` varchar( 55 ) DEFAULT NULL ,
`author_url` text,
`other_url` text,
`dob` varchar( 10 ) DEFAULT NULL ,
`dod` varchar( 10 ) DEFAULT NULL ,
PRIMARY KEY ( `id` )
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';

INSERT INTO `librivox_catalog_new`.`authors_cleanup`
SELECT *
FROM `librivox_catalog_new`.`authors` ;

ALTER TABLE `authors_cleanup` ADD `confirmed` TINYINT( 1 ) NOT NULL DEFAULT '0',
ADD `linked_to` INT( 11 ) NOT NULL DEFAULT '0';

