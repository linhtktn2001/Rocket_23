-- Exercise 1:Design a table
DROP DATABASE if exists `fresher`;
CREATE DATABASE `fresher`;
USE fresher;

-- Question1 Tạo bảng trainee
create table `Trainee`(
	TraineeID int primary key auto_increment,
    Full_Name char(30) NOT NULL,
	Birth_Date date NOT NULL,
    Gender enum('male', 'female',' unknown') NOT NULL,
    ET_IQ int unsigned NOT NULL, check(ET_IQ <= 20),
    ET_Gmath int unsigned NOT NULL, check( ET_Gmath <= 20),
    ET_English int unsigned NOT NULL, check( ET_English <=50),
    Training_Class char(10) NOT NULL,
    Evaluation_Notes varchar(300)
);

-- Question2 thêm trường VTI_Account
alter table Trainee add column VTI_Account int unique NOT NULL;




