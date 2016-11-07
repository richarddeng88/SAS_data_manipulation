*Q17;
data WORK.GEO; 
infile datalines; 
input City $20.;
if City='Tulsa' then State='OK'; 
Region='Central'; 
if City='Los Angeles' then State='CA';
Region='Western'; 
datalines; 
Tulsa
Los Angeles
Bangor
;
run; 
porc print data = geo;run;

*Q1;
data WORK.TOTAL; 
set WORK.SALARY;
by Department Gender; 
if First.<_insert_code_> then Payroll=0; 
Payroll+Wagerate; 
if Last.<_insert_code_>; 
run;

*3;
data WORK.INFO; 
Day="01" ;
Yr='1961' ;
X=mdy(Day,01,Yr) ;
run; 
proc print;run;

*9;
data course;
input exam;
datalines;
49.3
50.1
55.7
;
run;
proc format;
value score 1 - 50 = ‘Fail’
            51 - 100 = ‘Pass’;
run;
proc report data =course nowd;
column exam;
define exam / display format=score.;
run;



*11;
proc format;
value agegrp 
   low-12 ='Pre-Teen'
   13-high = 'Teen';
run;

proc print data = sashelp.class (firstobs=9 obs=20);run;

proc means data=SASHELP.CLASS;
var Height;
class Sex Age; 
format Age agegrp.;
run;

proc means data=SASHELP.CLASS min max mean maxdec=1;
var Height;
class Sex Age; 
format Age agegrp.;
run;



*21;
data products;
input id $ price productType $ sales return;
datalines;
K12S      95.50    OUTDOOR           15          2 
B132S      2.99    CLOTHING         300         10 
R18KY2    51.99    EQUIPMENT         25          5 
3KL8BY     6.39    OUTDOOR          125         15 
DY65DW     5.60    OUTDOOR           45          5 
DGTY23    34.55    EQUIPMENT         67          2 
;
run;

data WORK.OUTDOOR WORK.CLOTH WORK.EQUIP; 
set WORK.PRODUCTS;
if Sales GT 30; 
if  ProductType EQ 'OUTDOOR'  then output WORK.OUTDOOR;
else if ProductType EQ 'CLOTHING' then output WORK.CLOTH;
else if ProductType EQ 'EQUIPMENT' then output WORK.EQUIP;
run;











