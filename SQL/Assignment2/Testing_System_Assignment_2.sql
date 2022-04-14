
-- Tao database
DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

-- Tạo bảng Department
CREATE TABLE `Department` (
    DepartmentID 	TINYINT UNSIGNED KEY AUTO_INCREMENT,
    DepartmentName 	VARCHAR(30) NOT NULL UNIQUE
);

-- Thêm dữ liệu vào bảng Department
INSERT INTO `department` (`DepartmentName`) VALUES ('IT'),
												   ('Kinh doanh'),
                                                   ('Ke toan'),
                                                   ('Marketing'),
                                                   ('CSKH');

-- Tạo bảng Position
CREATE TABLE `Position` (
    PositionID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName 	ENUM('Dev','Test', 'Scrum Master', 'PM') NOT NULL 
);

-- Thêm dữ liệu vào bảng Position
INSERT INTO `Position` (PositionName) VALUES ('Dev'),
											 ('Test'),
                                             ('Scrum Master'),
                                             ('PM');

-- Tạo bảng Account
CREATE TABLE `Account` (
    AccountID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email 			VARCHAR(50) CHECK(Email LIKE '%@gmail.com' OR '%@yahoo.com') NOT NULL UNIQUE,
    Username 		VARCHAR(20) NOT NULL UNIQUE,
    Fullname 		VARCHAR(30) NOT NULL,
    DepartmentID 	TINYINT UNSIGNED ,
    PositionID 		TINYINT UNSIGNED,
    CreateDate 		DATE CHECK(CreateDate <= sysdate()),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- Thêm dữ liệu vào bảng Account
INSERT INTO `account` (`Email`, 	    `Username`, 	   `Fullname`, `DepartmentID`, `PositionID`,`CreateDate`) VALUES
				('linh123@gmail.com',    'linh123',   'Nguyen Anh Linh',     1,             1,       '2021/3/14'),
                ('anh001@gmail.com',     'anh001',     'Hoang Viet Anh',     2,          	3,       '2020/5/30'),
				('quang2001@gmail.com', 'quang2001',  'Nguyen Ba Quang',     4,          	2,       '2021/12/4'),
				('hientd@gmail.com',     'hientd',    'Trinh Dang Hien',     3,          	4,       '2019/2/9'),
				('duongpham@gmail.com', 'duongpham',  'Pham Tuan Duong',     4,          	3,       '2018/1/15'),
				('manhmeo@gmail.com',    'manhmeo',  'Duong Nghia Manh',     1,          	2,       '2021/6/24');
                        
-- Tạo bảo Group
CREATE TABLE `Group` (
    GroupID 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName 		VARCHAR(30) NOT NULL,
    CreatorID 		MEDIUMINT UNSIGNED NOT NULL UNIQUE,
    CreateDate 		DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- Thêm dữ liệu vào bảng Group
INSERT INTO `Group` (GroupName, CreatorID, CreateDate) VALUES
					('Group1',     1,     '2021/12/4'),
                    ('Group2',     2,     '2021/11/5'),
                    ('Group3',     3,     '2021/10/6'),
                    ('Group4',     4,     '2021/9/7'),
                    ('Group5',     5,     '2021/8/8');

-- Tạo bảng GroupAccount
CREATE TABLE `GroupAccount` (
    GroupID 		TINYINT UNSIGNED,
    AccountID 		MEDIUMINT UNSIGNED,
    JoinDate 		DATE NOT NULL,
    FOREIGN KEY ( AccountID) REFERENCES `Account`(AccountID),
	FOREIGN KEY (GroupID ) REFERENCES `Group`(GroupID)
);

-- Thêm dữ liệu vào bảng GroupAccount
INSERT INTO `GroupAccount` VALUES (2, 3, '2021/11/9'),
								  (5, 1, '2021/6/1'),
                                  (2, 2, '2021/9/10'),
                                  (3, 4, '2021/1/25'),
                                  (4, 1, '2021/10/15');

-- Tạo bảng TypeQuestion
CREATE TABLE `TypeQuestion` (
    TypeID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName 		VARCHAR(25) NOT NULL
);

-- Thêm dữ liệu vào bảng TypeQuestion
INSERT INTO `TypeQuestion` (TypeName) VALUES ('Essay'),
											 ('Multiple-Choice'),
                                             ('Talking');											

-- Tạo bảng CategoryQuestion
CREATE TABLE `CategoryQuestion` (
    CategoryID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName 	VARCHAR(30) NOT NULL
);

-- Thêm dữ liệu vào bảng CategoryQuestion
INSERT INTO `CategoryQuestion` (CategoryName ) VALUES 	('SQL'),
														('Java'),
														('C#'),
														('C++'),
														('Python');
                                                        
 -- Tạo bảng Question                                                       
CREATE TABLE `Question` (
    QuestionID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content 		VARCHAR(200),
    CategoryID 		MEDIUMINT UNSIGNED NOT NULL,
    TypeID 			TINYINT UNSIGNED,
    CreatorID 		MEDIUMINT UNSIGNED,
    CreateDate 		DATE,
    FOREIGN KEY (TypeID) REFERENCES `TypeQuestion`(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `CategoryQuestion`(CategoryID)
);

-- Thêm dữ liệu vào bảng Question
INSERT INTO `Question` (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES
					   ('hehehehe', 	2, 		1, 		4, 		'2021/3/1'),
                       ('hahahaha', 	1, 		3, 		3, 		'2021/1/1'),
                       ('hehehehe', 	3, 		2, 		2, 		'2021/7/11'),
                       ('hehehehe', 	4, 		1, 		5, 		'2020/5/15'),
                       ('hehehehe', 	5, 		3, 		5, 		'2021/8/31');
                       
 -- Tạo bảng Answer                      
CREATE TABLE `Answer` (
    AnswerID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content 		VARCHAR(500) NOT NULL,
    QuestionID 		MEDIUMINT UNSIGNED,
    isCorrect 		BOOLEAN,
    FOREIGN KEY  (QuestionID) REFERENCES `Question`(QuestionID)
);

-- Thêm dữ liệu vào bảng Answer
INSERT INTO `Answer` (Content, QuestionID, isCorrect ) VALUES
 					('kakaka',    3,         1),
                    ('kakaka',    1,         1),
                    ('kakaka',    2,         0),
                    ('kakaka',    4,         0),
                    ('kakaka',    5,         1);


-- Tạo bảng Exam
CREATE TABLE `Exam` (
    ExamID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code` 		MEDIUMINT UNSIGNED NOT NULL UNIQUE,
    Title 		VARCHAR(50),
    CategoryID 	MEDIUMINT UNSIGNED NOT NULL,
    Duration 	TINYINT UNSIGNED NOT NULL,
    CreatorID 	MEDIUMINT UNSIGNED NOT NULL ,
    CreateDate 	DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

-- Thêm dữ liệu vào bảng Exam
INSERT INTO `Exam` (`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES 
					('1', 	  'abc', 	'2', 		 '30', 			'3', '   2021/3/12'),
					('2', 	  'vbg',    '1',         '15',          '3',    '2019/2/20'),
					('6',   'lidad',   '1',         '90',          '2',    '2021/6/15'),
					('4',   'loia',    '3',         '35',          '1',     '2020/9/2'),
					('8',   '3liazw',  '3',         '10',          '5',   '2021/11/30');												


-- Tạo bảng ExamQuestion
CREATE TABLE `ExamQuestion` (
    ExamID 		MEDIUMINT UNSIGNED NOT NULL,
    QuestionID 	MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY( ExamID,  QuestionID),
    FOREIGN KEY (ExamID) REFERENCES `Exam`(ExamID),
	FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);

-- Thêm dữ liệu vào bảng ExamQuestion
INSERT INTO `ExamQuestion` VALUES (1, 3),
								  (2, 4),
                                  (1, 2),
                                  (3, 1),
                                  (1, 5);













