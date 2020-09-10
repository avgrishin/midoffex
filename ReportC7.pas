unit ReportC7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ReportC1, DB, FIBDataSet, pFIBDataSet, StdCtrls, ExtCtrls,
  DBCtrls, RxLookup, Mask, Buttons, Tabenter, MemDS, DBAccess, MSAccess;

type
  TfReportC7 = class(TfReportC1)
    DBMemo1: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReportC7: TfReportC7;

implementation

{$R *.dfm}

end.
