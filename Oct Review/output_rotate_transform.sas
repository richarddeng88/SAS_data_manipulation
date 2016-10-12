* rotating or transposing , a SAS data set can be accomplished by suing explicit output
statments in a data steop. when a dataset is rotated, the values of an observation in the 
input dataset become values of a variable in the output data set.;

data prog2;
input id $ q1 q2 q3 q4;
datalines;
	E00224 12 33 22 .
	E00443 35 48 40 20
	E00441 . 63 89 90
	;
run;

data rotate;
	drop q1 q2 q3 q4;
	set prog2;
	qtr = 1;
	amount = q1;
	output;
	qtr = 2;
	amount = q2;
	output;
	qtr =3;
	amount = q3;
	output;
	qtr=4 ;
	amount = q4;
	output;
run;

*proc print data=rotate;run;

data method;
input id $ internet $ telphone $ angency $;
datalines;
	F3153 N Y Y
	F161 Y Y N
	F212 N N Y
	;
RUN;

DATA buyhistory;
	dtrop internet telphone angency;
	set method;
	if internet = 'Y' then 
	do;
		method = 'internet';
		output;	
	end;

	if telphone = 'Y' then 
	do;
		method = 'telphone';
		output;	
	end;
	
		if angency = 'Y' then 
	do;
		method = 'angency';
		output;	
	end;
run;

proc print data=buyhistory;run;
