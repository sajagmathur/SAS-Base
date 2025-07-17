proc import datafile = "/home/u47497250/Exercise 2/score_data.xlsx" out = scoredata0 dbms = xlsx replace;
run;

* Create permanent SAS Dataset;

libname score1 "/home/u47497250/Exercise 2";
proc import datafile = "/home/u47497250/Exercise 2/score_data.xlsx" out = score.scoredata0 dbms = xlsx replace;
run;


data score1.scoredata;
set scoredata0;
run;