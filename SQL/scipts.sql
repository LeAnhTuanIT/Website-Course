USE MASTER
GO

IF EXISTS (SELECT NAME FROM SYS.DATABASES WHERE NAME = 'Course')
	DROP DATABASE Course
GO

CREATE DATABASE Course
ON (NAME = 'Course_DAT', FILENAME = 'D:\Workspace_SQL\Web_Course\Course.MDF')
LOG ON(NAME = 'Course_LOG', FILENAME = 'D:\Workspace_SQL\Web_Course\Course.LDF')
GO

USE Course
GO

CREATE TABLE Category
(
	category_id int primary key,
	Name nvarchar(255)

)
GO

CREATE TABLE Course
(
	course_id int primary key,
	title nvarchar(255),
	description text,
	price nvarchar(255),
	duration nvarchar(255),
	userid nvarchar(128),
	category_id int
	foreign key (userid) references AspNetUsers(Id),
	foreign key (category_id) references Category(category_id),
)
Go

CREATE TABLE Enrollment
(
	enrollment_id int primary key, 
	 course_id int,
	 users_id nvarchar(128),
	 enrollment_date datetime,
	 statuss int
	foreign key (users_id) references AspNetUsers(Id)

)
GO

CREATE TABLE Payment
(
	payment_id int primary key,
	enrollment_id int,
	payment_date datetime,
	amount float
	foreign key (enrollment_id) references Enrollment(enrollment_id)

)
GO

CREATE TABLE Review
(
	review_id int primary key,
	course_id int,
	users_id nvarchar(128),
	rating float,
	comment text,
	review_date datetime
	foreign key (users_id) references AspNetUsers(Id)
)