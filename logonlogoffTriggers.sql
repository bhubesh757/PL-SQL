--Event 'LogOn' Trigger
--used for monitoring the computer users  
-- for the user or the databases

CREATE TABLE hr_event_audit
  (
    event_type VARCHAR2(30),
    logon_date DATE,
    logon_time VARCHAR2(15),
    logof_date DATE,
    logof_time VARCHAR2(15)
  );

  -- trigger
  create or replace trigger hr_login_audit
  after logon on schema 
  begin
  insert into hr_event_audit values (
      ora_sysevent,
      sysdate,
      to_char(sysdate , 'hh24:mi:ss'),
      null,
      null
  );
  commit;
  end;
  /

  -- testing the trigger
  select * from hr_event_audit;
  disc;
  conn hr/hr;


  -- logoff Triggers

  create or replace trigger log_off_audit
  before logoff on schema
  begin 
  insert into hr_event_audit  values(
      ora_sysevent,
      NULL,
      NULL,
      sysdate,
      to_char(sysdate , 'hh24:mi:ss')
  );
commit;
end;
/


CREATE TABLE hr_event_audit
  (
    user_name varchar2(15),
    event_type VARCHAR2(30),
    logon_date DATE,
    logon_time VARCHAR2(15),
    logof_date DATE,
    logof_time VARCHAR2(15)
  );


    create or replace trigger log_off_audit
  before logoff on database
  begin 
  insert into hr_event_audit  values(
      user,
      ora_sysevent,
      NULL,
      NULL,
      sysdate,
      to_char(sysdate , 'hh24:mi:ss')
  );
commit;
end;
/
