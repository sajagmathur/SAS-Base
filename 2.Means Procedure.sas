/*Step 1:
Use Means Procedure:
	- Compute Descriptive statistics - N, Mean, Stdev, Minimum, Maximum
	- var: Which variables you wish to run it for
	- Class: Classification Variables.
		Class statement adds nobs column which specifies the number of observations in that class


*/
data ds1;
set sashelp.cars;
run;


proc means data=ds1;
var MSRP Invoice;
Class Make;
run;