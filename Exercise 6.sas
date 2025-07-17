*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/Exercise 6/Patient_HD.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
years_admitted = year(start_date);
num_days = Intck('day',start_date,end_date);
num_days1 = datdif(start_date,end_date,'Act/Act');
run;

proc print data = scoredata1;
