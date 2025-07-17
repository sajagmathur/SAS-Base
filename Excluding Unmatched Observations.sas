/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/41. Match Merging/score_data_id_partial_score4.xlsx" out = scoredata_p dbms = xlsx replace;
run;

/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/37. One to One Merge/score_data_id.xlsx" out = scoredata dbms = xlsx replace;
run;

/* sort data score data p */
proc sort data= scoredata_p;
by stu_id;
run;

/* sort data score data */
proc sort data= scoredata;
by stu_id;
run;

/* match merge data */
data mma (drop = stu_id);
merge scoredata_p (in = A) scoredata (in = B drop=score3);
by stu_id;
if A=1 and B=1;
run;

proc print data = mma;
title 'Match Merge Data in ascending order with only matching observations';
run;


proc print data = scoredata_p;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;