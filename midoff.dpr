program midoffex;

uses
  ShareMem,
  Forms,
  DM in 'DM.pas' {DM1: TDataModule},
  About1 in 'About1.pas' {fAbout1},
  Main1 in 'Main1.pas' {MainForm},
  Number2Txt in 'Number2Txt.pas',
  getNode in 'getNode.pas',
  EhLibSDAC in 'EhLibSDAC.Pas',
  RepTypeADO in 'RepTypeADO.pas' {fRepTypeADO1},
  TableADO in 'TableADO.pas' {fTableADO},
  ParamADO1 in 'ParamADO1.pas' {fParamADO1},
  ReportCADO1 in 'ReportCADO1.pas' {fReportCADO1},
  ReportCADO3 in 'ReportCADO3.pas' {fReportCADO3},
  TableADO1 in 'TableADO1.pas' {fTableADO1},
  ReportsADO in 'ReportsADO.pas' {fReportsADO1},
  SpravADO1 in 'SpravADO1.pas' {fSpravADO1},
  MyForm in 'MyForm.pas' {fMyForm1},
  WeatherForecast in 'WeatherForecast.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '”  ”‡Î—Ë·';
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
