unit Table1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ActnList,
  XPStyleActnCtrls, ActnMan, Grids, DBGridEh, FilterPart, ComCtrls, ToolWin,
  TB2Item, TBX, TB2Dock, TB2Toolbar, ExtCtrls, Buttons, Tabenter, GridsEh,
  MemDS, DBAccess, MSAccess;

type
  TfTable1 = class(TForm)
    AvEhGrid1: TAvEhGrid;
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
    TBXItem5: TTBXItem;
    acEscape1: TAction;
    acExcel1: TAction;
    TBXItem6: TTBXItem;
    acCopy1: TAction;
    TBXItem7: TTBXItem;
    Panel1: TPanel;
    q1: TMSQuery;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTable1: TfTable1;

implementation

uses DM, Clipbrd;

{$R *.dfm}

procedure TfTable1.acFilter1Execute(Sender: TObject);
begin
	q1.Filtered := False;
	q1.Filter := '';
end;

procedure TfTable1.acFilter1Update(Sender: TObject);
begin
	acFilter1.Enabled := q1.Filtered;
	acFilter1.Checked := q1.Filtered;
end;

procedure TfTable1.AvEhGrid1DblClick(Sender: TObject);
begin
  if not q1.IsEmpty then
    acExec1Execute(Sender);
end;

procedure TfTable1.acExec1Update(Sender: TObject);
begin
  acExec1.Enabled := not q1.IsEmpty;
end;

procedure TfTable1.acExec1Execute(Sender: TObject);
begin
  //
end;

procedure TfTable1.acRefresh1Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    q1.Close;
    q1.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfTable1.acEscape1Execute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfTable1.acExcel1Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  Panel1.Caption := 'Выгрузка в Excel...';
  Panel1.Left := (Width - Panel1.Width) div 2;
  Panel1.Top := (Height - Panel1.Height) div 2;
  Panel1.Visible := True;
  Application.ProcessMessages;
  try
    DM1.DBGrid1Xsl(AvEhGrid1);
  finally
    Panel1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfTable1.acCopy1Execute(Sender: TObject);
begin
  if AvEhGrid1.SelectedField <> nil then
    Clipboard.SetTextBuf(PChar(AvEhGrid1.SelectedField.AsString));
end;

procedure TfTable1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
