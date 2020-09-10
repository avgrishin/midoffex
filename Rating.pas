unit Rating;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MSAccess, GridsEh, DBGridEh, FilterPart,
  TB2Dock, TB2Toolbar, TBX, ComCtrls, TB2Item, Menus, ActnList, StdCtrls,
  DBCtrls;

type
  TfRating = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TBXDock3: TTBXDock;
    TBXToolbar3: TTBXToolbar;
    AvEhGrid1: TAvEhGrid;
    AvEhGrid2: TAvEhGrid;
    q1: TMSQuery;
    ds1: TDataSource;
    q2: TMSQuery;
    ds2: TDataSource;
    ActionList1: TActionList;
    acLink1: TAction;
    TBXPopupMenu1: TTBXPopupMenu;
    TBXItem1: TTBXItem;
    acRefresh1: TAction;
    TBXItem2: TTBXItem;
    TBXPopupMenu2: TTBXPopupMenu;
    TBXItem3: TTBXItem;
    TBXItem4: TTBXItem;
    acRefresh2: TAction;
    acExecLink1: TAction;
    TBControlItem1: TTBControlItem;
    DBText1: TDBText;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBControlItem2: TTBControlItem;
    DBText2: TDBText;
    acUnLink1: TAction;
    TBXItem5: TTBXItem;
    acCopy1: TAction;
    acCopy2: TAction;
    TBXItem6: TTBXItem;
    TBXItem7: TTBXItem;
    procedure acLink1Update(Sender: TObject);
    procedure acLink1Execute(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure acRefresh1Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acRefresh2Execute(Sender: TObject);
    procedure acExecLink1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure AvEhGrid2DblClick(Sender: TObject);
    procedure AvEhGrid1DblClick(Sender: TObject);
    procedure acExecLink1Update(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure acUnLink1Execute(Sender: TObject);
    procedure acUnLink1Update(Sender: TObject);
    procedure q1AfterOpen(DataSet: TDataSet);
    procedure acCopy1Execute(Sender: TObject);
    procedure acCopy2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRating: TfRating;

implementation

uses DM, StrUtils, Clipbrd;

{$R *.dfm}

procedure TfRating.acLink1Update(Sender: TObject);
begin
  acLink1.Enabled := not q1.Eof;
end;

procedure TfRating.acLink1Execute(Sender: TObject);
var
  Pos1: Integer;
begin
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.TabVisible := True;
  Screen.Cursor := crSQLWait;
  q2.DisableControls;
  try
    q2.First;
    if q1.FieldByName('lid').IsNull then
    begin
      Pos1 := Pos(' ', q1.FieldByName('NameBrief').AsString);
      if Pos1 = 0 then
        q2.Locate('lname', q1.FieldByName('NameBrief').AsString, [loPartialKey, loCaseInsensitive])
      else
      begin
        if Pos1 > 1 then
          q2.Locate('lname', MidStr(q1.FieldByName('NameBrief').AsString, 1, Pos1-1), [loPartialKey, loCaseInsensitive]);
      end
    end
    else
      q2.Locate('lid', q1.FieldByName('LID').Value, []);
  finally
    q2.EnableControls;
    Screen.Cursor := crDefault;
  end
end;

procedure TfRating.TabSheet1Enter(Sender: TObject);
begin
  TabSheet2.TabVisible := False;
  acLink1.ShortCut := TextToShortCut('Enter');
  acRefresh1.ShortCut := TextToShortCut('F5');
  acCopy1.ShortCut := TextToShortCut('Ctrl+C');
end;

procedure TfRating.TabSheet1Exit(Sender: TObject);
begin
  acLink1.ShortCut := 0;
  acRefresh1.ShortCut := 0;
  acCopy1.ShortCut := 0;
end;

procedure TfRating.acRefresh1Execute(Sender: TObject);
begin
  q1.Close;
  q1.Open;
end;

procedure TfRating.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfRating.acRefresh2Execute(Sender: TObject);
begin
  q2.Close;
  q2.Open;
end;

procedure TfRating.acExecLink1Execute(Sender: TObject);
begin
  q1.Edit;
  q1.FieldByName('lid').Value := q2.FieldByName('lid').Value;
  q1.Post;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Visible := True;
  ActiveControl := AvEhGrid1;
end;

procedure TfRating.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TfRating.TabSheet2Enter(Sender: TObject);
begin
  acExecLink1.ShortCut := TextToShortCut('Enter');
  acRefresh2.ShortCut := TextToShortCut('F5');
  acCopy2.ShortCut := TextToShortCut('Ctrl+C');
end;

procedure TfRating.TabSheet2Exit(Sender: TObject);
begin
  acExecLink1.ShortCut := 0;
  acRefresh2.ShortCut := 0;
  acCopy2.ShortCut := 0;
end;

procedure TfRating.AvEhGrid2DblClick(Sender: TObject);
begin
  if not q2.IsEmpty then
    acExecLink1Execute(Sender);
end;

procedure TfRating.AvEhGrid1DblClick(Sender: TObject);
begin
  if not q1.IsEmpty then
    acLink1Execute(Sender);
end;

procedure TfRating.acExecLink1Update(Sender: TObject);
begin
  acExecLink1.Enabled := not q2.IsEmpty;
end;

procedure TfRating.PageControl1Change(Sender: TObject);
begin
  PageControl1.ActivePage.Visible := True;
  if PageControl1.ActivePage = TabSheet1 then
    ActiveControl := AvEhGrid1
  else if PageControl1.ActivePage = TabSheet2 then
    ActiveControl := AvEhGrid2;
end;

procedure TfRating.acUnLink1Execute(Sender: TObject);
begin
  q1.Edit;
  q1.FieldByName('lid').Clear;
  q1.Post;
end;

procedure TfRating.acUnLink1Update(Sender: TObject);
begin
  acUnLink1.Enabled := not q1.FieldByName('lid').IsNull;
end;

procedure TfRating.q1AfterOpen(DataSet: TDataSet);
begin
  q1.FieldByName('lid').ReadOnly := False;
end;

procedure TfRating.acCopy1Execute(Sender: TObject);
begin
  if AvEhGrid1.SelectedField <> nil then
    Clipboard.SetTextBuf(PChar(AvEhGrid1.SelectedField.AsString));
end;

procedure TfRating.acCopy2Execute(Sender: TObject);
begin
  if AvEhGrid2.SelectedField <> nil then
    Clipboard.SetTextBuf(PChar(AvEhGrid2.SelectedField.AsString));
end;

end.
