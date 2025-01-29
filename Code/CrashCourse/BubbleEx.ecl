//To run this example, you need to have the Visualization bundle installed.
//See: https://github.com/hpcc-systems/Visualizer
IMPORT Visualizer;

GamesRec := RECORD
    STRING Rank;
    STRING Name;
    STRING Platform;
    STRING Year;
    STRING Genre;
    STRING Publisher;
    STRING NA_Sales;
    STRING EU_Sales;
    STRING JP_Sales;
    STRING Other_Sales;
    STRING Global_Sales;
END;

Games_DS := DATASET('~tech::vgsales',GamesRec,CSV(HEADING(1)));
top_sales_Count := TOPN(TABLE(Games_DS,{name,Global_Sales}),10,-Global_Sales);
OUTPUT(top_sales_Count,NAMED('salescount'));
Visualizer.TwoD.Bubble('global_count',,'salescount');