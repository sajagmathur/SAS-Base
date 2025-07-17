data earnings1;
/* Compute total money you would have if you start at 100 and invest it at 3.75% for 3 years */
interest = 0.0375;
time = 3;
final = 100;
initial = final;

do i = 1 to time;
	final = final *(1 + interest);
End;
/* year shows as 4 because it increments before checking itself against time */
format final dollar10.2;
run;
