-- cursors
--create a  explicit cursor 
-- example 1

--creating a employee table
CREATE TABLE employees
   ( employee_id NUMBER(6)
   , first_name VARCHAR2(20)
   , last_name VARCHAR2(25)
   CONSTRAINT emp_last_name_nn NOT NULL
   , email VARCHAR2(25)
   CONSTRAINT emp_email_nn NOT NULL
   , phone_number VARCHAR2(20)
   , hire_date DATE
   CONSTRAINT emp_hire_date_nn NOT NULL
   , job_id VARCHAR2(10)
   CONSTRAINT emp_job_nn NOT NULL
   , salary NUMBER(8,2)
   , commission_pct NUMBER(2,2)
   , manager_id NUMBER(6)
   , department_id NUMBER(4)
   , CONSTRAINT emp_salary_min
   CHECK (salary > 0) 
   , CONSTRAINT emp_email_uk
   UNIQUE (email)
   ) ;
INSERT INTO employees VALUES 
   ( 100
   , 'Steven'
   , 'King'
   , 'SKING'
   , '515.123.4567'
   , TO_DATE('17-JUN-1987', 'dd-MON-yyyy')
   , 'AD_PRES'
   , 24000
   , NULL
   , NULL
   , 90
   );
INSERT INTO employees VALUES 
   ( 101
   , 'Neena'
   , 'Kochhar'
   , 'NKOCHHAR'
   , '515.123.4568'
   , TO_DATE('21-SEP-1989', 'dd-MON-yyyy')
   , 'AD_VP'
   , 17000
   , NULL
   , 100
   , 90
   );
INSERT INTO employees VALUES 
   ( 102
   , 'Lex'
   , 'De Haan'
   , 'LDEHAAN'
   , '515.123.4569'
   , TO_DATE('13-JAN-1993', 'dd-MON-yyyy')
   , 'AD_VP'
   , 17000
   , NULL
   , 100
   , 90
   );
INSERT INTO employees VALUES 
   ( 103
   , 'Alexander'
   , 'Hunold'
   , 'AHUNOLD'
   , '590.423.4567'
   , TO_DATE('03-JAN-1990', 'dd-MON-yyyy')
   , 'IT_PROG'
   , 9000
   , NULL
   , 102
   , 60
   );
INSERT INTO employees VALUES 
   ( 104
   , 'Bruce'
   , 'Ernst'
   , 'BERNST'
   , '590.423.4568'
   , TO_DATE('21-MAY-1991', 'dd-MON-yyyy')
   , 'IT_PROG'
   , 6000
   , NULL
   , 103
   , 60
   );
INSERT INTO employees VALUES 
   ( 105
   , 'David'
   , 'Austin'
   , 'DAUSTIN'
   , '590.423.4569'
   , TO_DATE('25-JUN-1997', 'dd-MON-yyyy')
   , 'IT_PROG'
   , 4800
   , NULL
   , 103
   , 60
   );
INSERT INTO employees VALUES 
   ( 106
   , 'Valli'
   , 'Pataballa'
   , 'VPATABAL'
   , '590.423.4560'
   , TO_DATE('05-FEB-1998', 'dd-MON-yyyy')
   , 'IT_PROG'
   , 4800
   , NULL
   , 103
   , 60
   );
INSERT INTO employees VALUES 
   ( 107
   , 'Diana'
   , 'Lorentz'
   , 'DLORENTZ'
   , '590.423.5567'
   , TO_DATE('07-FEB-1999', 'dd-MON-yyyy')
   , 'IT_PROG'
   , 4200
   , NULL
   , 103
   , 60
   );


declare
v_name varchar(30);
cursor cur_name is 
select first_name from employees 
where employee_id < 105;
begin
open cur_name;
loop
fetch cur_name into v_name;
dbms_output.put_line(v_name);
exit when cur_name % NOTFOUND; 
end loop;
close cur_name;
end;
/
