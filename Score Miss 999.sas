*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/13. Use 1D Arrays/score_data_miss999.xlsx" out = scoredata0 dbms = xlsx replace;
run;


data scoredata1 (drop = i);
set scoredata0;

* Define Array;
	Array scorevalue (3) score1 score2 score3;
	
	Do i= 1 to dim(scorevalue);
		If scorevalue(i) = 999 Then scorevalue(i)=.;
	End;
ave_score = mean(score1,score2, score3);
Run;

proc means data = scoredata1;
var score1 score2 score3;
run;

/* This is to assign different variables */
/* data scoredata2 (drop = i); */
/* set scoredata1; */
/* 	array score(3) score1 score2 score3; */
/* 	array score_diff(3); */
/*   Do i = 1 to 3; */
/*   	score_diff(i) = score(i)- ave_score; */
/*   End; */
/* run; */

data scoredata2 (drop = i);
set scoredata1;
	array score(3) score1 score2 score3;
	array average{3} (79.5 81.9 80.80);
/* 	Assign Initial Values */
	array score_diff(3);
  Do i = 1 to 3;
  	score_diff(i) = score(i)- average(i);
  End;
run;
proc print data = scoredata1;
title "Missing Values are shown as periods.";
run;

proc print data = scoredata0;
title "Missing Values are shown as 999";
run;