data rich.demo;
input weight;
sum_weight+weight;
n+1;
average=sum_weight/n;8
datalines;
1 
2
3
4
5
6
7
8
9
10
;
run;

proc print;
run;

*2.9;
data park;
input parkname $ 1-22 state $ year @40 acreage Comma9.;
datalines;
Yellowstone            ID/MT/WY 1872     4,065,493
Everglades             FL 1934           1,398,800
Yosemite               CA 1864           760,917
Great Smoky Mountains  NC/TN    1926     520,269
Wolf Trap Farm         VA       1966     130
;
proc print data=park;
run;

*2.10;
data names;
input @'School:' school $ @'Time:' racetime :stimer8.;
datalines;
Bellatorum School: CSULA Time: 1:40.5
The Kraken School: ASU Time: 1:45.35
Black Widow School: UoA Time: 1:33.7
Koicrete School: CSUF Time: 1:40.25
Khaos School: UNLV Time: 2:03.45
Max School: UCSD Time: 1:26.47
Hakuna Matata School: UCLA Time: 1:20.64
Prospector School: CPSLO Time: 1:12.08
Andromeda School: CPP Time: 1:25.1
Kekoapohaku School: UHM Time: 1:24.49
;
run;
proc print data=names;
run;

*2.11;
data weather;
input city $ stata $ / normalhigh normallow #3 recordhigh recordlow;
datalines;
Nome AK
55 44
88 29
Miami FL
90 75
97 65
Raleigh NC
88 68
105 50
;
run;
proc print data=weather;
run;

*2.12;
data rainfall;
input city $ state $ normalrain meandailyrain @@; *@@ continue to read the line;
datalines;
Nome AK 2.5 15 Miami FL 6.75 
18
newyrok NY 3.5 19 cincinatti OH . 24
Raleigh NC . 12
run;
proc print data=rainfall;
run;

*2.13;
data surface;
input type $ @;  *@ tells SAS to hold that line of data;
if type = 'freeway' then delete;
input name $ 9-37 AMTraffic PMTraffic;
datalines;

freeway                 408          3684 3459
surface Martin Luther King Jr. Blvd. 1590 1234
surface Broadway                     1259 1290
surface Rodeo Dr.                    1890 2067
freeway           608                4583 3860
freeway 808                          2386 2518
surface Lake Shore Dr.               1590 1234
surface Pennsylvania Ave.            1259 1290
;
proc print data=surface;
run;

*2.15;
data testing;
infile 'c:\users\richard\desktop\example.txt' DLM=',' DSD missover; * missover tells sas if it runs out
						of data, don't go to the next line. Insteat, assign missing value;
input bandname :$30. gigdate :MMDDYY10. egith nine ten eleven;
run;
proc print data=testing;
run;

*2.16;
proc import datafile='c:\users\richard\desktop\data.csv' out=musics4;
run;
proc print data=musics4;
title 'customers at each gig'
run;

*2.21;
DATA funnies (LABEL = 'Comics Character Data');
INPUT Id Name $ Height Weight DoB MMDDYY8. @@;
LABEL Id = 'Identification no. '
Height = 'Height in inches'
Weight = 'Weight in pounds'
DoB = 'Date of birth';
INFORMAT DoB MMDDYY8.;
FORMAT DoB WORDDATE18.;
DATALINES;
53 Susie 42 41 07-11-81 54 Charlie 46 55 10-26-54
55 Calvin 40 35 01-10-81 56 Lucy 46 52 01-13-55
;
* Use PROC CONTENTS to describe data set funnies;
PROC print DATA = funnies;
proc contents data=funnies;
title 'funnies informations';
RUN;
