CREATE DATABASE mysql_shiyan;

use mysql_shiyan;

CREATE TABLE department
(
  dpt_name   CHAR(20) NOT NULL,
  people_num INT(10) DEFAULT '10',
  CONSTRAINT dpt_pk PRIMARY KEY (dpt_name)
 );

CREATE TABLE employee
(
  id      INT(10) PRIMARY KEY,
  name    CHAR(20),
  age     INT(10),
  salary  INT(10) NOT NULL,
  phone   INT(12) NOT NULL,
  in_dpt  CHAR(20) NOT NULL,
  UNIQUE  (phone),
  CONSTRAINT emp_fk FOREIGN KEY (in_dpt) REFERENCES department(dpt_name)
 );
 
CREATE TABLE project
(
  proj_num   INT(10) NOT NULL,
  proj_name  CHAR(20) NOT NULL,
  start_date DATE NOT NULL,
  end_date   DATE DEFAULT '2015-04-01',
  of_dpt     CHAR(20) REFERENCES department(dpt_name),
  CONSTRAINT proj_pk PRIMARY KEY (proj_num,proj_name)
 );

--the above sql statements can aslo be applied to sql server

--modify the table name in mysql
alter table employee rename employee_new;
alter table employee rename to employee_new;

--sql server
exec sp_rename 'employee','employee_new'

--add a column in mysql
alter table employee add height int(10) default 120;
alter table employee add height int(10) default 120 after name;--add a column after column name
alter table employee add height int(10) default 120 first;--add a column as the first column
--add a column in sql server
alter table employee add height int default 120;--we can't give a poisition for the new column which will be add at the last poisition

--delete a column in mysql
alter table employee drop column height;
alter table employee drop height;
--delete a column in sql server
alter table employee drop constraint DF_employee1__height__123321313;
alter table employee drop column height;





