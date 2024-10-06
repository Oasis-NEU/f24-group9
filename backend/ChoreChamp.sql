/*******************************************************************************
   ChoreChamp Database - Version 1.4
   Script: ChoreChamp.sql
   Description: Create database for IOS app
   DB Server: MySQL
   Author: Tyler Kim
   License: TBD
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `ChoreChamp`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE ChoreChamp;


USE ChoreChamp;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE User
(
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(160) NOT NULL,
    name INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    acct_date DATETIME NOT NULL,
    verified BOOLEAN NOT NULL,
    recent_task VARCHAR(100),
	pfp VARCHAR(100)
);

CREATE TABLE User_Follower
(
    user_id INT,
    following_id INT,
    is_approve BOOLEAN NOT NULL,
    CONSTRAINT Friendship_pk
    PRIMARY KEY (user_id, following_id),
    CONSTRAINT user_id_fk
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT following_id_fk
	FOREIGN KEY (following_id) REFERENCES User(user_id)
);

CREATE TABLE Task
(
	user_id INT PRIMARY KEY,
	task_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    task_description VARCHAR(150) NOT NULL,
    due_date DATE NOT NULL,
    complete BOOLEAN NOT NULL,
    CONSTRAINT task_id_fk
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Badges 
(
	user_id INT PRIMARY KEY,
	type_of_award VARCHAR(100) NOT NULL,
    current_rating INT,
    CONSTRAINT badges_id_fk
	FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Session 
(
	user_id INT,
	session_id INT PRIMARY KEY,
    date_visit DATE,
    duration_visit int,
    CONSTRAINT session_id_fk
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);