/*  This is the top ten priced items in rest*/
 *
 */

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.IMPORT (obs=10);
	vbar Item_Name / response=Product_Price datalabel;
	yaxis grid;
	title " Graph showing the count of cities";
run;

ods graphics / reset;


/*  This is the top ten priced items in rest*/

proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		entrytitle "Graph Showing Top  Priced items" / textattrs=(size=14);
		layout region;
		piechart category=Item_Name /;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie data=WORK.IMPORT;
run;

ods graphics / reset;

*Graph showing sales;
proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		entrytitle "Graph Showing Sales" / textattrs=(size=14);
		layout region;
		piechart category=Years / stat=pct;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie data=WORK.IMPORT;
run;

ods graphics / reset;


*Graph shows time orders are made/;

ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=WORK.IMPORT;
	title height=14pt "This Graph shows time orders are always made.";
	vline Hours / lineattrs=(thickness=4 color=CX990099);
	yaxis grid;
run;

ods graphics / reset;
title;

* Sales per Year/;
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.IMPORT;
	title height=14pt "Histogram graph showing Scales per Year";
	histogram Years / scale=count fillattrs=(color=CX2cebb5) dataskin=sheen;
	yaxis grid;
run;

ods graphics / reset;
title;

*Quantity per year;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.IMPORT (where=(Quantity > 10));
	title height=14pt "Graph shows  Count of Quantinty  greater than 10 Each year";
	hbar Years / group=Quantity groupdisplay=cluster;
	xaxis grid;
run;

ods graphics / reset;
title;


