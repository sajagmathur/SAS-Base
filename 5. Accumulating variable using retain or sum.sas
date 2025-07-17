/*Accumulating variable holds the value of some other variable from one observation to the next:
 - Retain retains totalMSRP and sets it to 0
 - Adds MSRP at each step
 - 
*/

data mycars;
set sashelp.cars(firstobs = min obs=10);
retain totalMSRP 0;
totalMSRP = totalMSRP + MSRP;
run;


/* Create accumulating variable using sum 
- By default, sum initiates the variable to 0 and then adds the variable
- It ignores the missing value at the beginning (missing values are set to 0)
- This is equivalent to sum function + retain statement
- you can still use retain to set a first initial value tbh! :P
*/

data mycars (keep = make model msrp totalmsrp);
set sashelp.cars(firstobs = min obs=10);
retain totalMSRP 10;
totalMSRP + MSRP;
run;



proc print data=mycars;
run;



