unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, TeEngine, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm2 = class(TForm)
    cht1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    Series4: TFastLineSeries;
    Series5: TPointSeries;
    Series6: TPointSeries;
    Series7: TPointSeries;
    Series8: TPointSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
  Uses Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  i, l, max1, max2, max3, max4, kk: Integer;
  nB, nC, yB, yC: Real;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  Series6.Clear;
  Series7.Clear;
  Series8.Clear;

  i:=1;
  while Qp<Qk+krok do
  begin
    nB:=nBN[i];
    nC:=nCD[i];
    yB:=yBN[i];
    yC:=yCD[i];
    Series1.AddXY(Qp,nB,'',clRed);
    Series2.AddXY(Qp,nC,'',clGreen);
    if yBN[i]>0 then Series3.AddXY(Qp,yB,'',clYellow);
    if (yCD[i]<=100) and (yCD[i]<>0) then Series4.AddXY(Qp,yC,'',clBlue);
    Qp:=Qp+krok;
    i:=i+1;
  end;

      kk:=i;
      max1:=1;
      max2:=1;
      max3:=1;
      max4:=1;
      for l:=2 to kk do
      begin
        if (nBN[l] > nBN[max1]) then
        begin
          max1:=l;
          Qp1:=Qp1+krok;
        end;
        if (nCD[l] > nCD[max2]) then
        begin
          max2:=l;
          Qp2:=Qp2+krok;
        end;
        if (yBN[l] > yBN[max3]) then
        begin
          max3:=l;
          Qp3:=Qp3+krok;
        end;
        if (yCD[l] > yCD[max4]) then
        begin
          max4:=l;
          Qp4:=Qp4+krok;
        end;
      end;
  Series5.AddXY(Qp1,nBN[max1],'',clRed);
  Series6.AddXY(Qp2,nCD[max2],'',clGreen);
  Series7.AddXY(Qp3,yBN[max3],'',clYellow);
  Series8.AddXY(Qp4,yCD[max4],'',clBlue);
end;  

end.
