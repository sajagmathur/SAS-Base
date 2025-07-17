data importfromcolumn;
infile "/home/u47497250/4. Import data using column input/DATA_column.txt";
input Name $ 1-5
	  Gender $ 6
	  Weight 7-9
	  DOB $ 10-19;
run;

proc print data=importfromcolumn;
run;
	  