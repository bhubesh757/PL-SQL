create or replace procedure pro_name (dep_id number , sal_raise number) 
is 
begin
update employees set salary = salary * sal_raise where department_id = dep_id;
end ;
/

exec pro_name

