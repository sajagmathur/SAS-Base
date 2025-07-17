*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/28. Use MDY Function/SAS date.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
bdate = mdy(month,day,year);
fix_date1 = mdy(8,31,1950);
fix_date2 = mdy(8,31,2050);
fix_date3 = mdy(8,31,50);
run;

proc print data = scoredata1;
format bdate date9. fix_date1 date9. fix_date2 date9. fix_date3 date9.;
run;