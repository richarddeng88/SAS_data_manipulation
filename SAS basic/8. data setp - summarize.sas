* ############## accumulating the number;
data sales;
	input sale_date $date9. sale;
	datalines;
	01APR2001 498.49
	02APR2001 946.50
	;
RUN;

proc print data=sales;run;

	* the RETAIN statement prevents SAS from re-initializing the values of new variables 
at the top of the data step. previous values of retained variables are available for 
processing across iterations of the data step.;
	
	* the reretain statement 
		1. retains the value of the variable in the PDV across iterations of data step.
		2. initializes the retained variable to missing before the first execution of 
	the data step if an initial vaule is not specified. 
		3. is a compile-time-only statement. ;
	
data sum;
	set sales;
	retain accumu 1000;
	accumu+sale;
run;

* @################### accumulating for groups ####################;

	* the BY statement in the DATA step enables you to process your data in groups. 
	a BY statement in data step creates temporary variables for each variable listed 
in the BY statement. General form of the name of BY variables in a data step:
		1. the First. variable has a value of 1 for the first observation in a BY 
	group. otherwise, it equals 0.
		2. the Last. variable has a value of 1 for the last observation in a BY 
	group. otherwise, it equals 0.; 
	
data salary;
	input dept $ salary region $ emp_id $;
	datalines;
	APTOPS 2000 E E001
	APTOPS 8000 W E012
	APTOPS 5000 W E023
	FINACE 12000 C E043
	FINACE 11000 E E034
	FINACE 9000 C E232
	SALES 9300 W E087
	SALES 7899 E E098
	FINACE 9000 C E232
	SALES 9300 W E087
	SALES 7899 E E098
	FINACE 9000 C E232
	SALES 9300 W E087
	SALES 7899 E E098
	FINACE 9000 C E232
	SALES 9300 W E087
	SALES 7899 E E098
	;
run;

data result;
	set salary;
	by dept;
	if first.dept then dept_salary =0; 
				* 1. set the accumuting variable to zero;
	dept_salary + salary; 
				* 2. increment the accumulating variable with a sum statement;
	if last.dept; 
				* 3. output only the last observation of each BY group;
run;
proc print data=result;run;

proc sort data=salary out=reg;
by region dept;
run;	

data reg_dept_sal(keep = region dept dep_sal num_em);
	set reg;
	by region dept;
	if first.dept then do;
		dep_sal = 0;
		num_em = 0;
	end;
	dep_sal + salary;
	num_em +1;
	if last.dept;
run;

proc print data=reg_dept_sal;
	var region dept dep_sal num_em;
run;




