-----------------------------------------------------------
--- Deliverable 1 : Number of Retiring employees By Title
-----------------------------------------------------------
--- Step 1-5: Create a table with retiring employees 
SELECT e.emp_no, e.first_name,e.last_name,
		t.title,t.from_date,t.to_date
INTO retirement_title
FROM employees as e
INNER JOIN
 titles as t
ON (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1952-01-01' and '1955-12-31')
order by e.emp_no


--- Step 6: Export the Retirement Titles table as retirement_titles.csv

--- Saved retirement_titles.csv into Data Folder

--- Step 7 : view retiring employees table
SELECT * FROM retirement_title --133776 rows

-- Get distinct retiring employees
SELECT Count(DISTINCT emp_no)
FROM retirement_title; -- 90,398


--- Step 8 - 13
-- Use Dictinct with Orderby to remove duplicate rows
-- Retiring employees who still did not leave the firm and are still employed
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title 
		INTO unique_titles
FROM retirement_title as rt
WHERE rt.to_date=('9999-01-01')
ORDER BY rt.emp_no;   

--- Step 14 : Export the Unique Titles table as unique_titles.csv

----- unique_titles.csv - Saved into Data Folder

--- Step 15 : view unique_title results
select * from unique_titles   -- 72,458 rows


--- Step 16 :19
-- count the retiring people by title

SELECT COUNT(ut.title) as "title_count", ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY "title_count" DESC

--- Step 20 :Export the Retiring Titles table as retiring_titles.csv 

--- Step 21 :view the results of number of retiring people by title
select * from  retiring_titles

--- Select distinct employees who are still working
select count(distinct(e.emp_no)) from employees  e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
WHERE de.to_date=('9999-01-01')  -- count : 240,124

	
-----------------------------------------------------------
--- Deliverable 2 : Employees eligible for retirement program
-----------------------------------------------------------

---Step 1 - 9 : create Mentorship_Eligibility table
-- employees birthdate between 1/1/1965 - 12/31/1965
-- order by employee number
SELECT DISTINCT ON (e.emp_no)
		e.emp_no, 
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)	
JOIN titles as t
	ON (e.emp_no = t.emp_no)
	
WHERE (de.to_date=('9999-01-01')) and 
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-12' )
ORDER BY e.emp_no ;

-- Step 10 : Export into mentorship_eligibilty.csv

-- Step 11 : View results of Mentorship eligibility table
select * from mentorship_eligibility; -- 1549 rows

SELECT COUNT(emp_no), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(emp_no) DESC;





		
		
		









-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;
