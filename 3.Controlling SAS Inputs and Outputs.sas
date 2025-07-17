/*Use Drop and Keep Statements to control inputs and outputs
Step1: Read the entire file but dropped in the final dataset -- Dataset Option
Step2: Did not read the entire file, dropped as soon as the variable was found. The 
		variable won't be available for PDV to see and sas won't be able to process it -- Dataset Option
Step3: Drop or keep statments impact all datasets mentioned in the datasteps (when you use otherwise)-- Statement
	   Note: 
	   1. Statements are applied before any set statement. 
	   2. If you decide do drop or keep the same variable it will give you a warning
*/


/*Step1*/
data cars1 (drop=Make);
set sashelp.cars;
run;


/*Step2*/
data cars2;
set sashelp.cars(drop=Make);
run;



/*Step3*/
data cars3;
keep Make Model;
set sashelp.cars;
run;

data cars4;
drop Make Model;
set sashelp.cars;
run;



