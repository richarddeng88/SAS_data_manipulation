Data mdata;
Input Group	NetWt Count;
Datalines;
2 51.8 20.0
3 54.3 23.0
	;
run;


*print out the data;
proc print data =mdata;
format Group dollar7.;
var Group Count;
run;

*display the descriptor protion of a sas data set;
proc contents data=mdata;run;
