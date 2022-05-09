unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, TeEngine, Series, TeeProcs, Chart,
  MXGRAPH, Math, ComCtrls, Unit2, Unit3;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt8: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edt9: TEdit;
    edt10: TEdit;
    edt11: TEdit;
    edt12: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    edt13: TEdit;
    edt14: TEdit;
    edt15: TEdit;
    edt16: TEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    StringGrid1: TStringGrid;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    edt17: TEdit;
    lbl24: TLabel;
    edt18: TEdit;
    lbl25: TLabel;
    edt19: TEdit;
    lbl26: TLabel;
    edt20: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    edt21: TEdit;
    edt22: TEdit;
    edt23: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  nBN: array[1..99] of Real;
  nCD: array[1..99] of Real;
  yBN: array[1..99] of Real;
  yCD: array[1..99] of Real;
  M1: array[1..99] of Real;
  krok, Qp, Qk, Qp1, Qp2, Qp3, Qp4, Qp11: Extended;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3, d0, d1, d2, d3: Real;
  j, i, x, y, k, l, max1, max2, max3, max4, kk: Integer;
begin
  StringGrid1.Options:=StringGrid1.Options+[goEditing];
  StringGrid1.Cells[0,0]:='Q';
  StringGrid1.Cells[1,0]:='f1';
  StringGrid1.Cells[2,0]:='f2';
  StringGrid1.Cells[3,0]:='f3';
  StringGrid1.Cells[4,0]:='f4';

  x:=StringGrid1.ColCount;
  y:=StringGrid1.RowCount;
  for i:=0 to x do
  for j:=0 to y do
  StringGrid1.Cells[i,j]:='';

  if (edt1.Text<>'') and (edt2.Text<>'') and
  (edt3.Text<>'') and (edt4.Text<>'') and
  (edt5.Text<>'') and (edt6.Text<>'') and
  (edt7.Text<>'') and (edt8.Text<>'') and
  (edt9.Text<>'') and (edt10.Text<>'') and
  (edt11.Text<>'') and (edt12.Text<>'') and
  (edt13.Text<>'') and (edt14.Text<>'') and
  (edt15.Text<>'') and (edt16.Text<>'') and
  (edt17.Text<>'') and (edt18.Text<>'') and
  (edt19.Text<>'') and (edt20.Text<>'') and
  (edt21.Text<>'') and (edt22.Text<>'') and (edt23.Text<>'') then
  begin
    a0:=StrToFloat(edt1.Text);
    b0:=StrToFloat(edt2.Text);
    c0:=StrToFloat(edt3.Text);
    d0:=StrToFloat(edt4.Text);
    a1:=StrToFloat(edt5.Text);
    b1:=StrToFloat(edt6.Text);
    c1:=StrToFloat(edt7.Text);
    d1:=StrToFloat(edt8.Text);
    a2:=StrToFloat(edt9.Text);
    b2:=StrToFloat(edt10.Text);
    c2:=StrToFloat(edt11.Text);
    d2:=StrToFloat(edt12.Text);
    a3:=StrToFloat(edt13.Text);
    b3:=StrToFloat(edt14.Text);
    c3:=StrToFloat(edt15.Text);
    d3:=StrToFloat(edt16.Text);
    Qp:=StrToFloat(edt17.Text);
    krok:=StrToFloat(edt18.Text);
    Qk:=StrToFloat(edt19.Text);

    if krok>=0.02 then
    begin
      k:=1;
      while Qp<Qk+krok do
      begin
        nBN[k]:=a0+a1*Qp+a2*Qp*Qp+a3*Qp*Qp*Qp;
        nCD[k]:=b0+b1*Qp+b2*Qp*Qp+b3*Qp*Qp*Qp;
        yBN[k]:=c0+c1*Qp+c2*Qp*Qp+c3*Qp*Qp*Qp;
        if Qp>0.09 then yCD[k]:=d0+d1*Qp+d2*Qp*Qp+d3*Qp*Qp*Qp;
        StringGrid1.RowCount:=k+1;
        StringGrid1.Cells[0,k]:=FloatToStr(Qp);
        StringGrid1.Cells[1,k]:=FloatToStr(nBN[k]);
        StringGrid1.Cells[2,k]:=FloatToStr(nCD[k]);
        if yBN[k]>0 then StringGrid1.Cells[3,k]:=FloatToStr(yBN[k]);
        if (yCD[k]<=100) and (yCD[k]<>0) then StringGrid1.Cells[4,k]:=FloatToStr(yCD[k]);
        Qp:=Qp+krok;
        k:=k+1;
      end;

      btn2.Enabled:=True;
      btn3.Enabled:=True;

      kk:=k;
      max1:=1;
      max2:=1;
      max3:=1;
      max4:=1;
      for l:=2 to kk do
      begin
        if (nBN[l] > nBN[max1]) then max1:=l;
        if (nCD[l] > nCD[max2]) then max2:=l;
        if (yBN[l] > yBN[max3]) then max3:=l;
        if (yCD[l] > yCD[max4]) then max4:=l;
      end;
      StringGrid1.Cells[1,max1]:='*'+FloatToStr(nBN[max1]);
      StringGrid1.Cells[2,max2]:='*'+FloatToStr(nCD[max2]);
      StringGrid1.Cells[3,max3]:='*'+FloatToStr(yBN[max3]);
      StringGrid1.Cells[4,max4]:='*'+FloatToStr(yCD[max4]);

    end else ShowMessage('Ќадто велика к≥льк≥сть значень! «б≥льш≥ть крок до 0,02.');
  end else ShowMessage('¬вед≥ть ус≥ дан≥!');
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  i, l, max1, max2, max3, max4, kk: Integer;
begin
  Qp:=StrToFloat(edt17.Text);
  krok:=StrToFloat(edt18.Text);
  Qk:=StrToFloat(edt19.Text);
  Qp1:=StrToFloat(edt17.Text);
  Qp2:=StrToFloat(edt17.Text);
  Qp3:=StrToFloat(edt17.Text);
  Qp4:=StrToFloat(edt17.Text);
  Application.CreateForm(TForm2, Form2);
  Form2.Show;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  a11, b11, c11, d11: Real;
  i, k, l, l1, max11, kk: Integer;
begin
  if (edt20.Text<>'') and (edt21.Text<>'')
  and (edt22.Text<>'') and (edt23.Text<>'') then
  begin
    StringGrid1.Cells[5,0]:='M';
    
    a11:=StrToFloat(edt20.Text);
    b11:=StrToFloat(edt21.Text);
    c11:=StrToFloat(edt22.Text);
    d11:=StrToFloat(edt23.Text);
    Qp:=StrToFloat(edt17.Text);
    krok:=StrToFloat(edt18.Text);
    Qk:=StrToFloat(edt19.Text);

    k:=1;
      while Qp<Qk+krok do
      begin
        M1[k]:=a11*nBN[k]+b11*nCD[k]+c11*yBN[k]+d11*yCD[k];
        StringGrid1.RowCount:=k+1;
        if M1[k]>=0 then StringGrid1.Cells[5,k]:=FloatToStr(M1[k]);
        Qp:=Qp+krok;
        k:=k+1;
      end;

      kk:=k;
      max11:=1;
      for l:=2 to kk do
      begin
        if (M1[l] > M1[max11]) then max11:=l;
      end;
      StringGrid1.Cells[5,max11]:='*'+FloatToStr(M1[max11]);
  end else ShowMessage('¬вед≥ть ус≥ дан≥!');

  Qp:=StrToFloat(edt17.Text);
  krok:=StrToFloat(edt18.Text);
  Qk:=StrToFloat(edt19.Text);
  Qp11:=StrToFloat(edt17.Text);
  Application.CreateForm(TForm3, Form3);
  Form3.Show;
end;

end.
