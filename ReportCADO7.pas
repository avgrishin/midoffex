unit ReportCADO7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ReportC1, DB, StdCtrls, ExtCtrls,
  DBCtrls, RxLookup, Mask, Buttons, Tabenter, MemDS, DBAccess, MSAccess,
  ReportCADO1, ADODB, TB2Item, TBX, Menus;

type
  TfReportCADO7 = class(TfReportCADO1)
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
  fReportCADO7: TfReportCADO7;

implementation

{$R *.dfm}

procedure TfReportCADO7.TBXItem1Click(Sender: TObject);
begin
  inherited;
  DBMemo1.SelectAll;
end;

end.
