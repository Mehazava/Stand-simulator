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
    StandName: TLabel;
    StandPrice: TLabel;
    GoodsList: TListBox;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
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
    constructor Create();
  end;

var
  Form1: TForm1;
  StandArr: array[0..STALLNUM] of TStand;
  StandPos: array[0..STALLNUM, 0..1] of Integer;
  StandSizeX, StandSizeY, ActiveStand, SCounter: Integer;

implementation

{$R *.lfm}

{ TForm1 }

constructor TStand.Create();
begin
  SCounter += 1;
  Name := 'Shop ' + IntToStr(SCounter);
  Price := SCounter * 100;
  Owner := 'NULL';
  GoT := -1;
  ////////////
  if (SCounter = 4) then begin
    GoT := 2;
    SetLength(Goods, 3);
    Goods[0].Name:= 'potato'; 
    Goods[0].Number:= 3;
    Goods[0].Value:= 20;
    Goods[1].Name:= 'leek';
    Goods[1].Number:= 5;
    Goods[1].Value:= 90;
    Goods[2].Name:= 'carrot';
    Goods[2].Number:= 12;
    Goods[2].Value:= 40;
  end;
  ////////
end;

procedure BuyCrap;
var
  i, j: Integer;
begin
  Randomize;
  for i := 0 to STALLNUM do begin
    for j := 0 to StandArr[i].GoT do begin
      if ((StandArr[i].Goods[j].Number > 0) and (random(10) > 8)) then begin // 1/10th chance
        StandArr[i].Goods[j].Number -= 1;
      end;
    end;
  end;
end;

procedure Choose(N: Integer);
var
  i: Integer;
begin
  ActiveStand := N;
  Form1.StandName.Caption := StandArr[N].Name;
  Form1.StandPrice.Caption := IntToStr(StandArr[N].Price) + ' $';
  if (StandArr[N].Owner = Form1.AccountCB.Caption) then
    Form1.BuyStandButton.Caption := 'Продать киосок'
  else Form1.BuyStandButton.Caption := 'Купить киосок';
  for i := 0 to StandArr[N].GoT do begin
    Form1.GoodsList.Items.Add(IntToStr(StandArr[N].Goods[i].Number) + ' ' +
      StandArr[N].Goods[i].Name + ' for ' + IntToStr(StandArr[N].Goods[i].Value));
  end;
end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
begin
  for i := 0 to STALLNUM do begin
    //if ((X > StandPos[i, 0]) and (X < StandPos[i, 0] + StandSizeX) and
    //  (Y > StandPos[i, 1]) and (Y < StandPos[i, 1] + StandSizeY))
    //then begin
    //  Choose(i);
    //  break;
    //end;
  end;
  Choose(3);//
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  SCounter := 0;
  for i := 0 to STALLNUM do begin
    StandArr[i] := TStand.Create;
  end;
end;


end.

