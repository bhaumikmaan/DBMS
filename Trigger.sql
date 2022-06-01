delimiter $$
create trigger Trg1
before update on employee
for each row
declare
employee_id employee.eid%type;
begin
if new.salary>100000 then
set new.salary=100000;
end if;
end$$
/

show error;
