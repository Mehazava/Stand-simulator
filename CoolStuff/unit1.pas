unit Unit1;

{$mode objfpc}{$H+}
{$MACRO ON}
{$DEFINE STALLNUM:=19}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BuyStandButton: TButton;
    ChooseGoods: TComboBox;
    NumGoods: TEdit;
    Funds: TLabel;
    Label5: TLabel;
    ResultPrice: TLabel;
    OrderGoodsButton: TButton;
    AccountCB: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GoodsList: TListBox;
    Panel1: TPanel;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

  TGoods = record
    Name: String;
    Number, Value: Int64;
  end;

  TStand = class
  public
    Owner, Name: String;
    Price, GoT: Int64;
    Goods: array of TGoods;
  end;

var
  Form1: TForm1;
  StandArr: array[0..STALLNUM] of TStand;
  StandPos: array[0..STALLNUM, 0..1] of Integer;
  StandSizeX, StandSizeY: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure Choose(N: Integer);

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, x, y: Integer;
begin
  for i := 0 to STALLNUM do begin
    if ((X > StandPos[i, 0]) and (X < StandPos[i, 0] + StandSizeX) and
      (Y > StandPos[i, 1]) and (Y < StandPos[i, 1] + StandSizeY))
    then Choose(i);
  end;
  Form1.Funds.Caption := IntToStr(X);
end;

end.

