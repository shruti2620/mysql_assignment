//* Q.1) and Q.2) statement to create contact and employee table ? */
CREATE DATABASE ASSIGNMENT1;

USE ASSIGNMENT1;

CREATE TABLE CONTACT1
( CONTACT_ID INT ,
  COMPANY_ID VARCHAR(50),
  FIRST_NAME VARCHAR(50),
  LAST_NAME VARCHAR(20),
  STREET VARCHAR(50),
  CITY VARCHAR(50),
  STATE VARCHAR(50),
  ZIP VARCHAR(50),
  ISMAIN BOOLEAN,
  E_MAIL TEXT,
  PHONE_NO VARCHAR(20)
  );
    INSERT INTO CONTACT1 (contact_id, company_id, first_name, last_name, street, city, state, zip, ismain, e_mail, phone_no)
VALUES
(1, 101, 'John', 'Doe', '123 Maple St', 'New York', 'NY', '10001', 1,'johndoe@example.com', '555-1234'),
(2, 102, 'Jane', 'Smith', '456 Oak Rd', 'Los Angeles', 'CA', '90001', 0, 'janesmith@example.com', '555-5678'),
(3, 103, 'Carlos', 'Garcia', '789 Pine Ave', 'Chicago', 'IL', '60601', 1, 'carlos.garcia@example.com', '555-9876'),
(4, 101, 'Emma', 'Brown', '321 Birch Ln', 'Houston', 'TX', '77001', 0, 'emmabrown@example.com', '555-1122'),
(5, 104, 'David', 'Johnson', '654 Cedar Blvd', 'Miami', 'FL', '33101', 1, 'david.johnson@example.com', '555-3344');
  SELECT * FROM CONTACT1 ;
  
  
  CREATE TABLE EMPLOYEE 
  (
  EMPLOYEE_ID INT,
  FIRST_NAME VARCHAR(50),
  LAST_NAME VARCHAR(50),
  SALARY DECIMAL(10,2),
  HIRE_DATE DATE,
  JOB_TITLE VARCHAR(50),
  EMAIL VARCHAR(50),
  PHONE_NO VARCHAR(50)
  );
  SELECT * FROM EMPLOYEE;
  INSERT INTO employee (employee_id, first_name, last_name, salary, hire_date, job_title, email, phone_no)
VALUES
(1, 'Alice', 'Johnson', 85000, '2020-06-15', 'Software Engineer', 'alice.johnson@example.com', '555-1234'),
(2, 'Bob', 'Smith', 95000, '2018-03-22', 'Project Manager', 'bob.smith@example.com', '555-5678'),
(3, 'Charlie', 'Brown', 75000, '2021-09-01', 'Marketing Specialist', 'charlie.brown@example.com', '555-8765'),
(4, 'Diana', 'Williams', 105000, '2017-11-30', 'HR Manager', 'diana.williams@example.com', '555-4321'),
(5, 'Ethan', 'Davis', 92000, '2019-05-14', 'Data Analyst', 'ethan.davis@example.com', '555-3344');
 
set sql_safe_updates=0; 
UPDATE EMPLOYEE SET PHONE_NO = '215-555' WHERE first_name = 'Alice' ;

  /* STATEMENT TO CREATE CONTACT EMPLOYEE TABLE */
  CREATE TABLE CONTACT_EMPLOYEE
  (
   CONTACT_EMPLOYEE_ID INT,
   CONTACT_ID INT,
   EMPLOYEE_ID INT,
   CONTACT_DATE DATE,
   DESCRIPTION VARCHAR(100)
   );
   SELECT * FROM CONTACT_EMPLOYEE;
   INSERT INTO contact_employee (contact_employee_id, contact_id, employee_id, contact_date, description)
VALUES
(1, 101, 1, '2023-10-15', 'Initial consultation regarding project requirements'),
(2, 102, 2, '2023-10-20', 'Follow-up on contract details and negotiation'),
(3, 103, 3, '2023-10-22', 'Meeting to discuss marketing strategy for the new product'),
(4, 104, 4, '2023-10-25', 'Employee training session on HR policies and procedures'),
(5, 105, 5, '2023-10-28', 'Data analysis review and feedback session');


select CONTACT_DATE,date_format(contact_date,"%M,%d,%Y") from contact_employee;

delete from contact_employee where contact_id = 102;


/* statement to create table of company*/
CREATE TABLE COMPANY 
( 
  COMPANY_ID INT,
  COMPANY_NAME VARCHAR(45),
  STREET VARCHAR(45),
  CITY VARCHAR(45),
  STATE VARCHAR(45),
  ZIP VARCHAR(45)
  );
  INSERT INTO company (company_id, company_name, street, city, state, zip)
VALUES
(1, 'Tech Solutions Inc.', '123 Silicon Valley Blvd', 'San Francisco', 'CA', '94105'),
(2, 'Green Energy Corp.', '456 Greenway Ave', 'Austin', 'TX', '73301'),
(3, 'Global Marketing LLC', '789 Market St', 'New York', 'NY', '10001'),
(4, 'Design Innovations Ltd.', '321 Creative Park Rd', 'Los Angeles', 'CA', '90001'),
(5, 'HealthPlus Enterprises', '654 Wellness Dr', 'Chicago', 'IL', '60601');

update company set company_name = 'urban outfilters,Inc' where company_id = '3';
select * from company;

update company set company_name = 'urban outfilters' where company_name='urban outfilters,Inc' ;



/* Q.8) what is the significance of "%" and "_" operators in the like statement ?
---> 1) % = the % wildcard represent zero or more character in the string. 
     
       e.g-> A% = here the string is start from word A 
             %e = those string which ends with the word e 
             S%i = those string which start with s and ends with i .
             
	 2) "_" = the (_) underscore represent exactly one character in the string.alter
     
	e.g -> s_d = those string which match atleast one word between s and d .
           s__ut_ = those string which match 3 fix word . 
	*/ 
    
/* Q.4) In the employee table , the statement that changes one person phone number ?
--> query is written in upper side .
   Q.5) In te company table , the statement that changes the name of "urban outfilters,Inc" to "urban outfilters" ?
   --> query is written in upper side.
   
 Q.6) In contact employee table ,the statement that remove one contact event with jack lee? 
   --> query is written in upeer side. 
   
Q.10) what does join means in mysql ?
   --> In MYSQL , JOIN clause is used to combine data from  two or more table based on the common column between them. 
        the purpose of using join is to query data from multiple table which is related to each other in some way. 
	
       Types of join --> 
       1) Inner join = the inner join select the record from both the table that have similar values. 
		2) Left join = the left join select all the records of left table and similar records from right table .
        3)Right join = the right join select all records from right table and similar records from left table. 
        4) Cross join = cross join select all the records from both the table( table1,table2). 
        e.g.-> */
CREATE DATABASE JOINN;

USE JOINN;

CREATE TABLE HR 
( 
 HR_ID INT PRIMARY KEY,
 HR_FNAME VARCHAR(20)
 );
 
 CREATE TABLE EMPLOYEE22
 ( 
   E_ID INT PRIMARY KEY,
   E_LNAME VARCHAR(20),
   E_SALARY INT,
   E_HR INT,
   FOREIGN KEY (E_HR) REFERENCES HR (HR_ID) 
   );
   
   SELECT * FROM HR INNER JOIN EMPLOYEE22 
   ON HR.HR_ID = EMPLOYEE22.E_HR;
   
    SELECT * FROM HR LEFT JOIN EMPLOYEE22 
   ON HR.HR_ID = EMPLOYEE22.E_HR;
   
    SELECT * FROM HR RIGHT JOIN EMPLOYEE22 
   ON HR.HR_ID = EMPLOYEE22.E_HR;
   
   SELECT * FROM HR CROSS JOIN EMPLOYEE22
   ON HR.HR_ID = EMPLOYEE22.E_HR;
   
   /* Q.7)  Write the SQL SELECT query that displays the names of the employees that
			have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
            MySQL Workbench. Copy the results below as well ? */   
    
    CREATE TABLE EMPLOYEES
    ( 
    E_ID INT PRIMARY KEY,
    E_NAME VARCHAR(20)
    );
    
    CREATE TABLE CONTACTS
    (
      COMPANY_ID INT PRIMARY KEY,
      COMPANY_NAME VARCHAR(40),
      EMPLOYEES_CONTACT INT 
      );
      
      SELECT * FROM EMPLOYEES RIGHT JOIN CONTACTS 
      ON EMPLOYEES.E_NAME = CONTACTS.EMPLOYEES_CONTACT WHERE COMPANY_NAME = "TOLL BROTHERS" ;
      
      /* Q.12) What is the role of the MySQL JOIN clause in a query, and what are some
               common types of joins? 
		--> There is main role of join clause which work between two row which related to two or more tables . 
            the main purpose of join clause is to allow the query with more database in single result . 
            Some common types of join -->
	         1) Inner join = the inner join select the record from both the table that have similar values. 
		    2) Left join = the left join select all the records of left table and similar records from right table .
			3)Right join = the right join select all records from right table and similar records from left table. 
            4) Cross join = cross join select all the records from both the table( table1,table2).
    
    Q.9) Explain normalization in the context of databases. 
    ans --> normalization is the process in database to eliminate redundancy and inconsistancy . 
             it's main purpose is to avoid problems that can be arise from updating redundant data.
             normalization makes database more flexible and protect data . 
             normalization mainly used when dealing with large database. 
             rules-> 
                     a) eliminate repeating group 
                     b) eliminate redundant data 
                     c) eliminate column not dependent on key 
					
   Q. 11) What do you understand about DDL, DCL, and DML in MySQL?
   ANS --> DDL = Data defination language is concerned with database and description of how data sshould be stored in the database. 
           DDL COMMAND = create database , drop database, create table, alter table , drop table , create index, create view etc. 
            
		   DML COMMAND = Data manipulation language deals with data manipulation and include the most common sql statement such as SELECT , INSERT, UPDATE ,
                         DELETE, REPLACE etc. 
		   
           DCL COMMAND = DATA CONTROL LANGUAGE include command such as GRANT AND REVOKE . IT is also auto comitted . 
                         
		   
	
   
   
   

    


   
   
   
  
  
  
  