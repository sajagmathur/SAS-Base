/* Import Excel and create a dataset; */
proc import datafile = "/home/u47497250/Exercise 9/sale_state.xlsx" out = scoredata0 dbms = xlsx replace;
run;


data scoredata1 (drop = rn cn);
set scoredata0;

array salesdata(2,3) saleCA1 saleCA2 saleCA3 saleTX1 saleTX2 saleTX3;
array salesfinal(2) salecatotal saletxtotal (0 0);
Do rn=1 to 2;
	Do cn = 1 to 3;
		salesfinal(rn) = salesfinal(rn)+salesdata(rn,cn);
	end;
	
end;
run;


proc print data = scoredata1;
Format salecatotal saletxtotal dollar10.2;
run;