*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/22. Using Substr/Chara_data1.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;






length phone_update  $10;
phone_update = tranwrd(phone,'000','408');
run;

proc print data=scoredata1;
run;


