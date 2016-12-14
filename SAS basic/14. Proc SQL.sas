data company;
   input Name $ 1-25 Age 27-28 Gender $ 30;
   datalines;
Vincent, Martina          34 F
Phillipon, Marie-Odile    28 F
Gunter, Thomas            27 M
Harbinger, Nicholas       36 M
Benito, Gisela            32 F
Rudelich, Herbert         39 M
Sirignano, Emily          12 F
Morrison, Michael         32 M
wa haha                   99 F
;

data finance;
   input IdNumber $ 1-11 Name $ 13-40 Salary;
   datalines;
074-53-9892 Vincent, Martina             35000
776-84-5391 Phillipon, Marie-Odile       29750
929-75-0218 Gunter, Thomas               27500
446-93-2122 Harbinger, Nicholas          33900
228-88-9649 Benito, Gisela               28000
029-46-9261 Rudelich, Herbert            35000
442-21-8075 Sirignano, Emily             5000
843-32-4843 guguga, keke                 900
;

proc print data=company;run;
proc print data=finance; run;


*proc SQL;
proc sql;
	select sum(age),gender
	from company
	where age>20
	group by gender;
quit;

*create a new talbe( dataset);
proc sql outobs=4;
	create table new as
	select idnumber,company.name, age, gender, salary
	from company, finance
	where company.name=finance.name and gender='F'
	order by salary;
quit;

* subqueries + group by
	>>> if a query contains a GROUP BY clause, all columns in the select clause that do not contain a
	summary function should be listed in the GROUP BY clause;

proc sql feedback;  *feedback option wirtes the SQL into sas logs;
	select avg(age) as avg_age, avg(salary) as avg_salary, gender
	from company, finance
	where company.name=finance.name
	group by gender
	having avg(age)<
		(select avg(age)+5 from company);
quit;

* print heading;
proc sql outobs=4;
title 'employee salary report';
	select idnumber label="Id Number",company.name,age,gender,'salary is:' as mark,salary format=dollar12.2
	from company, finance
	where company.name=finance.name and gender='F'
	order by salary;
quit;

* summary count - from a different library;
proc sql noexec;  *If the query is valid and all referenced columns and tables exist, the SAS log displays
the following message: "Statement not executed due to NOEXEC option.";
	select count(*) as num, avg(beds) as avg_bed
	from rich.Doctors;
quit;


*validate ---- If the query is valid, the SAS log displays a message;
proc sql;
	validate  
	select count(*) as num, avg(beds) as avg_bed
	from rich.Doctors;
quit;


*question 6;
data pilots;
input id  name $ jobcode $ salary;
datalines;
001  Albert   PT1       50000
002  Brenda   PT1       70000
003  Carl     PT1       60000
008  crack    PT1       100000
004  Donna    PT2       80000
005  Edward   PT2       90000
006  Flora    PT3       100000
;
run;

proc sql;
select id,Jobcode,
		Salary format=dollar8.0,
		avg(salary) label='avg' format=dollar8.0
from pilots
group by Jobcode;
quit;

proc sql;
 select P2.jobcode, P2.salary,
               ( select AVG(P1.salary)
                   from WORK.PILOTS P1
                  where P1.jobcode = P2.jobcode
               ) as Avg
 from WORK.PILOTS P2
 order by P2.id asc;

proc sql;
select Jobcode,Salary,Avg from WORK.PILOTS,
		(select Jobcode as Jc,avg(Salary) as Avg
			from WORK.PILOTS group by 1)
where Jobcode=Jc
order by Id ;
quit;


*question 11;
data math1a;
input name $ fi $@;
datalines;
lauren l
patel a
chang z
hillier r
;
data math1b;
input name $ fi $@;
datalines;
smith m
lauren l
patel a
;
proc sql;
select * from work.math1a
/*intersect corr*/
outer union corr
select * from work.math1b
;
quit;
*???CORR??OUTER UNION???????????????NAME????,????????;
