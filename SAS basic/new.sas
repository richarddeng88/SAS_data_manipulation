libname richard 'C:\Users\q.deng\Desktop\sas'; * create a library;

data richard.new;
input name $ age;
datalines;
rich 29
cuihua 56
;
run;

proc print data=richard.new;
run;
proc contents data=richard._all_ nods;
run;
proc contents data=richard.new varnum;
run;

proc options option=yearcutoff option=obs option=firstobs; *take a look at the default options. ;
run;

