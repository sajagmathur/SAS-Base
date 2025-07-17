data formattedinputs;
infile "/home/u47497250/5. Import data using formatted inputs/DATA_column.txt";
input
@1 Name $5. 
@6 Gender $1.
@7 Weight 3.
@10 DOB mmddyy10.;
format DOB mmddyy10.;
run;

proc print data=formattedinputs;
format  DOB date9.;
run;

proc print data=formattedinputs;
format  DOB mmddyy10.;
run;


proc print data=formattedinputs;
format  DOB date9.;
run;