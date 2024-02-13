program InterruptHandler;
uses crt, dos;

{$F+,S-,W-}
procedure INT5Handler; interrupt;
begin
  WriteLn('Custom handler triggered for INT5');

  {sending the End Of Interrupt signal}
  port[$20] := $20;
end;
{$F-,S+}

{$F+,S-,W-}
procedure INT5HandlerParams(Flags, CS, IP, AX, BX, CX, DX, SI, DI, DS, ES, BP: Word); interrupt;
begin
  WriteLn(Flags);

  {sending the End Of Interrupt signal}
  port[$20] := $20;
end;
{$F-,S+}

var
  originalHandler: pointer;

begin
  ClrScr;
  GetIntVec($5, originalHandler);
  SetIntVec($5, Addr(INT5Handler));

  WriteLn('Custom handler installed');
  ReadLn;

  SetIntVec($5, originalHandler);

  WriteLn('Original handler reverted');
  ReadLn;
end.
