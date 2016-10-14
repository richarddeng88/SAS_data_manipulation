* ############# understand that there are functions for char, numeric and date type#########;

	* A sas function is a routine that performs a computation or system manipulation and returns a value. 
	* the RIGHT function returns its argument right-aligned. Trailing blanks are moved to the
start of the value. ;

data flyers;
	input id $ name $10. address $15.;
	datalines;
	M3134 Farr,Sue  15 harvey rd.  
	F161 Mason,Ron  442 Glen Ave.  
	F212 Ruth,Guo   2491 Brady St.  
	;
run;
proc print data=flyers;var id;run;

	* the SUBSTR function is used to extract or replace characters. 
>>> newvar = substr(string, start<, length>)
			
	* the scan function returns the nth word of a character value. it is used to extract words
from a character value when the relative order of words is known., but their starting positions 
are not. 
		>> if n is negative, scan selects the word in the character string starting fromthe end of string.;
		
data test;
	drop name;
	length gender $10.;
	set flyers;
	if substr(id,1,2)='M' then gender = 'Mr.';
	else gender = 'Ms.';
	first_name = scan(name,1,',');
	last_name = scan(name,2, ',');
run;
proc print data=test;run;

	* the concatenation operator joins character strings. Depending on the characters available ono your 
keyboard, the symbol to concatenate character values can be two exclamation point(!!). 

	* the TRIM function removes trailing blanks from its argument. 

data flyers1;
	input id $ status $38. address $15.;
	datalines;
	M3134 Silver 1998, Gold 2000                15 harvey rd.  
	F161  Bronze 1999,Silver 1992,Silver 2001   442 Glen Ave.  
	F212  Bronze 1994, Gold 1996, Silver 1998   2491 Brady St.  
	;
run;
proc print data=flyers1;run;
	
	* the FIND function searches for a specific substring of characters within a character string
that you specify and returns its location.
		>> position = FIND(target, value<, modifiers>)
		>> the FIND function returns: the starting position of the first occurrence of value
within target, if value is found. 
		>> 0, if value is not found.
		
		a modifier can be the value I or T. I indicates that the search is case-insensitive. 
T indicates that the search ignores trailing blanks. if the argument is omitted, the search is 
case-sensitive and trailing blanks are taken into consideration. s
		;
		
* the following code only returns records containing the 'Silver' in the status;
data info2;
	set flyers1;
	if find(status,'Silver','I') > 0;
	index = index(status,'Gold');
run;
proc print data=info2;run;
		
	* the INDEX function searches a character argument for the location of a specified character
value and returns its location. 		
	

* ################# converting variable type #####################################;

	* you can convert data type :
	-INPUT character-to-numeric conversion.
		>> num_var = input(source, informat)
	-PUT   numeric-to-character conversion. 
		>> char_var = put(source, format)
		;
		
data conversion;
	a='32,000';\
	b='03may2008';
	a1 = input(a, comma6.);
	b1 = input(b, date9.);
	
	c = 55000;
	d =366;
	c1 = put(c, dollar7.)
	d1 = put(d, date9.)
run;
proc contents data=conversion;run;
proc print data=conversion;run;

	




