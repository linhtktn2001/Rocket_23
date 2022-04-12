
-- Tao database
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE `Department` (
    DepartmentID 	INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName 	CHAR(30)
);

CREATE TABLE `Position` (
    PositionID 		INT PRIMARY KEY AUTO_INCREMENT,
    PositionName 	ENUM('Dev','Test', 'Scrum Master', 'PM')
);

CREATE TABLE `Account` (
    AccountID 		INT PRIMARY KEY AUTO_INCREMENT,
    Email 			CHAR(50),
    Username 		CHAR(20),
    Fullname 		CHAR(30),
    DepartmentID 	INT,
    PositionID 		INT,
    CreateDate 		DATE
);

CREATE TABLE `Group` (
    GroupID 		INT PRIMARY KEY AUTO_INCREMENT,
    GroupName 		CHAR(30),
    CreatorID 		INT,
    CreateDate 		DATE
);

CREATE TABLE `GroupAccount` (
    GroupID 		INT PRIMARY KEY AUTO_INCREMENT,
    AccountID 		INT,
    JoinDate 		DATE
);

CREATE TABLE `TypeQuestion` (
    TypeID 			INT PRIMARY KEY AUTO_INCREMENT,
    TypeName 		CHAR(25)
);

CREATE TABLE `CategoryQuestion` (
    CategoryID 		INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName 	CHAR(30)
);

CREATE TABLE `Question` (
    QuestionID 		INT PRIMARY KEY AUTO_INCREMENT,
    Content 		VARCHAR(200),
    CategoryID 		INT,
    TypeID 			INT,
    CreatorID 		INT,
    CreateDate 		DATE
);

CREATE TABLE `Answer` (
    AnswerID 		INT PRIMARY KEY AUTO_INCREMENT,
    Content 		VARCHAR(500),
    QuestionID 		INT,
    isCorrect 		BOOLEAN
);

CREATE TABLE `Exam` (
    ExamID 		INT PRIMARY KEY AUTO_INCREMENT,
    `Code` 		INT,
    Title 		CHAR(50),
    CategoryID 	INT,
    Duration 	INT,
    CreatorID 	INT,
    CreateDate 	DATE
);

CREATE TABLE `ExamQuestion` (
    ExamID 		INT PRIMARY KEY AUTO_INCREMENT,
    QuestionID 	INT
);














