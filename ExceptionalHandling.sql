-PL/SQL
-- exception handing
 --user defines exception using a exception variable
 -- it creates an error eithout showing the un time error

declare 
var_d1 number := 34;
var_d2 number := 0;
var_result number ;
exep_error exception;
begin 
if var_d2 = 0 then 
raise exep_error;
end if ;
var_result := var_d1/var_d2 ;
dbms_output.put_line('the Result of the equaiton is ' || var_result);

--exceptonal handling
exception when exep_error then 
dbms_output.put_line('Error above implemetation is error');
end;
/
--raise application error
--example one
declare 
age number := 30;
begin
if age < 18 then 
raise_application_error(-2009 , 'you are not eligible to vote');
end if;
dbms_output.put_line('yes you can eligible for voting');

exception when others then 
dbms_output.put_line('error');
end;
/
