Program SimpleObject;
Uses crt;

Type Person = Object
  name: string;
  age: integer;

  Procedure Print;
End;

Procedure Person.Print;
Begin
  WriteLn(name);
End;

Var
  Radu: Person;

Begin
  ClrScr;

  Radu.name = 'Radu';
  Radu.Print;

  ReadLn;
End.
