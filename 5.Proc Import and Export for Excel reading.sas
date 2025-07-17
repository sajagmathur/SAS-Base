/*Import Dataset from Excel using Import Statement. Create output dataset */

libname myprj1 "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/";

/*Export snacks data as excel - xlsx*/

proc export data=sashelp.Snacks
    outfile="/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/snacks.xlsx"
    dbms=xlsx;
run;

/*Export snacks data as excel - xls*/
proc export data=sashelp.Snacks
    outfile="/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/snacks.xls"
    dbms=xls;
run;

/*Write import statement
Datafile: Name of location + File that you wish to import
out - Output location
dbms - databse type - xlsx here
replace - will replace any existing dataset
*/

proc import datafile = "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/snacks.xlsx"
	out = myprj1.snacks_data
	DBMS = xlsx
	REPLACE;
run;

/* Print the results */
proc print data = myprj1.snacks_data;
run;

/*Part 2 - use xls formatted thing as older version of excel*/

proc import datafile = "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/snacks.xls"
	out = myprj1.snacks1
	DBMS = xls
	REPLACE;
run;

/* Print the results */
proc print data = myprj1.snacks1;
run;