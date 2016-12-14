*7;
data a;
input id 5. @10 price;
datalines;
21345     $23.53
;
run;
proc print data=a;run;


*8;
data a;
input type $ 1-5 +1 color $;
datalines;
daisyyellow
;
run;
proc print data=a;run;


*13;
data co;
infile datalines dsd;
input style $ @;
if style = 'CONDO' or style = 'RANCH' then
input sqfeet bedrooms baths street $ price : dollar10.;
datalines;
RANCH,1250,2,1,Sheppard Avenue,"$64,000"
SPLIT,1190,1,1,Rand Street,"$65,850"
CONDO,1400,2,1.5,Market Street,"80,050"
TWOSTORY,1810,4,3,Garris Street,"$107,250"
RANCH,1500,3,3,Kemble Avenue,"$86,650"
SPLIT,1615,4,3,West Drive,"94,450"
SPLIT,1305,3,1.5,Graham Avenue,"$73,650"
;
run;
proc print data=co;run;

*14;
data co;
infile datalines dsd;
input style $ @;
if style = 'CONDO' or style = 'RANCH';
input sqfeet bedrooms baths street $ price : dollar10.;
datalines;
RANCH,1250,2,1,Sheppard Avenue,"$64,000"
SPLIT,1190,1,1,Rand Street,"$65,850"
CONDO,1400,2,1.5,Market Street,"80,050"
TWOSTORY,1810,4,3,Garris Street,"$107,250"
RANCH,1500,3,3,Kemble Avenue,"$86,650"
SPLIT,1615,4,3,West Drive,"94,450"
SPLIT,1305,3,1.5,Graham Avenue,"$73,650"
;
run;
proc print data=co;run;








































