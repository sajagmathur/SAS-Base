/*
Assigning a libref 	to a relational dataset;
	- Set sashelp.cars to a new dataset
*/

libname prj2 "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets";

data prj2.mydata;
	Set sashelp.cars;
run;

/* Reference a data source using sas two level name 


*/

libname prj2 "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets";

data prj2.us_autos;
	Set prj2.mydata;
	Where Origin="Asia";
run;

proc print data = prj2.us_autos;
run;