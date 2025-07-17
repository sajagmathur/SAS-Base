/*Create output datasets using out=option
	1. In Proc Freq
	2. In Proc Tabulate
 */

data ds1;
set sashelp.cars;
run;

libname outpath '/home/u47497250/0.6Charts and Reports/';
proc freq data =ds1;
tables  Make /out=outpath.ds2;
run;

proc tabulate data = sashelp.cars out=outpath.ds3;
Class Type;
Table Type;
title1 'One Dimentional Table: Only Column Dimension';
run; 


