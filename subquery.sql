-- subquery
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
select title, avg(a.salary) as avg_salary
    from salaries a, titles b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by title;   
   
select min(avg_salary)
  from (  select title, 
                 round(avg(a.salary)) as avg_salary
	        from salaries a, titles b
		   where a.emp_no = b.emp_no
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
                               