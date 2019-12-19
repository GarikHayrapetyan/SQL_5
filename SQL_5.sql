--1
select e.empno,e.sal,b.empno,b.sal
from emp e, emp b
where e.mgr=b.empno and e.sal>b.sal;

--1
select e.ename
from emp e,salgrade
where sal between losal and hisal and grade >(select grade from emp,salgrade where sal between losal and hisal and empno=e.mgr);

--2
select loc,count(empno)
from emp,dept
where emp.deptno=dept.deptno
group by loc
order by 2;

--3
select hiredate,count(empno)
from emp
group by hiredate
having count(empno)>1;

--4
select ename
from emp
where hiredate in(
select hiredate
from emp
group by hiredate
having count(empno)>1);

--5
select ename
from emp
where job!='ANALYST' and sal in(
select sal
from emp
where job='ANALYST');

--6
select job,grade,sal
from emp,salgrade
where (grade,sal) in(
select grade,max(sal)
from emp,salgrade
where emp.sal between losal and hisal
group by grade);

select job,max(grade)
from emp,salgrade
where sal between losal and hisal
group by job;


--7
select job
from emp,dept
where emp.deptno=dept.deptno and loc='DALLAS' 
Minus
select job
from emp,dept
where emp.deptno=dept.deptno and loc='CHICAGO';


--8
select sum(nvl(comm,55)),sum(comm)
from emp
where deptno=10;

--9
select deptno,count(mgr)
from emp
group by deptno
having avg(sal)>1800;


--10
select 'Mr ' || e.ename ||' who has a position of '|| e.job ||' is supervised by Mr ' ||b.ename
from emp e, emp b
where e.mgr=b.empno;

