-- Allows to see rank of average salaries
Delimiter $$

CREATE PROCEDURE AveragesSalaryRanks(
In EmployeeNumber int,
Out SalaryRank varchar(10)

)
 Begin
	 Declare salary_rank int;
	 
	 
	 Select AVG(s.salary) 
	 into salary_rank
	 from salaries s
	 inner join employees e on s.emp_no = e.emp_no 
	 where e.emp_no = EmployeeNumber;
	
	If salary_rank > 100000 then set SalaryRank ='High';
	 ELSEIF salary_rank < 100000 and salary_rank > 55000 then set SalaryRank = 'Middle';
	 ELSE set SalaryRank = 'Low';
	END if;

END $$

Delimiter ;
CALL AveragesSalaryRanks(10003, @SalaryRank);
SELECT @SalaryRank as 'Salary Rank';
