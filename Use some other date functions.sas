*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/28. Use MDY Function/SAS date.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
today_date1 = today();
today_date2 = date();
Months = intck('month',start_date,today());
Years = intck('year',start_date,today());
run;

proc print data = scoredata1;
format today_date1 today_date2 date9.;
run;