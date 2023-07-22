IMPORT $;
Vehicle := $.File_Vehicle.File;

MyRec := RECORD
 Vehicle.Orig_state;
 TypeCnt := COUNT(GROUP)/10;
END;

MyTable := TABLE(Vehicle,MyRec,Orig_state);

OUTPUT(Sort(MyTable,Orig_state),ALL,NAMED('State_Choro'));

IMPORT Visualizer;

// state := TABLE($.File_Persons.File, {state, UNSIGNED4 rowcount := COUNT(GROUP)}, state, FEW);
// OUTPUT(state, NAMED('state_rowcount'));
Visualizer.Choropleth.USStates('ODSCEast', , 'State_Choro', , , DATASET([{'paletteID', 'Blues'}], Visualizer.KeyValueDef));


