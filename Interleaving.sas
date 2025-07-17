/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/37. One to One Merge/score_data_id_partial.xlsx" out = scoredata_p dbms = xlsx replace;
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

/* interleave data */
data interleave;
set scoredata_p scoredata;
by stu_id;
run;

proc print data = interleave;
title 'interleaving';
run;

proc print data = scoredata_p;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;