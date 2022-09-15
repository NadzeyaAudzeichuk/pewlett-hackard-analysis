# Pewlett-Hackard-analysis
HR data analysis with PostgreSQL

## Overview of the analysis

The analysis aims to perform employee research to find who will retire in the next few years and offer a retirement package for those who meet specific criteria. And second, starting to think about how many positions will need to be filled in the near future. We will determine the number of retiring employees and their titles, as well as identify employees who are eligible to participate in a mentorship program.

## Results

The data that we need is available in the form of six CSV files. We create an ERD and use SQL to build a PostgreSQL database.

![EmployeeDB.png](https://github.com/NadzeyaAudzeichuk/pewlett-hackard-analysis/blob/main/EmployeeDB.png)

To determine retirement-eligible employees, we create a Retirement Titles table that holds all the titles of employees born between 1952 and 1955. Because some employees have had multiple job positions over the years working in the company, we keep the most recent title. Also, the database contains information on all employees, including those who have already left the company. We need to make sure to exclude those.

![Retiring_titles.png]()

To create a mentorship-eligibility list, we select the current employees born in 1965.. 

![Mentoring_titles.png]()

## Summary

As we can see from the analysis, about 72 thousand employees are retiring in the next few years. 

The list of employees to mentor is very small (1,550 employees only)



