/* Data Errors in Raw Data:

	- Usually, there are errors in Data Import
	- These occur whene we use different SAS Statements than expected for data.
	How are these handled?
		When sas sees these errors, it continues execution and puts a note in the program log.
		Input record is recorded in logs.
		Values in the SAS Observation are logged
		Missing values are assigned to variable
		Execution Continues
	
	Example:
		Fname,Lname, Age,Office_loc
		Dave,Smith,Unknown,London
	- Here Unknown was supposed to be numeric and is wrong type.
	- Sas logs a note, logs input values, assigns missing values to age and  moves on.
	
	How to track these errors:
	Note: LOST CARD -- When sas can't find a value, it inputs the next value to office, then searches for office in next line.
	If there is no next line, it gives lost card.
	To fix it, fix the source.
	
Validating Data Errors:
	- Use Conditionals:
		If then statement: If [EXPRESSION] Then statement;
		Example: 
				if missing(age) then Age =33;;
				if missing(Region) then Region = 'North America';
				
	- Use proc print with var and where.
		Var will select specific variables, where will filter out the rows that you wish to change
	
	- Freq procedure to validate data:
		nlevels: provides a number of distinct values in the table
		table: will build out table for only specific variables
		From this, we will know how many times each variable is duplicated and remove the duplicate values.
		Eg: Acura	7	1.64	7	1.64 --> has 7 levels

	- Using means and var to do data validaton:
		n nmiss min max options help us get the missing, non missing minimum and max observations
		Default: N	Mean	Std Dev	Minimum	Maximum
		var - specifies which variables you wish to analyze: Default - All numeric variables
		You can spot missing values, extereme max and extereme minimum from this

	- Using Univariate and Var:
		Used to generate descriptive statistics
		var salary --> means you are only analyzing salary
		nextrobs=1  --> Sets the number of extreme variables that you wish to see.
		You can set from 0 to half the max no. of operations. If 0, no extreme observations are printed.
	
		Output:
			Moments Table
				Non Missing Rows of data (N)
				Kurtosis etc.
			Basic Statistical Measures:
				Mean, Median, Mode, STDEV, Variance
				Range, Interquartile Range
			Studen's T test on mean=0
			Extremes:
				Lowest and highest extremes
			Missing Value:
				Tells the missing values
			Analyze this to understand which data is wrong.
*/

/*Proc print with where and var */
proc print data = sashelp.cars;
Var make model;
Where make = 'Acura';
run;

/*Proc Freq*/
proc freq data=sashelp.cars nlevels;
tables make;
run;

/*Conditionals to replace*/
data cars1;
 set sashelp.cars;
 If make = 'Acura' then make = 'NotAcura';
run;

proc freq data=cars1 nlevels;
tables make;
run;

/*Using proc means and var on sashelp.cars */

proc means data=sashelp.cars n nmiss min max;
var MSRP;
run;

/*Using proc univariate */

proc univariate data=sashelp.cars nextrobs=1;
var MSRP;
run;