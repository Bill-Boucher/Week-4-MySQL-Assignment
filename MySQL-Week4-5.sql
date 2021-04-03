-- Shows how many employees are within a certain department number 

delimiter $$
CREATE PROCEDURE NumberOfEmployeeByDepartment (
In DepartmentTitle varchar (35),
Out total int

)
BEGIN
Select count(dept_no)
Into total
From dept_emp de 
Where dept_no = DepartmentTitle;
END $$

delimiter ;
CALL NumberOfEmployeeByDepartment('d003', @total);
Select @total as 'Number of Employees';