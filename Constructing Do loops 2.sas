data earnings3 (drop = counter);
/* Compute total money you would have if you start at 100 and invest it at 3.75% for 3 years */
/* Drop counter and use year */
interest = 0.0375;
time = 3;
final = 100;
initial = final;

do counter = 1 to time;
	final = final *(1 + interest);
	year+1;
/* Using output statement */
output;
End;
/* year shows as 4 because it increments before checking itself against time */
format final dollar10.2;

run;

title "Listing of earnings with Do loops";
proc print data = earnings3;
run;
