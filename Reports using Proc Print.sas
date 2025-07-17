/* One to One Merge */
/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/47. Reports using Proc Print/FunRun_data_id_class.xlsx" out = fr0 dbms = xlsx replace;
run;

/* specify format of variables by using the format statement */
/* add sum statement to compute subtotals of numeric variables */
proc print data = fr0 noobs;
var name stu_id gender class fund;
sum fund stu_id;
format fund dollar5.1;
run;


/* computing group subtotals with group variable as class variabe */
proc sort data = fr0;
by class;
run;

proc print data = fr0 noobs;
var name stu_id gender class fund;
sum fund;
by class;
format fund dollar5.1;
run;

/* Labelling totals and subtotals */
/* The subtotal default label is the by variable */
/* The grand total default label is no label */
/* You can use SUMLABEl= option to replace default subtotal label and Grandtotal label = option to replace */
/* a blank grand total label */

proc print data = fr0 noobs sumlabel = "Total Fund Raised" grandtotal_label="Grand Total of Fund Raised";
title 'Fund Raised by Class';
var name stu_id gender class fund;
sum fund;
by class;
run;

/* To modify appearance of the report, you can use both BY and ID statements */
proc print data = fr0 noobs sumlabel = "Total Fund Raised" grandtotal_label="Grand Total of Fund Raised";
title 'Fund Raised by Class with different appearance';
var name stu_id gender class fund;
sum fund;
by class;
id class;
run;

