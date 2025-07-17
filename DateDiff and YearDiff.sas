*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/28. Use MDY Function/SAS date.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
year_diff1=yrdif(start_date,today(),'30/360');
year_diff2=yrdif(start_date,today(),'Act/Act');
year_diff3=yrdif(start_date,today(),'Act/360');
year_diff4=yrdif(start_date,today(),'Act/365');

/* Datedif function */
day_diff1=datdif(start_date,today(),'30/360');
day_diff2=datdif(start_date,today(),'Act/Act');
run;

proc print data = scoredata1;
run;