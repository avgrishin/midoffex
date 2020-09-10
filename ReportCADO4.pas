unit ReportCADO4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ReportC1, DB, StdCtrls, ExtCtrls, DBCtrls, RxLookup, Mask, Buttons, 
  Tabenter, ReportCADO1, ADODB;

type
  TfReportCADO4 = class(TfReportCADO1)
    DBMemo1: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReportCADO4: TfReportCADO4;

implementation

{$R *.dfm}

end.
