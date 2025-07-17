/* 
Step1: 
Frequency Table: 
	For each variable it gives:
		Frequency
		Cumulative Frequency 
		Percentage
		Cumulative Percentage
Tables Option: Gives freq which variables to create frequency distribution for
- You don't use frequency variables for analysis variables (Like sales) or for unique variables (Like emp id).
- Used for categorical variables like make, model etc.
Other Uses of Freq table: 
	Cross Tabulation
	Chi Square Test
	Save output report in a SAS Dataset

Cross Tab Table:
 - Mention an asterisk between the variables for which you need the cross tab
 - O/P: Frequency, Percent, Row Percent, Column Percent
 - Crosslist: Two way table is displayed in a column format
 
 
Step2:
Enhanced Frequency Tables:
	- Specify Labels through a label statement
	- Use User Defined Formats --> Not shown here
	- Use styles for styling
	- Use ODS to output this
	
Table Options:
	- Specify options in the table to suppress cummulative frequency (nocum), similarly  can suppres others
	- Nofreq: Suppresses cell frequency in crosstab
	- Crosslist
	
ProcFreq Options:
	- nlevels- gives the levels of frequency distribution for each variable name
*/

data ds1;
set sashelp.cars;
run;


/*Step1*/
proc freq data=ds1 nlevels;
tables Make Origin;
run;

proc freq data=ds1;
tables Make*Origin /nofreq;
run;

/*Step2*/
ods pdf file='/home/u47497250/0.5SAS Reports/reportfreq.pdf' style=BarrettsBlue;
proc freq data=ds1;
tables Make Origin /nocum;
	Label Make = 'Make of s-the Car'
		  Origin = 'Origin of the Car';
run;
ods pdf close;

ods _all_ close;
ods listing;



proc freq data=ds1;
tables Make*Origin /crosslist;
run;