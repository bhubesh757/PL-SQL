create or replace function area_circle(radius number) 
return number is
pi constant number (7,3) := 3.14;
area number(7,3);

begin
--area of the circle
area := pi * (radius * radius);
return area;
end;
/ 

--calling the function
set serveroutput on;
-- assign this to variable
