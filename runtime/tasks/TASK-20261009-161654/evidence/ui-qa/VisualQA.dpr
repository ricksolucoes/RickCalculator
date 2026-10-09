program VisualQA;
{$APPTYPE CONSOLE}
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, System.Types, Vcl.Forms, Vcl.Controls,
 Vcl.StdCtrls, Vcl.Graphics, Calculator.MainForm, Calculator.Controller;
var F:TCalculatorMainForm; D:TLabel; OutDir:string; I:Integer;
function Button(Index:Integer):TCalculatorButton;
begin Result:=TCalculatorButton(F.Components[Index+2]) end;
procedure Keys(const S:string);
var C:Char; J:Integer;
begin
 for C in S do begin
  for J:=0 to 16 do
   if (Button(J).LabelText=C) or ((C='S') and (J=3)) then begin Button(J).Click; Break end;
  Application.ProcessMessages;
 end;
end;
procedure Snap(const Name:string);
var B:TBitmap; DC:HDC; P:TPoint;
begin
 F.Repaint; Application.ProcessMessages; Sleep(350); Application.ProcessMessages;
 B:=TBitmap.Create; B.SetSize(F.ClientWidth,F.ClientHeight); P:=F.ClientToScreen(Point(0,0)); DC:=GetDC(0); try BitBlt(B.Canvas.Handle,0,0,B.Width,B.Height,DC,P.X,P.Y,SRCCOPY); finally ReleaseDC(0,DC) end;
 try B.SaveToFile(OutDir+Name+'.bmp') finally B.Free end;
 WriteLn(Name,' display=',D.Caption,' ppi=',F.PixelsPerInch,
 ' client=',F.ClientWidth,'x',F.ClientHeight,' displayfont=',D.Font.Size);
end;
procedure Geometry;
var J,K:Integer; A,B:TControl; R:TRect; Next:HWND;
begin
 if F.ComponentCount<>19 then raise Exception.Create('Inventory');
 for J:=0 to 16 do begin
  A:=Button(J);
  WriteLn('button ',J,' label=',Button(J).LabelText,' accessible=',Button(J).Caption,
   ' enabled=',A.Enabled,' tab=',Button(J).TabOrder,
   ' bounds=',A.Left,',',A.Top,',',A.Width,',',A.Height);
  if (A.Left<0) or (A.Top<0) or (A.Left+A.Width>F.ClientWidth) or
   (A.Top+A.Height>F.ClientHeight) then raise Exception.Create('Clipping');
  if Button(J).TabOrder<>J then raise Exception.Create('Tab order');
  for K:=J+1 to 16 do begin
   B:=Button(K);
   if IntersectRect(R,A.BoundsRect,B.BoundsRect) then raise Exception.Create('Overlap');
  end;
  Button(J).SetFocus; F.Perform(CM_DIALOGKEY,VK_TAB,0); Next:=F.ActiveControl.Handle;
  if Next<>Button((J+1) mod 17).Handle then raise Exception.Create('VCL Tab traversal');
 end;
 WriteLn('PASS inventory bounds overlap actual-tab-cycle');
end;
begin
 try
 OutDir:=IncludeTrailingPathDelimiter(ExtractFilePath(ExtractFileDir(ParamStr(0))));
 Application.Initialize;
 F:=TCalculatorMainForm.Create(nil);
 try
 F.SetController(TCalculatorController.New); F.Position:=poDesigned; F.Left:=0; F.Top:=0; F.Show; F.BringToFront; Application.ProcessMessages; Sleep(800); Application.ProcessMessages;
 D:=TLabel(F.Components[1]); Geometry;
 Button(0).SetFocus; Snap('01-initial-focus');
 SendMessage(Button(0).Handle,BM_SETSTATE,1,0); Snap('02-pressed');
 SendMessage(Button(0).Handle,BM_SETSTATE,0,0);
 Button(7).SetFocus; SendMessage(Button(7).Handle,BM_SETSTATE,1,0); Snap('02b-accent-pressed'); SendMessage(Button(7).Handle,BM_SETSTATE,0,0); Keys('C123456789012345S'); Snap('03-negative-15digits');
 Keys('C0,123456789012345S'); Snap('04-negative-decimal');
 Keys('C,'); Snap('05-transient-zero-comma'); Keys('C1,'); Snap('06-transient-one-comma');
 Keys('CS'); Snap('07-negative-zero'); Keys('C2+3='); Snap('08-result');
 Keys('C1'); for I:=1 to 100 do Keys('+='); Snap('09-scientific');
 Keys('C1'); for I:=1 to 1100 do begin
  Keys('+=');
  if D.Caption='Resultado fora da faixa numérica.' then Break;
 end;
 if D.Caption<>'Resultado fora da faixa numérica.' then raise Exception.Create('No error');
 for I:=0 to 16 do if Button(I).Enabled=(I in [1,2,3,7,11]) then raise Exception.Create('Error availability');
 Snap('10-error'); Keys('7'); Snap('11-recovery');
 F.ScaleForPPI(144); F.PixelsPerInch:=144; F.OnResize(F); F.Left:=0; F.Top:=0; Geometry; Snap('12-scale150');
 Keys('C0,123456789012345S'); Snap('13-scale150-long');
 Keys('C1'); for I:=1 to 1100 do begin Keys('+='); if D.Caption='Resultado fora da faixa numérica.' then Break end;
 Snap('14-scale150-error');
 WriteLn('PASS visual evidence captured');
 finally F.Free end;
 except on E:Exception do begin WriteLn('FAIL ',E.Message); ExitCode:=1 end end;
end.





