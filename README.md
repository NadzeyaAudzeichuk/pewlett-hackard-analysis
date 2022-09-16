# Pewlett-Hackard-analysis
HR data analysis with PostgreSQL

## Overview of the analysis

The analysis aims to perform employee research to find who will retire in the next few years and offer a retirement package for those who meet specific criteria. And second, starting to think about how many positions will need to be filled in the near future. We will determine the number of retiring employees and their titles, as well as identify employees who are eligible to participate in a mentorship program.

## Results

The data that we need is available in the form of six CSV files. We create an ERD and use SQL to build a PostgreSQL database.

![EmployeeDB.png](https://github.com/NadzeyaAudzeichuk/pewlett-hackard-analysis/blob/main/EmployeeDB.png)

To determine retirement-eligible employees, we create a Retirement Titles table that holds all the titles of employees born between 1952 and 1955. Because some employees have had multiple job positions over the years working in the company, we keep the most recent title. Also, the database contains information on all employees, including those who have already left the company. We need to make sure to exclude those.

![Retiring_titles.png](https://github.com/NadzeyaAudzeichuk/pewlett-hackard-analysis/blob/main/Retiring_titles.png)

To create a mentorship-eligibility list, we select the current employees born in 1965.. 

![Mentoring_titles.png](https://github.com/NadzeyaAudzeichuk/pewlett-hackard-analysis/blob/main/Mentoring_titles.png)

## Summary

It is essential that every organization develops succession plans that identify how many candidates will be recruited, how they will be trained, and how they will advance.

As we can see from the analysis, about 72 thousand employees are retiring from PH in the next few years. That is a significant shift for the company. 

In the analysis, we considered mentorship-eligible employees those who were born in 1965. The list we got is tiny (1,550 employees only) compared to the retiring numbers. The suggestion will be to consider those born in 1964 as well. It will add another 18 thousand mentors, which seems more reasonable. Below are two tables with the numbers of eligible mentors by the department for comparison. 

![Mentor_depts_both.png](https://github.com/NadzeyaAudzeichuk/pewlett-hackard-analysis/blob/main/Mentor_depts_both.png)

Even though including born in 1964 employees makes the numbers look better, it is not the only option to improve the company's succession plan.