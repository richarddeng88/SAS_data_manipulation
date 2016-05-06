libname richard 'C:\Users\q.deng\Desktop\sas'; * create a library;

* flower dataset is in the richard library;
%let type=Ginger;

*###############################################################################;
%macro sample;
	proc sort data=richard.flower;
	by salequantity;
	run;
	
	proc print data=richard.flower;
	format saledate worddate18. saleamount dollar10.2;
	run;

%mend sample;

proc print data=richard.flower;
format saledate worddate18. saleamount dollar10.2;
run;

data t; set richard.flower;
where variety="&type";
run;
proc print data=t;
run;

%sample

*###############################################################################;
%macro select(cus_name= ,cus_name2=, sorttype= );
	
	proc sort data=richard.flower out=newform;
	by &sorttype;
	where customerid="&cus_name" or customerid= "&cus_name2";
	run;

	proc print data=newform;
	title "orders of new form";
	footnote;
	run; 

	proc means data=newform min mean median range std max;
	var salequantity saleamount;
	class customerid;
	title " descriptive result";
	run;

%mend select;

%select(cus_name=240W,cus_name2=356W, sorttype=Variety)
%select(cus_name=188R,cus_name2=356W, sorttype=saleamount)

*###############################################################################;
