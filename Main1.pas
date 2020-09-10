unit Main1;

interface

uses
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs, TableADO, frxDesgn, frxClass, TB2Item, TBX, Menus, ActnList, DB,
//  TB2Dock, TB2Toolbar, Grids, DBGridEh, FilterPart,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, TB2Item, TBX,
  TBXMDI, TBXSwitcher, TB2Dock, TB2Toolbar, Dialogs, ImgList, ActnList,
  ActnMan, ComCtrls, ADODB, InvokeRegistry, Rio, SOAPHTTPClient,
  IdBaseComponent, IdComponent, IdCoder3to4,
  IdTCPConnection, IdTCPClient, IdMessage, IdMessageClient, IdSMTP, IdCoderMIME;

type
  TMainForm = class(TForm)
    acClose1: TAction;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    acRefresh1: TAction;
    acFilter1: TAction;
    SaveDialog1: TSaveDialog;
    acAbout1: TAction;
    TBXDock1: TTBXDock;
    TBXToolbar1: TTBXToolbar;
    TBXMDIWindowItem1: TTBXMDIWindowItem;
    TBXMDIHandler1: TTBXMDIHandler;
    TBXDock2: TTBXDock;
    TBXToolbar2: TTBXToolbar;
    TBXSubmenuItem1: TTBXSubmenuItem;
    TBXSubmenuItem2: TTBXSubmenuItem;
    TBXSubmenuItem3: TTBXSubmenuItem;
    TBXSubmenuItem5: TTBXSubmenuItem;
    TBXSubmenuItem6: TTBXSubmenuItem;
    TBXItem1: TTBXItem;
    TBXItem2: TTBXItem;
    TBXItem3: TTBXItem;
    TBXMDIWindowItem2: TTBXMDIWindowItem;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBXItem17: TTBXItem;
    acReport1: TAction;
    TBXItem23: TTBXItem;
    acDocsTW1: TAction;
    ActionList1: TActionList;
    acTest: TAction;
    TBXItem38: TTBXItem;
    TBXItem4: TTBXItem;
    acReportA1: TAction;
    acReportB1: TAction;
    TBXItem5: TTBXItem;
    acMyForm1: TAction;
    acCBonds: TAction;
    acRep1: TAction;
    TBXItem6: TTBXItem;
    TBXItem7: TTBXItem;
    acEmail1: TAction;
    TBXItem8: TTBXItem;
    acAddOption1: TAction;
    acEMailTest: TAction;
    IdSMTP1: TIdSMTP;
    TBXItem9: TTBXItem;
    procedure acClose1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acAbout1Execute(Sender: TObject);
    procedure acCascade1Execute(Sender: TObject);
    procedure acTile1Execute(Sender: TObject);
    procedure acReport1Execute(Sender: TObject);
    procedure acReportA1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acReportB1Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acMyForm1Execute(Sender: TObject);
    procedure acRep1Execute(Sender: TObject);
    procedure acEmail1Execute(Sender: TObject);
    procedure acAddOption1Execute(Sender: TObject);
    procedure acEMailTestExecute(Sender: TObject);
  private
    DLLInstance: THandle;
    PackageModule : HModule;
    proc: procedure(AHandle: TApplication; Conn: _Connection);
    function LookMdiChild(Sender: TObject; Num: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

//procedure acShowReports(App: TApplication; Conn: _Connection); external 'midoffex.dll';

implementation

uses DM, StrUtils, About1, ReportsADO, MyForm, bond, WeatherForecast, XSBuiltIns;

{$R *.dfm}

procedure TMainForm.acClose1Execute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TMainForm.acAbout1Execute(Sender: TObject);
var
  fAbout1: TfAbout1;
begin
  fAbout1 := TfAbout1.Create(Self);
  try
    fAbout1.ShowModal;
  finally
    fAbout1.Free;
  end;
end;

function TMainForm.LookMdiChild(Sender: TObject; Num: Integer) : Boolean;
var
  Done: Boolean;
  Count: Integer;
begin
  LookMDIChild := False;
  Done := False;
  Count := 1;
  if MDIChildCount > 0 then
  begin
    repeat
    begin
      if MDIChildren[Count-1].Tag = Num then
      begin
        Done := True;
        LookMDIChild := True;
        MDIChildren[Count-1].Show;
      end
      else Count := Count+1;
      if Count > MDIChildCount Then Done := True;
    end;
    until Done;
  end;
end;

procedure TMainForm.acCascade1Execute(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.acTile1Execute(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.acReport1Execute(Sender: TObject);
var
  proc: procedure(App: HWND; Conn: _Connection);
begin
//  acShowReports(Application, DM1.ADOConnection1.ConnectionObject);

  if DLLInstance = 0 then
  begin
    DLLInstance := LoadLibrary('midoffex.dll');
    if DLLInstance = 0 then
    begin
      MessageDlg('Невозможно загрузить DLL', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  @proc := GetProcAddress(DLLInstance, 'acShowReports2');
  if @proc <> nil then
  begin
    proc(Application.Handle, DM1.ADOConnection1.ConnectionObject);
  end
  else
    MessageDlg('Не найдена искомая процедура!.', mtError, [mbOK], 0);

{
  if not LookMdiChild(Sender, 16) then
  begin
}
    //acShowReports;
    {
    with TfReportsADO1.Create(Self) do
    begin
      FormStyle := fsMDIChild;
      Tag := 16;
      FormInit(0, 0, 'DID=6858160');
      Show;
    end;
}
//  end;
end;

procedure TMainForm.acReportA1Execute(Sender: TObject);
var
  proc: procedure(AHandle: TApplication; Scr: TScreen; Conn: _Connection);
begin
  if DLLInstance = 0 then
  begin
    DLLInstance := LoadLibrary('midoffex.dll');
    if DLLInstance = 0 then
    begin
      MessageDlg('Невозможно загрузить DLL', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  @proc := GetProcAddress(DLLInstance, 'acShowReportsMDI');
  if @proc <> nil then
    proc(Application, Screen, DM1.ADOConnection1.ConnectionObject)
  else
    MessageDlg('Не найдена искомая процедура!.', mtError, [mbOK], 0);
  //
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DM1.ADOConnection1.Open;
end;

procedure TMainForm.acReportB1Execute(Sender: TObject);
begin
  if PackageModule = 0 then
  begin
    PackageModule := LoadPackage('MDIPackage.bpl');
    if PackageModule <> 0 then
    begin
      try
        @proc := GetProcAddress(PackageModule,'ExecuteChild');
      except
        //display an error message if we fail
        ShowMessage ('Package not found');
      end;
    end
  end;
  if Assigned(proc) then proc(Application, DM1.ADOConnection1.ConnectionObject);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if PackageModule <> 0 then UnloadPackage(PackageModule);
end;

procedure TMainForm.acMyForm1Execute(Sender: TObject);
begin
  if not LookMdiChild(Sender, 16) then
  begin
    with TfMyForm1.Create(Self) do
    begin
      FormStyle := fsMDIChild;
      Tag := 16;
      Show;
    end;
  end;

end;

procedure TMainForm.acRep1Execute(Sender: TObject);
var
  proc: procedure(App: TApplication; Conn: _Connection; AParentID: Integer; AReportID: Integer; ADopParamStr: string);
begin
  if DLLInstance = 0 then
  begin
    DLLInstance := LoadLibrary('midoffex.dll');
    if DLLInstance = 0 then
    begin
      MessageDlg('Невозможно загрузить DLL', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  @proc := GetProcAddress(DLLInstance, 'acShowReport');
  if @proc <> nil then
    proc(Application, DM1.ADOConnection1.ConnectionObject, 0, 91, 'CLIENTDUID=261')
  else
    MessageDlg('Не найдена искомая процедура!.', mtError, [mbOK], 0);
end;

procedure TMainForm.acEmail1Execute(Sender: TObject);
var
  proc: procedure(App: HWND; Conn: _Connection; AReportID: Integer; ADopParamStr: string);
begin
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
    proc(Application.Handle, DM1.ADOConnection1.ConnectionObject, 314, '');
  end
  else
    MessageDlg('Не найдена искомая процедура!.', mtError, [mbOK], 0);
end;

procedure TMainForm.acAddOption1Execute(Sender: TObject);
var
  proc: procedure(App: HWND; Conn: _Connection; out SecID: Integer);
  SecID: Integer;
begin
  if DLLInstance = 0 then
  begin
    DLLInstance := LoadLibrary('midoffex.dll');
    if DLLInstance = 0 then
    begin
      MessageDlg('Невозможно загрузить DLL', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  @proc := GetProcAddress(DLLInstance, 'acAddOption');
  if @proc <> nil then
  begin
    SecID := 0;
    proc(Application.Handle, DM1.ADOConnection1.ConnectionObject, SecID);
    Application.MessageBox(PAnsiChar(IntToStr(SecID)), 'dd');
  end
  else
    MessageDlg('Не найдена искомая процедура!.', mtError, [mbOK], 0);
end;

procedure TMainForm.acEMailTestExecute(Sender: TObject);
var
  AMsg: TIdMessage;
begin
  AMsg := TIdMessage.Create(Self);
  AMsg.Recipients.EMailAddresses := 'GrishinAV@am-uralsib.ru';//,uralsib@outlook.com
  AMsg.ExtraHeaders.Add('Subject: =?windows-1251?B?'+'Test'+'=?=');
  AMsg.From.Address := 'assets_msg@am-uralsib.ru';
  AMsg.From.Name := 'MiddleOffice';
  AMsg.Priority := mpHigh;
  AMsg.Body.Text := 'Test Тест';
  AMsg.CharSet := 'Windows-1251';
  AMsg.ContentTransferEncoding := '8bit';
  AMsg.ContentType := 'text/html';
  AMsg.Encoding := meMIME;
  IdSMTP1.Connect();
  if IdSMTP1.Authenticate then
    IdSMTP1.Send(AMsg);
  IdSMTP1.Disconnect;
end;

end.

