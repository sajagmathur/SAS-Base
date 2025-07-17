*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/9. Use Assignment and Set Statements/score_data.xlsx" out = scoredata0 dbms = xlsx replace;
run;

Data scoredata1;
Set scoredata0;
	Totalscore = sum(score1,score2,score3);
	Averagescore = mean(score1,score2,score3);
	Gender1 = upcase(gender);
	
	if gender = 'm' then gender_num = 1;
	
	if score1 NE . and score2 ne . and score3 ne . then take = 'complete';
	
	
	if averagescore > 80 Then Do;
	pass = 'Near Pass';
	End;
	
	if averagescore > 90 Then Do;
	pass = 'Pass';
	End;
	
Run;

proc print data = scoredata1;

