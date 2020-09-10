unit PMain;

interface

uses Windows, Forms, ADODB, Dialogs;

procedure acShowReports(AHandle: THandle; Conn: _Connection);

implementation

uses DM, ReportsADO;

procedure acShowReports(AHandle: THandle; Conn: _Connection);
var
  fReports1: TfReportsADO1;
  DllAppHandle: THandle;
begin
  ShowMessage('Не');
  //DllAppHandle := Application.Handle;
  //Application.Handle := AHandle;
  //DM1.DataModuleInit(Conn);
  ShowMessage('Не1');
  fReports1 := TfReportsADO1.Create(nil);
  try
    //fReports1.FormStyle := fsNormal;
    fReports1.Position := poDesktopCenter;
    fReports1.FormInit(0, 0, '');
    fReports1.ShowModal;
  finally
    //fReports1.Free;
  end;
  //Application.Handle := DllAppHandle;
end;

exports
  acShowReports;

end.
