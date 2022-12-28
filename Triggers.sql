 CREATE TABLE superheroes (
  sh_name VARCHAR2 (20)
);    

drop table superheroes;

create or replace trigger bi_sh
before insert on superheroes
for each row 
enable
declare
v_user varchar2(15);
begin
select user into v_user from dual; 
dbms_output.put_line('Line inserted ' || v_user);
end;
/

insert into superheroes values('ironmann');






CREATE TABLE sh_audit(
  new_name varchar2(30),
  old_name varchar2(30),
  user_name varchar2(30),
  entry_date varchar2(30),
  operation  varchar2(30)
);


CREATE OR REPLACE trigger superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date  varchar2(30);
BEGIN
  SELECT user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date  FROM dual;
  IF INSERTING THEN
    INSERT INTO sh_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.SH_NAME, Null , v_user, v_date, 'Insert');  
  ELSIF DELETING THEN
    INSERT INTO sh_audit (new_name,old_name, user_name, entry_date, operation)
    VALUES(NULL,:OLD.SH_NAME, v_user, v_date, 'Delete');
  ELSIF UPDATING THEN
    INSERT INTO sh_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.SH_NAME, :OLD.SH_NAME, v_user, v_date,'Update');
  END IF;
END;
/

INSERT INTO superheroes VALUES ('Superman');
select * from sh_audit;

UPDATE SUPERHEROES SET SH_NAME = 'Ironman' WHERE SH_NAME='Superman';

DELETE FROM superheroes WHERE SH_NAME = 'Ironman';
