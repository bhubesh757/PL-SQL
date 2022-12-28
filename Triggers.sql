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



create table superheroes_bk as select * from superheroes where 1 =2;
select * from superheroes_bk
--no data present in the superheroes_bk

create or replace trigger sh_bk
before insert or delete or update on superheroes
for each row
enable
begin
if inserting then
insert into superheroes_bk (sh_name) values (:NEW.sh_name);
elsif deleting then
delete from superheroes_bk where sh_name = :old.sh_name;
elsif updating then
update  superheroes_bk set sh_name = :NEW.sh_name where sh_name = :old.sh_name;
end if;
end;
/
 
 insert into superheroes values ('blackpanther');
 
 --I am getting numneric and variable error
 
 CREATE TABLE schema_audit
  (
    ddl_date       DATE,
    ddl_user       VARCHAR2(15),
    object_created VARCHAR2(15),
    object_name    VARCHAR2(15),
    ddl_operation  VARCHAR2(15)
  );

  create or replace trigger hr_audit_tr
  after ddl on schema
  begin
  insert into schema_audit values (
sysdate, 
sys_context('USERENV','CURRENT_USER'), 
ora_dict_obj_type, 
ora_dict_obj_name, 
ora_sysevent);
end;
/

select * from schema_audit;
create table himava(r_num number);
insert into bhubeshkiller values(5);
select * from bhubeshkiller;

  




