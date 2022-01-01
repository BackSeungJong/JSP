--CREATE TABLE `myshopping`.`users` (
--  `no` INT NOT NULL AUTO_INCREMENT,
--  `name` VARCHAR(10) NOT NULL,
--  `birthdate` VARCHAR(10) NOT NULL,
--  `gender` INT(1) NOT NULL,
--  `address` VARCHAR(100) NOT NULL,
--  `PN` VARCHAR(15) NOT NULL,
--  `id` VARCHAR(45) NOT NULL,
--  `pw` VARCHAR(45) NOT NULL,
--  `joinDate` DATETIME NOT NULL,
--  `height` INT NULL,
--  `weight` INT NULL,
--  PRIMARY KEY (`no`,`id`));

--INSERT INTO `myshopping`.`users` (`name`, `birthdate`, `gender`, `address`, `PN`, `id`, `pw`, `joinDate`) VALUES ('back', '19950523', '1', '서그내로', '01072774929', 'qwer', 'qwer', '2021-12-22 14:14:54.373');


select * from users;