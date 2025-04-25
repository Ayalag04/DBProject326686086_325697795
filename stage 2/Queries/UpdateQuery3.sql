begin;
UPDATE Employee
SET Salary = 
    CASE 
        WHEN Tenure >= 10 THEN Salary * 1.20  
        WHEN Tenure >= 5 THEN Salary * 1.10   
        WHEN Tenure >= 2 THEN Salary * 1.05  
        ELSE Salary
    END;
--commit;
--rollback;

