unit ReportCADO3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls,
  DBCtrls, RxLookup, Mask, Buttons, Tabenter, MemDS,
  DBAccess, MSAccess, ReportCADO1, ADODB, TB2Item, TBX, Menus;

type
  TfReportCADO3 = class(TfReportCADO1)
    DBMemo1: TDBMemo;
    TBXPopupMenu1: TTBXPopupMenu;
    TBXItem1: TTBXItem;
    procedure TBXItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReportCADO3: TfReportCADO3;

implementation

uses DM;

{$R *.dfm}

procedure TfReportCADO3.TBXItem1Click(Sender: TObject);
begin
  inherited;
  DBMemo1.SelectAll;
end;

end.
