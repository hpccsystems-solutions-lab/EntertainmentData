EXPORT myMod := MODULE
 //Visible only by MyMod
 SHARED x := 88;
 SHARED y := 42;

 //Visible by MyMod and externally
 EXPORT See := 'This is how a module works';
 EXPORT Res := Y * 2;
END;