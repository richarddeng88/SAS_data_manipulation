*1;
data a;
input dept $ gender $ salary;
datalines;
A M 20
A F 39
A M 23
B M 93
B F 73
B M 23
C F 32
C F 43
C M 32
;
run;
data total;
set a;
by dept gender;
if first.gender then payroll=0;
payroll + salary;
if last.gender;
run;
proc print data=total;run;

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


*31;
data WORK.SPORTS_INFO;
length Fname Sport1-Sport3 $ 10;
infile datalines dlm=',';
input Fname $ Sport1 $ Sport2 $ Sport3 $;
datalines;
Kim,Basketball,Golf,Tennis
Bill,Football
Tracy,Soccer,Track 
;
run;
proc print data=WORK.SPORTS_INFO;run;
proc contents;run;



*35;
data ex;
input x y;
datalines;
5  2
3  1
5  6
;
run;

data
SASUSER.ONE 
SASUSER.TWO 
OTHER;
set ex;
if X = 5 then output SASUSER.ONE;
if Y < 5 then output SASUSER.TWO;
output;
run;

proc print data=sasuser.one;run;
proc print data=sasuser.two;run;
proc print data=other;run;


*36;
data WORK.EMPLOYEE;
infile datalines;
input 
@1  FirstName $
@15 StartDate mmddyy10.
@25 Department $;
datalines;
Xing           2 19 2004 ACCT
Bob            5 22 2004 MKTG
Jorge          3 14 2004 EDUC
;
run;

proc print data=employee;format startdate date9.;run;
proc print data=employee;format startdate mmddyy10.;run;


*38;
data ex;
input x y $ z;
datalines;
1  A  27 
1  A  33 
1  B  45 
2  A  52 
2  B  69 
3  B  70 
4  A  82 
4  C  91 
;
run;

data WORK.TWO;
set ex; 
by X Y;
if First.y;
run;
proc print data=WORK.TWO noobs; *noobs don't show you the column of observations number (1,2,3,4,5,....);
run;



* 40;
data WORK.PRODUCTS;
	Prod=1;
	do while(Prod LE 6); 
		Prod + 1;
		output;
	end;
run; 
proc print data=products;run;



*41;
*  CAT does not remove leading or trailing blanks, and does not
   insert separators.

   CATX strips both leading and trailing blanks, and inserts
   separators. The first argument to CATX specifies the separator.

CATX(delimiter, item-1 <, … item-n> )
	**delimiter**
	specifies a character string that is used as a delimiter between concatenated items.

	**item**
	specifies a constant, variable, or expression, either character or numeric. If item is numeric, then its 
value is converted to a character string by using the BESTw. format. In this case, SAS does not write a note 
to the log. For more information, see The Basics.
;

data WORK.PHONES; 
	input EmpLName $ EmpFName $ Dept $ Phone $ Extension; 
	FullName=CATX(',',EmpFName,EmpLName); 
	FullName1=EmpFName!!EmpLName;
	datalines;
	Stevens James SALES 304-923-3721 14
;
run; 
 proc print data=phones;run;

*47;
data CellCounts;
input R C Count @@;
datalines;
1 1 5   1 2 3
2 1 4   2 2 3
;
run;

proc freq data=CellCounts;
tables R*C;
run;

proc freq data=CellCounts;
tables R*C /nocol norow;
run;


*48;
data WORK.TEST;
*drop City;
	input 
	Name $ 1-14 /
	Address $ 1-14 / 
	City $ 1-12 ;
	if City='New York  ' then input @1 State $2.; 
	else input; 
datalines; 
Joe Conley 
123 Main St.
Janesville 
WI
Jane Ngyuen
555 Alpha Ave. 
New York 
NY
Jennifer Jason 
666 Mt. Diablo 
Eureka
CA
;
proc print data=test;run;



*60;
data products;
input ProdId  $  Price    ProductType $   Sales    Returns ;
datalines;
  K12S      95.50    OUTDOOR           15          2 
  B132S      2.99    CLOTHING         300         10 
  R18KY2    51.99    EQUIPMENT         25          5 
  3KL8BY     6.39    OUTDOOR          125         15 
  DY65DW     5.60    OUTDOOR           45          5 
  DGTY23    34.55    EQUIPMENT         67          2 
;
run;

data WORK.REVENUE(drop=Sales Returns Price);
set WORK.PRODUCTS(keep=ProdId Price Sales Returns); 
Revenue=Price*(Sales-Returns);
run;
proc print data=revenue; run;


*66;
data WORK.SALES; 
 do Year=1 to 5; 
    do Month=1 to 12;
       X + 1;
    end;
 end;
run;
proc print data=sales;run;


*67;
data old;
input x;
datalines;
1
2
.
13
22
;
run;
proc print data=old;run;

data WORK.NEW; 
set WORK.OLD(keep=X);
if X < 10 then X=1; 
else if X >= 10 AND X LT 20 then X=2; 
else X=3;
run; 
proc print data=new;run;


*68;
data new;
 set old;
 length x $6;
 CharEmpid=x;
run;



