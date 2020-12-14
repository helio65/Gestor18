unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufBase, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, System.Threading;

type
  TfTarefa2 = class(TfBase)
    BitBtn1: TBitBtn;
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    Label1: TLabel;
    edtTempo_T1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtTempo_T2: TEdit;
    Label4: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessarThread1;
    procedure ProcessarThread2;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.BitBtn1Click(Sender: TObject);
begin
   pbThread1.Visible := True;
   pbThread2.Visible := True;
   ProcessarThread1;
   ProcessarThread2;
end;

procedure TfTarefa2.FormDestroy(Sender: TObject);
begin
   fTarefa2 := nil;
end;

procedure TfTarefa2.ProcessarThread1;
begin
   TTask.Run(
            procedure
            var
               aIndex: Integer;
            begin

               pbThread1.Max      := 101;
               pbThread1.Position := 0;


               for aIndex := 0 to 100 do begin

                  Sleep(StrToIntDef(edtTempo_T1.Text,0));
                  TThread.Synchronize(
                     TThread.CurrentThread,
                        procedure
                        begin
                           pbThread1.Position := pbThread1.Position + 1;
                        end);
               end;
            end
   );
end;

procedure TfTarefa2.ProcessarThread2;
begin
   TTask.Run(
            procedure
            var
               aIndex: Integer;
            begin

               pbThread2.Max      := 101;
               pbThread2.Position := 0;

               for aIndex := 0 to 100 do begin

                  Sleep(StrToIntDef(edtTempo_T2.Text, 0));
                  TThread.Synchronize(
                     TThread.CurrentThread,
                        procedure
                        begin
                           pbThread2.Position := pbThread2.Position + 1;
                        end);
               end;
            end
   );
end;

end.