Data mdata;
Input Group	NetWt Count;
Datalines;
2 51.8 20.0
3 54.3 23.0
	;
run;

*print out the data;
proc print data = work.mdata;
format Group dollar7. NetWt dollar7;
run;

*display the descriptor protion of a sas data set;
proc contents data=mdata;run;
