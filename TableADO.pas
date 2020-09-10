unit TableADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ActnList,
  XPStyleActnCtrls, ActnMan, Grids, DBGridEh, FilterPart, ComCtrls, ToolWin,
  TB2Item, TBX, TB2Dock, TB2Toolbar, ExtCtrls, Buttons, Tabenter, Placemnt,
  GridsEh, MemDS, DBAccess, MSAccess, ADODB;

type
  TfTableADO = class(TForm)
    AvEhGrid1: TAvEhGrid;
    q1: TADOQuery;
    ds1: TDataSource;
    ActionList1: TActionList;
    acRefresh1: TAction;
    acFilter1: TAction;
    acExec1: TAction;
    TBXDock2: TTBXDock;
    TBXToolbar2: TTBXToolbar;
    TBXItem3: TTBXItem;
    TBXItem4: TTBXItem;
    TBXPopupMenu1: TTBXPopupMenu;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBXItem1: TTBXItem;
    TBXItem2: TTBXItem;
    miSelect: TTBXItem;
    acEscape1: TAction;
    acExcel1: TAction;
    TBXItem6: TTBXItem;
    acCopy1: TAction;
    TBXItem7: TTBXItem;
    Panel1: TPanel;
    FormPlacement1: TFormPlacement;
    acSearch1: TAction;
    TBXItem17: TTBXItem;
    acIncSearch1: TAction;
    TBXItem18: TTBXItem;
    procedure acFilter1Execute(Sender: TObject); virtual;
    procedure acFilter1Update(Sender: TObject); virtual;
    procedure AvEhGrid1DblClick(Sender: TObject); virtual;
    procedure acExec1Update(Sender: TObject); virtual;
    procedure acExec1Execute(Sender: TObject); virtual;
    procedure acRefresh1Execute(Sender: TObject); virtual;
    procedure acEscape1Execute(Sender: TObject);
    procedure acExcel1Execute(Sender: TObject);
    procedure acCopy1Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AvEhGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acSearch1Execute(Sender: TObject);
    procedure acIncSearch1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ExcelExport(Grid: TAvEhGrid);
    { Public declarations }
  end;

//var
//  fTableADO: TfTableADO;

implementation

uses DM, Clipbrd, ToolCtrlsEh, DBGridEhFindDlgs;

{$R *.dfm}

procedure TfTableADO.acFilter1Execute(Sender: TObject);
begin
	q1.Filtered := False;
	q1.Filter := '';
end;

procedure TfTableADO.acFilter1Update(Sender: TObject);
begin
	acFilter1.Enabled := q1.Filtered;
	acFilter1.Checked := q1.Filtered;
end;

procedure TfTableADO.AvEhGrid1DblClick(Sender: TObject);
begin
  if not q1.IsEmpty then
    acExec1Execute(Sender);
end;

procedure TfTableADO.acExec1Update(Sender: TObject);
begin
  acExec1.Enabled := not q1.IsEmpty;
end;

procedure TfTableADO.acExec1Execute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfTableADO.acRefresh1Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    q1.Close;
    q1.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfTableADO.acEscape1Execute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfTableADO.acExcel1Execute(Sender: TObject);
begin
  ExcelExport(AvEhGrid1);
end;

procedure TfTableADO.ExcelExport(Grid: TAvEhGrid);
begin
  Screen.Cursor := crSQLWait;
  Panel1.Caption := 'Выгрузка в Excel...';
  Panel1.Left := (Width - Panel1.Width) div 2;
  Panel1.Top := (Height - Panel1.Height) div 2;
  Panel1.Visible := True;
  Application.ProcessMessages;
  try
    DM1.DBGrid1Xsl(Grid);
  finally
    Panel1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfTableADO.acCopy1Execute(Sender: TObject);
begin
  if AvEhGrid1.SelectedField <> nil then
    Clipboard.SetTextBuf(PChar(AvEhGrid1.SelectedField.AsString));
end;

procedure TfTableADO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTableADO.FormShow(Sender: TObject);
begin
  BringToFront;
end;

procedure TfTableADO.AvEhGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) and (AvEhGrid1.DataSource.DataSet.State = dsEdit) and (not AvEhGrid1.SelectedField.ReadOnly) then
    AvEhGrid1.DataSource.DataSet.Post;
end;

procedure TfTableADO.acSearch1Execute(Sender: TObject);
begin
  AvEhGrid1.StopInplaceSearch;
  ExecuteDBGridEhFindDialogProc(AvEhGrid1, '', '', nil, AvEhGrid1.IsFindDialogShowAsModal);
end;

procedure TfTableADO.acIncSearch1Execute(Sender: TObject);
begin
  AvEhGrid1.StartInplaceSearch('', -1, ltdAllEh);
end;

end.
