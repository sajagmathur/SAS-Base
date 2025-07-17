%let baseloc = /home/u47497250/4. Import data using column input;
data importfromcolumn;
infile "&baseloc./DATA_column.txt";
input Name $ 1-5
	  Gender $ 6
	  Weight 7-9
	  DOB $ 10-19;
run;

proc print data=importfromcolumn;
run;

/* If there is a delimiter in the text file use dim keyword and not the numbers in columns.
DLM is used with infile statement to specify delimiters
Following dollar sign means a character variable
*/