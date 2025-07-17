/* Informat means input formats. This allows you to read data from flat files in a certain way. For example, if you wish to read numbers
in coma9 format etc.
https://support.sas.com/publishing/pubcat/chaps/59498.pdf

DSD (delimiter-sensitive data)
The DSD option changes how SAS treats delimiters when you use LIST input and sets the default delimiter to a comma. When you specify DSD, SAS treats two consecutive delimiters as a missing value and removes quotation marks from character values.
Default: Consecutive delimiters are treated as a single delimiter.
MISSOVER. prevents an INPUT statement from reading a new input data record if it does not find values in the current input line for all the variables in the statement. When an INPUT statement reaches the end of the current input data record, variables without any values assigned are set to missing.
Missover Option: To recognize missing value at the end of the data. 
		Default- If there is a missing data at the end of the row, sas loads the next observation
		*****Log - SAS went to new line when the input statement went past the line. *******
Example:
If dataset is -
firstname, lastname, age
sajag, mathur
apoorva, mathur, 22
thus, sajag mathur has missing values. To not impact this - Use missover option.
*/
data importfromcsv;
infile "/home/u47497250/2. Import csv data/DATA_commas.csv" dsd;
input name $ gender $ age income :comma9.;
run;

proc print data = importfromcsv;
run;

/* If there is a delimiter in the text file use dim keyword and not the numbers in columns.
DLM is used with infile statement to specify delimiters
Following dollar sign means a character variable
:comma9. changes the informat to comma9. once it has imported, you change the informat by colon format modifier. 
If you do not use this, it will give errors in import.
Informats are used in the input statement post infile
*/


data otherdelimiter;
infile "/home/u47497250/3. Import from any other delimiter/other_del_data.txt" dsd dlm = ":";
input name $ gender $ age income;
run;

proc print data= otherdelimiter;
run;


/*Using some of the statements in sas
Keep Statement: which variables you wish to keep
Label statement: to label any particular variable
Format Statment: To give particular format to particular statement
 */

data statements;
set otherdelimiter;
keep name gender age;
label name='Full_Name';
run;

/*label option: makes it print data using label */
proc print data=statements label;
run;