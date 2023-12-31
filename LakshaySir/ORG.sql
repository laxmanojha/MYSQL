create database ORG;
show databases;
use ORG;

select * from Bonus;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 -- Question  1 
 Select FIRST_NAME AS WORKER_NAME FROM Worker;
 
 -- Question 2
 Select UPPER(FIRST_NAME) FROM Worker;
 
 -- Question 3
 Select distinct DEPARTMENT FROM WORKER;
 Select Department from worker
 group by department;
 
 -- Question 4
 Select substr(first_name from 1 for 3) from worker;
 select substring(first_name, 1, 3) from worker;
 
  -- Question 5 
 Select position('b' in First_name) AS "b's Position" from worker 
 where first_name = "Amitabh";
 Select position('b' in 'Amitabh');
 Select instr('amitabh','b');
 
 -- Question 6
 Select rtrim(first_name) from worker;
 
 -- Question 7
 Select ltrim(first_name) from worker;
 
 -- Question 8
 -- putting the distinct after length is invalid 
 Select distinct department, length( Department ) from worker 
 group by department;
 
 -- Question 9
 Select replace(first_name,'a','A') from worker;
 
 -- Question 10
 Select concat(First_name,' ',Last_name) AS Complete_name from worker;
 
 -- Question 11 
 Select * from worker 
 order by first_name;
 
 -- Question 12
 Select * from worker
 order by first_name, department desc;
 
 -- Question 13
 Select * from worker
 -- where first_name IN ("Vipul", "satish");
 where first_name = "vipul" or first_name = "satish";
 
 -- Question 14
 Select * from worker
 -- where first_name Not in("vipul","satish");
 where first_name <> "vipul" or first_name <> 'satish';
 
 -- Question 15
 Select * from worker 
 where department like 'admin%';
 
 -- Question 16
 select * from worker 
 -- where position('a' in first_name) <> 0;
 where first_name like '%a%';
 
 -- Question 17
 Select * from worker 
 where first_name like '%a';
 
 -- Question 18
 Select * from worker  
 -- where first_name Like '%h' AND length(first_name) = 6;
 where first_name like '_____h';
 
 -- Question 19
 Select * from worker
 where salary between 100000 AND 500000;
 
 -- Question 20
 Select * from worker
 where year(joining_date) = 2014 AND month(joining_date) = 02;
 -- where joining_date like '2014-02%';
 
 -- Question 21
 Select department,Count(*) from worker 
 where department = 'Admin';
 
 -- Question 22
 Select concat(first_name,' ', last_name) AS 'FULL NAME' from worker
 where salary BETWEEN 50000 AND 100000;
 
 -- Question 23
 Select department, count(worker_id) as count from worker
 group by department
 order by count(department) desc;
 
 -- Question 24
show tables;
select * from bonus;
 Select w.*,t.worker_title,t.affected_from from Worker w inner join Title t on w.worker_id = t.worker_ref_id where t.worker_title = 'manager';
 
 -- Question 25
 Select Worker_Title, count(worker_title) AS Title_Count from title
 group by Worker_title
 having Title_Count > 1;
 
 -- Question 26
 Select * from worker
 where mod(worker_id,2) <> 0;
 
 -- Question 27
 Select * from worker
 where worker_id%2 = 0;
 
 -- Question 28
 Create table worker_clone like worker;
 insert into worker_clone select * from worker;
 select * from worker_clone;
 
 -- Question 29
 Select worker.* from worker inner join worker_clone using(worker_id);