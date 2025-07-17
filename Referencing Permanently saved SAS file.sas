*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
SET scoredata0;
	TotalScore = sum(score1,score2,score3);
	AverageScore = mean(score1,score2,score3);
run;


libname myformat "/home/u47497250/17. Saving and using formats permanently";
options fmtsearch= (myformat work library);

proc print data = scoredata1;
	format gender $genderval. averagescore asgroup.;
run;