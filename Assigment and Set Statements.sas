*Import Excel and create a dataset;
proc import datafile = "/home/u47497250/9. Use Assignment and Set Statements/score_data.xlsx" out = scoredata0 dbms = xlsx replace;
run;

data scoredata1;
Set scoredata0;
Grade = 7;
ScoreType = 'MathSores';
Totalscore = score1 + score2 + score3;
AverageScore = Totalscore/3;
run;


proc print data= scoredata1;
run;