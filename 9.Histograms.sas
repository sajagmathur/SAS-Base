/*
	Histogram: Frequency distribution of a numeric variable
	
	Procedure used: Sgplot
	- Give data name
	- GIVE histogram "column name"
	- giove density "column name"
	
	Proc Means:
	Used to Summarize the graph in form of table
	- Var - Specifies variable with respect to which means need to be calculated
*/

ods graphics / reset imagemap;

proc sgplot data = sashelp.cars;
	histogram Horsepower;
	density Horsepower;
run;


ods graphics / reset;

/*Just frequency of the dataset*/
proc means data=sashelp.cars;
Var Horsepower;
run;