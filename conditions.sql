-- control statement
--pl sql
--if statements
--if then statement


declare 
    v_num number := 11;
begin
    if v_num > 10 then
    dbms_output.put_line('i am sucker');
    end if;
        dbms_output.put_line('i am fucker');
end;
/



--if then else
declare 
    v_num number := 11;
begin
    if v_num > 10 then
    dbms_output.put_line('i am sucker');
    else 
        dbms_output.put_line('i am fucker');
    end if;
         dbms_output.put_line('i am poor');
end;
/

--eg 2 
--finding the even / odd  
set serveroutput on;
declare 
v_num number := &enteranum;
begin 
if  mod(v_num , 2) = 0 then
dbms_output.put_line(v_num||' is even');
else 
dbms_output.put_line(v_num||' is odd');
end if;
dbms_output.put_line('if else code completed');
end;
/

--iterative statements and loops
 --simple loop

declare 
 v_count number :=0;
 v_result number ;
 begin 
 loop
 v_count := v_count+1;
 v_result := 20 * v_count;
 dbms_output.put_line('20'||'x' || v_count||' = ' ||v_result);
 --we use if else to stop the loop
 if v_count >= 10 then
 exit;
 end if;
 end loop;
 end;
 /

--multiplication using simple loop
declare 
 v_count number :=0;
 v_result number ;
 begin 
 loop
 v_count := v_count+1;
 v_result := 20 * v_count;
 dbms_output.put_line('20'||'x' || v_count||' = ' ||v_result);
 --we use if else to stop the loop
 exit when v_count >=10;
 end loop;
 end;
 /

 --while loop

 declare
 v_count number := 0;
v_result number ;
begin 
while v_count<= 10 loop
 v_count := v_count+1;
 v_result := 10 * v_count;
 dbms_output.put_line('10'||'x' || v_count||' = ' ||v_result);
 end loop;
 end ;
 /

 -- for loop
 --numeric and cursor for loop
--refer syntax

begin 
for v_counter in 1..20 loop
dbms_output.put_line(v_counter);
end loop;
end;

--ex -2
--reverse order
begin 
for v_counter in reverse 1..10 loop
dbms_output.put_line(v_counter);
end loop;
end;
