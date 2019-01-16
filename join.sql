-- equijoin(inner join)

-- 현재 근무중인 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
  from employees a, titles b
 where a.emp_no = b.emp_no      -- join 조건 
   and b.to_date = '9999-01-01'; -- 선택 조건
   
-- 현재 근무중인 직책이 Senior Engineer인 
-- 여자직원의 이름을 출력하세요.
select a.emp_no, a.first_name
  from employees a, titles b
 where a.emp_no = b.emp_no          -- join 조건 
   and b.to_date = '9999-01-01'     -- 선택 조건
   and b.title = 'Senior Engineer'
   and a.gender = 'F';

--
-- ANSI/ISO SQL의 JOIN
--

-- 1. natural join
      select a.emp_no, a.first_name, b.title
        from employees a 
natural	join titles b
 where b.to_date = '9999-01-01';

-- 2. join ~ using
      select a.emp_no, a.first_name, b.title
        from employees a 
        join titles b using(emp_no)
 where b.to_date = '9999-01-01';
 
-- 3. join ~ on
      select a.emp_no, a.first_name, b.title
        from employees a 
        join titles b on a.emp_no = b.emp_no
 where b.to_date = '9999-01-01';
 
 -- ex1)
  select a.emp_no, 
         concat(a.first_name, ' ', a.last_name),
         c.dept_name
    from employees a, dept_emp b, departments c
   where a.emp_no = b.emp_no
     and b.dept_no = c.dept_no
	 and b.to_date = '9999-01-01'
order by concat(a.first_name, ' ', a.last_name) asc;
    
     
 -- ex2)
  select a.emp_no,
         concat(a.first_name, ' ', a.last_name),
         b.salary
    from employees a, salaries b
   where a.emp_no = b.emp_no
     and b.to_date = '9999-01-01'
order by concat(a.first_name, ' ', a.last_name) asc;
    
   
   


  
  
  