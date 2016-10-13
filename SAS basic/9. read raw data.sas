	* ################# 4.1 reading delimited raw data files########################
	>the term standard data refers to character and numeric data tht SAS recognizes automatically. 
	>the term non standard data refers to character and numeric data tht ss does not recognize
automatically. 
		> to read in nonstandard data, you must apply an informat general form of an informat, which 
is the instruction that specify how SAS reads raw data. 
			> $ indicates a character informat
			> w is an optional field width. if no width is sepcified, sas uses the default width. 
			> . is the required delimiter. 
			> d is an optional decimal specification for numeric informats. 
			
	example : COMMAw. reads numeric data ($4,242) and strips out the dillar signs and commas.
			  MMDDYYw. reads dates in the form 12/31/2012
			  DATEw.   reads dates in the from 29Feb2001

	colon: the colon signals that SAS should read from delimiter to delimiter. if the colon
is omitted, sas reads the length of the informat. ;

data info;
length id $ 5;
input id $ inservice date9. pass cargocap;
datalines;
50001 4feb1989 123 435
50002 11nov1989 152 540
;
run;
proc print data=info;run;
	
	
	
	