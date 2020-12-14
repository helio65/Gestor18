unit uspQuery;

interface

uses
  FireDAC.Comp.Client, System.Classes, System.SysUtils;

type
  TspQuery = class (TFDQuery)
  private
    FspCondicoes: TStrings;
    FspColunas: TStrings;
    FspTabelas: TStrings;
    procedure SetspColunas(const Value: TStrings);
    procedure SetspCondicoes(const Value: TStrings);
    procedure SetspTabelas(const Value: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure GeraSQL;
  published
    property spCondicoes: TStrings read FspCondicoes write SetspCondicoes;
    property spColunas: TStrings read FspColunas write SetspColunas;
    property spTabelas: TStrings read FspTabelas write SetspTabelas;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
   inherited;
   FspCondicoes := TStringList.Create;
   FspColunas   := TStringList.Create;
   FspTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
   FspTabelas.Free;
   FspColunas.Free;
   FspCondicoes.Free;
   inherited;
end;

procedure TspQuery.GeraSQL;
var
   FSQLTemplate : String;
   FTabelas : TStringList;
begin
//   1) A primeira condi��o n�o deve iniciar por um operador
//   2) A segunda condi��o em diante precisa incluir AND, OR, etc.
//   3) FspTabelas.CommaText foi usado porque seu valor � identico a
//      FspTabelas.Text e ainda permite que no futuro possam ser usadas mais de
//      uma tabela (joins separados por v�rgulas)

   if FspColunas.Text = EmptyStr then
      raise Exception.Create('Informe o nome da(s) coluna(s) a ser(em) retornada(s)!');
   if FspTabelas.Text = EmptyStr then
      raise Exception.Create('Informe o nome da(s) tabela(s)!');

   FTabelas := TStringList.Create;
   try
     FTabelas.Delimiter := ',';
     FTabelas.DelimitedText := FspTabelas.Text;
     if FTabelas.Count > 1 then
         raise Exception.Create('S� � permitido informar apenas uma tabela');
   finally
      FTabelas.Free;
   end;

   FSQLTemplate := 'select %s from %s';
   if FspCondicoes.Text <> EmptyStr then begin
      FSQLTemplate := FSQLTemplate + ' where %s';
      SQL.Text := Format(FSQLTemplate,[FspColunas.CommaText, FspTabelas.CommaText, FspCondicoes.Text]);
   end else begin
      SQL.Text := Format(FSQLTemplate,[FspColunas.CommaText, FspTabelas.CommaText]);
   end;

   FspTabelas.Clear;
   FspColunas.Clear;
   FspCondicoes.Clear;

end;

procedure TspQuery.SetspColunas(const Value: TStrings);
begin
   FspColunas.Assign(Value);
end;

procedure TspQuery.SetspCondicoes(const Value: TStrings);
begin
   FspCondicoes.Assign(Value);
end;

procedure TspQuery.SetspTabelas(const Value: TStrings);
begin
   FspTabelas.Assign(Value);
end;

end.
