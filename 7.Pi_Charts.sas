/*Create Pi Charts with SgRender Procedure
	- PI chart shows the relative contribution of parts to the whole
	- SG Render Procedure is used. This procedure uses a template to create a graph that we wish to create.
	
GTL Statements: Graph Template Language statements that are used to create particular templates.

Step 1: 
Proc Template:
	- Compiles and saves template
	- Define statement starts the definition block, end statement ends the definition block
	- Define statement contains the type of graph we wish to create (Eg. Statgraph is a graph template)
	  mygraphs.pie is the template name.
	- begingraph and endgraph begin and end the graph statement block respectively

Witin begin and endgraph, gtl statements are placed: 
	- layout: layout is specified as type region. Meaning the pie will be created on 'type' column
	- piechart category - 90 is the degrees at which the first slice starts, 1 is if the first slice is centered

Step 2: Set ODS options:
	- ods graphics - enables / disables ods graphics processing
	- reset: resets all the options
	
Step 3: Use proc sgrender
	- Specify the dataset
	- Specify the template you wish to create
	
Step 4: Reset ODS Graphics

*/

proc template;
define statgraph mygraphs.pie;
	begingraph;
	layout region;
	piechart category = type / start = 90 centerfirstslice=1;
	endlayout;
	endgraph;
end;
run;

ods graphics / reset imagemap;

proc sgrender data = sashelp.cars template=mygraphs.pie;
run;

ods graphics / reset;
data work.cars;
Set sashelp.cars;
run;

/*Just frequency of the dataset*/
proc freq data=sashelp.cars;
tables type;
run;