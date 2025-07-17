*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/21. Using Scan Function/Chara_data.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
last_name = Scan(full_name,2,',: ');
run;

proc print data=scoredata1;

