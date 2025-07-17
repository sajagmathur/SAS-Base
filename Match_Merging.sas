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
data mma;
merge scoredata_p scoredata;
by stu_id;
run;

proc print data = mma;
title 'Match Merge Data in ascending order';
run;


proc print data = scoredata_p;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;

/* descending */

/* sort data score data p */
proc sort data= scoredata_p;
by descending stu_id;
run;

/* sort data score data */
proc sort data= scoredata;
by descending stu_id;
run;

/* match merge data */
data mmd;
merge scoredata_p scoredata;
by descending stu_id;
run;

proc print data = mmd;
title 'Match Merge Data in descending order';
run;


proc print data = scoredata_p;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;