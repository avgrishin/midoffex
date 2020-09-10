unit DM2;

interface

uses
  Windows, Messages, Dialogs, Forms, SysUtils, Classes, DB, ADODB;

type
  TDataModule2 = class(TDataModule)
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    DLLInstance: THandle;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
  N: Integer;
  User, Pass: string;
  Report: string;
  DopParamStr: string;
  proc: procedure(App: HWND; Conn: _Connection; AReportID: Integer; ADopParamStr: string);
begin
  For N := 1 To ParamCount Do
  Begin
    if UpperCase(Copy(ParamStr(N), 1, 2)) = 'L:' then
      User := Copy(ParamStr(N), 3, Length(ParamStr(N)) - 2)
    else if UpperCase(Copy(ParamStr(N), 1, 2)) = 'P:' then
      Pass := Copy(ParamStr(N), 3, Length(ParamStr(N)) - 2)
    else if UpperCase(Copy(ParamStr(N), 1, 2)) = 'R:' then
      Report := Copy(ParamStr(N), 3, Length(ParamStr(N)) - 2)
    else if UpperCase(Copy(ParamStr(N), 1, 2)) = 'D:' then
      DopParamStr := Copy(ParamStr(N), 3, Length(ParamStr(N)) - 2)
  end;
  if ADOConnection1.Connected then
    ADOConnection1.Close;
  ADOConnection1.Open(User, Pass);
  if DLLInstance = 0 then
  begin
    DLLInstance := LoadLibrary('midoffex.dll');
    if DLLInstance = 0 then
    begin
      MessageDlg('Невозможно загрузить DLL', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  @proc := GetProcAddress(DLLInstance, 'acEmailReport');
  if @proc <> nil then
  begin
    proc(Application.Handle, ADOConnection1.ConnectionObject, StrToInt(Report), DopParamStr);
  end
  else
    MessageDlg('Не найдена искомая процедура!.', mtError, [mbOK], 0);
end;

end.
