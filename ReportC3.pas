unit ReportC3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ReportC1, DB, StdCtrls, ExtCtrls,
  DBCtrls, RxLookup, Mask, Buttons, Tabenter, MemDS,
  DBAccess, MSAccess;

type
  TfReportC3 = class(TfReportC1)
    DBMemo1: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReportC3: TfReportC3;

implementation

uses DM;

{$R *.dfm}

end.
