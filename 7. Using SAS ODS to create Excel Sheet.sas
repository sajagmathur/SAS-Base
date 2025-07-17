/* ODS - Stands for Output Delivery System.
We will use this to create an excel sheet in sas */


/*USE ODS Command to export 
CSVALL - Used for CSV Files
file = give file name
rs = none --> gives none as record separator
style that is used to print output
*/

ODS csvall file = "/home/u47497250/0.1.SAS SkillSoft - SAS Datasets/cars_final.csv" rs=none style=minimal;
run;

/*use proc print to print values into the csv.
NOOBS suppresses the number of observations --> Observation numbers are supressed. If not mentioned,
observaton numbers will be present in csv.
 */

proc print data= sashelp.cars noobs;
run;

/*close ods*/

ODS csvall close;
run;