CREATE DATABASE NONAME
USE NONAME
CREATE TABLE MOVIES(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(50)
)
INSERT INTO MOVIES
VALUES('TITANIC')
INSERT INTO MOVIES
VALUES('LEGEND')

CREATE TABLE LANGUAGES(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(50)
)
INSERT INTO LANGUAGES
VALUES('ENGLISH')


CREATE TABLE MOVIELANGUAGES(
ID INT PRIMARY KEY IDENTITY,
LANGUAGEID INT REFERENCES LANGUAGES(ID),
MOVIEID INT REFERENCES MOVIES(ID)
)

INSERT INTO MOVIELANGUAGES
VALUES(1,1)
INSERT INTO MOVIELANGUAGES
VALUES(1,5)

CREATE TABLE BRANCHES(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(50)
)
INSERT INTO BRANCHES
VALUES('A')

CREATE TABLE HALLS(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(50),
BRANCHID INT REFERENCES BRANCHES(ID)
)
INSERT INTO HALLS
VALUES('PREMIUM',1)

CREATE TABLE SEANSES(
ID INT PRIMARY KEY IDENTITY,
MOVIELANGUAGEID INT REFERENCES MOVIELANGUAGES(ID),
HALLID INT REFERENCES HALLS(ID),
TIME DATETIME2,
PRICE DECIMAL
)
INSERT INTO SEANSES 
VALUES(2,1,'2022-06-08',10)

--QUESTION1
SELECT M.ID,M.LANGUAGEID,M.MOVIEID FROM MOVIELANGUAGES AS M
JOIN SEANSES
ON
SEANSES.MOVIELANGUAGEID=M.ID

--QUESTION2
SELECT MOVIELANGUAGEID,HALLID,TIME,PRICE,HALLS.NAME,BRANCHES.NAME FROM SEANSES
JOIN HALLS
ON 
HALLS.ID=SEANSES.HALLID
JOIN BRANCHES
ON
BRANCHES.ID=HALLS.BRANCHID