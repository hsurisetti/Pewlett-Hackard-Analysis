# Pewlett Hackard Analysis

## Overview :

Pewlet Hackard is a large company boasting several thousand employees. Many employees are approaching the retirement age, which will leave thousands of job openings. The management wants to be prepared for this known as 'Silver Tsunami' as employees reach their retirement age by offering a mentorship program to train the future generation of Pewlet Hackard employees .

## Resources :

Data Sources: departments.csv,dept_emp.csv,dept_manager.csv,employees.csv,salaries.csv.titles.csv

Software : SQL, POSTgreSQL,pgAdmin

### ERD Diagram:
![img](https://github.com/hsurisetti/Pewlett-Hackard-Analysis/blob/main/screenshots/PH_ERD.png)

### Retiring Employees by Title


### Query : 


```javascript
SELECT e.emp_no, e.first_name,e.last_name,
		t.title,t.from_date,t.to_date
INTO retirement_title
FROM employees as e
INNER JOIN
 titles as t
ON (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1952-01-01' and '1955-12-31')
order by e.emp_no
```


### Pewlett Hackard - retirement_titles Table
![img](https://github.com/hsurisetti/Pewlett-Hackard-Analysis/blob/main/screenshots/retirement_title.png)


### Unique Titles

### Pewlett Hachard unique_titles Table
![img](https://github.com/hsurisetti/Pewlett-Hackard-Analysis/blob/main/screenshots/unique_titles.png)


### Retiring Titles

### Pewlett Hackard retiring_titles Table
![img](https://github.com/hsurisetti/Pewlett-Hackard-Analysis/blob/main/screenshots/retiring_titles.png)

## Employees eligible for mentorship Program

### Query
 ```javascript
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
```

## mentorship_eligibility Table

![img](https://github.com/hsurisetti/Pewlett-Hackard-Analysis/blob/main/screenshots/mentorship_eligibility.png)

## Results : 
### The number of retiring employees by title without filtration

    Total Number of Employees  :  300,024
    Number of employees about to retire   : 133,776

### Removing the duplicates, 
    Number of distinct retiring employees :90,398
    Percentage of employees retiring : 90,398 / 300,024 = 30.1 %

### Adding filtration to account only the actual number of employees still working in PH
    Total Count of employees who are still employed in PH : 240,124
    Number of retiring employees, still employed in PH :  72,458
    Percentage of retiring employees still employed in PH : 72,458 / 240,124 = 30.1%



## Summary :
 Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    As Silver Tsunami begins, 90,398 employees retire which creates opening for that many which would be a 30 % of the total number of employees count.

    Total Count of employees who are still employed in PH : 240,124
    Number of retiring employees, still employed in PH :  72,458

    Percentage of employees about to retire who are still employed in PH : 72,458 / 240,124 = 30.1%
Also, we can see from the unique_titles table that, there are large number of engineers(45,397 engineers )retiring which 50.2% of all the retirees , which poses a big risk.
To make the problem , more difficult we can see that a large sector od senior staff(28,254) are also retiring which accounts to 31.3% of the total.

Image 7: Pewlett Hackard - unique_titles.csv

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Image 8 : mentorship_eligibility.csv - grouped by title
 As Silver Tsunami approaches , PH would face a major threat with a large number of senior employees retiring.  
    The total number of retiring employees chosen for mentorship are 1549 of the 72,458 employees actually retiring. This leaves a ratio of 47:1, which is a large ratio.
         72,458/ 1549 = 47 people / mentor 
In order for the mentorship program to be effective, PH would need to increase the number of mentors atleast 10 fold, so there would enough number of mentors to train the new hires.
