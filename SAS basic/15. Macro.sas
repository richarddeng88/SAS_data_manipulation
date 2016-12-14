*################################ macro variables #################################;
%let year=2017;
%let amount = 1000;
%let state=NY;

title "welcome to &state";
footnote "the time is &systime &sysday, &sysdate9";
data test;
year = &year;
amount = &amount;
%put the value is good;
run;


*define macro in data step depending on the conditionss --- call symput;
data sasuser.all;
input course_number paid $8.;
datalines;
1 N
2 N
3 N
3 Y
3 Y
3 Y
;
run;
proc print data=sasuser.all;run;

%let crsnum=3;
data revenue;
set sasuser.all end=final;
where course_number=&crsnum;
total+1;
if paid='Y' then paidup+1;
if final then do;
	if paidup<total then do;
		call symput('foot','Some Fees Are Unpaid');
		end;
	else do;
		call symput('foot','All Students Have Paid');
		end;
end;
run;

proc print data=revenue;
title "Payment Status for Course &crsnum";
footnote "&foot";
run;

*############################### macro programs #################################;
%macro company;
proc print data=company;run;
%mend;

%company;


*question 7 -- %EVAL discards the fractional part when it performs division on integers that would 
				result in a fraction:; 
%let Value=9;
%let Add=5;
%let Newval=%eval(&Value/&Add);
%put &Newval;


*question 12;
data students;
input Name $8. age;
datalines;
Mary       15
Philip     16
Robert     12
Ronald     15
;
run;

%let Value=Philip;   
proc print data=WORK.STUDENTS;
*where upcase(name)="%upcase(&Value)";
where name="&Value";
run;
