*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/22. Using Substr/Chara_data1.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
index_num = index(phone,'408');

run;

data scoredata2;
set scoredata1;
if index_num=1;
run;

proc print data=scoredata1;
proc print data = scoredata2;


