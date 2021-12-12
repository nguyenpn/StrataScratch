/*
Write a query that calculates the difference between the highest salaries
found in the marketing and engineering departments.
Output just the absolute difference in salaries.
*/

SELECT ABS((SELECT MAX(salary) 
              FROM db_employee AS e, db_dept AS d
             WHERE e.department_id = d.id
               AND d.department = 'engineering')
            - 
           (SELECT MAX(salary) 
            FROM db_employee AS e, db_dept AS d
            WHERE e.department_id = d.id
              AND d.department = 'marketing')
          ) AS salary_difference
  FROM db_employee
 LIMIT 1;
