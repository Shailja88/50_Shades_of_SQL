## Data Definition language (DDL) Commands 
## TCARD -> TRUNCATE CREATE ALTER RENAME DROP 


## Data Manipulation Language( (DML)  Commands 
## SIDU -> SELECT INSERT DELETE UPDATE 


## command to create database (CREATE DATABASE)
CREATE DATABASE PRACTICE2;


## see databases (SHOW)
SHOW DATABASES; 


## switch to particular databases (USE)
USE PRACTICE2;


## create relation 
CREATE TABLE WORKER(
  WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FIRST_NAME CHAR(25),
  LAST_NAME CHAR(25),
  SALARY INT(15),
  JOINING_DATE DATETIME,
  DEPARTMENT CHAR(25)
);


## inserting rows into table WORKER(relation)
 INSERT INTO WORKER 
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES 
    (001,'MONIKA','ARORA',100000,'14-02-20 09:00:00','HR'),
    (002,'NIHARIKA','VERMA',80000,'14-06-11 09:00:00','ADMIN'),
    (003,'VISHAL','SINGHAL',300000,'14-02-20 09:00:00','HR'),
    (004,'AMITABH','SINGH',500000,'14-02-20 09:00:00','ADMIN'),
    (005,'VIVEK','BHATI',500000,'14-06-11 09:00:00','ADMIN'),
    (006,'VIPUL','DIWAN',200000,'14-06-11 09:00:00','ACCOUNT'),
    (007,'SATISH','KUMAR',75000,'14-01-20 09:00:00','ACCOUNT'),
    (008,'GEETIKA','CHAUHAN',90000,'14-04-11 09:00:00','ADMIN');


## see table + table entries 
SELECT * FROM WORKER;


## creating referenced table or child table or derived table that have foreign key 

CREATE TABLE BONUS (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WORKER(WORKER_ID)
        ON DELETE CASCADE
);


## inserting rows into table BONUS(relation)
INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001,5000,'16-02-20 00:00:00'),
(002,3000,'16-06-11 00:00:00'),
(003,4000,'16-02-20 00:00:00'),
(001,4500,'16-02-20 00:00:00'),
(002,3500,'16-06-11 00:00:00');


## creating referenced table or child table or derived table that have foreign key 
CREATE TABLE TITLE(
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
     REFERENCES WORKER(WORKER_ID)
      ON DELETE CASCADE
); 


## inserting rows into table TITLE(relation)
INSERT INTO TITLE
(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES 
(001,'MANAGER','2016-02-20 00:00:00'),
(002,'EXECUTIVE','2016-06-11 00:00:00'),
(008,'EXECUTIVE','2016-06-11 00:00:00'),
(005,'MANAGER','2016-06-11 00:00:00'),
(004,'ASST. MANAGER','2016-06-11 00:00:00'),
(007,'EXECUTIVE','2016-06-11 00:00:00'),
(006,'LEAD','2016-06-11 00:00:00'),
(003,'LEAD','2016-06-11 00:00:00');

-- 1. Write an SQL query to fetch "FIRST_NAME" from Worker table using the alias name as  <WORKER_NAME>
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;


-- 2. Write an SQL query to fetch "FIRST_NAME" from Worker table in upper case
SELECT UPPER(FIRST_NAME) FROM WORKER;


-- 3.Write an SQL query to fetch unique values of DEPARTMENT from Worker table ;
SELECT DISTINCT DEPARTMENT FROM WORKER;
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT ;


-- 4.Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT SUBSTR(FIRST_NAME,1,3) FROM WORKER;


-- 5.Write an SQL query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table 
SELECT INSTR(FIRST_NAME,'B') FROM WORKER WHERE FIRST_NAME = "AMITABH";


-- 6 Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side;
SELECT RTRIM(FIRST_NAME) FROM WORKER;


-- 7 Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the left side;
SELECT LTRIM(FIRST_NAME) FROM WORKER;


-- 8 Write an SQL query that fetches the unique values of department from worker table and prints its length;
SELECT DISTINCT DEPARTMENT,LENGTH(DEPARTMENT) AS SIZE FROM WORKER ;
SELECT DEPARTMENT , LENGTH(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;


-- 9. Write an SQL query to print the FIRST_NAME from worker table after replacing 'A' with 'a';
SELECT REPLACE(FIRST_NAME,'A','a') FROM WORKER ;


-- 10. Write an SQL query to print the FIRST_NAME from Worker table into a single column COMPLETE_NAME;
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER;


-- 11 Write and SQL query to print all worker details from the Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;


-- 12 Write an SQL query to print all Worker details from worker table order by first_name ascending and department  descending 
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;


-- 13 Write an SQL Query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME IN("SATISH","VIPUL");


-- 14 Write and SQL query to print details of workers excluding firstname as "Vipul" and "Satish" from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN("SATISH","VIPUL");


-- 15 Write an SQL query to print details of worker with department name as "ADMIN*"
SELECT * FROM WORKER WHERE DEPARTMENT LIKE "ADMIN%";


-- 16 Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a';
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%A%";


-- 17 Write an SQL query to print details of workers whose FIRST_NAME ends with 'a';
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%a";


-- 18.  Write an SQL query to print details of workers whose FIRST_NAME ends with 'h' and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE "_____H" AND LENGTH(FIRST_NAME)=6;


-- 19   Write an SQL query to print details of workers whose SALARY lies between 100000 and 500000;
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;


-- 20   Write and SQL query to print details of workers who have joined in FEB'2014
SELECT * FROM WORKER WHERE MONTH(JOINING_DATE)=2 AND YEAR(JOINING_DATE)=2014;


-- 21 Write an SQL query to fetch the count of employees working in the deparment 'Admin'
SELECT DEPARTMENT, COUNT(*) FROM WORKER WHERE DEPARTMENT = "ADMIN";


-- 22 Write an SQL query to fetch worker full names with salaries >=50000 and <=100000;
SELECT  CONCAT(FIRST_NAME," ",LAST_NAME) AS FULL_NAME FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;


-- 23 Write an SQL Query to fetch the no of worker for each department in the descending order.
SELECT DEPARTMENT, COUNT(WORKER_ID) AS CNT FROM WORKER GROUP BY DEPARTMENT ORDER BY CNT DESC;


-- 24 Write an SQL Query to print the details of worker who are also Managers.
-- title table and worker table 
SELECT W1.* FROM WORKER AS W1,TITLE AS T1 WHERE W1.WORKER_ID = T1.WORKER_REF_ID AND T1.WORKER_TITLE='MANAGER';


-- 25 Write an SQL Query to fetch number (more than 1) of different titles in the PRACTICE2
SELECT WORKER_TITLE,COUNT(*) AS C FROM TITLE GROUP BY WORKER_TITLE having c>1;


-- 26 Write an SQL Query to show only odd rows from a table
SELECT * FROM WORKER WHERE WORKER_ID%2!=0;
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2)=1;


-- 27 Write an SQL query to show only even rows from a table
SELECT * FROM WORKER WHERE WORKER_ID%2=0;


-- 28 Write an SQL query to clone a new table from another table
CREATE TABLE WORKER_CLONE LIKE WORKER;
INSERT INTO WORKER_CLONE SELECT * FROM WORKER;
SELECT * FROM WORKER_CLONE;


-- 29 Write an SQL Query to fetch intersecting records of two tables.
SELECT W1.* FROM WORKER W1,WORKER_CLONE W2 ;
SELECT W1.* FROM WORKER W1,WORKER_CLONE W2 WHERE W1.WORKER_ID=W2.WORKER_ID;


-- 30 Write an SQL query to show records from one table that another table does not have.
SELECT * FROM WORKER WHERE WORKER_ID NOT IN(SELECT WORKER_ID FROM WORKER_CLONE);
SELECT W1.* 
FROM WORKER W1
LEFT JOIN WORKER_CLONE W2 ON W1.WORKER_ID=W2.WORKER_ID 
WHERE W2.WORKER_ID IS NULL;
SELECT WORKER.* FROM WORKER LEFT JOIN WORKER_CLONE USING(WORKER_ID) WHERE WORKER_CLONE.WORKER_ID IS NULL;


-- exists can be used do it when you come next time here 
-- 31 Write an SQL Query to use current date and time (DUAL TABLE);
SELECT CURDATE();
SELECT NOW();


-- 32 Write an SQL Query to show the top n(say 5) records of a table order by descending salary.
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 5;


-- 33 Write an SQL Query to determine the nth (say 5 ) salary from table;
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 4,1;


-- 34 Write an SQL Query to determine the 5th highest salary without using LIMIT Keyword;
SELECT DISTINCT SALARY FROM WORKER AS W1 WHERE 4 =  (SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W2.SALARY>W1.SALARY);


-- 35 Write an SQL Query to fetch the list of employees with the same same salary;
SELECT W1.* FROM WORKER W1,WORKER W2 WHERE W1.SALARY = W2.SALARY AND W1.WORKER_ID <> W2.WORKER_ID;


-- 36 Write an SQL Query to fetch the second highest salary from the table
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 1,1;
SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN(SELECT MAX(SALARY) FROM WORKER);
SELECT DISTINCT W1.SALARY FROM WORKER W1 WHERE 1=(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W2.SALARY>W1.SALARY);


-- 37 Write an SQL Query to show one row twice in results from a table .
SELECT * FROM WORKER 
UNION ALL SELECT * FROM WORKER ORDER BY WORKER_ID ASC;


-- 38 Write an SQL Query to list worker_id who does not get bonus;  have to use bonus table dude 
SELECT WORKER_ID FROM WORKER WHERE WORKER_ID NOT IN(SELECT WORKER_REF_ID FROM BONUS);


-- 39 Write an SQL Query to fetch the 50% record from a table.
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT MAX(WORKER_ID) /2 FROM WORKER);


-- 40 Write an SQL Query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT,COUNT(*) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(*)<4;


-- 41 Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT , COUNT(*) FROM WORKER GROUP BY DEPARTMENT;


-- 42 Write an SQL Query to show the last record from a table
SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 1;
SELECT * FROM WORKER WHERE WORKER_ID IN (SELECT MAX(WORKER_ID ) FROM WORKER);


-- 43 Write an SQL Query to fetch the first row from a table;
SELECT * FROM WORKER WHERE WORKER_ID IN(SELECT MIN(WORKER_ID) FROM WORKER); 
SELECT * FROM WORKER ORDER BY WORKER_ID ASC LIMIT 1;


-- 44 Write an SQL Query to fetch the last five records from a table;
(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID ;


-- 45 Write an SQL Query to print the name of employees having the highest salary in each deparatment.
SELECT W.DEPARTMENT,W.FIRST_NAME,W.LAST_NAME FROM (SELECT MAX(SALARY) AS MSAL , DEPARTMENT FROM WORKER GROUP BY DEPARTMENT) AS TEMP INNER JOIN
WORKER W WHERE W.SALARY=TEMP.MSAL AND W.DEPARTMENT = TEMP.DEPARTMENT;


-- 46 Write an SQL Query to fetch three max salaries from a table using correlated subqueries
SELECT DISTINCT SALARY FROM WORKER W1 WHERE 3 > (SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W2.SALARY>W1.SALARY) ORDER BY W1.SALARY DESC;


-- 47 Write an SQL Query to fetch three min salaries from a table using correlated subqueries
SELECT DISTINCT SALARY FROM WORKER W1 WHERE 3> (SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W2.SALARY<W1.SALARY)ORDER BY W1.SALARY DESC;


-- 48 Write an SQL Query to fetch nth max salaries from a table;
SELECT DISTINCT SALARY FROM WORKER W1 WHERE n>(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W2.SALARY>W1.SALARY);


-- 49 Write an SQL query to fetch departments along with the total salaries paid for each of them;
SELECT DEPARTMENT , SUM(SALARY) AS SUM FROM WORKER GROUP BY DEPARTMENT ORDER BY SUM DESC;


-- 50 Write an SQL Query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME , SALARY FROM WORKER WHERE SALARY =(SELECT MAX(SALARY) FROM WORKER);
