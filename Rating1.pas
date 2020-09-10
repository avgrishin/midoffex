unit PrcLst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DBCtrlsEh, StdCtrls, Mask, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, Grids, DBGridEh, FilterPart, ComCtrls, TB2Item, TBX, Menus,
  TB2Dock, TB2Toolbar, FIBQuery, pFIBQuery, pFIBStoredProc, Placemnt,
  ToolEdit, DBCtrls, TBXDkPanels, GridsEh;

type
  TfPrcLst1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    AvEhGrid1: TAvEhGrid;
    q1: TpFIBDataSet;
    ds1: TDataSource;
    q1ID: TFIBIntegerField;
    q1CLIENTID: TFIBIntegerField;
    q1PRCDATE: TFIBDateTimeField;
    q1PRICEWNDS: TFIBIntegerField;
    q1SROK: TFIBIntegerField;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBNumberEditEh1: TDBNumberEditEh;
    ActionList1: TActionList;
    acPlSave1: TAction;
    acPlCancel1: TAction;
    acPlAdd1: TAction;
    TBXPopupMenu1: TTBXPopupMenu;
    TBXItem3: TTBXItem;
    TBXItem4: TTBXItem;
    acRefresh1: TAction;
    acPlChange1: TAction;
    TBXItem1: TTBXItem;
    acPlDel1: TAction;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBXItem2: TTBXItem;
    TBXSeparatorItem2: TTBXSeparatorItem;
    TabSheet2: TTabSheet;
    AvEhGrid2: TAvEhGrid;
    q2: TpFIBDataSet;
    q2ID: TFIBIntegerField;
    q2PRCLSTID: TFIBIntegerField;
    q2PRODCODE: TFIBIntegerField;
    q2PRODNAME: TFIBStringField;
    q2PLANT: TFIBStringField;
    q2COUNTRY: TFIBStringField;
    q2NUM: TFIBIntegerField;
    q2BPRICE: TFIBFloatField;
    q2NDS: TFIBFloatField;
    q2TDATEEND: TFIBStringField;
    q2DATEEND: TFIBDateTimeField;
    q2OURPRODUCTID: TFIBIntegerField;
    q2OURARTICLE: TFIBStringField;
    q2OURPRODNAME: TFIBStringField;
    q2OURPLANT: TFIBStringField;
    q2OURCOUNTRY: TFIBStringField;
    ds2: TDataSource;
    acExec1: TAction;
    acImpPrc1: TAction;
    TBXPopupMenu2: TTBXPopupMenu;
    TBXItem5: TTBXItem;
    TabSheet3: TTabSheet;
    AvEhGrid3: TAvEhGrid;
    q3: TpFIBDataSet;
    q3ARTICLE: TFIBStringField;
    q3PRODNAME: TFIBStringField;
    q3PLANT: TFIBStringField;
    q3COUNTRY: TFIBStringField;
    q3PRODUCTID: TFIBIntegerField;
    q3BARCODE: TFIBStringField;
    q3NDS: TFIBFloatField;
    ds3: TDataSource;
    spSetLink1: TpFIBStoredProc;
    acLink3: TAction;
    acExec2: TAction;
    q2BARCODE: TFIBStringField;
    TBXPopupMenu3: TTBXPopupMenu;
    TBXItem6: TTBXItem;
    TBXSeparatorItem3: TTBXSeparatorItem;
    TBXItem9: TTBXItem;
    acRefresh3: TAction;
    acRefresh2: TAction;
    TBXSeparatorItem4: TTBXSeparatorItem;
    TBXItem7: TTBXItem;
    TBXItem8: TTBXItem;
    TabSheet4: TTabSheet;
    AvEhGrid4: TAvEhGrid;
    q4: TpFIBDataSet;
    q4ARTICLE: TFIBStringField;
    q4PRODNAME: TFIBStringField;
    q4PLANT: TFIBStringField;
    q4COUNTRY: TFIBStringField;
    q4PRODUCTID: TFIBIntegerField;
    q4BARCODE: TFIBStringField;
    q4NDS: TFIBFloatField;
    ds4: TDataSource;
    q4EID: TFIBIntegerField;
    q4ZAKAZ: TFIBFloatField;
    q4NUM: TFIBIntegerField;
    q4BPRICE: TFIBFloatField;
    q4DATEEND: TFIBDateTimeField;
    TBXPopupMenu4: TTBXPopupMenu;
    TBXItem10: TTBXItem;
    TBXSeparatorItem5: TTBXSeparatorItem;
    TBXItem11: TTBXItem;
    acExec4: TAction;
    q4PRODCODE: TFIBIntegerField;
    acRefresh4: TAction;
    acCopy1: TAction;
    TBXItem12: TTBXItem;
    TBXItem13: TTBXItem;
    TBXItem14: TTBXItem;
    TBXItem15: TTBXItem;
    TBXItem16: TTBXItem;
    spSetLink2: TpFIBStoredProc;
    acLink2: TAction;
    TBXItem17: TTBXItem;
    acUnLink4: TAction;
    TBXItem18: TTBXItem;
    acUnLink2: TAction;
    TBXItem19: TTBXItem;
    acExpOrder1: TAction;
    TBXItem20: TTBXItem;
    acImpPrc2: TAction;
    TBXItem21: TTBXItem;
    TBXDock1: TTBXDock;
    TBXToolbar1: TTBXToolbar;
    TBControlItem1: TTBControlItem;
    TBControlItem2: TTBControlItem;
    TBControlItem3: TTBControlItem;
    TBControlItem4: TTBControlItem;
    TBXItem22: TTBXItem;
    Label1: TLabel;
    Label3: TLabel;
    deDateB1: TDateEdit;
    deDateE1: TDateEdit;
    acShow1: TAction;
    TBXItem23: TTBXItem;
    q1DID: TFIBIntegerField;
    q1CLIENTNAME: TFIBStringField;
    acExport1: TAction;
    TBXItem24: TTBXItem;
    q4PPRODNAME: TFIBStringField;
    q4PPLANT: TFIBStringField;
    q4PACKING: TFIBIntegerField;
    TBXDock2: TTBXDock;
    TBXToolbar2: TTBXToolbar;
    TBControlItem5: TTBControlItem;
    TBControlItem6: TTBControlItem;
    TBControlItem7: TTBControlItem;
    DBText1: TDBText;
    Label5: TLabel;
    DBText2: TDBText;
    TBXDock3: TTBXDock;
    TBXToolbar3: TTBXToolbar;
    TBXCheckBox1: TTBXCheckBox;
    TBControlItem8: TTBControlItem;
    q2PACKING: TFIBIntegerField;
    q2PRICEIN: TFIBFloatField;
    TBXDock4: TTBXDock;
    TBXToolbar4: TTBXToolbar;
    TBControlItem9: TTBControlItem;
    TBXCheckBox2: TTBXCheckBox;
    procedure acPlAdd1Execute(Sender: TObject);
    procedure acPlSave1Execute(Sender: TObject);
    procedure acPlCancel1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acRefresh1Execute(Sender: TObject);
    procedure acRefresh1Update(Sender: TObject);
    procedure acPlAdd1Update(Sender: TObject);
    procedure acPlChange1Update(Sender: TObject);
    procedure acPlChange1Execute(Sender: TObject);
    procedure acPlDel1Update(Sender: TObject);
    procedure acPlDel1Execute(Sender: TObject);
    procedure AvEhGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure acExec1Execute(Sender: TObject);
    procedure acExec1Update(Sender: TObject);
    procedure AvEhGrid1DblClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure acImpPrc1Execute(Sender: TObject);
    procedure acLink3Execute(Sender: TObject);
    procedure acLink3Update(Sender: TObject);
    procedure AvEhGrid2DblClick(Sender: TObject);
    procedure acExec2Update(Sender: TObject);
    procedure acExec2Execute(Sender: TObject);
    procedure acRefresh3Execute(Sender: TObject);
    procedure acRefresh2Execute(Sender: TObject);
    procedure AvEhGrid3DblClick(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet3Exit(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure acExec4Update(Sender: TObject);
    procedure acExec4Execute(Sender: TObject);
    procedure AvEhGrid4DblClick(Sender: TObject);
    procedure acRefresh4Execute(Sender: TObject);
    procedure acCopy1Execute(Sender: TObject);
    procedure acLink2Update(Sender: TObject);
    procedure acLink2Execute(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure acUnLink4Execute(Sender: TObject);
    procedure acUnLink4Update(Sender: TObject);
    procedure acUnLink2Update(Sender: TObject);
    procedure acUnLink2Execute(Sender: TObject);
    procedure acExpOrder1Execute(Sender: TObject);
    procedure acImpPrc2Execute(Sender: TObject);
    procedure acShow1Execute(Sender: TObject);
    procedure acExport1Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TBXCheckBox1Change(Sender: TObject);
    procedure TBXCheckBox2Change(Sender: TObject);
  private
    FDID: Integer;
    UserID: Integer;
    procedure OnValError(Control: TWinControl);
    { Private declarations }
  public
    procedure FormInit(ClientID, AUserID: Integer);
    procedure FormInit2(DID, AUserID: Integer);
    { Public declarations }
  end;

var
  fPrcLst1: TfPrcLst1;

implementation

uses UDM, Clipbrd, Reports, StrUtils, pFIBProps, Import1;

{$R *.dfm}

procedure TfPrcLst1.FormInit(ClientID, AUserID: Integer);
var
  Cursor: TCursor;
begin
  UserID := AUserID;
  Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    q1.Conditions.AddCondition('clientid', 'clientid = :clientid', true);
    q1.Conditions.Apply;
    q1.ParamByName('ClientID').Value := ClientID;
  finally
    Screen.Cursor := Cursor;
  end;
  PageControl1.ActivePageIndex := 0;
  TabSheet4.TabVisible := False;
  acLink2.Enabled := False;
  acLink2.Visible := False;
end;

procedure TfPrcLst1.FormInit2(DID, AUserID: Integer);
var
  Cursor: TCursor;
  q: TpFIBDataSet;
begin
  FDID := DID;
  UserID := AUserID;
  Cursor := Screen.Cursor;
  q := TpFIBDataSet.Create(Self);
  try
    Screen.Cursor := crSQLWait;
    q.Transaction := DM1.trRead;
    q4.ParamByName('docid').Value := DID;
  finally
    Screen.Cursor := Cursor;
    FreeAndNil(q);
  end;
  PageControl1.ActivePageIndex := 0;
  TabSheet4.PageIndex := 1;
  TabSheet3.TabVisible := False;
  acExec2.Enabled := False;
  acExec2.Visible := False;
  acPlAdd1.Enabled := False;
  acPlAdd1.Visible := False;
end;

procedure TfPrcLst1.acPlAdd1Execute(Sender: TObject);
var
  vPricewnds, vSrok: Variant;
begin
  Panel1.Height := 36;
  Panel1.Enabled := True;
  ActiveControl := DBDateTimeEditEh1;
  AvEhGrid1.Enabled := False;
  TBXToolbar1.Enabled := False;
  if q1.Eof then
  begin
    vPricewnds := 1;
    vSrok := 0;
  end
  else
  begin
    vPricewnds := q1PRICEWNDS.AsVariant;
    vSrok := q1SROK.AsVariant;
  end;
  q1.Insert;
  q1PRCDATE.AsVariant := Date;
  q1PRICEWNDS.AsVariant := vPricewnds;
  q1SROK.AsVariant := vSrok;
end;

procedure TfPrcLst1.acPlSave1Execute(Sender: TObject);
begin
  if q1PRCDATE.Value = 0 then
    OnValError(DBDateTimeEditEh1);
  q1.Post;
  Panel1.Enabled := False;
  Panel1.Height := 0;
  AvEhGrid1.Enabled := True;
  TBXToolbar1.Enabled := True;
  ActiveControl := AvEhGrid1;
end;

procedure TfPrcLst1.acPlCancel1Execute(Sender: TObject);
begin
  q1.Cancel;
  Panel1.Enabled := False;
  Panel1.Height := 0;
  AvEhGrid1.Enabled := True;
  TBXToolbar1.Enabled := True;
  ActiveControl := AvEhGrid1;
end;

procedure TfPrcLst1.FormCreate(Sender: TObject);
begin
  Panel1.Height := 0;
  Panel1.Enabled := False;
  AvEhGrid1.UseMultiTitle := True;
  AvEhGrid2.UseMultiTitle := True;
  AvEhGrid4.UseMultiTitle := True;
  deDateB1.Date := Date-3;
  deDateE1.Date := Date;
end;

procedure TfPrcLst1.acRefresh1Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    q1.ReopenLocate('id');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfPrcLst1.acRefresh1Update(Sender: TObject);
begin
  acRefresh1.Enabled := not Panel1.Enabled;
end;

procedure TfPrcLst1.OnValError(Control: TWinControl);
begin
	Application.MessageBox('Обязательное для заполнения поле',PChar(Caption),MB_ICONERROR+MB_OK);
	if Control.Enabled then Control.SetFocus;
  Abort;
end;

procedure TfPrcLst1.acPlAdd1Update(Sender: TObject);
begin
  acPlAdd1.Enabled := not Panel1.Enabled and acPlAdd1.Visible and q1.Active;
end;

procedure TfPrcLst1.acPlChange1Update(Sender: TObject);
begin
  acPlChange1.Enabled := not Panel1.Enabled and not q1.IsEmpty;
end;

procedure TfPrcLst1.acPlChange1Execute(Sender: TObject);
begin
  Panel1.Height := 36;
  Panel1.Enabled := True;
  ActiveControl := DBDateTimeEditEh1;
  AvEhGrid1.Enabled := False;
  TBXToolbar1.Enabled := False;
  q1.Edit;
end;

procedure TfPrcLst1.acPlDel1Update(Sender: TObject);
begin
  acPlDel1.Enabled := not Panel1.Enabled and not q1.IsEmpty;
end;

procedure TfPrcLst1.acPlDel1Execute(Sender: TObject);
begin
  if Application.MessageBox('Удалить прайс-лист?',PChar(Caption),MB_ICONQUESTION+MB_YESNO) = IDYES then
    q1.Delete;
end;

procedure TfPrcLst1.AvEhGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
	r: TRect;
begin
  if Column.Tag > 0 then
  begin
	  r := Rect;
    r.Top := r.Top+Column.Grid.RowHeight;
    Column.Grid.DefaultDrawColumnCell(r, DataCol, Column.Grid.Columns[Column.Tag], State);
    if Column.Tag+1 < Column.Grid.Columns.Count then
    begin
      r.Top := r.Top+Column.Grid.RowHeight;
      Column.Grid.DefaultDrawColumnCell(r, DataCol, Column.Grid.Columns[Column.Tag+1], State);
      if Column.Tag+2 < Column.Grid.Columns.Count then
      begin
        r.Top := r.Top+Column.Grid.RowHeight;
        Column.Grid.DefaultDrawColumnCell(r, DataCol, Column.Grid.Columns[Column.Tag+2], State);
      end;
    end;
  end;
end;

procedure TfPrcLst1.acExec1Execute(Sender: TObject);
begin
  PageControl1.SelectNextPage(True, False);
  PageControl1.ActivePage.TabVisible := True;
  if PageControl1.ActivePage = TabSheet2 then
  begin
    Caption := 'Прайс-лист от '+q1PRCDATE.AsString+'г. Отсрочка '+q1SROK.AsString+' дн.';
    Screen.Cursor := crSQLWait;
    q2.DisableControls;
    try
      TBXCheckBox2Change(TBXCheckBox2);
    finally
      q2.EnableControls;
      Screen.Cursor := crDefault;
    end;
  end
  else if PageControl1.ActivePage = TabSheet4 then
  begin
    Screen.Cursor := crSQLWait;
    Caption := 'Заказ по прайс-листу от '+q1PRCDATE.AsString+'г. Отсрочка '+q1SROK.AsString+' дн.';
    q4.DisableControls;
    try
      q4.ReopenLocate('eid');
    finally
      q4.EnableControls;
      Screen.Cursor := crDefault;
    end
  end;
end;

procedure TfPrcLst1.acExec1Update(Sender: TObject);
begin
  acExec1.Enabled := not q1.IsEmpty;
end;

procedure TfPrcLst1.AvEhGrid1DblClick(Sender: TObject);
begin
  if not q1.IsEmpty then
    acExec1Execute(Sender);
end;

procedure TfPrcLst1.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (Sender as TPageControl).ActivePage = TabSheet1 then
    AllowChange := not q1.IsEmpty
  else
    AllowChange := True;
end;

procedure TfPrcLst1.PageControl1Change(Sender: TObject);
begin
  PageControl1.ActivePage.Visible := True;
  if PageControl1.ActivePage = TabSheet1 then
  begin
    Caption := 'Выбор прайс-листа';
    ActiveControl := AvEhGrid1;
    q2.Close;
    q4.Close;
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    ActiveControl := AvEhGrid2;
  end
  else if PageControl1.ActivePage = TabSheet3 then
  begin
  end
  else if PageControl1.ActivePage = TabSheet4 then
  begin
    ActiveControl := AvEhGrid4;
  end
end;

procedure TfPrcLst1.acImpPrc1Execute(Sender: TObject);
var
  fReports1: TfReports1;
begin
  fReports1 := TfReports1.Create(nil);
  try
    fReports1.FormInit(1418, 1, 'DID='+q1ID.asString);
    fReports1.FUserID := UserID;
    fReports1.acExec1Execute(nil);
    q2.CloseOpen(False);
  finally
    fReports1.Free;
  end;
end;

procedure TfPrcLst1.acLink3Execute(Sender: TObject);
begin
  if Application.MessageBox(PAnsiChar('Привязать '+q3PRODNAME.Value+', '+q3PLANT.Value+', '+q3COUNTRY.Value+' к '+q2PRODNAME.Value+', '+q2PLANT.Value+', '+q2COUNTRY.Value+'?'), PAnsiChar(Caption), MB_YESNO) = IDYES then
  begin
    spSetLink1.ParamByName('clientid').Value := q1CLIENTID.AsVariant;
    spSetLink1.ParamByName('productid').Value := q3PRODUCTID.AsVariant;
    spSetLink1.ParamByName('code').Value := q2PRODCODE.AsVariant;
    spSetLink1.ParamByName('concept').Value := 0;
    spSetLink1.ExecProc;
    PageControl1.ActivePage := TabSheet2;
    PageControl1.ActivePage.Visible := True;
    ActiveControl := AvEhGrid2;
    q2.Refresh;
  end;
end;

procedure TfPrcLst1.acLink3Update(Sender: TObject);
begin
  acLink3.Enabled := not q3.IsEmpty;
end;

procedure TfPrcLst1.AvEhGrid2DblClick(Sender: TObject);
begin
  if not q2.IsEmpty then
  begin
    if acExec2.Visible then
    begin
      acExec2Execute(Sender)
    end
    else
      acLink2Execute(Sender);
  end
end;

procedure TfPrcLst1.acExec2Update(Sender: TObject);
begin
  acExec2.Enabled := not q2.IsEmpty and acExec2.Visible;
end;

procedure TfPrcLst1.acExec2Execute(Sender: TObject);
var
  Pos1: Integer;
begin
  PageControl1.ActivePage := TabSheet3;
  PageControl1.ActivePage.TabVisible := True;
  AvEhGrid3.SetFocus;
  Screen.Cursor := crSQLWait;
  Caption := q2PRODNAME.Value+', '+q2PLANT.Value+', '+q2COUNTRY.Value+', '+q2BARCODE.Value+', НДС: '+q2NDS.AsString+'%';
  q3.DisableControls;
  try
    TBXCheckBox1Change(TBXCheckBox1);
    if q2OURPRODUCTID.AsInteger = 0 then
    begin
      q3.First;
      if (q2BARCODE.Value = '') or not q3.Locate('barcode', q2BARCODE.Value, [loCaseInsensitive]) then
      begin
        Pos1 := Pos(' ', q2PRODNAME.Value);
        if Pos1 = 0 then
          q3.Locate('prodname', q2PRODNAME.Value, [loPartialKey, loCaseInsensitive])
        else
        begin
          if MidStr(q2PRODNAME.Value, Pos1-1, 1) = ',' then Pos1 := Pos1-1;
          if Pos1 > 1 then
            q3.Locate('prodname', MidStr(q2PRODNAME.Value, 1, Pos1-1), [loPartialKey, loCaseInsensitive]);
        end
      end
    end
    else
      q3.Locate('productid', q2OURPRODUCTID.Value, []);
  finally
    q3.EnableControls;
    Screen.Cursor := crDefault;
  end
end;

procedure TfPrcLst1.acRefresh2Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    q2.ReopenLocate('ID');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfPrcLst1.acRefresh3Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    q3.ReopenLocate('productid');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfPrcLst1.AvEhGrid3DblClick(Sender: TObject);
begin
  if not q3.IsEmpty then
    acLink3Execute(Sender);
end;

procedure TfPrcLst1.TabSheet1Enter(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to PageControl1.PageCount-1 do
    if PageControl1.Pages[I].PageIndex > TabSheet1.PageIndex then
      PageControl1.Pages[I].TabVisible := False;
  acExec1.ShortCut := TextToShortCut('Enter');
  acRefresh1.ShortCut := TextToShortCut('F5');
  acPlAdd1.ShortCut := TextToShortCut('Ins');
  acPlChange1.ShortCut := TextToShortCut('Ctrl+Enter');
  acPlDel1.ShortCut := TextToShortCut('Ctrl+Del');
end;

procedure TfPrcLst1.TabSheet1Exit(Sender: TObject);
begin
  acExec1.ShortCut := 0;
  acRefresh1.ShortCut := 0;
  acPlAdd1.ShortCut := 0;
  acPlChange1.ShortCut := 0;
  acPlDel1.ShortCut := 0;
end;

procedure TfPrcLst1.TabSheet2Enter(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to PageControl1.PageCount-1 do
    if PageControl1.Pages[I].PageIndex > TabSheet2.PageIndex then
      PageControl1.Pages[I].TabVisible := False;
  if acExec2.Enabled then
    acExec2.ShortCut := TextToShortCut('Enter')
  else if acLink2.Enabled then
    acLink2.ShortCut := TextToShortCut('Enter');
  acRefresh2.ShortCut := TextToShortCut('F5');
end;

procedure TfPrcLst1.TabSheet2Exit(Sender: TObject);
begin
  acExec2.ShortCut := 0;
  acLink2.ShortCut := 0;
  acRefresh2.ShortCut := 0;
end;

procedure TfPrcLst1.TabSheet3Enter(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to PageControl1.PageCount-1 do
    if PageControl1.Pages[I].PageIndex > TabSheet3.PageIndex then
      PageControl1.Pages[I].TabVisible := False;
  acLink3.ShortCut := TextToShortCut('Enter');
  acRefresh3.ShortCut := TextToShortCut('F5');
end;

procedure TfPrcLst1.TabSheet3Exit(Sender: TObject);
begin
  acLink3.ShortCut := 0;
  acRefresh3.ShortCut := 0;
end;

procedure TfPrcLst1.TabSheet4Enter(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to PageControl1.PageCount-1 do
    if PageControl1.Pages[I].PageIndex > TabSheet4.PageIndex then
      PageControl1.Pages[I].TabVisible := False;
  acExec4.ShortCut := TextToShortCut('Enter');
  acRefresh4.ShortCut := TextToShortCut('F5');
end;

procedure TfPrcLst1.TabSheet4Exit(Sender: TObject);
begin
  acExec4.ShortCut := 0;
  acRefresh4.ShortCut := 0;
end;

procedure TfPrcLst1.acExec4Update(Sender: TObject);
begin
  acExec4.Enabled := not q4.IsEmpty;
end;

procedure TfPrcLst1.acExec4Execute(Sender: TObject);
var
  Pos1: Integer;
begin
  PageControl1.ActivePage := TabSheet2;
  PageControl1.ActivePage.TabVisible := True;
  AvEhGrid2.SetFocus;
  Screen.Cursor := crSQLWait;
  Caption := q4PRODNAME.Value+', '+q4PLANT.Value+', '+q4COUNTRY.Value+', '+q4BARCODE.Value+', НДС: '+q4NDS.AsString+'%';
  q2.DisableControls;
  try
    q2.Open;
    if q4PRODCODE.AsInteger = 0 then
    begin
      q2.First;
      if (q4BARCODE.Value = '') or not q2.Locate('barcode', q4BARCODE.Value, [loCaseInsensitive]) then
      begin
        Pos1 := Pos(' ', q4PRODNAME.Value);
        if Pos1 = 0 then
          q2.Locate('prodname', q4PRODNAME.Value, [loPartialKey, loCaseInsensitive])
        else
        begin
          if MidStr(q4PRODNAME.Value, Pos1-1, 1) = ',' then Pos1 := Pos1-1;
          if Pos1 > 1 then
            q2.Locate('prodname', MidStr(q4PRODNAME.Value, 1, Pos1-1), [loPartialKey, loCaseInsensitive]);
        end
      end
    end
    else
      q2.Locate('prodcode', q4PRODCODE.Value, []);
  finally
    q2.EnableControls;
    Screen.Cursor := crDefault;
  end
end;

procedure TfPrcLst1.AvEhGrid4DblClick(Sender: TObject);
begin
  if not q4.IsEmpty then
    acExec4Execute(Sender);
end;

procedure TfPrcLst1.acRefresh4Execute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    q4.ReopenLocate('productid');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfPrcLst1.acCopy1Execute(Sender: TObject);
begin
  if ActiveControl is TAvEhGrid then
    if (ActiveControl as TAvEhGrid).SelectedField <> nil then
      Clipboard.SetTextBuf(PChar((ActiveControl as TAvEhGrid).SelectedField.AsString));
end;

procedure TfPrcLst1.acLink2Update(Sender: TObject);
begin
  acLink2.Enabled := not q2.IsEmpty;
end;

procedure TfPrcLst1.acLink2Execute(Sender: TObject);
begin
  if Application.MessageBox(PAnsiChar('Привязать '+q2PRODNAME.Value+', '+q2PLANT.Value+', '+q2COUNTRY.Value+' к '+q4PRODNAME.Value+', '+q4PLANT.Value+', '+q4COUNTRY.Value+'?'), PAnsiChar(Caption), MB_YESNO) = IDYES then
  begin
    spSetLink2.ParamByName('clientid').Value := q1CLIENTID.AsVariant;
    spSetLink2.ParamByName('productid').Value := q4PRODUCTID.AsVariant;
    spSetLink2.ParamByName('code').Value := q2PRODCODE.AsVariant;
    spSetLink2.ParamByName('concept').Value := 0;
    spSetLink2.ExecProc;
    PageControl1.ActivePage := TabSheet4;
    PageControl1.ActivePage.Visible := True;
    ActiveControl := AvEhGrid4;
    q2.Refresh;
    q4.Refresh;
  end
end;

procedure TfPrcLst1.acUnLink4Execute(Sender: TObject);
var
  q: TpFIBQuery;
begin
  q := TpFIBQuery.Create(Self);
  try
    q.Database := DM1.pFIBDatabase1;
    q.Transaction := DM1.trWrite;
    q.Options := q.Options+[qoStartTransaction]+[qoAutoCommit];
    q.SQL.Text := 'delete from plnk where id1 = :productid and id3 = :clientid and concept = :concept;';
    q.ParamByName('clientid').Value := q1CLIENTID.AsVariant;
    q.ParamByName('productid').Value := q4PRODUCTID.AsVariant;
    q.ParamByName('concept').Value := 0;
    q.ExecQuery;
    q4.Refresh;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfPrcLst1.acUnLink4Update(Sender: TObject);
begin
  acUnLink4.Enabled := not q4.IsEmpty;
end;

procedure TfPrcLst1.acUnLink2Update(Sender: TObject);
begin
  acUnLink2.Enabled := not q2.IsEmpty;
end;

procedure TfPrcLst1.acUnLink2Execute(Sender: TObject);
var
  q: TpFIBQuery;
begin
  q := TpFIBQuery.Create(Self);
  try
    q.Database := DM1.pFIBDatabase1;
    q.Transaction := DM1.trWrite;
    q.Options := q.Options+[qoStartTransaction]+[qoAutoCommit];
    q.SQL.Text := 'delete from plnk where id2 = :code and id3 = :clientid and concept = :concept;';
    q.ParamByName('clientid').Value := q1CLIENTID.AsVariant;
    q.ParamByName('code').Value := q2PRODCODE.AsVariant;
    q.ParamByName('concept').Value := 0;
    q.ExecQuery;
    q2.Refresh;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfPrcLst1.acExpOrder1Execute(Sender: TObject);
var
  fReports1: TfReports1;
begin
  fReports1 := TfReports1.Create(nil);
  try
    fReports1.FormInit(1429, 1, 'DID='+IntToStr(FDID)+''#13#10''+'ID='+q1ID.AsString);
    fReports1.FUserID := UserID;
    fReports1.acExec1Execute(nil);
  finally
    fReports1.Free;
  end;
end;

procedure TfPrcLst1.acImpPrc2Execute(Sender: TObject);
var
  fReports1: TfReports1;
begin
  fReports1 := TfReports1.Create(nil);
  try
    fReports1.FormInit(1475, 1, 'DID='+IntToStr(FDID)+''#13#10''+'ID='+q1ID.AsString);
    fReports1.FUserID := UserID;
    fReports1.acExec1Execute(nil);
    q2.CloseOpen(False);
  finally
    fReports1.Free;
  end;
end;

procedure TfPrcLst1.acShow1Execute(Sender: TObject);
begin
  q1.Close;
  q1.ParamByName('dateb').Value := deDateB1.Date;
  q1.ParamByName('datee').Value := deDateE1.Date;
  q1.Open;
  if PageControl1.ActivePage = TabSheet1 then
    AvEhGrid1.SetFocus;
end;

procedure TfPrcLst1.acExport1Execute(Sender: TObject);
begin
  with TfImport1.Create(nil) do
    try
      FormInit(1, 6901, 'DID6901='+IntToStr(FDID)+''#13#10''+'PLID='+q1ID.AsString);
      FUserID := UserID;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfPrcLst1.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfPrcLst1.TBXCheckBox1Change(Sender: TObject);
begin
  q3.Close;
  if TBXCheckBox1.Checked then
    q3.ParamByName('f1').Value := ''
  else
    q3.ParamByName('f1').Value := 'and not exists(select 1 from xecint where owner = l1.lid and concept = 302 and node = 50024 and val = 60067213)';
  q3.Open;
end;

procedure TfPrcLst1.TBXCheckBox2Change(Sender: TObject);
begin
  q2.Close;
  if TBXCheckBox2.Checked then
    q2.ParamByName('f1').Value := 'and p.id1 is not null'
  else
    q2.ParamByName('f1').Value := '';
  q2.Open;
end;

end.

