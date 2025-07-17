*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/9. Use Assignment and Set Statements/score_data.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
set scoredata0;
	Averagescore = mean(score1,score2,score3);
Averagescore_int=int(Averagescore);
Averagescore_r1 = round(Averagescore,0.1);
Averagescore_r2 = round(Averagescore,0.01);
run;

proc print data=scoredata1;
run;


