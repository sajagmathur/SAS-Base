*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;

Data scoredata1;
Set scoredata0;
* Output using Functions;
	Totalscore = sum(score1,score2,score3);
	Averagescore = mean(score1,score2,score3);
run;

proc means data = scoredata1 maxdec=1 n mean max min;
	var score1 score2 score3 averagescore;
	Title 'Summary of Scores';
run;

/* By Statement */

proc sort data = scoredata1 out= scoredata2;
by Gender;
run;

proc means data = scoredata2 maxdec=1 n mean max min;
	by gender;
	var score1 score2 score3 averagescore;
	Title 'Summary of Scores by gender using by statement';
run;


/* Class Statement */
/* sorting is not required for class statement */
proc means data = scoredata2 maxdec=1 n mean max min;
	Class gender;
	var score1 score2 score3 averagescore;
	Title 'Summary of Scores by gender using by statement';
run;

/* If you wish to have data for missing variable, add it in the procedure */
proc means data = scoredata2 maxdec=1 n mean missing max min;
	Class gender;
	var score1 score2 score3 averagescore;
	Title 'Summary of Scores by gender using by statement';
run;