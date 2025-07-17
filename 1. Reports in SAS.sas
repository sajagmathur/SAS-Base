/* Reports are generally created using proc step:
	1. Proc Means
	2. Proc Print
	3. Proc Freq
*/

data ds1;
Set sashelp.cars;
StartDate = Input("&sysdate9.",anydtdte10.);
run;



/*Proc Print (Simple):
Produces simple listing of data. This is without any subsetting
*/

proc print data = ds1;
run;

/*Proc Freq (Frequency Distribution):
Gives the frequency tables for each variable:
 	- Frequency
 	- Percent
 	- Cumulative Frequency
 	- Cumulative Percent
*/

proc freq data = ds1;
run;

/* Proc Means 
 - N
 - Mean
 - Stdev
 - Minimum
 - Maximum
 
 */
proc means data =ds1;
run;


/***Enhanced Report in SAS ****/

/* 
1. Add Options, Titles and Footnotes
2. Use ODS or Output Delivery System

Step1: Write print statement with vars to print. This will only print the variables specified in the var statement.
Step2: specify an option NoObs -- This will remove the number of observations from the output
Step3: Give a title statement below the proc to give it a title
Step4: 
	- Set options - ls=64 nocenter (will not center data) nodate (will not print date in ouput)
	- set title1. Simlarly you can give title2 etc. You can have upto 10 titles.
	- set footnote. Similar to titles. You can have upto 10 footnotes. They remain in effect until they are changed / cancelled or you end the sas session
	- Footnote Properties: colour = red, height = 9pt, bold. Finally - 'Internal Use Only' will be the text displayed. Similarly, system's date is also represented as shown
Step5: Use Label Statement to alter column headings. See proc print for reference. Note that you need to write label as well at the bottom.
	- Note: Labels can be upto 256 characters and they are automatically used by procedures like proc freq
	- In print proc - You need to enable lable option
	- Temporary labels are assigned in procs, permanent labels are assigned in data statement
	- Split = Option - If you have multiple words on header, you can write each word on a different line. In this case,
	  split has been done wherever there is a space. You can specify any other character

Step6: Assigns formats to statements. It assigns format to things, but does not alter the values. Done using format statement.
	- Temporary formats overwrite permananet formats when used in procs (temporarily!)	  

Step7: Subsetting and Grouping Reports using Where and By Statements:
	- Where: Used for subsetting. Can be used with and or or.
	- by statement is used to produce grouped reports
	- Observations in the dataset must be sorted by the same variable as specified in the by statement
	
Step8: Output Using ODS (Output Delivery System):
	- Listing: Sends output to results tab
	- You can also send to pdf, html,csv, xml, ms office and rtf formats	
	- Make sure you close all ods redirection at the bottom
	- At last, give an ods listing statement to make sure there is an open destination to any future programs

Step9: Specify Style Definition in ODS Statement
- Tells sas about style that it is going to take
- Style= option is used in front of ODS. This is not available in listing


*/

/*Step1*/
proc print data = ds1;
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower;
run;

/*Step2*/
proc print data = ds1 noobs;
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower;
run;

/*Step3*/
proc print data = ds1 noobs;
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower;
title "Cars Dataset - Pruned";
run;

/*Step4*/
options ls=64 nocenter nodate;
proc print data = ds1 noobs;
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
run;


/*Step5*/
options ls=64 nocenter nodate;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model'; 
run;



/*Step6*/
options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
run;
%let outpath = "/home/u47497250/0.5SAS Reports";


/*Step7*/
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
%let outpath = "/home/u47497250/0.5SAS Reports";


/*Step8*/
/*Listing to Results Tab*/
ods listing;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods listing close; 

/*Print to HTMl*/
%let outpath = '/home/u47497250/0.5SAS Reports/report.html';
ods html file=&outpath.;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods html close;

/*Print to PDF */

%let outpath = '/home/u47497250/0.5SAS Reports/report.pdf';
ods pdf file=&outpath.;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods pdf close; 

/*Print to RTF */

%let outpath = '/home/u47497250/0.5SAS Reports/report.rtf';
ods rtf file=&outpath.;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods rtf close; 


/*Print to CSV */

%let outpath = '/home/u47497250/0.5SAS Reports/report.csv';
ods csvall file=&outpath.;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods csvall close; 


/*Report that can be opened within MS Office */

%let outpath = '/home/u47497250/0.5SAS Reports/reportoffice.html';
ods msoffice2k file=&outpath.;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods msoffice2k close;


/*xml report that can be opened in excel - Can be used to have different tabs in excel */
%let outpath = '/home/u47497250/0.5SAS Reports/reportoffice.xml';
ods tagsets.excelxp file=&outpath.;
proc sort data=ds1;
by Make;
run;

options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods tagsets.excelxp close;
/*Step9 - Styling*/
%let outpath = '/home/u47497250/0.5SAS Reports/report.pdf';
ods pdf file=&outpath. style=Harvest;
proc sort data=ds1;
by Make;
run;



options ls=64 nocenter;
proc print data = ds1 noobs label split=' ';
Var Make	Model	Type	Origin	DriveTrain	MSRP	Invoice	EngineSize	Cylinders	Horsepower StartDate;
title1 "Cars Dataset - Pruned";
title2 "Tells about Cars";
footnote1 color= red height=9pt bold 'Internal Use Only';
footnote2 color=blue height=8pt "&sysdate9.";
label Make = 'Company' Model = 'Name of Model';
Format StartDate mmddyyyy10.; 
where Make = 'Acura' or Make = 'Audi';
*and Origin in ('Asia') ;
by Make;
run;
ods pdf close; 

/*Close All ODS Redirections */
ods _all_ close;
ods listing;



