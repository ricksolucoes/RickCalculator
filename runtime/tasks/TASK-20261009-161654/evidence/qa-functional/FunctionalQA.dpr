program FunctionalQA;
{$APPTYPE CONSOLE}
uses System.SysUtils, System.Classes, Vcl.Forms, Vcl.StdCtrls,
  Calculator.MainForm, Calculator.Controller, Calculator.Formatter;
var F: TCalculatorMainForm; Count: Integer;
procedure Press(const S: string);
var I: Integer; B: TButton; Found: Boolean;
begin
  Found := False;
  for I := 0 to F.ComponentCount-1 do
    if F.Components[I] is TButton then begin
      B := TButton(F.Components[I]);
      if B.Caption = S then begin
        Found := True;
        if B.Enabled then B.Click;
        Break;
      end;
    end;
  if not Found then raise Exception.Create('Button missing: '+S);
  Application.ProcessMessages;
end;
procedure Keys(const S: string);
var C: Char;
begin
  for C in S do
    case C of
      'C': Press('Limpar tudo');
      'E': Press('Limpar entrada');
      'B': Press('Apagar último caractere');
      'S': Press('Alternar sinal');
    else Press(C); end;
end;
procedure Check(const ID, S, Expected: string);
var Actual: string;
begin
  Keys(S);
  Actual := TLabel(F.Components[1]).Caption;
  WriteLn(ID, ' Action=',S,' Observed=',Actual,' Expected=',Expected);
  if Actual <> Expected then raise Exception.Create('FAIL '+ID);
  Inc(Count);
end;
procedure Overflow;
var I: Integer;
begin
  Keys('C1');
  for I := 1 to 1100 do begin
    Keys('+=');
    if TLabel(F.Components[1]).Caption = 'Resultado fora da faixa numérica.' then begin
      WriteLn('Natural overflow at doubling ',I);
      Exit;
    end;
  end;
  raise Exception.Create('No natural overflow');
end;
var I: Integer; NegZero: Double; Bits: UInt64;
begin
  try
    Application.Initialize;
    F := TCalculatorMainForm.Create(nil);
    try
      F.SetController(TCalculatorController.New);
      F.Show; Application.ProcessMessages;
      Check('AC01a','C,','0,'); Check('AC01b',',','0,');
      Check('AC02a','C123456789012345','123456789012345'); Check('AC02b','6','123456789012345');
      Check('AC03a','C2+3=','5'); Check('AC03b','C2+3+4=','9');
      Check('AC04','C2++3=','5');
      Check('AC05a','C2+3=','5'); Check('AC05b','=','8'); Check('AC05c','=','11');
      Check('AC06a','C5+=','10'); Check('AC06b','=','15');
      Check('AC07','C5=','5');
      Check('AC08a','C2+3=7','7'); Check('AC08b','C2+3=+4=','9');
      Check('AC09entry','C12C=','0'); Check('AC09pending','C2+C=','0'); Check('AC09result','C2+3=C=','0');
      Check('AC10a','C8+2E=','8'); Check('AC10b','C8+E=','8');
      Check('AC11a','C2+3=E','0'); Check('AC11b','=','0'); Check('AC11c','7','7');
      Check('AC12a','C1,2B','1,'); Check('AC12b','B','1'); Check('AC12c','B','0');
      Check('AC13a','C2+3=B','5'); Check('AC13b','71B','7');
      Check('AC14a','CS','-0'); Check('AC14b','C5+S2=','3'); Check('AC14c','C12SS','12');
      Check('AC15a','C2+3=','5'); Check('AC15b','S','-5'); Check('AC15c','=','-2');
      Overflow; Check('AC16','','Resultado fora da faixa numérica.');
      Check('AC17ignored','EBS+=','Resultado fora da faixa numérica.');
      Check('AC09error','C=','0');
      Overflow; Check('AC17clear','C','0');
      Overflow; Check('AC17digit','7','7');
      Overflow; Check('AC17comma',',','0,');
      Check('AC18decimal','C1,20+2,30=','3,5');
      Check('AC18zero','C1+S1=','0');
      Bits := UInt64(1) shl 63; Move(Bits,NegZero,SizeOf(NegZero));
      if TCalculatorFormatter.ResultText(NegZero) <> '0' then raise Exception.Create('Signed zero');
      WriteLn('AC18 signed internal zero observed=0 expected=0');
      Check('AC19precision','C0,123456789012345+0,123456789012345=','0,24691357802469');
      Keys('C1'); for I := 1 to 100 do Keys('+=');
      WriteLn('AC19scientific Observed=',TLabel(F.Components[1]).Caption);
      if Pos('E',TLabel(F.Components[1]).Caption)=0 then raise Exception.Create('Missing scientific');
      if Pos(',',TLabel(F.Components[1]).Caption)=0 then raise Exception.Create('Missing comma');
      Check('Regression','C2+3===','11');
      WriteLn('PASS checks=',Count,' GUI production View/controller/math, real natural overflow');
    finally F.Free end;
  except on E: Exception do begin WriteLn('FAIL ',E.ClassName,': ',E.Message); ExitCode:=1 end end;
end.