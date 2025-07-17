*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/11. Use Conditional Operators/score_data_miss.xlsx" out = scoredata0 dbms = xlsx replace;
run;


Data scoredata1;
Set scoredata0;

* if scores are ne;
if score1 NE . and score2 ne . and score3 ne . then take = 'complete';
	else take = 'incomplete';
run;

* IF STATEMENT;
Data scoredata_all;
Set scoredata1;
if take = 'complete';
run;

proc print data = scoredata_all;
run;

* IF STATEMENT;
Data scoredata_delete;
Set scoredata1;
if take = 'complete' then delete;
run;

proc print data = scoredata_delete;
run;