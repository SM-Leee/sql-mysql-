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
 
 