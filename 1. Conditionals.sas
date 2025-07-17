/*
Using conditionals for data manipulation:
	1. IF-Then statement
	2. If-Then do statement is a multiline if then statement
	3. If - Else is used to specify the else condition
	4. Using If and where --> Use where to subset observations and use if to further operations
		Use where first to save time.
	5. Subsetting using If Then Delete Statement
		
*/


data cars1;
set sashelp.cars;
run;


/*1. If then statement
  2. If then do statement
  3. If then else statement
  4. If missing
 */

data ifthencars;
set cars1;
If Make = 'Audi' Then Make = 'Maruti';
If MSRP>35000 Then
		Highprice=2;
	Else If MSRP>30000 Then
		Highprice = 1;
	*Else Highprice=0;
If missing(Highprice) Then Highprice = 999;	

If Type = 'SUV' Then
	do;
	Type = 'Pikachu';
	Make = 'Ash Kechum';
	length highprice 8.;
	
	end;
run;


/*If where statements. We used if and where for subsetting purposes*/

data ifwherecars;
	set sashelp.cars;
	Where Origin = 'Asia';
	If Make = 'Acura';
run;

/*5. Subsetting using If Then Delete */

data ifthendeletecars;
	Set sashelp.cars;
	If Make = 'Acura' then Delete;
run;