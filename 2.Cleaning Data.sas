/*Cleaning Data
	1. Using Assignment Statements:
		Suppose your make is supposed to be maruti, assign it maruti
		If we need upper case, use upcase function.
		Propcase: first letter in each word is uppercase
	
	2. Clean Data using Conditionals
		Example, if Model for SUV is supposed to be ALTO use if then
		Example: If Missing(Age) then age = 99;
		


*/

data cars1;
Set sashelp.cars;
Make=upcase('Maruti');
If Type = "SUV" Then Type = propcase("ALTO");
run;
