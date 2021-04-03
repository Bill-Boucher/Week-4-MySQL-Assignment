-- Finds if an employee makes a salary over 60k

delimiter $$
CREATE PROCEDURE HighSalary (
in EmployeeNumber int,
out Salary_Over varchar (6)
)
BEGIN
	
	Declare salary_number int;
	
	SELECT s.salary into salary_number
	from salaries s
	inner join employees e on e.emp_no = s.emp_no 
	where e.emp_no = EmployeeNumber; 
	
 
if salary_number > 60000 then set Salary_Over = 'Yes';
else set Salary_Over = 'No';
END IF;

END $$

delimiter ;
call HighSalary (10010, @Salary_Over);
select @Salary_Over as 'High Salary';
