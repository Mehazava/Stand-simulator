unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListBox1: TListBox;
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
    Price: Int64;
    Goods: array of TGoods;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

