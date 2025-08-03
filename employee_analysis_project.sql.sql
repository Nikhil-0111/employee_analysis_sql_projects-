-- creating database
create database employee;
use employee;

-- ==========================
-- 📁 Table 1: proj_table
-- ==========================
CREATE TABLE proj_table (
    PROJECT_ID VARCHAR(10) PRIMARY KEY,
    PROJ_NAME VARCHAR(50),
    DOMAIN VARCHAR(30),
    START_DATE DATE,
    CLOSURE_DATE DATE,
    DEV_QTR VARCHAR(10),
    STATUS VARCHAR(20)
);

INSERT INTO proj_table VALUES
('P001', 'Sales Analytics', 'Retail', '2023-01-01', '2023-06-01', 'Q1', 'Closed'),
('P002', 'Customer Segmentation', 'Marketing', '2023-03-01', '2023-09-01', 'Q1', 'Closed'),
('P003', 'IoT Monitoring', 'Tech', '2024-01-01', '2024-12-01', 'Q2', 'Ongoing'),
('P004', 'Churn Prediction', 'Telecom', '2023-05-15', '2023-11-30', 'Q2', 'Closed'),
('P005', 'HR Dashboard', 'HR', '2024-04-01', '2024-09-01', 'Q2', 'Ongoing');

-- ==========================
-- 👥 Table 2: emp_record_table
-- ==========================
CREATE TABLE emp_record_table (
    EMP_ID VARCHAR(10) PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    GENDER VARCHAR(10),
    ROLE VARCHAR(30),
    DEPT VARCHAR(20),
    EXP INT,
    COUNTRY VARCHAR(20),
    CONTINENT VARCHAR(20),
    SALARY INT,
    EMP_RATING INT,
    MANAGER_ID VARCHAR(10),
    PROJ_ID VARCHAR(10),
    FOREIGN KEY (MANAGER_ID) REFERENCES emp_record_table(EMP_ID),
    FOREIGN KEY (PROJ_ID) REFERENCES proj_table(PROJECT_ID)
);

INSERT INTO emp_record_table VALUES
('E001', 'Ravi', 'Verma', 'Male', 'Manager', 'Finance', 12, 'India', 'Asia', 9000, 5, NULL, 'P001'),
('E002', 'Anita', 'Sharma', 'Female', 'Analyst', 'Finance', 3, 'India', 'Asia', 5000, 3, 'E001', 'P001'),
('E003', 'Raj', 'Kumar', 'Male', 'Engineer', 'Tech', 5, 'India', 'Asia', 7000, 4, 'E001', 'P003'),
('E004', 'Meena', 'Joshi', 'Female', 'Manager', 'Marketing', 10, 'India', 'Asia', 8500, 5, NULL, 'P002'),
('E005', 'Tom', 'Lee', 'Male', 'Analyst', 'Marketing', 2, 'USA', 'North America', 4800, 2, 'E004', 'P002'),
('E006', 'Sara', 'Khan', 'Female', 'Data Scientist', 'Data Science', 6, 'UK', 'Europe', 7500, 4, 'E001', 'P004'),
('E007', 'David', 'Brown', 'Male', 'Engineer', 'Tech', 4, 'Canada', 'North America', 7200, 3, 'E001', 'P003'),
('E008', 'Neha', 'Singh', 'Female', 'Analyst', 'HR', 3, 'India', 'Asia', 5200, 4, 'E001', 'P005'),
('E009', 'Ali', 'Rehman', 'Male', 'Manager', 'HR', 13, 'Pakistan', 'Asia', 8800, 5, NULL, 'P005'),
('E010', 'Emily', 'Chen', 'Female', 'ML Engineer', 'Data Science', 8, 'Singapore', 'Asia', 8200, 5, 'E001', 'P004');

-- ==========================
-- 👩‍🔬 Table 3: data_science_team
-- ==========================
CREATE TABLE data_science_team (
    EMP_ID VARCHAR(10) PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    GENDER VARCHAR(10),
    ROLE VARCHAR(30),
    DEPT VARCHAR(20),
    EXP INT,
    COUNTRY VARCHAR(20),
    CONTINENT VARCHAR(20),
    FOREIGN KEY (EMP_ID) REFERENCES emp_record_table(EMP_ID)
);

INSERT INTO data_science_team (EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT, EXP, COUNTRY, CONTINENT)
VALUES
('DS101', 'Amit', 'Verma', 'Male', 'Data Analyst', 'Data Science', 1, 'India', 'Asia'),
('DS102', 'Sara', 'Khan', 'Female', 'Data Engineer', 'Data Science', 3, 'UAE', 'Asia'),
('DS103', 'John', 'Miller', 'Male', 'ML Engineer', 'Data Science', 5, 'USA', 'North America'),
('DS104', 'Priya', 'Sharma', 'Female', 'Data Scientist', 'Data Science', 8, 'India', 'Asia'),
('DS105', 'Liam', 'Smith', 'Male', 'Senior DS', 'Data Science', 6, 'UK', 'Europe'),
('DS106', 'Ayesha', 'Rahman', 'Female', 'Junior DS', 'Data Science', 2, 'Pakistan', 'Asia'),
('DS107', 'Carlos', 'Lopez', 'Male', 'Data Scientist', 'Data Science', 10, 'Mexico', 'North America'),
('DS108', 'Emily', 'Wong', 'Female', 'ML Engineer', 'Data Science', 11, 'Singapore', 'Asia'),
('DS109', 'Raj', 'Kumar', 'Male', 'Lead DS', 'Data Science', 12, 'India', 'Asia'),
('DS110', 'Sofia', 'Garcia', 'Female', 'Data Analyst', 'Data Science', 4, 'Spain', 'Europe'),
('DS111', 'Tom', 'Evans', 'Male', 'Senior DS', 'Data Science', 5, 'Canada', 'North America'),
('DS112', 'Meera', 'Iyer', 'Female', 'Data Engineer', 'Data Science', 7, 'India', 'Asia'),
('DS113', 'Jin', 'Park', 'Male', 'Lead DS', 'Data Science', 13, 'South Korea', 'Asia'),
('DS114', 'Anna', 'Petrova', 'Female', 'Manager', 'Data Science', 15, 'Russia', 'Europe'),
('DS115', 'Samuel', 'Brown', 'Male', 'Data Scientist', 'Data Science', 9, 'USA', 'North America');




/* fetching EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and 
DEPARTMENT from the employee record table, and make a list of employees 
and details of their department.*/

SELECT 
    emp_id, first_name, last_name, gender, Dept
FROM
    emp_record_table;
SELECT 
    emp_id,
    CONCAT(first_name, ' ', last_name) AS fullname,
    gender,
    Dept
FROM
    emp_record_table ;

/* query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, 
DEPARTMENT, and EMP_RATING if the EMP_RATING is:  
      ●less than two 
	  ●greater than four  
	●between two and four  */
    
    
 select emp_id,first_name,last_name,gender,Dept ,EMP_RATING 
    from emp_record_table 
	where emp_rating<2;
 
 select emp_id,first_name,last_name,gender,Dept ,EMP_RATING 
      from emp_record_table 
       where emp_rating>4;
     
SELECT 
    emp_id, first_name, last_name, gender, Dept, EMP_RATING
FROM
    emp_record_table
WHERE
    emp_rating BETWEEN 2 AND 4;
 
 
/* 5.  Query to fetch full name of  employees in the Finance department from the employee table and then give 
	 the resultant column alias as NAME.*/


select concat_ws(' ',first_name,last_name) as name ,dept
      from emp_record_table 
      where dept = 'finance';
     

/* query to list only those employees who have someone reporting to 
them. Also, show the number of reporters (including the President).  */


SELECT 
    m.emp_id,
    m.first_name,
    m.last_name,
    m.role,
    m.Dept,
    COUNT(e.emp_id) AS 'employee_count'
FROM
    emp_record_table m
        INNER JOIN
    emp_record_table e ON m.emp_id = e.manager_id
        AND e.emp_id != e.manager_id
WHERE
    m.role IN ('manager' , 'president')
GROUP BY m.emp_id , m.first_name , m.last_name , m.role , m.Dept
ORDER BY m.emp_id ;



/*7.  query to list down all the employees from the healthcare and finance 
departments using union. Take data from the employee record table.*/
    
    
select concat_ws(' ',first_name,last_name) as emp_name ,dept
      from emp_record_table 
      where dept = 'finance'
      Union
   select concat_ws(' ',first_name,last_name) as emp_name ,dept
      from emp_record_table 
      where dept = 'healthcare';   
  
/*8.       a query to list down employee details such as EMP_ID, FIRST_NAME, 
LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also 
include the respective employee rating along with the max emp rating for the 
department */

SELECT 
    emp_id,
    dept,
    CONCAT_WS(' ', first_name, last_name) AS emp_name,
    role,
    emp_rating,
    COUNT(emp_id) AS num_emp,
    AVG(emp_rating) AS avg_rating,
    MAX(emp_rating) AS max_rating
FROM
    emp_record_table
GROUP BY emp_id , dept , first_name , last_name , role , emp_rating
ORDER BY dept;


/* query to calculate the minimum and the maximum salary of the 
employees in each role    */

select Role,min(salary) as Min_salary,max(salary) as Max_salary
 from  emp_record_table
 group by role;

 
 /* 10.  a query to assign ranks to each employee based on their experience. 
  */

select EMP_ID,first_name,last_name,exp,
rank() over (order by exp desc) as rank_by_exp,
dense_rank() over (order by exp desc) as denserank_by_exp 
from emp_record_table; 

-- CREATING VIEWS



/*11. query to create a view that displays employees in various countries 
whose salary is more than six thousand. Take data from the employee record 
table.  */

create view emp_salary_above_6000 as
select emp_id,First_name,last_name,role,dept,country ,continent,salary
from emp_record_table
where salary>6000 ;
select * from emp_salary_above_6000;

-- NESTED QUERY

/*12.   a nested query to find employees with experience of more than ten 
years. */


select emp_id,First_name,last_name,role,exp,salary
from emp_record_table 
where role in (select role from emp_record_table
where exp>10);

-- CREATING STORED PROCEUDRE 

/* 13. query to create a stored procedure to retrieve the details of the 
employees whose experience is more than three years.. */

delimiter &&
create procedure exp_above_3()
begin
select emp_id,First_name,last_name,role,exp,salary 
from emp_record_table
where exp>3;
end && 

-- STORED FUNCTIONS

/* 14. .
  a query using stored functions in the project table to check whether 
the job profile assigned to each employee
 in the data science team matches 
the organization’s set standard. 
The standard being: 
For an employee with experience less than or equal to 2 years assign 'JUNIOR 
DATA SCIENTIST', 
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA 
SCIENTIST', 
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA 
SCIENTIST', 
For an employee with the experience of 10 to 12 years assign 'LEAD DATA 
SCIENTIST', 
For an employee with the experience of 12 to 16 years assign 'MANAGER'.  */

delimiter &&
create function jobprofile_by_exp(exp int) 
returns varchar(150)
deterministic
Begin
declare job_profile varchar(150);
if exp <=2 then set job_profile = 'JUNIOR DATA SCIENTIST';
elseif exp between 2 and 5 then set job_profile =  'ASSOCIATE DATA 
SCIENTIST'; 
elseif exp between 5 and 10 then set job_profile =  'SENIOR DATA 
SCIENTIST'; 
elseif exp between 10 and 12 then set job_profile = 'LEAD DATA 
SCIENTIST';
elseif exp between 12 and 16 then set job_profile = 'MANAGER';
 end if;
 return(job_profile);
 end &&
 
 select emp_id,First_name,last_name,role,exp ,jobprofile_by_exp(exp) as standard_designation 
from data_science_team
order by exp;
 
/*15 Created an index to improve the cost and performance of the query to find 
the employee whose FIRST_NAME is ‘Eric’ in the employee table after 
checking the execution plan.  */


 alter table emp_record_table modify first_name varchar(20);
 
 select * from emp_record_table 
 where FIRST_NAME = 'eric'; 
 
 create index query_2 on emp_record_table(FIRST_NAME);
 
 SHOW INDEX FROM emp_record_table;
 
EXPLAIN SELECT * FROM emp_record_table
 WHERE first_name = 'eric';


 /*16.  query to calculate the bonus for all the employees, based on their 
ratings and salaries (Used the formula: 5% of salary * employee rating).  */
 
select emp_id,First_name,last_name,role,exp,salary,emp_rating,
(salary*0.05*emp_rating) as bonus
from emp_record_table;

/*17. query to calculate the average salary distribution based on the 
continent and country.   */

select country,CONTINENT,avg(salary) as avg_salary from emp_record_table
group by CONTINENT,COUNTRY with rollup
order by avg_salary Desc;



    