libname richard 'C:\Users\richard\Desktop\sas'; * Reference a SAS data library;
filename card 'C:\Users\richard\Desktop\sas\card.dat'; * Reference an external file;

*read a .dat file;
data richard.card;
infile card;
input card_id disp_id type $ issued_date $ ;
run;
proc print data=richard.card (obs=10);run;

*wriite a .dat file;
data write;
set card;
file 'c:\users\richard\desktop\sas\card.dat';
put card_id disp_id type $ issued_date $ ;
run;


data richard.vote; *Name a SAS data set;
infile vote obs=3;      *Identify an external file;
input name $16. v1 v2 v3 v4 v5 v6;
if v4>30;
run;
proc print;
run;


data richard.vote_1; *Name a SAS data set;
infile 'C:\Users\q.deng\Desktop\sas\vote.dat';      *Identify an external file;
input name $16. v1 v2 v3 v4 v5 v6;
total = v1+v2+v3;
TestDate='27apr2016'd;
format Testdate $date10.;
if v4>30 then level = 'high';
else level = 'low';
n=_N_; 
error = _error_;
run;
proc print;
sum total;
run;


* write data into raw file;
data test;
set richard.vote_1;
file 'C:\Users\richard\Desktop\sas\vote_1.dat';
put name $16. v1 v2 v3 v4 v5 v6;
run;


