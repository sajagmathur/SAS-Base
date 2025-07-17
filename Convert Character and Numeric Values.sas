proc import datafile="/home/u47497250/20.  Convert Character and Numeric Values/Convert Data.xlsx" dbms= xlsx out = scoredata0 replace;

* Char to numeric;
data scoredata1;
set scoredata0;
*Auto Convert;
	score_ac = raw_score*1;
	score_num = input(raw_score,7.);
run;


* Numeric to Char;
data scoredata2;
set scoredata0;
*Auto Convert;
	gender_ac = gender || '/' ||gender_code;
	gender_char= put(gender_code,8.);
run;