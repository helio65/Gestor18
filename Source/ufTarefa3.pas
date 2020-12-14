unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Datasnap.DBClient;

type
  TfTarefa3 = class(TfBase)
    gridProjetos: TDBGrid;
    edtTotal: TLabeledEdit;
    edtTotalDivisoes: TLabeledEdit;
    btnObterTotal: TBitBtn;
    btnObterTotalDivisoes: TBitBtn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    aClientDataSet : TClientDataSet;
    aDataSource    : TDataSource;
    procedure PopularGridProjetos;
    function TotalizarValorProjetos(aDataSet : TDataSet) : Currency;
    function TotalizarValorDivisoes(aDataSet : TDataSet) : Double;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
   edtTotal.Text := FormatFloat('0.00', TotalizarValorProjetos(gridProjetos.DataSource.DataSet));
end;

procedure TfTarefa3.btnObterTotalDivisoesClick(Sender: TObject);
begin
   edtTotalDivisoes.Text := FormatFloat('0.00', TotalizarValorDivisoes(gridProjetos.DataSource.DataSet));
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
   aClientDataSet          := TClientDataSet.Create(nil);
   aDataSource             := TDataSource.Create(nil);
   aDataSource.DataSet     := aClientDataSet;
   gridProjetos.DataSource := aDataSource;
   aClientDataSet.IndexFieldNames := 'Codigo';
   PopularGridProjetos;
end;

procedure TfTarefa3.FormDestroy(Sender: TObject);
begin
   fTarefa3 := nil;
   aClientDataSet.Free;
   aDataSource.Free;
end;

procedure TfTarefa3.PopularGridProjetos;
var
   aIndex: Integer;
begin
   aClientDataSet.FieldDefs.Clear;
   aClientDataSet.FieldDefs.Add('Codigo', ftInteger);
   aClientDataSet.FieldDefs.Add('NomeProjeto', ftString, 50);
   aClientDataSet.FieldDefs.Add('Valor', ftCurrency);
   aClientDataSet.CreateDataSet;
   aClientDataSet.DisableControls;
   try
      for aIndex := 1 to 10 do begin
         aClientDataSet.Insert;
         aClientDataSet.FieldByName('Codigo').AsInteger := aIndex;
         aClientDataSet.FieldByName('NomeProjeto').AsString := 'Projeto ' + aIndex.ToString;
         aClientDataSet.FieldByName('Valor').AsCurrency := aIndex * 10;
         aClientDataSet.Post;
      end;
      aClientDataSet.First;
   finally
      aClientDataSet.EnableControls;
   end;
end;

function TfTarefa3.TotalizarValorDivisoes(aDataSet: TDataSet): Double;
var
   aDividendo, aDivisor : Double;
   aFirst        : Boolean;
   aDatasetClone : TClientDataSet;
begin

   Result     := 0;
   aDividendo := 0;
   aDivisor   := 0;
   aFirst     := True;

   aDatasetClone := TClientDataSet.Create(nil);
   aDatasetClone.CloneCursor(TClientDataSet(aDataSet), False, False);
   try
      while not aDatasetClone.Eof do begin

         if aFirst then begin
            aDivisor := aDatasetClone.FieldByName('Valor').AsCurrency;
            aFirst   := False;
         end else begin
            aDividendo := aDatasetClone.FieldByName('Valor').AsCurrency;
         end;

         if (aDividendo > 0) and (aDivisor > 0) then begin
            Result     := Result + (aDividendo / aDivisor);
            aDivisor   := aDividendo;
            aDividendo := 0;
         end;

         aDatasetClone.Next;

      end;
   finally
      aDatasetClone.Free;
   end;
end;

function TfTarefa3.TotalizarValorProjetos(aDataSet: TDataSet): Currency;
var
   aDatasetClone : TClientDataSet;
begin
   Result        := 0;
   aDatasetClone := TClientDataSet.Create(nil);
   aDatasetClone.CloneCursor(TClientDataSet(aDataSet), False, False);
   try
      while not aDatasetClone.Eof do begin
         Result := Result + aDatasetClone.FieldByName('Valor').AsCurrency;
         aDatasetClone.Next;
      end;
   finally
      aDatasetClone.Free;
   end;
end;

end.
