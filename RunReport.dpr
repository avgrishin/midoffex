program RunReport;

uses
  Forms,
  DM2 in 'DM2.pas' {DataModule2: TDataModule};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
