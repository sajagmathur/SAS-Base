*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/36. 2D Arrays/monthly.xlsx" out = monthly dbms = xlsx replace;
run;

data quarters (drop = i j);
set monthly;
	array m{4,3} month1-month12;
	
/* 	Generate data for Quarterly Sales */
 	array qtr(4);
 	
 	Do i = 1 to 4;
  		qtr(i) = 0; /*initiate variable */
  			Do j = 1 to 3;
  				qtr(i) = qtr(i)+m(i,j);
  			End;
 	End;
 	
run;

proc print data = quarters;
run;

