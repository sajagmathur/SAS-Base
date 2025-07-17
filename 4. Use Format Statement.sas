/*
Format Statement:
- Give format to a SAS Dataset
- Use the format statement to give certain formatting to the sas dataset

*/

data autos;
set sashelp.cars;
format msrp date9. weight comma10.;
run;
