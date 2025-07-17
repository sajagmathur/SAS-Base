*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
SET scoredata0;
	TotalScore = sum(score1,score2,score3);
	AverageScore = mean(score1,score2,score3);
run;

proc print data=scoredata1;

data scoredata2;
set scoredata1;
	format AverageScore 5.2;
run;

proc print data=scoredata2;
title "Permanent format for Average Score";
run;

* Temporary format for soredata2;

proc print data=scoredata2;
title "Temporary format for Average Score";
	format AverageScore 4.1;
run;
