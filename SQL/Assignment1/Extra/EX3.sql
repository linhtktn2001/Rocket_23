-- Exercise 2: Data Types(2)
DROP database if exists data_type2;
create database data_type2;
use data_type2;
create table AL2(
	ID mediumint unsigned primary key auto_increment,
    `Name` char(30),
    BirthDate date,
    Gender enum('0' , '1', 'NULL'),
    IsDeletedFlag bit not null
);