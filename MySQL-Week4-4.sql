-- Shows how many employees have a specific job title

delimiter $$
CREATE PROCEDURE NumberOfEmployeesByJobTitle (
In positionTitle varchar (35),
Out total int

)
BEGIN
Select count(title)
Into total
From titles 
Where title = positionTitle;
END $$

delimiter ;
CALL NumberOfEmployeesByJobTitle ('Staff', @total);
Select @total as 'Number of Employees';
