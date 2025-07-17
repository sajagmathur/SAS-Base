*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/28. Use MDY Function/SAS date.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
sdate = start_date;
s_year= year(sdate);
s_qtr= qtr(sdate);
s_day= day(sdate);
s_weekday=weekday(sdate);
run;

data scoredata2;
set scoredata1;
if  s_weekday in (2,6);
run;