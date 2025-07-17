*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/Exercise 4/Sale.xlsx" out = sale0 dbms = xlsx replace;
run;

data sale1;
set sale0;

	label   emid = "Employee ID"
	    	sale_m1 = "Sale in Jan."
            sale_m2 = "Sale in Feb."
 			sale_m3 = "Sale in Mar.";
 	
 	AverageSale = mean(sale_m1,sale_m2,sale_m3);
 	
 	Format AverageSale dollar10.2;
run;

libname myfmt "/home/u47497250/Exercise 4";

Proc format library=myfmt;
Value  	salegroup   	low -<700 = 'Need Improvement'
						700 -<900 = 'Good'
						900 -High = 'Top Sale'
						Other = 'Missing';
run;
 
libname myfmt "/home/u47497250/Exercise 4";
options fmtsearch= (myfmt work library);

proc print data = sale1 label;
format sale_m1 sale_m2 sale_m2 salegroup.;
run;