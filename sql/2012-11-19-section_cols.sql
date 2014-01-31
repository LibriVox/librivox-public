ALTER TABLE `sections` ADD `source` TEXT NULL AFTER `listen_url`;

ALTER TABLE `sections` ADD `author_id` INT( 11 ) NULL DEFAULT NULL AFTER `source` ;

ALTER TABLE `sections` ADD `language_id` INT( 11 ) NULL AFTER `author_id`;  