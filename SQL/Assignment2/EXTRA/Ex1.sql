DROP DATABASE IF EXISTS `Fresher`;
CREATE DATABASE `Fresher`;
USE `Fresher`;

-- Tạo bảng Trainee
CREATE TABLE IF NOT EXISTS `Trainee` (
	TraineeID			MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Full_Name			VARCHAR(30) NOT NULL,
    Birth_Date			DATE NOT NULL,
    Gender 				ENUM('Male', 'Female','Unknown') NOT NULL,
    ET_IQ				TINYINT UNSIGNED CHECK(ET_IQ<=20),
    ET_Gmath			TINYINT UNSIGNED CHECK(ET_Gmath<=20),
    ET_English			TINYINT UNSIGNED CHECK(ET_English <=50),
    Training_Class		TINYINT UNSIGNED,
    Evaluation_Notes	VARCHAR(50)
);
-- Thêm trường Account vào bảng Trainee
ALTER TABLE `Trainee` ADD COLUMN VTI_Account MEDIUMINT UNIQUE NOT NULL AFTER TraineeID;

-- Tạo bảng Data_Type
CREATE TABLE IF NOT EXISTS `Data_Type`(
	ID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` 	VARCHAR(30) NOT NULL,
    `Code` 	CHAR(5) NOT NULL UNIQUE,
    ModifiedDate TIMESTAMP
);

-- Tạo bảng Data_Type2
CREATE TABLE IF NOT EXISTS `Data_Type2`(
	ID 				MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` 			VARCHAR(30) NOT NULL,
    BirthDate 		DATE NOT NULL,
    Gender 			ENUM('0' , '1', 'NULL'),
    IsDeletedFlag 	BIT NOT NULL
);
