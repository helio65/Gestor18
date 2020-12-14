unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    Menu: TMainMenu;
    arefas1: TMenuItem;
    arefa11: TMenuItem;
    arefa21: TMenuItem;
    arefa31: TMenuItem;
    procedure arefa11Click(Sender: TObject);
    procedure arefa21Click(Sender: TObject);
    procedure arefa31Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses ufTarefa1, ufTarefa2, ufTarefa3;

procedure TFrmPrincipal.arefa11Click(Sender: TObject);
begin
   if not Assigned(fTarefa1) then
      fTarefa1 := TfTarefa1.Create(Self);
   fTarefa1.Show;
end;

procedure TFrmPrincipal.arefa21Click(Sender: TObject);
begin
   if not Assigned(fTarefa2) then
      fTarefa2 := TfTarefa2.Create(Self);
   fTarefa2.Show;
end;

procedure TFrmPrincipal.arefa31Click(Sender: TObject);
begin
   if not Assigned(fTarefa3) then
      fTarefa3 := TfTarefa3.Create(Self);
   fTarefa3.Show;
end;

end.
