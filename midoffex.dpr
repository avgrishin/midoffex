library midoffex;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  SysUtils,
  Classes,
  Windows,
  Forms,
  DM in 'DM.pas' {DM1: TDataModule},
  UMain in 'UMain.pas',
  ParamADO1 in 'ParamADO1.pas' {fParamADO1},
  TableADO1 in 'TableADO1.pas' {fTableADO1},
  TableADO in 'TableADO.pas' {fTableADO},
  ReportCADO1 in 'ReportCADO1.pas' {fReportCADO1},
  ReportCADO3 in 'ReportCADO3.pas' {fReportCADO3},
  ReportsADO in 'ReportsADO.pas' {fReportsADO1},
  getNode in 'getNode.pas',
  EhLibADO in 'EhLibADO.Pas',
  SpravADO1 in 'SpravADO1.pas' {fSpravADO1},
  ReportCADO7 in 'ReportCADO7.pas' {fReportCADO7},
  MyForm in 'MyForm.pas' {fMyForm1},
  ReportCADO4 in 'ReportCADO4.pas',
  Rating in 'Rating.pas' {fRating},
  Table in 'Table.pas' {fTable},
  EhLibSDAC in 'EhLibSDAC.Pas',
  frxMSQueryRTTI in 'frxMSQueryRTTI.pas',
  AddOption in 'AddOption.pas' {fAddOption},
  tnpdf in 'TNPDF.PAS';

{$R *.res}

exports
  acShowReports,
  acShowReports2,
  acShowReportsMDI,
  acShowReport,
  acEmailReport,
  acAddOption;

procedure DllMain(reason: Integer);
begin
  case reason of
    DLL_PROCESS_ATTACH:
    begin
      if not Assigned(DM1) then
        DM1 := TDM1.Create(nil);
    end;
    DLL_PROCESS_DETACH:
    begin
      if Assigned(DM1) then
        DM1.Free;
      if Assigned(DllApp) then
        Application := DllApp;
//      if Assigned(DllScr) then
//        Screen := DllScr;
    end;
  end;
end;

begin
  DLLProc := @DllMain;
  DllProc(DLL_PROCESS_ATTACH);
end.

