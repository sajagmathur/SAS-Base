*Store user defined formats;

libname myformat "/home/u47497250/17. Saving and using formats permanently";

Proc format library = myformat;
		Value $genderval	'm' = 'Male'
							'f' = 'Female';
		Value asgroup 		0 -<60 = 'F'
							60 -<70 = 'D'
							70 -<80 = 'C'
							80 -<90 = 'B'
							90 - High= 'A'
							Other = 'Missing';
run;

* Titles of formats in the library;

Title "Format Definitions in the MYFMTS Library";
proc format library= myformat fmtlib;
run;