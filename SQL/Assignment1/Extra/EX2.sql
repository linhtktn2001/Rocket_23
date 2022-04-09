-- Exercise 2: Data Types
DROP DATABASE if exists data_type;
CREATE DATABASE data_type;
USE data_type;
create table AL1(
	ID MEDIUMINT unsigned primary key auto_increment,
    `Name` char(30),
    `Code` char(5),
    ModifiedDate datetime
);
