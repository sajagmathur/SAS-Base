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

Data scoredata_missing;
Set scoredata1;
	if gender = 'm' then gender_num = 1;
		Else if gender = 'f' then gender_num = 0;
		Else gender_num = .;
	
	if score1 NE . and score2 ne . and score3 ne . then take = 'complete';
	else take = 'incomplete';
	
	
	if averagescore > 90 Then Do;
	pass = 'Pass';
	grade = 'A';
	End;
	Else if averagescore >80 Then Do;
	pass = 'Pass';
	grade = 'B';
	End;
	Else if averagescore <= 80 and averagescore >= 0 then do;
	pass = 'Fail';
	grade = 'D';
	End;
Run;

proc print data = scoredata_missing;
run;

/* Proc frequency */
proc freq data = scoredata_missing;
tables gender gender*grade;
title "Frequency tables not including missing";
run;

proc freq data = scoredata_missing;
tables gender gender*grade/missing;
title "Frequency tables including missing";
run;


proc freq data = scoredata_missing;
tables gender gender*grade/missing nocol norow;
title "Frequency tables without row and column";
run;