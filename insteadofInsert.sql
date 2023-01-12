--Instead of update 

CREATE TABLE startup_audit 
(
  Event_type  VARCHAR2(15),
  event_date  DATE,
  event_time  VARCHAR2(15)
);

-- trigger 

create or replace trigger tr_st_sudit 
after startup on database
begin
 insert into startup_audit values (
     ora_sysevent,
     sysdate ,
     to_char(sysdate,'hh24:mm:ss')
 );
 end;
 /

  -- create instead of insert trigger
  create table  student( 
      name varchar(15)
  );
 
 create table subject (
     subname varchar(15)
 );

 insert into student values('charan');
 insert into subject values('java');

 create view vw_names as 
 select name , subname from student , subject ;

 insert into vw_names values('karan' , 'sql');

 --creating a instead of insert trigger
 create or replace trigger tr_name
 instead of insert on vw_names
 for each row
 begin
 insert into student(name) values (:new.name);
 insert into subject(subname) values (:new.subname);
 end;
 /

 select * from student;
 select * from subject;

create or replace trigger io_update
instead of update on vw_names
for each row
begin
--updating the student name
update student set name = :new.name
where name = :old.name;
--updating the subject name
update subject set subname = :new.subname
where subname = :old.subname;
end;
/

update vw_names set name = ' bhubesh' where subname = 'java';

select * from student ;
