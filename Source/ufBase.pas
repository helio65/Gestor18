unit ufBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfBase = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBase: TfBase;

implementation

{$R *.dfm}

procedure TfBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;
end;

end.
