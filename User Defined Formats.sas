*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
SET scoredata0;
	TotalScore = sum(score1,score2,score3);
	AverageScore = mean(score1,score2,score3);
run;


*Design format for gender and average score;
Proc format;
	Value $genderval	'm' = 'Male'
						'f' = 'Female';
	Value asgroup 		0 -<60 = 'F'
						60 -<70 = 'D'
						70 -<80 = 'C'
						80 -<90 = 'B'
						90 - High= 'A'
						Other = 'Missing';
run;

proc print data = scoredata1;
Title "Non Formatted Results";
run;

proc print data = scoredata1;
format gender $genderval. averagescore asgroup.;
Title "Formatted Results";
run;