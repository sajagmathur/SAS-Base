*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/22. Using Substr/Chara_data1.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
fullname_lc = lowcase(full_name);
fullname_uc = upcase(full_name);
fullname_pc = propcase(fullname_lc,' ;,');
run;

proc print data=scoredata1;



