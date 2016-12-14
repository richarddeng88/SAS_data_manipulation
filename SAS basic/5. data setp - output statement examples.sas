* output statement - example1; 
data prog;
input division $ emps increase;
datalines;
	aptops 205 0.075
	finance 198 0.040
	fltops 187 0.080
;
run;

* using OUTPUT without arguments in data step causes the current observation to be 
written to all data set that are named in the data statement.;

data forecast;
	drop emps;
	set prog;
	year =1;
	new_total = emps*(1+increase);
	output;
	year =2;
	new_total = new_total*(1+increase);
	output;
	year =3;
	new_total = new_total*(1+increase);
	output;
run;
proc print data=forecast;run;


* output statement - example 2;
* rotating or transposing, a SAS data set can be accomplished by using explicit output
statments in a data step. when a dataset is rotated, the values of an observation in the 
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
proc print data=rotate;run;

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

* example 3 - creating multiple SAS data sets in a single data steps
	>>>>>>> seperating one data set into different data sets;
data militry;
input code $ type $ age;
datalines;
	SKF1 AIR_FORCE 23
	DPG2 ARMY 43
	HIF3 AIR_FORCE 23
	NFE4 NAVAL 32
	DAA5 ARMY 26
	TUU6 AIR_FORCE 36
	KAA7 NAVAL 29
	WOO8 ARMY 31
	NFE9 NAVAL 32
	DAA10 AIR_FORCE 26
	TUU11 ARMY 36
	KAA12 NAVAL 29
	WOO13 AIR_FORCE 31
	DAA14 ARMY 26
	TUU15 AIR_FORCE 36
	KAA16 NAVAL 29
	WOO17 ARMY 31
	NFE18 NAVAL 32
	;
run;

	* when the drop= data set option is associated with an output data set, SAS does not write the 
	specified variables to the ouput data set. However, all variables are available for processing.;
	* when using keep= data set option, only associated variables are written to output data set.; 
data army navy airforce; 
	*drop type; 
	set militry;
	if type='ARMY' then ouput army;
	if type='AIR_FORCE' then output airforce;
	if type='NAVAL' then output navy;
run;
proc print data= army;run;

	* a different example for using drop= and keep= to select variables.;
data army(drop= age)
	 navy(drop=code type) 
	 airforce; 
	set militry;
	if type='ARMY' then ouput army;
	if type='AIR_FORCE' then output airforce;
	if type='NAVAL' then output navy;
run;
proc print data=army;run;

	* by default, sas begins processing a SAS data set with the first observation and continues processing 
untill the last observation. the FIRSTOBS= and OBS= data set options can be used to control which
observations are processed.;
		*FIRSTOBS= specifies a starting point for processing an input data set.  ;
		*you can use then with input data sets only. ;
data army1;
	set militry(firstobs=3 obs=10);
	if type = 'ARMY' then output;
run;
proc print data=army1(firstobs=2 obs=4);run;
	
	
	
