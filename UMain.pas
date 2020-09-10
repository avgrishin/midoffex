unit UMain;

interface

uses Windows, Forms, ADODB,ActiveX,Controls;

procedure acShowReports(App: TApplication; Conn: _Connection);
procedure acShowReports2(const hApp: HWND; Conn: _Connection);
procedure acShowReportsMDI(App: TApplication; Scr: TScreen; Conn: _Connection);
procedure acShowReport(App: TApplication; Conn: _Connection; AParentID: Integer; AReportID: Integer; ADopParamStr: string);
procedure acEmailReport(const hApp: HWND; Conn: _Connection; AReportID: Integer; ADopParamStr: string);
procedure acAddOption(const hApp: HWND; Conn: _Connection; out SecID: Integer);

var
  DllApp: TApplication;
  DllScr: TScreen;

implementation

uses DM, ReportsADO, Graphics, MyForm, AddOption;

procedure acShowReports(App: TApplication; Conn: _Connection); export;
var
  FConnObject: _Connection;
begin
  //if not Assigned(DllApp) then
//    DllApp := Application;
//  Application := App;
  FConnObject := DM1.ADOConnection1.ConnectionObject;
  DM1.DataModuleInit(Conn);
  with TfReportsADO1.Create(nil {Application.MainForm}) do
    try
      FormStyle := fsNormal;
      Visible := False;
      Position := poDesktopCenter;
      FormInit(0, 0, '');
      //acExec1Execute(Application.MainForm);
      ShowModal;
    finally
      Free;
  end;
  DM1.ADOConnection1.ConnectionObject := FConnObject;
end;

procedure acShowReports2(const hApp: HWND; Conn: _Connection); export;
var
  FConnObject: _Connection;
  FHWND: HWND;
begin
  FHWND := Application.Handle;
  Application.Handle := hApp;
  FConnObject := DM1.ADOConnection1.ConnectionObject;
  DM1.DataModuleInit(Conn);
  try
    with TfReportsADO1.Create(Application) do
      try
        FormStyle := fsNormal;
        Visible := False;
        Position := poDesktopCenter;
        FormInit(0, 0, '');
        //acExec1Execute(Application.MainForm);
        ShowModal;
      finally
        Free;
      end;
  finally
    DM1.ADOConnection1.ConnectionObject := FConnObject;
    Application.Handle := FHWND;
  end;
end;

procedure acShowReport(App: TApplication; Conn: _Connection; AParentID: Integer; AReportID: Integer; ADopParamStr: string);
var
  FConnObject: _Connection;
begin
  if not Assigned(DllApp) then
    DllApp := Application;
  Application := App;
  FConnObject := DM1.ADOConnection1.ConnectionObject;
  DM1.DataModuleInit(Conn);
  with TfReportsADO1.Create(Application.MainForm) do
    try
      FormStyle := fsNormal;
      Visible := False;
      Position := poDesktopCenter;
      FormInit(AParentID, 0, ADopParamStr);
      q1.Locate('ReportID', AReportID, []);
      acExec1Execute(Application.MainForm);
      //ShowModal;
    finally
      Free;
  end;
  DM1.ADOConnection1.ConnectionObject := FConnObject;
end;

procedure acEmailReport(const hApp: HWND; Conn: _Connection; AReportID: Integer; ADopParamStr: string);
var
  FConnObject: _Connection;
  FHWND: HWND;
begin
  FHWND := Application.Handle;
  Application.Handle := hApp;

  FConnObject := DM1.ADOConnection1.ConnectionObject;
  DM1.DataModuleInit(Conn);
  try
    with TfReportsADO1.Create(Application) do
      try
        FormStyle := fsNormal;
        Visible := False;
        Position := poDesktopCenter;
        //FormInit(AParentID, 0, ADopParamStr);
        //q1.Locate('ReportID', AReportID, []);
        ExecReportEmail(AReportID, ADopParamStr);
      finally
        Free;
    end;
  finally
    DM1.ADOConnection1.ConnectionObject := FConnObject;
    Application.Handle := FHWND;
  end;
end;

procedure acShowReportsMDI(App: TApplication; Scr: TScreen; Conn: _Connection);
begin
  if not Assigned(DllApp) then
    DllApp := Application;
  Application := App;
  if not Assigned(DllScr) then
    DllScr := Screen;
  Screen := Scr;
  DM1.DataModuleInit(Conn);
  with TfReportsADO1.Create(Application) do
  begin
    FormStyle := fsMDIChild;
    FormInit(0, 0, '');
    Show;
  end;
  Screen := DllScr;
end;

procedure acAddOption(const hApp: HWND; Conn: _Connection; out SecID: Integer); export;
var
  FConnObject: _Connection;
  FHWND: HWND;
begin
  FHWND := Application.Handle;
  Application.Handle := hApp;
  FConnObject := DM1.ADOConnection1.ConnectionObject;
  DM1.DataModuleInit(Conn);
  try
    with TfAddOption.Create(nil) do
      try
        FormStyle := fsNormal;
        Visible := False;
        Position := poDesktopCenter;
        if ShowModal = mrOk then
          SecID := qSecOpt1.FieldByName('ID').Value;
      finally
        Free;
    end;
  finally
    DM1.ADOConnection1.ConnectionObject := FConnObject;
    Application.Handle := FHWND;
  end;
end;

end.
