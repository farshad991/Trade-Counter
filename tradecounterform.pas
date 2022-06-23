unit TradeCounterForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnLoss: TButton;
    BtnReset: TButton;
    BtnWinDecrease: TButton;
    BtnWin: TButton;
    BtnLossDecrease: TButton;
    Button1: TButton;
    LblWin: TLabel;
    LblTotal: TLabel;
    LblLoss: TLabel;
    LblWinrate: TLabel;
    LblWinrateTitle: TLabel;
    LblTotalTitle: TLabel;
    tglAlwaysTop: TToggleBox;
    procedure BtnLossClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure BtnWinClick(Sender: TObject);
    procedure BtnLossDecreaseClick(Sender: TObject);
    procedure BtnWinDecreaseClick(Sender: TObject);
    procedure BtnHome(Sender: TObject);
    procedure tglAlwaysTopChange(Sender: TObject);
    procedure TotalCount();
  private
    wincount:Integer;
    losscount:Integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnWinClick(Sender: TObject);
begin
     Inc(wincount);
     LblWin.Caption:=IntToStr(wincount);
     TotalCount();
end;

procedure TForm1.BtnLossClick(Sender: TObject);
begin
     Inc(losscount);
     LblLoss.Caption:=IntToStr(losscount);
     TotalCount();
end;

procedure TForm1.BtnResetClick(Sender: TObject);
begin
     wincount := 0;
     losscount := 0;
     LblWin.Caption:='0';
     LblLoss.Caption:='0';
     LblTotal.Caption:='';
     LblWinrate.Caption:='';
end;

procedure TForm1.BtnLossDecreaseClick(Sender: TObject);
begin
     Dec(losscount);
     LblLoss.Caption:=IntToStr(losscount);
     TotalCount();
end;

procedure TForm1.BtnWinDecreaseClick(Sender: TObject);
begin
     Dec(wincount);
     LblWin.Caption:=IntToStr(wincount);
     TotalCount();
end;

procedure TForm1.BtnHome(Sender: TObject);
begin
     OpenURL('https://github.com/farshad991/TradeCounter');
end;

procedure TForm1.tglAlwaysTopChange(Sender: TObject);
begin
     if tglAlwaysTop.Checked then
     FormStyle:=fsSystemStayOnTop
  else
     FormStyle:=fsNormal;
end;

procedure TForm1.TotalCount();
var
     totaltrade:Integer;
     winrate:Double;
     winratea:Integer;
begin
     totaltrade := wincount + losscount;
     winrate := wincount / totaltrade * 100;
     winratea := trunc(winrate);
     LblTotal.Caption:=IntToStr(totaltrade);
     LblWinrate.Caption:=IntToStr(winratea) + ' %';

end;

end.

