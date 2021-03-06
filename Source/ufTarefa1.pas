unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufBase, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery, FireDAC.Phys.FBDef, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TfTarefa1 = class(TfBase)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    memoSQL: TMemo;
    btnGerarSQL: TBitBtn;
    spQuery1: TspQuery;
    procedure FormDestroy(Sender: TObject);
    procedure btnGerarSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGerarSQLClick(Sender: TObject);
begin
   memoSQL.Lines.Clear;
   spQuery1.spColunas   := memoColunas.Lines;
   spQuery1.spTabelas   := memoTabelas.Lines;
   spQuery1.spCondicoes := memoCondicoes.Lines;

   spQuery1.GeraSQL;
   memoSQL.Lines := spQuery1.SQL;
end;

procedure TfTarefa1.FormDestroy(Sender: TObject);
begin
   fTarefa1 := nil;
end;

end.
