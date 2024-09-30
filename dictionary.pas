Program DictionaryExample;

Type 
  DictionaryItemPointer = ^DictionaryItem;
  DictionaryItem = Record
    value: integer;
    next: DictionaryItemPointer;
  End;
  Dictionary = array[1..10] Of DictionaryItemPointer;

Function Hash(value: integer): integer;
Begin
  Hash := value Mod 10;
End;

Procedure Insert(value: integer; Var dictionary: Dictionary);
Var 
  index: integer;
  newItem: DictionaryItemPointer;
Begin
  index := Hash(value);
  newItem := dictionary[index];

  If newItem = Nil Then
    Begin
      new(newItem);

      newItem^.value := value;
      dictionary[index] := newItem;
    End
  Else
    Begin
      While newItem^.next <> Nil Do
        newItem := newItem^.next;

      New(newItem^.next);
      newItem^.next^.value := value;
    End;
End;

Procedure Print(dictionary: Dictionary);
Var 
  i: integer;
  iterator: DictionaryItemPointer;
Begin
  For i := 1 To 10 Do
    Begin
      write(i);
      write(' - ');

      If dictionary[i] <> Nil Then
        Begin
          write(dictionary[i]^.value);

          iterator := dictionary[i]^.next;
          While iterator <> Nil Do
            Begin
              write(' ');
              write(iterator^.value);

              iterator := iterator^.next;
            End;
        End;

      writeln;
    End;

  writeln;
End;


Var 
  myDictionary: Dictionary;
Begin
  Insert(2, myDictionary);
  Insert(8, myDictionary);
  Insert(11, myDictionary);
  Insert(1, myDictionary);
  insert(21, myDictionary);

  Print(myDictionary);
End.
