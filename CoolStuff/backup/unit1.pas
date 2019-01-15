unit Unit1;

{$mode objfpc}{$H+}

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
  StandArr: array[0..69] of TStand;

implementation

{$R *.lfm}

end.

