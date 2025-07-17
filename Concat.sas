/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/37. One to One Merge/score_data_id_partial.xlsx" out = scoredata_p dbms = xlsx replace;
run;

/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/37. One to One Merge/score_data_id.xlsx" out = scoredata dbms = xlsx replace;
run;

/* one to one match */
data concat;
	set scoredata_p scoredata;
run;


proc print data = scoredata_p;
title "Partial Score Data.";
run;


proc print data = scoredata;
title "Score Data.";
run;

proc print data = concat;
title "Concatenated Datasets.";
run;