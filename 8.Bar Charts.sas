/*
	Bar Charts: Show the relative magnitute of different variablers and are used to compare relative numeric
	values of multiple variables.
	
	Procedure used: Sgplot
	- Give data name
	- hbar: horizontal bar, type - bar on type variable frequrncies
	- response: HP, use mean stat -- i.e. mean of horse power for different type is plotted

	Proc Means:
	Used to Summarize the graph in form of table
	- Var - Specifies variable with respect to which means need to be calculated
	- Class specifies the split
*/

ods graphics / reset imagemap;

proc sgplot data = sashelp.cars;
	hbar Type / response = Horsepower stat = mean;
run;


/*Add a layer by grouping the data by origin
groupdisplay - can specify group as cluster or stack
cluster is better than stack
 */

proc sgplot data = sashelp.cars;
	hbar Type / response = Horsepower stat = mean group = origin groupdisplay=cluster;
run;


proc sgplot data = sashelp.cars;
	hbar Type / response = Horsepower stat = mean group = origin groupdisplay=stack;
run;


/*Try out a vertical bar chart*/
proc sgplot data = sashelp.cars;
	vbar Type / response = Horsepower stat = mean group = origin groupdisplay=cluster;
run;


ods graphics / reset;

/*Just frequency of the dataset*/
proc means data=sashelp.cars;
Var Horsepower;
class type;
run;