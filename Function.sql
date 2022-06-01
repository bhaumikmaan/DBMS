delimiter $$
create function discount(pid int)
returns int
deterministic
begin
declare temp int;
select price into temp from product where id=pid;
if temp<=5000 then
return 500;
else
return 1000;
end if;
end$$
