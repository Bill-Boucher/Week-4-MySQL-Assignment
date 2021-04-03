-- Allows to find employees names with certain title
delimiter $$

CREATE procedure EmployeeTitleNames (
in EmployeeTitle varchar (60)
)
BEGIN
	SELECT e.first_name, e.last_name, t.title
	from titles t 
	inner join employees e on t.emp_no = e.emp_no 
	where t.title = EmployeeTitle;

END $$

delimiter ;
call EmployeeTitleNames('Engineer');