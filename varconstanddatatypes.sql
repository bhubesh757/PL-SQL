
CREATE TABLE employees(
    employee_id integer, 
    Name varchar(20), 
    Email varchar(25), 
    PhoneNo varchar(25), 
    salary integer
);

insert into employees values(1 , 'bhubesh' , 'bhubesh@gmail.com' , 987654321 , 98430);


declare
    v_salary number(8);
begin
    select salary into v_salary from employees
    where employee_id = 1;
    dbms_output.put_line(v_salary);
end;
/

declare
    v_salary number(8);
    v_name varchar(15);
begin
    select salary , name into v_salary , v_name from employees
    where employee_id = 1 ;
    dbms_output.put_line(v_name || ' Has Hand in Salary of' || v_salary);
end;

/* Anchored Datatype */

create table students (
    stu_id number(2),
    f_name varchar2(8)
);

insert into students values(1 , 'clark' );
insert into students values(2 , 'tony' );

select * from students;


declare
    v_fname students.f_name%type;
begin
    select f_name into v_fname from students 
    where stu_id = 2;
    dbms_output.put_line(v_fname);
end;

/* constanst in pl/sql 8/


declare 
v_pi constant number(7,6) := 3.14;
begin
dbms_output.put_line(v_pi);
end;
/

--using default 
declare 
v_pi constant number(7,6) default 3.14;
begin
dbms_output.put_line(v_pi);
end;
/

bind variables // or host variables*/


/* initialize the bind variable use EXECUTE command */
VARIABLE v_bind varchar2(10);
EXEC :v_bind := "Cyberhacks" ;
 begin
  :v_bind :=" Bhubesh";
  dbms_output.put_line(:v_bind);
  end;
  /* display the bind variable */
  
  








