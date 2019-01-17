-- 집계함수(통계)
select *
  from salaries
 where emp_no = 10060;
 
select avg(salary), sum(salary)
  from salaries
 where emp_no = 10060;
 
  select emp_no, avg(salary), sum(salary)
    from salaries
group by emp_no; 


select salary, from_date
  from salaries
 where emp_no = 10060;

select * 
from( select max(salary) as max_salary, 
             min(salary) as min_salary
        from salaries
       where emp_no = 10060) a;
       
  select emp_no, count(*) 
    from titles 
group by emp_no;      
       
       
  select emp_no, avg(salary) 
    from salaries
group by emp_no
  having avg(salary) > 10000;        


-- ex5)
  select title, avg(b.salary), count(*) as cnt
    from employees a, salaries b, titles c
   where a.emp_no = b.emp_no
     and a.emp_no = c.emp_no
     and b.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
group by c.title
  having cnt > 100;
   
-- ex6)
  select dept_name, avg(e.salary) 
    from employees a, dept_emp b, titles c, departments d, salaries e
   where a.emp_no = b.emp_no
	 and a.emp_no = c.emp_no
     and a.emp_no = e.emp_no
     and b.dept_no = d.dept_no
	 and b.to_date = '9999-01-01'
	 and c.to_date = '9999-01-01'
	 and e.to_date = '9999-01-01'
     and c.title = 'Engineer'
group by d.dept_name;
     
-- ex7)
  select c.title, sum(e.salary) 
    from employees a, titles c, salaries e
   where a.emp_no = c.emp_no
     and a.emp_no = e.emp_no
	 and c.to_date = '9999-01-01'
	 and e.to_date = '9999-01-01'
     and c.title <> 'Engineer'
group by c.title
  having sum(e.salary) > 2000000000;










 
 