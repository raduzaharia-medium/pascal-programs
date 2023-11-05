Program SimpleSort;

Var
  numbers: array[1..4] of integer;
  i, j: integer;
  temp: integer;

Begin
  numbers[1] := 4;
  numbers[2] := 7;
  numbers[3] := 3;
  numbers[4] := 5;

  For i := 1 to 4 do
    For j := 1 to 4 do
    Begin
      If (numbers[i] < numbers[j]) then
      Begin
        temp := numbers[i];
        numbers[i] := numbers[j];
        numbers[j] := temp;
      End;
    End;

  For i := 1 to 4 do
    Write(numbers[i]);

  ReadLn;
End.
