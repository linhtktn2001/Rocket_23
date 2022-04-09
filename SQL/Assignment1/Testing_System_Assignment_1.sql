DROP DATABASE if exists Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
use Testing_System_Assignment_1;

create table `Department`(
	DepartmentID int primary key auto_increment,
    DepartmentName char(30)
);

create table `Position`(
	PositionID int primary key auto_increment,
    PositionName char(30)
);

create table `Account`(
	AccountID int primary key auto_increment,
    Email char(50),
    Username char(20),
    Fullname char(30),
    DepartmentID int,
    PositionID int,
    CreateDate date
);

create table `Group`(
	GroupID int primary key auto_increment,
    GroupName char(30),
    CreatorID int,
    CreateDate date
);

create table `GroupAccount`(
	GroupID int primary key auto_increment,
    AccountID int,
    JoinDate date
);

create table `TypeQuestion`(
	TypeID int primary key auto_increment,
    TypeName char(25)
);

create table `CategoryQuestion`(
	CategoryID int primary key auto_increment,
    CategoryName char(30)
);

create table `Question`(
	QuestionID int primary key auto_increment,
    Content varchar(200),
    CategoryID int,
    TypeID int,
    CreatorID int,
    CreateDate date
);

create table `Answer`(
	AnswerID int primary key auto_increment,
    Content varchar(500),
    QuestionID int,
    isCorrect boolean
);

create table `Exam`(
	ExamID int primary key auto_increment,
    `Code` int,
    Title char(50),
    CategoryID int,
    Duration int,
    CreatorID int,
    CreateDate date
);

create table `ExamQuestion`(
	ExamID int primary key auto_increment,
    QuestionID int
);














