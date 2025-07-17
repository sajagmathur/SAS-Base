proc import datafile= "/home/u47497250/Exercise 3/score_data_miss777.xlsx" dbms= xlsx out = scoredata0 replace;
run;

data scoredata1;
set scoredata0;

*replace 777 by . using if then;
	Array scores (*) score1 score2 score3;

	Do i= 1 to dim(scores);
	if scores(i) = 777 Then scores(i) = .;
	End;

* Averagescores using sas function mean;
	averagescores = mean(score1,score2,score3);
run;


Proc print data = scoredata1;
