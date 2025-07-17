/*
If you want sum by groups:
	1. Sort data by a by variable
	2. Set grouped cars to mycars; give a by variable; 
	3. First and Last -- Variables explained below
*/

/*Step1: Sort the Data */
data mycars1;
set sashelp.cars;
run;

proc sort data=mycars1;
by Origin;
run;

/*
First Dot: The by variable in Origin always creates two temporary variables first and last.
They help us identify the first and last observations. 
 Steps: First set accumulating variable to 0 at the start of each group -- If first.Origin then groupedMSRP=0
 Add variables (groupedMSRP + msrp)
 Only record last observation in the variable
 Output will be the last value that is accumulated.
*/
data groupedcars (keep=Origin GroupedMSRP);
set mycars1;
by Origin;

	If first.Origin then groupedMSRP=0;
	groupedMSRP+msrp;
	if last.Origin;
run;


/*Summarise data by multiple groups
	1. Specify multiple by variables in proc sort: First variable is called primary sort variable
	Second is called secondary sort variable
	2. Then use do loop along with first and last variables as shown below to summarize data by group.
*/
 
proc sort data=mycars1;
by DriveTrain Origin;
run;

data groupedcars (keep=DriveTrain Origin GroupedMSRP numcars);
set mycars1;
by DriveTrain Origin;

	If first.Origin then do;
	 groupedMSRP=0;
	 numcars=0;
	end;
	groupedMSRP+msrp;
	numcars+1;
	if last.Origin;
run;

proc print data=groupedcars;
run;

