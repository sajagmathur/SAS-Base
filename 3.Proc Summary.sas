/* Proc Summary:
 - Gives summary for the specified variable and splits it by class
 - Option Print needs to be given to print it out.
 - To get it as an output dataset, you can give an output option output out=libname.dsname
 - You can relabel min max sum and mean in the output dataset
 - Same statistics as mean, but if you don't give print option, it will show nothing
 - Even if you don't specify var it wont show you anything. You have to be more specific in giving inputs.
 - Just like the other reports you can add footnotes, titles, formats, labels, output
 - Label MSRP as Retail Price
 - Add Title 
 
_TYPE_
 - In output data, there is this variable
 - 0 value is the overall summary
 - 1 gives summary based on one class
 - 2 gives summary based on the other class
 - 3 gives summary based on both classes taken together
Use ods to print to pdf
 - 
*/


data ds1;
set sashelp.cars;
run;


proc summary data=sashelp.cars print;
var MSRP;
class Make;
Label MSRP = 'Retail Price';
title 'Summary report for Retail Price of Cars';
output out=work.carsdata min=Minsales max=maxsales sum=sumsales mean=meansales;
run;

ods pdf file='/home/u47497250/0.6Charts and Reports/reportsummary.pdf' style=BarrettsBlue;
proc print data=work.carsdata;
run;
ods pdf close;

ods _all_ close;
ods listing;
