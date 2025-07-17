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
* Output using if then and else ;

/* sort */
Proc sort data=scoredata1 out=scoredata2;
by gender descending Averagescore;
Run;

proc print data = scoredata2;

/* options nodupkey dupout */
Proc sort data=scoredata1 out=scoredata3 nodupkey dupout=extraobs;
by gender;
Run;

proc print data = scoredata3;
run;

proc print data = extraobs;
run;
