# Trigger Examples

## Trigger to set Maximum salary 100000
```
create trigger Trg1
before update on employee
for each row
begin
if new.salary>100000 then
set new.salary=100000;
end if;
end$$
``` 
## Trigger to demonstrate foreign key on delete cascade
```
create trigger Trg2
before delete on Department
for each row
begin
delete from employee where did=old.did;
end$$
```
## Trigger to demonstrate foreign key on update cascade
```
create trigger Trg3
before update on Department
for each row
begin
update employee set did=new.did where did=old.did;
end$$
```
