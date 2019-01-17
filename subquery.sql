-- subquery
-- 단일행인 경우
-- <, >, =, !=, <=, >=
select a.emp_no, a.first_name
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.dept_no = (select b.dept_no
                      from employees a, dept_emp b
					 where a.emp_no = b.emp_no
                       and concat(a.first_name, ' ', a.last_name) = 'Fai Bale'
                       and b.to_date = '9999-01-01');
 
-- ex2)
  select a.first_name, b.salary
    from employees a, salaries b
   where a.emp_no = b.emp_no
     and b.to_date = '9999-01-01'
     and salary < (select avg(salary) 
                     from salaries
				    where to_date='9999-01-01')
order by b.salary desc;

-- ex2)
SELECT 
    title, AVG(a.salary) as avg_salary
FROM
    salaries a,
    titles b,
    employees c
WHERE
    c.emp_no = a.emp_no
        AND c.emp_no = b.emp_no
        AND a.to_date = '9999-01-01'
        AND b.to_date = '9999-01-01'
GROUP BY title
ORDER BY avg_salary asc
   limit 0, 1; 



select min(avg_salary)
  from (  select title, 
                 avg(a.salary) as avg_salary
	        from salaries a, titles b, employees c
		   where c.emp_no = a.emp_no
             and c.emp_no = b.emp_no
             and a.to_date = '9999-01-01'
             and b.to_date = '9999-01-01'
        group by title ) a;


  select title, 
 	     round(avg(a.salary)) as avg_salary
    from salaries a, titles b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by title
  having avg_salary = (select min(avg_salary)
                         from (  select title, 
                                        round(avg(a.salary)) as avg_salary
	                               from salaries a, titles b
		                          where a.emp_no = b.emp_no
                                    and a.to_date = '9999-01-01'
                                    and b.to_date = '9999-01-01'
							   group by title ) a );
                               
-- 다중행
-- any
-- =any(in  완전동일), >any, <any, <>any(!=all 완전동일), <=any, >=any
-- all
-- =all, >all, <all, <>all, <=all, >=all 

-- ex)
select emp_no, salary from salaries where to_date='9999-01-01' and salary>50000;
  
select concat(first_name, ' ', last_name), b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) =any (select emp_no, salary from salaries where to_date='9999-01-01' and salary>50000);
 
select concat(first_name, ' ', last_name), b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and (a.emp_no, b.salary) in (select emp_no, salary from salaries where to_date='9999-01-01' and salary>50000);
        
select concat(a.first_name, ' ', a.last_name),
       b.salary 
  from employees a,
       (select emp_no, salary 
          from salaries 
         where to_date='9999-01-01'
           and salary>50000) b
 where a.emp_no = b.emp_no;
 
           
  
                               