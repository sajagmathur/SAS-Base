/*Part1: we will try to reado out using xlsx file */
/*While reading excel, used valid name option as any since excels have spaces */
options validvarname=any;

/*Create libref using xlsx engine. Specify the name  */
libname myxl XLSX "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/snacks.xlsx";
libname myprj1 "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/";

/* Expose the member data names from the xlsx*/
proc datasets lib=myxl; quit;

/* Note that the library here is the excel file, the sheet can be directly assigned to a dataset */
data myprj1.snacks_final;
	set myxl.snacks;
run;

/*Clear the library*/

libname myxl clear;


/*Part2: Export to excel and create an excel*/

libname myxl1 XLSX "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/snacks_final.xlsx";

/*Directly write sheets*/
data myxl1.employees;
	set myprj1.snacks_final;
run;

libname myxl1 clear;
