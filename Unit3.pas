unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, TeEngine, ExtCtrls, TeeProcs, Chart;

type
  TForm3 = class(TForm)
    cht1: TChart;
    Series1: TFastLineSeries;
    Series2: TPointSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
    uses Unit1;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
var
  i, l1, max11, kk:Integer;
  M:Real;
begin
  Series1.Clear;
  Series2.Clear;
  i:=1;
  while Qp<Qk+krok do
  begin
    M:=M1[i];
    if M>0 then Series1.AddXY(Qp,M,'',clRed);
    Qp:=Qp+krok;
    i:=i+1;
  end;

      kk:=i;
      max11:=1;
      for l1:=2 to kk do
      begin
        if (M1[l1] > M1[max11]) then
        begin
          max11:=l1;
          Qp11:=Qp11+krok;
        end;
      end;
  Series2.AddXY(Qp11,M1[max11],'',clRed);
end;

end.
