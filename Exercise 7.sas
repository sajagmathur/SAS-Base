data invest1 (drop=time);
amt = 60000;
increment=0.03;
time=5;
year=0;

/* Do i=1 to time; */
/* 	amt=amt*(1+increment); */
/* 	output; */
/* end; */

Do while(amt<100000);
	amt=amt*(1+increment);
	year = year+1;
	output;
end;
run;


proc print data = invest1;
run;