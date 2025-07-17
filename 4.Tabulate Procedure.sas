/*Tabulate Procedure:
One Dimentional Table:
	- You need to specify which variable you need the table for in the table statement
	-You also need to specify what classes you need data for

Two Dimentional Table:
	- Specify Two Dimentions instead of one
	- You need a row and column dimension
	
Three Dimension Table:
	- Three dimensions, page, row and column
	
Note: 
	1. Class is not separated by commas but table is!
	2. Class or var statement must be provided. But both statements are not required
	3. Class Variable: Can be num or char
	4. Var: Analysis Variables are always numeric and typicallhy continuous: example - Sales
	5. Multiple ways can be used --> Not being discussed here
*/

data ds1;
set sashelp.cars;
run;

proc tabulate data = sashelp.cars;
Class Type;
Table Type;
title1 'One Dimentional Table: Only Column Dimension';
run; 


proc tabulate data = sashelp.cars;
Class Type Origin;
Table Type, Origin;
title1 'Two Dimentional Table: Row and Column Dimension';
run; 

proc tabulate data = sashelp.cars;
Class Make Type Origin;
Table Make, Type, Origin;
title1 'Three Dimentional Table: Page, Row and Column Dimension';
run; 



