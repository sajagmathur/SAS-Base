/*
Use obs= and firstobs= options to limit the number of observations in input  / output 	
 - obs = : specifies the number of the last observation that is processed by sas. obs is not the number of observations.
 - firstobs=: number of the first observation that the sas will process. firstobs<obs when used together
 - Step 1 uses firstobs and obs to extract data in the data step
 - Step 2 uses firstobs and obs in the procedure step to limit the observations given as output
 In case you use where statement in the print procdure, where acts first, then firstobs and obs run
*/


/*Step 1*/
data cars1;
set sashelp.cars (firstobs=min obs=10);
run;

/*Step 2*/
proc print data = sashelp.cars (firstobs=10 obs=20) noobs;
run;

/*Step 3*/
data cars1 (drop=Make);
set sashelp.cars;
run;

/*Step 4*/
data cars1 (drop=Make);
set sashelp.cars;
run;