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

---for loop in cursor 
--simple 
declare 
cursor cur_name is
select first_name ,last_name from employees
where employee_id > 100;
begin
--why loop it reduces all the conditions of the open ,fetch , close 
for L_IDX in cur_name
loop
dbms_output.put_line(L_IDX.first_name ||' ' || L_IDX.last_name);
end loop;
end;
/

--it prints all the name of the person wieth emp_id < 200
--paramaterized cursor
declare
cursor cur_name(var_id number) is
select employee_id , first_name from employees
where employee_id > var_id;
begin
for L_IDX in cur_name(100)
loop
dbms_output.put_line(L_IDX.employee_id||' ' || L_IDX.first_name);
end loop;
end;
/
