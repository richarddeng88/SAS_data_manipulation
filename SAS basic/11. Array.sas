* use the OF operator;
DATA array_example;
	INPUT A1 A2 A3 A4;
	ARRAY A(4) A1-A4;
	A_SUM=SUM(OF A(*));
	A_MEAN=MEAN(OF A(*));
	A_MIN=MIN(OF A(*));
	DATALINES;
	21 4 52 11
	96 25 42 6
	;
	RUN;
PROC PRINT DATA=array_example; RUN;

* use the IN operator;
DATA array_in_example;
	INPUT A1 $ A2 $ A3 $ A4 $;
	ARRAY COLOURS(4) A1-A4;
	IF 'yellow' IN COLOURS THEN available='Yes';
	ELSE available='No';
	DATALINES;
	Orange pink violet yellow
	;
	RUN;
PROC PRINT DATA=array_in_example;
RUN;

* why we use array? -- The use of arrays may allow us to simplify our processing. we can use array to 
help read and analyze repetitive data with a minimum of coding. ;

* example: suppose we have a file where each record contains 12 values with temperature for each hour of 
the day. These temperatures are in Fahrenheit and we need to convert them into Celsius value.;
data temperature;
input tem1 - tem12;
datalines;
9  8  9  9 10 10 11 12 14 19 21 18
10 9 11 13 16 18 20 23 25 24 23 19
;
run;


* the array elemment cannot be use in compiler statements such as DROP and KEEP. An array must be defined 
within the data step prior to being referenced and if an array is referenced without being defined, an
error will occur. ;

* Define an array within one data step and reference the array within another data step will also cause
errors, because arrays exist only for the duration of the data step in which they are defined. therefore, 
it is necessary to define an array within every data step where array will be referenced. ;

data convert;
	set temperature;
	array tem{12} tem1 - tem12;
	array cel{12};
	do i = 1 to 12;
		cel{i} = 2* tem{i};
	end;
run;	

proc print data=convert ;run;
