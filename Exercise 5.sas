*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/Exercise 5/Chara_data2.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
*DOB variables creation;
DOB_year = Scan(DOB,3,'/');
DOB_date= Scan(DOB,2,'/');
DOB_month = Scan(DOB,1,'/');
DOB_month_substr = substr(DOB,1,index(DOB,'/')-1);
*Creating DOB using trim and catx;
DOB_new1 = trim(DOB_year) || ', ' || trim(DOB_month) || ', ' || trim(DOB_date);
DOB_new2ss = Catx(', ',DOB_year,DOB_month, DOB_date);
raw_score = tranwrd(raw_score,'missing','');
run;

proc print data=scoredata1;

data cd2;
set scoredata1;
If index(DOB,'2007');
run;

proc print data = cd2;
