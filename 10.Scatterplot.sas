/*
	Scatterplot: Reveals relations between two or more procedures
	
	Procedure used: Sgscatter
	- Give data name
	- compare y = [variable to compare]
	- x = [all x variables that you need to compare against y]
	- group = type --- group by type , i .e . compare for each type
	
	Proc Means:
	Used to Summarize the graph in form of table
	- Var - Specifies variable with respect to which means need to be calculated
*/

ods graphics / reset imagemap;

proc sgscatter data = sashelp.cars;
	compare y = MPG_Highway
		    x = (Weight Horsepower Enginesize)
		    / group = Type;
run;


ods graphics / reset;

/*Just frequency of the dataset*/
proc means data=sashelp.cars;
Var Horsepower;
run;