select * from address

select * from classes

select * from movie

select * from parents

select * from school

select * from staff

select * from staff_salary

select * from student_classes

select * from student_parent

select * from students

select * from subjects

-- 10 Check Unique values in the dataset
select * from students

select distinct(gender) from students

select distinct(age) from students

-- 11. Check for null values
select * from students
where gender is null


---- 12. Apply orderby clouse
select * from students
order by first_name

select * from students
order by first_name asc

select * from students
order by first_name desc

-- 14. using and or operetor
select * from staff_salary

select * from staff_salary
where salary > 10000 and currency = 'USD'


select * from staff_salary
where salary > 10000 or currency = 'USD'


---- 15. using Lmit clause
select * from staff_salary
limit 2


select * from staff_salary
limit 1


select * from staff_salary
offset 2


select * from staff_salary
offset 2
limit 1

select * from staff_salary
order by salary desc
offset 1
limit 1

----- 17. Using like operator

select * from students
where first_name like 'L%'


select* from students
where first_name like'L%y'


select* from students
where first_name like'_l%'


select* from students
where first_name like'__l%'


-- 20. Using groupby function
select * from students

select count(gender) from students

select max(age) from students

select min(age) from students

select avg(age) from students

select avg(age) from students
group by gender


select gender, avg(age) from students
group by gender


select gender, max (age) from students
group by gender



select gender, max (age) from students
where gender = 'Male'
group by gender










