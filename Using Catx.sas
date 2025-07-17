*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/21. Using Scan Function/Chara_data.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
last_name = Scan(full_name,1,',: ');
first_name = Scan(full_name,2,',: ');
student_name1=trim(last_name) || ', ' || trim(first_name);
length student_name2 $25;
student_name2 = catx(',',last_name,first_name);
run;


proc print data=scoredata1;

