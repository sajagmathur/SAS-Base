*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

Data scoredata1;
Set scoredata0;

* Output using Functions;

	Totalscore = sum(score1,score2,score3);
	Averagescore = mean(score1,score2,score3);
	Gender1 = upcase(gender);
run;

/* use univariate procedure - var statement to generate statistic for averagescore variable */
Proc univariate data= scoredata1;
 Var averagescore;
 Title 'Summary of Average Scores';
run;

/* by statement allows to get the subgroup analysis by the by variable. before using the */
/* by variable, data should be sorted in the by order */
proc sort data = scoredata1 out = scoredata2;
by gender;
run;

Proc univariate data= scoredata2;
 Var averagescore;
 By gender;
 Title 'Summary of Average Scores by Gender';
run;

