libname richard 'C:\Users\richard\Desktop\sas'; * create a library;

data richard.admit;
input id name $ sex $ age date height weight actlevel $ fee;
datalines;
2458 Murray,w M 47 1 72 168 HIGH 85.2
2433 herry M 34 13 82 1987 LOW 115.2
2462 ALMERS.C F 34 3 66 152 HIGH 124.8
2510 BONAVENTURE.T F 37 11 61 123 LOW  149.7
2310 tonny M 67 51 91 93 MIDDLE  189.2
;
run;
proc print data =richard.admit;run;


* PROC SORT;
 	* create a new dataset, and will not change the original data set;
proc sort data=richard.admit out=ad;
by age descending date; * if for ascending, only by variable_name, if descending, add "descending";
run;
proc print data=ad;
sum fee; * it will sum up the fee variable; 
run;



* there is by option in proc print;
proc sort data=richard.admit out=ad; 
by actlevel;
run;
title1 "customer records";
footnote "RD work";

proc print data=ad;
sum fee;
by actlevel; * usually 'actlevel' is categorical, then it print out different level seperately;
id actlevel; * it will use 'actlevel' as the id;
pageby actlevel;
run;

title;footnote; * cancel title and footnote;



* PROC PRINT,label the variable names and change the printing format;
proc print data=ad label; * temeperary assign a label in the report;
var id age date weight fee;
label fee='Admission Fee'; * label was not saved in the dataset, only effective in the this procedure;
label age='Age of Patient';
format fee dollar8.2;
run;


* permanetly assign labels and formats into the dataset;
data richard.ad; set ad;
label fee='Admission Fee';
label age='Age of Patient';
format fee dollar8.2;
run;
proc print data=richard.ad label;
run;


proc print data=ad noobs; * by default the report display obs colum, "noobs" is to remove the default 
							Obs column that displays observation numbers.;
var id age date weight fee name;
where age ~= 34;
where name contains "BO";
run;

proc print data=ad ; 
id id age; * identify the observations based on the variable "id", "age".;
var id age date weight fee;
run;

proc print data=ad; 
var id age date weight fee name;
where age ~= 34 or name ? "O";
run;


* make values; 
data richard.one; set ad;
if date > 40 then delete;
retain already 990; * give the already a value 990;
already + fee;
format already dollar8.2;

length status $ 8;
if age >45 then status = 'old';
else if 35<=age<=45 then status='middle';
else status='young';
run;

proc print data=richard.one;
run;

proc print data=ad;run;
