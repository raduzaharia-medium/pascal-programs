Program RandomCircles;
Uses Crt, Graph;

Var gDriver, gMode: integer;
Var x, y, radius, color: integer;
Var i: integer;

Begin
  gDriver := detect;

  InitGraph(gDriver, gMode, 'C:\BP\BGI');
  Randomize;

  For i := 1 to 100 do
  Begin
    x := Random(GetMaxX) + 1;
    y := Random(GetMaxY) + 1;
    radius := Random(100) + 10;
    color := Random(15) + 1;

    SetColor(color);
    Circle(x, y, radius);
  End;

  ReadLn;
  CloseGraph;
End.
