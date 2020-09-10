unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Table, frxDesgn, frxClass, TB2Item, TBX, Menus, ActnList, DB,
  TB2Dock, TB2Toolbar, Grids, DBGridEh, FilterPart,
  ExtCtrls, ComCtrls, Printers, ReportC1,
  OleServer, MSXML2_TLB, StdCtrls, ComObj, ActiveX, frxExportXLS, Buttons,
  Tabenter, frxBarcode, Mask, DBCtrlsEh, Placemnt, frxBDEComponents,
  DBTables, frxDBSet, DBCtrls, GridsEh, MemDS, DBAccess, MSAccess;

type
  TfReports1 = class(TfTable)
    frxDesigner1: TfrxDesigner;
    acDesign: TAction;
    TBXItem8: TTBXItem;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    acInsert1: TAction;
    acChange1: TAction;
    acDelete1: TAction;
    acInsert2: TAction;
    acChange2: TAction;
    acInsert3: TAction;
    acDelete2: TAction;
    acHidden1: TAction;
    TBXItem9: TTBXItem;
    TBXItem10: TTBXItem;
    TBXSeparatorItem2: TTBXSeparatorItem;
    TBXItem11: TTBXItem;
    TBXPopupMenu2: TTBXPopupMenu;
    TBXItem12: TTBXItem;
    TBXItem13: TTBXItem;
    TBXItem14: TTBXItem;
    TBXSeparatorItem3: TTBXSeparatorItem;
    TBXItem15: TTBXItem;
    TBXItem16: TTBXItem;
    XmlDoc1: TFreeThreadedDOMDocument;
    frxXLSExport1: TfrxXLSExport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxBDEComponents1: TfrxBDEComponents;
    frxReport1: TfrxReport;
    qRepTree1: TMSQuery;
    procedure acDesign1Execute(Sender: TObject);
    procedure acInsert1Execute(Sender: TObject);
    procedure acDesignUpdate(Sender: TObject);
    procedure acDelete1Execute(Sender: TObject);
    procedure acDelete1Update(Sender: TObject);
    procedure acChange2Update(Sender: TObject);
    procedure acChange1Update(Sender: TObject);
    procedure acChange1Execute(Sender: TObject);
    procedure acExec1Execute(Sender: TObject); override;
    procedure acInsert2Execute(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeView1Deletion(Sender: TObject; Node: TTreeNode);
    procedure acChange2Execute(Sender: TObject);
    procedure acInsert3Update(Sender: TObject);
    procedure acDelete2Execute(Sender: TObject);
    procedure acDelete2Update(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure acHidden1Execute(Sender: TObject);
    procedure acHidden1Update(Sender: TObject);
    procedure acInsert3Execute(Sender: TObject);
    function frxReport1UserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acDesign7Execute(Sender: TObject);
    procedure acDesignExecute(Sender: TObject);
  private
    Form: TfTable;
    frxDBDataset1: TfrxDBDataset;
    FHidden: Shortint;
    FDopParamStr: string;
    function SetParams(ParamStr: String; fibparams: TMSParams; ID: Integer): Boolean;
    procedure RTExpand(ParentID: Integer; Node: TTreeNode);
    procedure ExecWebReport(Sender: TObject);
    procedure ExecFastReport1(Sender: TObject);
    procedure ExecFastReport7(Sender: TObject);
    procedure CreateReportC(var fReportC: TfReportC1; RepTypeID: Integer);
    procedure ExecWordReport(Sender: TObject);
    procedure ExecPivotReport(Sender: TObject);
    procedure ExecExcelReport(Sender: TObject);
    procedure ExecTextReport(Sender: TObject);
    procedure ExecTextImport(Sender: TObject);
    procedure ExecImpDocLines(Sender: TObject);
    procedure ExecExcelExport(Sender: TObject);
    procedure ExecExcelImport(Sender: TObject);
    procedure SetDopParams(prm: TMSParams);
    procedure qAfterUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var Resume: Boolean);
    procedure acShowDesc1Execute(Sender: TObject);
    { Private declarations }
  public
    procedure FormInit(AParentID: Integer; AHidden: Shortint;
      ADopParamStr: string);
    { Public declarations }
  end;

	TRTRec = class
		RepTreeID: Integer;
		ParentID: Integer;
	public
		constructor Create(ARepTreeID, AParentID: Integer); virtual;
	end;

var
  fReports1: TfReports1;

const
  CNoForm = 'Нет формы для данной операции';

implementation

uses DM, RepType, Param1, ReportC3, ShellApi, StrUtils, ExcelXP, Math, Number2Txt,
  Main1;

{$R *.dfm}

function getNodeText(Node1: IXMLDOMNode; AttrName: string; DefaultValue: string): WideString;
begin
	if Node1.attributes.getNamedItem(AttrName) <> nil then
		getNodeText := Node1.attributes.getNamedItem(AttrName).text
	else
		getNodeText := DefaultValue;
end;

function getNodeInt(Node1: IXMLDOMNode; AttrName: string; DefaultValue: Integer): Integer;
begin
	if Node1.attributes.getNamedItem(AttrName) <> nil then
    try
  		getNodeInt := StrToInt(Node1.attributes.getNamedItem(AttrName).text)
    except
      getNodeInt := DefaultValue;
    end
	else
		getNodeInt := DefaultValue;
end;

constructor TRTRec.Create(ARepTreeID, AParentID: Integer);
begin
	inherited Create;
	RepTreeID := ARepTreeID;
	ParentID := AParentID;
end;

procedure TfReports1.CreateReportC(var fReportC: TfReportC1; RepTypeID: Integer);
begin
  if RepTypeID = 1 then
  	fReportC := TfReportC1.Create(Self)
  else if RepTypeID = 2 then
  	fReportC := TfReportC1.Create(Self)
  else if RepTypeID = 3 then
  	fReportC := TfReportC3.Create(Self)
//  else if RepTypeID = 4 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 5 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 6 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 7 then
//  	fReportC := TfReportC7.Create(Self)
//  else if RepTypeID = 8 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 9 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 10 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 11 then
//  	fReportC := TfReportC4.Create(Self)
  else
  begin
    Application.MessageBox(CNoForm, 'Ошибка', MB_ICONERROR+MB_OK);
    Exit;
  end;
end;

procedure TfReports1.FormInit(AParentID: Integer; AHidden: Shortint; ADopParamStr: string);
var
	RTRec: TRTRec;
begin
  FDopParamStr := ADopParamStr;
  FHidden := AHidden;
	TreeView1.Items.Clear;
	RTRec := TRTRec.Create(AParentID, 1);
	with TreeView1.Items.AddObject(nil, '<Все>', RTRec) do
	begin
		ImageIndex := 4;
		SelectedIndex := ImageIndex;
    TreeView1.Selected := TreeView1.TopItem;
	end;
	RTExpand(AParentID, nil);
end;

procedure TfReports1.ExecWebReport(Sender: TObject);
(*var
  fParam1: TfParam1;
  fWeb1: TfWeb1;
  sParam: string;
	I: Integer;
  //URL: WideString;
  //V: Variant;
  params: TStringList;*)
begin
(*
  if not SetParams(q1.FBN('Params').Value, sp1.Params, q1.FBN('REPORTID').Value) then Exit;

	sParam := '';
  if ADOQuery2.Parameters.Count > 0 then
  begin
  	fParam1 := TfParam1.Create(Self);
	  try
  		if not fParam1.FormInit(ADOQuery2, qReport1ReportID.Value, 3) then
        Exit;
		  if fParam1.ShowModal <> mrOK then
        Exit;
			for I := 0 to ADOQuery2.Parameters.Count - 1 do
 			begin
  			if I > 0 then
	  			sParam := sParam+'&';
		  	sParam := sParam+ADOQuery2.Parameters[I].Name+'=';
        if ADOQuery2.Parameters[I].Value <> Null then
          sParam := sParam+String(ADOQuery2.Parameters[I].Value);
			end;
    finally
      fParam1.Free;
    end;
  end;
  if FDopParamStr <> '' then
  begin
    if sParam <> '' then
      sParam := sParam+'&';
	  sParam := FDopParamStr;
  end;
{  V := CreateOleObject('InternetExplorer.Application');
  V.Visible := True;
  URL := 'http://localhost'; //ADOQuery1URL.Value+sParam;
  V.Navigate(qReport1URL.Value+sParam);
  //InternetExplorer1.Visible := True;
  //InternetExplorer1.Navigate(URL);
  //ShellExecute(Handle, 'open', PChar(ADOQuery1URL.Value+sParam), nil, nil, SW_SHOWNORMAL);
 }
	fWeb1 := TfWeb1.Create(Self);
	fWeb1.Caption := 'Отчет '+qReport1Name.Value;
  qConfig1.Open;
	//fWeb1.URL := StringReplace(qReport1URL.Value, '%Host%', qConfig1Host.Value, [rfIgnoreCase])	+sParam;
  //fWeb1.Orientation := qReport1Orientation.Value;
  //fWeb1.Data := ADOQuery1Data.Value;
  fWeb1.FormInit(qReport1Orientation.Value, StringReplace(qReport1URL.Value, '%Host%', qConfig1Host.Value, [rfIgnoreCase])+sParam);
	fWeb1.Show;
  *)
end;

procedure TfReports1.ExecFastReport1(Sender: TObject);
{
var
  fibparam: TFIBXSQLVAR;
	I, J, P: Integer;
  q: TfrxFIBQuery;
  qb: TfrxBDEQuery;
  o: TPrinterOrientation;
  }
begin
(*
  frxReport1.Clear;
  if q1.FBN('URL').Value <> '' then
  begin
    frxReport1.LoadFromFile(q1.FBN('URL').Value);
    sp1.SQL.Text := q1.FBN('Params').AsString;
    if sp1.ParamCount > 0 then
    begin
      if not SetParams(q1PARAMS.Value, sp1.Params, q1.FBN('ReportID').Value) then Exit;
    end;
    if FDopParamStr <> '' then
    begin
      P := Pos('=', FDopParamStr);
      if sp1.SQL.Text <> '' then sp1.SQL.Text := sp1.SQL.Text+' ' else sp1.SQL.Text := ':p160932 ';
      sp1.SQL.Text := sp1.SQL.Text+':'+LeftStr(FDopParamStr, P-1);
      if sp1.ParamCount > 0 then
        sp1.ParamByName(LeftStr(FDopParamStr, P-1)).Value := MidStr(FDopParamStr, P+1, Length(FDopParamStr)-P);
    end;

    for I := 0 to frxReport1.DataSets.Count - 1 do
    begin
      if frxReport1.DataSets.Items[I].DataSet is TfrxFIBQuery then
      begin
        q := frxReport1.DataSets.Items[I].DataSet as TfrxFIBQuery;
        for J := 0 to q.Params.Count - 1 do
        begin
          fibparam := sp1.FindParam(q.Params[J].Name);
          if fibparam <> nil then
            q.Params[J].Value{Expression} := fibparam.Value;
        end;
      end
      else if frxReport1.DataSets.Items[I].DataSet is TfrxBDEQuery then
      begin
        qb := frxReport1.DataSets.Items[I].DataSet as TfrxBDEQuery;
        for J := 0 to qb.Params.Count - 1 do
        begin
          fibparam := sp1.FindParam(qb.Params[J].Name);
          if fibparam <> nil then
            qb.Params[J].Value{Expression} := fibparam.Value;
        end;
      end

    end;
    if q1.FBN('Orientation').Value = 0 then
      o := poLandscape
    else
      o := poPortrait;
    for I := 0 to frxReport1.PagesCount -1 do
      if frxReport1.Pages[I] is TfrxReportPage then
        (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
    frxReport1.ShowReport();
  end;*)
end;

procedure TfReports1.ExecFastReport7(Sender: TObject);
{
var
  o: TPrinterOrientation;
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, P: Integer;
  qdsList: TList;
  qds: TpFIBDataSet;
  frxDBDS1: TfrxDBDataset;
  fibparam: TFIBXSQLVAR;
  }
begin
(*
  frxReport1.Clear;
  if q1.FBN('URL').Value <> '' then
  begin
    sp1.SQL.Text := q1.FBN('Params').AsString;
    if sp1.ParamCount > 0 then
    begin
      if not SetParams(q1PARAMS.Value, sp1.Params, q1.FBN('ReportID').Value) then Exit;
    end;
    if FDopParamStr <> '' then
    begin
      P := Pos('=', FDopParamStr);
      if sp1.SQL.Text <> '' then sp1.SQL.Text := sp1.SQL.Text+' ' else sp1.SQL.Text := ':p160932 ';
      sp1.SQL.Text := sp1.SQL.Text+':'+LeftStr(FDopParamStr, P-1);
      if sp1.ParamCount > 0 then
        sp1.ParamByName(LeftStr(FDopParamStr, P-1)).Value := MidStr(FDopParamStr, P+1, Length(FDopParamStr)-P);
    end;

    qdsList := TList.Create;

    IXmlDoc1 := XmlDoc1.DefaultInterface;
    IXmlDoc1.loadXML(q1REPDATA.AsString);
    Node1 := IXmlDoc1.documentElement.selectSingleNode('TQueries');
    NodeList1 := Node1.selectNodes('TQuery');
    for I := 0 to NodeList1.length-1 do
    begin
      qds := TpFIBDataSet.Create(Self);
      qds.SQLs.SelectSQL.Text := getNodeText(NodeList1[I], 'sql');
      qds.Transaction := DM1.trRead;
      frxDBDS1 := TfrxDBDataset.Create(Self);
      frxDBDS1.UserName := getNodeText(NodeList1[I], 'name');;
      frxDBDS1.DataSet := qds;
      frxReport1.DataSets.Add(frxDBDS1);
      frxReport1.EnabledDataSets.Add(frxDBDS1);
      qdsList.Add(frxDBDS1);
      for P := 0 to qds.ParamCount - 1 do
      begin
        fibparam := sp1.FindParam(qds.Params[P].Name);
        if fibparam <> nil then
          qds.Params[P].Value{Expression} := fibparam.Value
        else
          qds.Params[P].Value := Null;
      end;
    end;

    frxReport1.LoadFromFile(q1.FBN('URL').Value);

    if q1.FBN('Orientation').Value = 0 then
      o := poLandscape
    else
      o := poPortrait;
    for I := 0 to frxReport1.PagesCount -1 do
      if frxReport1.Pages[I] is TfrxReportPage then
        (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
    frxReport1.ShowReport();

    for I := 0 to frxReport1.EnabledDataSets.Count-1 do
      frxReport1.EnabledDataSets.Delete(0);
    for I := 0 to qdsList.Count-1 do
    begin
      frxDBDS1 := TfrxDBDataset(qdsList[I]);
      qds := TpFIBDataSet(frxDBDS1.DataSet);
      FreeAndNil(qds);
      FreeAndNil(frxDBDS1);
    end;
    qdsList.Free;
  end;*)
end;

procedure TfReports1.acDesign7Execute(Sender: TObject);
{
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I: Integer;
  o: TPrinterOrientation;
  qdsList: TList;
  qds: TpFIBDataSet;
  frxDBDS1: TfrxDBDataset;
  }
begin
{
  qdsList := TList.Create;

  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q1REPDATA.AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQueries');
  NodeList1 := Node1.selectNodes('TQuery');
  for I := 0 to NodeList1.length-1 do
  begin
    qds := TpFIBDataSet.Create(Self);
    qds.SQLs.SelectSQL.Text := getNodeText(NodeList1[I], 'sql');
    qds.Transaction := DM1.trRead;
    frxDBDS1 := TfrxDBDataset.Create(Self);
    frxDBDS1.UserName := getNodeText(NodeList1[I], 'name');;
    frxDBDS1.DataSet := qds;
    frxReport1.DataSets.Add(frxDBDS1);
    frxReport1.EnabledDataSets.Add(frxDBDS1);
    qdsList.Add(frxDBDS1);
  end;
  if q1URL.Value <> '' then
    frxReport1.LoadFromFile(q1URL.Value);
  if q1.FBN('Orientation').Value = 0 then
    o := poLandscape
  else
    o := poPortrait;
  for I := 0 to frxReport1.PagesCount -1 do
    if frxReport1.Pages[I] is TfrxReportPage then
      (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
  frxReport1.DesignReport;
  for I := 0 to frxReport1.EnabledDataSets.Count-1 do
    frxReport1.EnabledDataSets.Delete(0);
  for I := 0 to qdsList.Count-1 do
  begin
    frxDBDS1 := TfrxDBDataset(qdsList[I]);
    qds := TpFIBDataSet(frxDBDS1.DataSet);
    FreeAndNil(qds);
    FreeAndNil(frxDBDS1);
  end;
  qdsList.Free;
  }
end;

procedure TfReports1.acDesign1Execute(Sender: TObject);
{var
  I: Integer;
  o: TPrinterOrientation;
  }
begin
{
  frxReport1.Clear;

  if q1URL.Value <> '' then
    frxReport1.LoadFromFile(q1URL.Value);
  if q1.FBN('Orientation').Value = 0 then
    o := poLandscape
  else
    o := poPortrait;
  for I := 0 to frxReport1.PagesCount -1 do
    if frxReport1.Pages[I] is TfrxReportPage then
      (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
  frxReport1.DesignReport;
  }
end;

procedure TfReports1.qAfterUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var Resume: Boolean);
begin
  DataSet.DataSource.DataSet.Refresh;
end;

procedure TfReports1.acShowDesc1Execute(Sender: TObject);
var
  f: TForm;
begin
  f := TForm.Create(Form);
  try
    f.Caption := 'Описание';
    f.Width := Screen.Width*8 div 10;
    f.Height := Screen.Height*8 div 10;
    f.Position := poDesktopCenter;
    with TDBMemo.Create(f) do
    begin
      Parent := f;
      Align := alClient;
      DataSource := ds1;
      DataField := 'REPDESC';
      ReadOnly := True;
    end;
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfReports1.ExecExcelReport(Sender: TObject);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1, NodeList2: IXMLDOMNodeList;
  I, J: Integer;
  tbxExcel1, tbxDesc: TTBXItem;
  c: TColumnEh;
  sColor, vt: String;
  //vParser: TSQLParser;
  o: TAvEhGrid;
  p: TMSParam;
  pnl: TPanel;
  prnt: TWinControl;
begin
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q1.FieldByName('RepData').AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
  Form := TfTable.Create(Self);
  try
    Form.acEscape1 := nil;
    Form.Caption := q1.FieldByName('NAME').Value;
    Form.WindowState := wsMaximized;
    Form.miSelect.Visible := False;
    Form.AvEhGrid1.OnDblClick := nil;
    Form.AvEhGrid1.Options := Form.AvEhGrid1.Options-[dgCancelOnExit]-[dgTabs];
    Form.q1.Close;
    //Form.q1.WaitEndMasterInterval := getNodeInt(Node1, 'WaitEndMasterInterval', Form.q1.WaitEndMasterInterval);
    Form.q1.SQL.Text := getNodeText(Node1, 'sql', '');
    Form.q1.SQLUpdate.Text := getNodeText(Node1, 'updsql', '');
    Form.q1.SQLRefresh.Text := getNodeText(Node1, 'refsql', '');
    {if (Form.q1.SQLRefresh.Text = '') and (UpperCase(getNodeText(Node1, 'RefreshAfterPost')) = 'TRUE') then
    begin
      vParser := TSQLParser.Create;
      try
        vParser.SQLText := Form.q1.SQLs.SelectSQL.Text;
        vParser.SQLText := vParser.SetOrderClause('');
        Form.q1.SQLs.RefreshSQL.Text := vParser.AddToMainWhere(getNodeText(Node1, 'RefreshWhere'), True);
      finally
        vParser.Free
      end;
    end;}
    if UpperCase(getNodeText(Node1, 'AllowRefresh', '')) = 'TRUE' then
    begin
      Form.q1.SQLRefresh.Text := Form.q1.SQL.Text;
    end;
    if Form.q1.SQLUpdate.Text <> '' then
    begin
      Form.q1.CachedUpdates := True;
      Form.AvEhGrid1.Options := Form.AvEhGrid1.Options+[dgEditing];
      Form.AvEhGrid1.AllowedOperations := Form.AvEhGrid1.AllowedOperations+[alopUpdateEh];
    end
    else
      Form.q1.CachedUpdates := False;
    if UpperCase(getNodeText(Node1, 'UseMultiTitle', '')) = 'TRUE' then
      Form.AvEhGrid1.UseMultiTitle := True
    else
      Form.AvEhGrid1.UseMultiTitle := False;
    if UpperCase(getNodeText(Node1, 'AutoFitColWidth', '')) = 'FALSE' then
      Form.AvEhGrid1.AutoFitColWidths := False;
    Form.AvEhGrid1.TitleHeight := getNodeInt(Node1, 'TitleHeight', Form.AvEhGrid1.TitleHeight);
    Form.AvEhGrid1.TitleLines := 1;
    Form.AvEhGrid1.FooterRowCount := getNodeInt(Node1, 'FooterRowCount', Form.AvEhGrid1.FooterRowCount);
    if UpperCase(getNodeText(Node1, 'SumListActive', '')) = 'TRUE' then
      Form.AvEhGrid1.SumList.Active := True;
    if Form.q1.ParamCount > 0 then
    begin
      if not SetParams(q1.FieldByName('PARAMS').Value, Form.q1.Params, q1.FieldByName('ReportID').Value) then Exit;
    end;
    SetDopParams(Form.q1.Params);
    try
      Form.q1.DisableControls;
      Form.acRefresh1Execute(Sender);
      if Form.q1.Eof then
      begin
        Application.MessageBox('Не найдены данные для отчета', PAnsiChar(Application.Title), MB_ICONERROR);
      end
      else
      begin
        NodeList1 := Node1.selectNodes('TField');
        for I := 0 to NodeList1.length-1 do
        begin
          c := Form.AvEhGrid1.Columns.Add;
          c.FieldName := getNodeText(NodeList1[I], 'name', '');
          c.Title.Caption := getNodeText(NodeList1[I], 'display', c.Title.Caption);
          c.Width := getNodeInt(NodeList1[I], 'DisplayWidth', c.Width)*8;
          c.DisplayFormat := getNodeText(NodeList1[I], 'DisplayFormat', '');
          c.KeyList.Text := getNodeText(NodeList1[I], 'KeyList', '');
          c.PickList.Text := getNodeText(NodeList1[I], 'PickList', '');
          sColor := getNodeText(NodeList1[I], 'Color', '');
          if sColor <> '' then c.Color := StringToColor(sColor);
          if UpperCase(getNodeText(NodeList1[I], 'ReadOnly', '')) = 'FALSE' then
          begin
            c.ReadOnly := False;
            c.Color := cl3DLight;
          end
          else
            c.ReadOnly := True;
          c.Footer.FieldName := getNodeText(NodeList1[I], 'FooterFieldName', c.FieldName);
          vt := getNodeText(NodeList1[I], 'FooterValueType', '');
          if vt <> '' then
          begin
            if vt = 'fvtSum' then
              c.Footer.ValueType := fvtSum
            else if vt = 'fvtCount' then
              c.Footer.ValueType := fvtCount;
            c.Footer.DisplayFormat := c.DisplayFormat;
          end;
        end;
        Form.q1.EnableControls;
        tbxExcel1 := TTBXItem.Create(Form.TBXToolbar2);
        tbxExcel1.Action := Form.acExcel1;
        Form.TBXToolbar2.Items.Add(tbxExcel1);

        tbxDesc := TTBXItem.Create(Form.TBXToolbar2);
        tbxDesc.Action := TAction.Create(Self);
        with tbxDesc.Action as TAction do
        begin
          Caption := 'Описание';
          ImageIndex := 15;
          OnExecute := acShowDesc1Execute;
        end;
        Form.TBXToolbar2.Items.Add(tbxDesc);

        prnt := Form;
        NodeList1 := Node1.selectNodes('TChildQuery');
        for I := 0 to NodeList1.length-1 do
        begin
          pnl := TPanel.Create(Form);
          with pnl do
          begin
            Align := alBottom;
            Parent := prnt;
            Height := getNodeInt(NodeList1[I], 'Height', 200);
            BorderStyle := bsNone;
            BevelInner := bvNone;
            BevelOuter := bvNone;
          end;
          with TSplitter.Create(Form) do
          begin
            Align := alBottom;
            Parent := prnt;
          end;
          prnt := pnl;
          o := TAvEhGrid.Create(Form);
          with o as TAvEhGrid do
          begin
            Align := alClient;
            Parent := pnl;
            OptionsEh := [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth];
            ColumnDefValues.Title.Alignment := taCenter;
            ColumnDefValues.Title.TitleButton := True;
            Flat := True;
            if UpperCase(getNodeText(NodeList1[I], 'UseMultiTitle', '')) = 'TRUE' then
              UseMultiTitle := True
            else
              UseMultiTitle := False;
            if UpperCase(getNodeText(NodeList1[I], 'AutoFitColWidth', '')) = 'TRUE' then
              AutoFitColWidths := True;
            TitleHeight := getNodeInt(NodeList1[I], 'TitleHeight', 24);
            TitleLines := 1;
            FooterRowCount := getNodeInt(NodeList1[I], 'FooterRowCount', FooterRowCount);
            if UpperCase(getNodeText(NodeList1[I], 'SumListActive', '')) = 'TRUE' then
              SumList.Active := True;
            Options := Options-[dgCancelOnExit]-[dgTabs]+[dgAlwaysShowSelection];
            DataSource := TDataSource.Create(Self);
            DataSource.DataSet := TMSQuery.Create(Self);
            with DataSource.DataSet as TMSQuery do
            begin
              Connection := DM1.MSConnection1;
              MasterSource := Form.ds1;
              SQL.Text := getNodeText(NodeList1[I], 'sql', '');
              SQLUpdate.Text := getNodeText(NodeList1[I], 'updsql', '');
              SQLRefresh.Text := getNodeText(NodeList1[I], 'refsql', '');
              for J := 0 to Form.q1.ParamCount-1 do
              begin
                p := FindParam(Form.q1.Params[J].Name);
                if p <> nil then
                  p.Value := Form.q1.Params[J].Value;
              end;
              {if (SQLRefresh.Text = '') and (UpperCase(getNodeText(NodeList1[I], 'RefreshAfterPost')) = 'TRUE') then
              begin
                vParser := TSQLParser.Create;
                try
                  vParser.SQLText := SQLs.SelectSQL.Text;
                  vParser.SQLText := vParser.SetOrderClause('');
                  SQLs.RefreshSQL.Text := vParser.AddToMainWhere(getNodeText(NodeList1[I], 'RefreshWhere'), True);
                  RefreshTransactionKind := tkUpdateTransaction;
                finally
                  vParser.Free
                end;
              end;}
              if SQLUpdate.Text <> '' then
              begin
                CachedUpdates := True;
                (o as TAvEhGrid).Options := (o as TAvEhGrid).Options+[dgEditing];
                AllowedOperations := AllowedOperations+[alopUpdateEh];
                //AfterUpdateRecord := qAfterUpdateRecord;
              end
              else
                CachedUpdates := False;
              NodeList2 := NodeList1[I].selectNodes('TField');
              for J := 0 to NodeList2.length-1 do
              begin
                c := Columns.Add;
                c.FieldName := getNodeText(NodeList2[J], 'name', '');
                c.Title.Caption := getNodeText(NodeList2[J], 'display', c.Title.Caption);
                c.Width := getNodeInt(NodeList2[J], 'DisplayWidth', c.Width)*8;
                c.DisplayFormat := getNodeText(NodeList2[J], 'DisplayFormat', '');
                c.KeyList.Text := getNodeText(NodeList2[J], 'KeyList', '');
                c.PickList.Text := getNodeText(NodeList2[J], 'PickList', '');
                sColor := getNodeText(NodeList1[I], 'Color', '');
                if sColor <> '' then c.Color := StringToColor(sColor);
                if UpperCase(getNodeText(NodeList2[J], 'ReadOnly', '')) = 'FALSE' then
                begin
                  c.ReadOnly := False;
                  c.Color := cl3DLight;
                end
                else
                  c.ReadOnly := True;
                c.Footer.FieldName := getNodeText(NodeList2[J], 'FooterFieldName', '');
                vt := getNodeText(NodeList2[J], 'FooterValueType', '');
                if vt <> '' then
                begin
                  if vt = 'fvtSum' then
                    c.Footer.ValueType := fvtSum
                  else if vt = 'fvtCount' then
                    c.Footer.ValueType := fvtCount;
                  c.Footer.DisplayFormat := c.DisplayFormat;
                end;
              end;
              Open;
            end;
          end;
        end;
        Form.WindowState := wsMaximized;
        Form.ShowModal;
      end;
      Form.q1.Close;
    finally
      Form.Free;
    end;
  except
		on E: Exception do
		begin
			Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
		end;
  end;
end;

procedure TfReports1.ExecTextReport(Sender: TObject);
{var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  SaveDialog: TSaveDialog;
  q: TpFIBQuery;
  F: TextFile;}
begin
{
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q1REPDATA.AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
  SaveDialog := TSaveDialog.Create(Self);
  try
    SaveDialog.DefaultExt := 'txt';
    SaveDialog.Filter := 'Текстовый файл (*.txt)|*.txt';
    if SaveDialog.Execute then
    begin
      q := TpFIBQuery.Create(Self);
      try
        q.Database := DM1.pFIBDatabase1;
        q.Transaction := DM1.trRead;
        q.SQL.Text := getNodeText(Node1, 'sql');
        if q.ParamCount > 0 then
        begin
          if not SetParams(q1PARAMS.Value, q.Params, q1.FBN('ReportID').Value) then Exit;
        end;
        SetDopParams(q.Params);
        q.ExecQuery;
        if not q.Eof then
        begin
          AssignFile(F, SaveDialog.FileName);
          Rewrite(F);
          while not q.Eof do
          begin
            Writeln(F, q.Fields[0].AsString);
            q.Next;
          end;
          Flush(F);
          CloseFile(F);
          ShellExecute(Handle, 'open', PChar(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
        end;
      finally
        q.Free;
      end
    end;
  finally
    SaveDialog.Free;
  end}
end;

procedure TfReports1.ExecTextImport(Sender: TObject);
{var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, lines, errors: Integer;
  OpenDialog: TOpenDialog;
  q, qi: TpFIBQuery;
  F: TextFile;
  pl, sl: TStringList;
  S: String;}
begin
{
  OpenDialog := TOpenDialog.Create(Self);
  q := TpFIBQuery.Create(Self);
  qi := TpFIBQuery.Create(Self);
  sl := TStringList.Create;
  pl := TStringList.Create;
  pl.Delimiter := Chr(9);
  try
    OpenDialog.DefaultExt := 'txt';
    OpenDialog.Filter := 'Текстовый файл (*.txt)|*.txt';
    if OpenDialog.Execute then
    begin
      IXmlDoc1 := XmlDoc1.DefaultInterface;
      IXmlDoc1.loadXML(q1REPDATA.AsString);
      Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
      q.Database := DM1.pFIBDatabase1;
      q.Transaction := DM1.trWrite;
      q.Options := q.Options+[qoStartTransaction]-[qoAutoCommit];
      if not q.Transaction.Active then q.Transaction.Active := True;
      q.SQL.Text := getNodeText(Node1, 'sql');
      if q1PARAMS.Value <> '' then
      begin
        if not SetParams(q1PARAMS.Value, q.Params, q1REPORTID.Value) then Exit;
      end;
      if getNodeText(Node1, 'initsql') <> '' then
      begin
        qi.Database := DM1.pFIBDatabase1;
        qi.Transaction := DM1.trWrite;
        qi.Options := q.Options+[qoStartTransaction]-[qoAutoCommit];
        qi.SQL.Text := getNodeText(Node1, 'initsql');
        SetDopParams(qi.Params);
        qi.ExecQuery;
      end;
      SetDopParams(q.Params);
      NodeList1 := Node1.selectNodes('TColumn');
      for I := 0 to NodeList1.length-1 do
      begin
        sl.Add(getNodeText(NodeList1[I], 'value'));
      end;
      AssignFile(F, OpenDialog.FileName);
      Reset(F);
      lines := 0;
      errors := 0;
      try
        if not Eof(F) then
        begin
          Readln(F, S);
          while not Eof(F) do
          begin
            Readln(F, S);
            SetDelimitedText(pl, S);
            for I := 0 to sl.Count-1 do
            begin
              if i < pl.Count then
                q.Params[StrToInt(sl.Names[I])-1].Value := pl.Strings[StrToInt(sl.ValueFromIndex[i])-1]
              else
                q.Params[StrToInt(sl.Names[I])-1].Clear;
            end;
            try
              q.ExecQuery;
              lines := lines+1;
            except
              on ex: Exception do
              begin
                errors := errors+1;
                q.Transaction.Rollback;
                Application.MessageBox(PAnsiChar('Строка'+IntToStr(lines+1)+ex.Message), 'Ошибка', MB_ICONERROR);
                Exit;
              end
            end;
          end;
        end;
      finally
        Flush(F);
        CloseFile(F);
      end;
      q.Transaction.Commit;
      Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(Lines)+'. Ошибок - '+IntToStr(Errors)), PAnsiChar(Caption), MB_ICONINFORMATION);
    end
  finally
    sl.Free;
    pl.Free;
    q.Free;
    qi.Free;
    OpenDialog.Free;
  end}
end;

procedure TfReports1.ExecImpDocLines(Sender: TObject);
{  function StrToOem1(const AnsiStr: string): string;
  begin
    SetLength(Result, Length(AnsiStr));
    //if Length(Result) > 0 then
      OemToChar(PChar(AnsiStr), PChar(Result));
  end;
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, P, lc: Integer;
  lines, errors: Integer;
  OpenDialog: TOpenDialog;
  q: TpFIBQuery;
  pl, sl: TStringList;
  S: String;
	XlsApp: TExcelApplication;
	XlsWb1: TExcelWorkbook;
	XlsWs1: TExcelWorksheet;
  bLoop: Boolean;
  qt: TTable;
  dbf: TDbf;
  param: String;
  F: TextFile;
  }
begin
{
  OpenDialog := TOpenDialog.Create(Self);
  q := TpFIBQuery.Create(Self);
  sl := TStringList.Create;
  try
    IXmlDoc1 := XmlDoc1.DefaultInterface;
    IXmlDoc1.loadXML(q1REPDATA.AsString);
    Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
    param := getNodeText(Node1, 'param');
    q.Database := DM1.pFIBDatabase1;
    q.Transaction := DM1.trRead;
    q.SQL.Text := 'select linfo from lib where lid = '+param;
    q.Options := q.Options+[qoStartTransaction];
    if not SetParams(param, q.Params, q1REPORTID.Value) then Exit;
    q.ExecQuery;
    IXmlDoc1.loadXML(q.Fields[0].AsString);
    q.Close;
    Node1 := IXmlDoc1.documentElement.selectSingleNode('TImport');
    NodeList1 := Node1.selectNodes('TParam');
    for I := 0 to NodeList1.length-1 do
    begin
      sl.Add(getNodeText(NodeList1[I], 'value'));
    end;
    if getNodeText(Node1, 'type') = 'Excel' then
    begin
      OpenDialog.DefaultExt := 'xls';
      OpenDialog.Filter := 'Файл Excel (*.xls)|*.xls;*.xlsx';
      if OpenDialog.Execute then
      begin
        s := getNodeText(Node1, 'initsql');
        q.Transaction := DM1.trWrite;
        q.Options := q.Options+[qoStartTransaction]+[qoAutoCommit];
        if s <> '' then
        begin
          q.SQL.Text := s;
          SetDopParams(q.Params);
          q.ExecQuery;
          q.Close;
        end;
        q.SQL.Text := getNodeText(Node1, 'sql');
        SetDopParams(q.Params);
        XlsApp := TExcelApplication.Create(Self);
        XlsApp.ConnectKind := ckNewInstance;
        XlsApp.Connect;
        XlsApp.AutoQuit := True;
        XlsWb1 := TExcelWorkbook.Create(Self);
	      XlsWs1 := TExcelWorksheet.Create(Self);
        try
          XlsApp.Workbooks.Open(OpenDialog.FileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam, EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
          XlsWb1.ConnectTo(XlsApp.Workbooks[1] as _Workbook);
          XlsWs1.ConnectTo(XlsWb1.Worksheets[1] as _Worksheet);
          XlsApp.DisplayAlerts[0] := False;
          bLoop := True;
          I := getNodeInt(Node1, 'FirstRow', 2);
          lc := getNodeInt(Node1, 'LastCol', 1);
          lines := 0;
          errors := 0;
          while bLoop do
          begin
            s := XlsWs1.Cells.Item[I,lc];
            if s <> '' then
            begin
              for P := 0 to sl.Count-1 do
              begin
                if q.FindParam(sl.Names[P]) <> nil then
                begin
                  s := XlsWs1.Cells.Item[I,StrToInt(sl.ValueFromIndex[P])];
                  q.ParamByName(sl.Names[P]).AsVariant := s;
                end;
              end;
              try
                q.ExecQuery;
                lines := lines+1;
              except
                on ex: Exception do
                begin
                  errors := errors+1;
                  q.Transaction.Rollback;
                  if Application.MessageBox(PAnsiChar('Строка'+IntToStr(I)+' '+ex.Message+' Прервать цикл ?'), 'Ошибка', MB_YESNO or MB_ICONERROR) = IDNO then
                    bLoop := False;
                end
              end;
              I := I+1;
            end
            else
              bLoop := False;
          end;
          Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(Lines)+'. Ошибок - '+IntToStr(Errors)), PAnsiChar(Caption), MB_ICONINFORMATION);
        finally
          XlsWs1.Free;
          XlsWb1.Free;
          XlsApp.Free;
        end;
      end;
    end
    else if getNodeText(Node1, 'type') = 'Dbf' then
    begin
      OpenDialog.DefaultExt := 'dbf';
      OpenDialog.Filter := 'Файл Dbf (*.dbf)|*.dbf';
      if OpenDialog.Execute then
      begin
        s := getNodeText(Node1, 'initsql');
        if s <> '' then
        begin
          q.SQL.Text := s;
          q.Transaction := DM1.trWrite;
          q.Options := q.Options+[qoStartTransaction]+[qoAutoCommit];
          SetDopParams(q.Params);
          q.ExecQuery;
          q.Close;
        end;
        q.SQL.Text := getNodeText(Node1, 'sql');
        SetDopParams(q.Params);
        qt := TTable.Create(Self);
        try
          qt.TableName := OpenDialog.FileName;
          qt.Open;
          lines := 0;
          errors := 0;
          while not qt.Eof do
          begin
            for P := 0 to sl.Count-1 do
            begin
              if q.FindParam(sl.Names[P]) <> nil then
              begin
                q.ParamByName(sl.Names[P]).AsVariant := qt.FieldByName(sl.ValueFromIndex[P]).AsString;
              end;
            end;
            try
              q.ExecQuery;
              lines := lines+1;
            except
              on ex: Exception do
              begin
                errors := errors+1;
                q.Transaction.Rollback;
                Application.MessageBox(PAnsiChar('Строка'+IntToStr(lines+1)+ex.Message), 'Ошибка', MB_ICONERROR);
              end
            end;
            qt.Next;
          end;
          qt.Close;
          Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(Lines)+'. Ошибок - '+IntToStr(Errors)), PAnsiChar(Caption), MB_ICONINFORMATION);
        finally
          qt.Free;
        end
      end
    end
    else if getNodeText(Node1, 'type') = 'TDbf' then
    begin
      OpenDialog.DefaultExt := 'dbf';
      OpenDialog.Filter := 'Файл Dbf (*.dbf)|*.dbf';
      if OpenDialog.Execute then
      begin
        s := getNodeText(Node1, 'initsql');
        if s <> '' then
        begin
          q.SQL.Text := s;
          q.Transaction := DM1.trWrite;
          q.Options := q.Options+[qoStartTransaction]+[qoAutoCommit];
          SetDopParams(q.Params);
          q.ExecQuery;
          q.Close;
        end;
        q.SQL.Text := getNodeText(Node1, 'sql');
        SetDopParams(q.Params);
        dbf := TDBF.Create(Self);
        try
          dbf.TableName := OpenDialog.FileName;
          dbf.TableLevel := 4;
          dbf.Open;
          lines := 0;
          errors := 0;
          while not dbf.Eof do
          begin
            for P := 0 to sl.Count-1 do
            begin
              if q.FindParam(sl.Names[P]) <> nil then
              begin
                q.ParamByName(sl.Names[P]).AsVariant := dbf.FieldByName(sl.ValueFromIndex[P]).AsString;
              end;
            end;
            try
              q.ExecQuery;
              lines := lines+1;
            except
              on ex: Exception do
              begin
                errors := errors+1;
                q.Transaction.Rollback;
                Application.MessageBox(PAnsiChar('Строка'+IntToStr(lines+1)+ex.Message), 'Ошибка', MB_ICONERROR);
              end
            end;
            dbf.Next;
          end;
          dbf.Close;
          Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(Lines)+'. Ошибок - '+IntToStr(Errors)), PAnsiChar(Caption), MB_ICONINFORMATION);
        finally
          dbf.Free;
        end
      end
    end
    else if getNodeText(Node1, 'type') = 'Text' then
    begin
      OpenDialog.DefaultExt := 'txt';
      OpenDialog.Filter := 'Файл Txt (*.txt)|*.txt';
      if OpenDialog.Execute then
      begin
        s := getNodeText(Node1, 'initsql');
        if s <> '' then
        begin
          q.SQL.Text := s;
          q.Transaction := DM1.trWrite;
          q.Options := q.Options+[qoStartTransaction]+[qoAutoCommit];
          SetDopParams(q.Params);
          q.ExecQuery;
          q.Close;
        end;
        q.SQL.Text := getNodeText(Node1, 'sql');
        SetDopParams(q.Params);
        pl := TStringList.Create;
        pl.Delimiter := Chr(getNodeInt(Node1, 'Delimiter', 9));
        AssignFile(F, OpenDialog.FileName);
        Reset(F);
        try
          for I := 1 to getNodeInt(Node1, 'FirstRow', 2) - 1 do
            if Eof(F) then Readln(F, S);
          lines := 0;
          errors := 0;
          while not Eof(F) do
          begin
            Readln(F, S);
            SetDelimitedText(pl, S);
            for P := 0 to sl.Count-1 do
            begin
              if q.FindParam(sl.Names[P]) <> nil then
              begin
                if P < pl.Count then
                  q.ParamByName(sl.Names[P]).AsVariant := pl.Strings[StrToInt(sl.ValueFromIndex[P])-1]
                else
                  q.ParamByName(sl.Names[P]).Clear;
              end;
            end;
            try
              q.ExecQuery;
              lines := lines+1;
            except
              on ex: Exception do
              begin
                errors := errors+1;
                q.Transaction.Rollback;
                Application.MessageBox(PAnsiChar('Строка'+IntToStr(lines+1)+' '+ex.Message), 'Ошибка', MB_ICONERROR);
              end
            end;
          end;
        finally
          CloseFile(F);
          pl.Free;
        end;
        Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(Lines)+'. Ошибок - '+IntToStr(Errors)), PAnsiChar(Caption), MB_ICONINFORMATION);
      end
    end
  finally
    sl.Free;
    q.Free;
    OpenDialog.Free;
  end
  }
end;

procedure TfReports1.ExecExcelImport(Sender: TObject);
begin

end;

procedure TfReports1.ExecExcelExport(Sender: TObject);
{var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
	XlsApp: TExcelApplication;
	XlsWb1: TExcelWorkbook;
	XlsWs1: TExcelWorksheet;
  Data: OleVariant;
  sl: TStringList;
  q: TpFIBQuery;
  I, FirstRow, FirstCol, ColCount, l: Integer;
  FileName: String;
  SaveDialog: TSaveDialog;
  AskTemplate: Boolean;
  }
begin
{
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q1REPDATA.AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');

  q := TpFIBQuery.Create(Self);
  sl := TStringList.Create;
  try
    q.Database := DM1.pFIBDatabase1;
    q.Transaction := DM1.trRead;
    q.SQL.Text := getNodeText(Node1, 'sql');
    if q.ParamCount > 0 then
    begin
      if not SetParams(q1PARAMS.Value, q.Params, q1.FBN('ReportID').Value) then Exit;
    end;
    SetDopParams(q.Params);
    q.ExecQuery;
    if not q.Eof then
    begin
      NodeList1 := Node1.selectNodes('TColumn');
      for I := 0 to NodeList1.length-1 do
      begin
        sl.Add(getNodeText(NodeList1[I], 'value'));
      end;
      if UpperCase(getNodeText(Node1, 'AskTemplate')) = 'YES' then
        AskTemplate := True
      else
        AskTemplate := False;
      if not AskTemplate then
        FileName := getNodeText(Node1, 'Template');
      FirstRow := getNodeInt(Node1, 'FirstRow', 2);
      FirstCol := getNodeInt(Node1, 'FirstCol', 1);
      SaveDialog := TSaveDialog.Create(Self);
      try
        SaveDialog.DefaultExt := 'xls';
        SaveDialog.Filter := 'Файл Excel (*.xls)|*.xls;*.xlsx';
        if SaveDialog.Execute then
        begin
          if AskTemplate then
            FileName := SaveDialog.FileName;
          XlsApp := TExcelApplication.Create(Self);
          XlsWb1 := TExcelWorkbook.Create(Self);
          XlsWs1 := TExcelWorksheet.Create(Self);
  	      try
            XlsApp.ConnectKind := ckNewInstance;
            XlsApp.Connect;
            XlsApp.AutoQuit := True;
            XlsApp.Visible[0] := False;

            if FileName <> '' then
              XlsApp.Workbooks.Add(FileName, 0)
            else
              XlsApp.Workbooks.Add(EmptyParam, 0);

            XlsWb1.ConnectTo(XlsApp.Workbooks[1] as _Workbook);
            XlsWs1.ConnectTo(XlsApp.Workbooks[1].Worksheets[1] as _Worksheet);
            ColCount := getNodeInt(Node1, 'ColCount', sl.Count)-1;
            Data := VarArrayCreate([0, ColCount], varVariant);
            l := 0;
            while not q.Eof do
            begin
              for I := 0 to sl.Count-1 do
              begin
                Data[StrToInt(sl.Values[sl.Names[I]])-1] := FieldToVariant(q.FieldByName(sl.Names[I]));
              end;
              XlsWs1.Range[XlsWs1.Cells.Item[FirstRow,FirstCol], XlsWs1.Cells.Item[FirstRow,FirstCol+ColCount]].Value2 := Data;
              FirstRow := FirstRow+1;
              q.Next;
              l := l+1;
            end;
            q.Close;
            XlsApp.DisplayAlerts[0] := False;
            XlsWb1.SaveCopyAs(SaveDialog.FileName);
            XlsApp.Quit;
            Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(l)+#13#10'Файл сохранен - '+SaveDialog.FileName), PAnsiChar(Caption), MB_ICONINFORMATION);
      	  finally
	  	      XlsApp.Free;
        		XlsWb1.Free;
	  	      XlsWs1.Free;
      	  end;
        end;
      finally
        SaveDialog.Free;
      end;
    end;
  finally
    q.Free;
    sl.Free;
  end;}
end;

procedure TfReports1.SetDopParams(prm: TMSParams);
var
  dp: TStringList;
  P: Integer;
begin
  if FDopParamStr <> '' then
  begin
    dp := TStringList.Create;
    try
      dp.Text := FDopParamStr;
      for P := 0 to dp.Count-1 do
      begin
        if prm.FindParam(dp.Names[P]) <> nil then
          prm.ParamByName(dp.Names[P]).Value := dp.Values[dp.Names[P]];
      end
    finally
      FreeAndNil(dp);
    end;
  end;
end;

procedure TfReports1.ExecPivotReport(Sender: TObject);
{
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I: Integer;
  str: String;
  FieldName: String;

  procedure DoPivot;
  var
	  ExcelApplication1: TExcelApplication;
  	ExcelWorkbook1: TExcelWorkbook;
	  ExcelWorksheet1: TExcelWorksheet;
    PivotField1: IPivotField;
    I: Integer;
    orient: string;
    IDisp: IDispatch;
  begin
  	ExcelApplication1 := TExcelApplication.Create(Self);
	  ExcelWorkbook1 := TExcelWorkbook.Create(Self);
	  ExcelWorksheet1 := TExcelWorksheet.Create(Self);
	  ExcelApplication1.Visible[0] := True;
	  try
  		ExcelWorkbook1.ConnectTo( ExcelApplication1.Workbooks.Add(EmptyParam, 0) as _Workbook);
	  	ExcelWorksheet1.ConnectTo(ExcelWorkbook1.Worksheets[1] as _Worksheet);
      with ExcelWorkbook1.PivotCaches.Add(xlExternal, EmptyParam) do
      begin
        Connection := 'ODBC;DSN=fbtwg;'; //PROTOCOL=2;SERVER=192.168.127.200;DATABASE=/db/profitmed.gdb;UID=twuser;;CHARSET=win1251;VERSION=6;DIALECT=1;OPTIONS=
        CommandType := xlCmdSql;
        CommandText := str;
        with CreatePivotTable('R10C1', 'СводнаяТаблица1', True, xlPivotTableVersion10) do
        begin
          NodeList1 := Node1.selectNodes('TField');
          for I := 0 to NodeList1.length-1 do
          begin
            FieldName := getNodeText(NodeList1[I], 'name');
            if FieldName <> '' then
            begin
              orient := getNodeText(NodeList1[I], 'orientation');
              IDisp := PivotFields('LID');
              IDisp.QueryInterface(IID_IPivotField, PivotField1);
              PivotField1.Set_Orientation(xlRowField);
            end;
          end;
        end
      end;
  	finally
		  ExcelApplication1.Free;
  		ExcelWorkbook1.Free;
	  	ExcelWorksheet1.Free;
  	end;
  end;

  procedure DoPivotLate;
  var
    AppProgID        : String;
    App              : Variant;
    Wb, Ws, PC, PT, PF : Variant;
    Result           : HResult;
    Unknown          : IUnknown;
    name             : String;
    orient           : String;
    I                : Integer;
    display          : String;
    formula          : String;
  begin
    AppProgID := 'Excel.Application';
    Result := GetActiveObject(ProgIDToClassID(AppProgID), nil, Unknown);
    if (Result = MK_E_UNAVAILABLE) then
      App := CreateOleObject(AppProgID)
    else
      begin
      App := GetActiveOleObject(AppProgID);
    end;
    App.Visible := True;
    Wb := App.WorkBooks.Add;
    Ws := Wb.ActiveSheet;
    PC := Wb.PivotCaches.Add(xlExternal);
    PC.Connection := 'ODBC;DSN=fbtwg;'; //PROTOCOL=2;SERVER=192.168.127.200;DATABASE=/db/profitmed.gdb;UID=twuser;;CHARSET=win1251;VERSION=6;DIALECT=1;OPTIONS=
    PC.CommandType := xlCmdSql;
    PC.CommandText := str;
    PC.CreatePivotTable(Wb.Worksheets[1].Cells[3,1], 'СводнаяТаблица1', True, xlPivotTableVersion10);
    PT := Wb.Worksheets[1].PivotTables('СводнаяТаблица1');
    NodeList1 := Node1.selectNodes('TField');
    for I := 0 to NodeList1.length-1 do
    begin
      name := getNodeText(NodeList1[I], 'name');
      if name <> '' then
      begin
        PF := PT.PivotFields(name);
        orient := getNodeText(NodeList1[I], 'orientation');
        display := getNodeText(NodeList1[I], 'display');
        if display = '' then display := FieldName;
        if orient = 'xlRowField' then
        begin
          PF.Orientation := xlRowField;
          PF.Caption := display
        end
        else if orient = 'xlColumnField' then
        begin
          PF.Orientation := xlColumnField;
          PF.Caption := display
        end
        else if orient = 'xlPageField' then
        begin
          PF.Orientation := xlPageField;
          PF.Caption := display
        end
        else if orient = 'xlDataField' then
          PT.AddDataField(PF, display, xlSum);
      end;
    end;
    NodeList1 := Node1.selectNodes('TCalcField');
    for I := 0 to NodeList1.length-1 do
    begin
      name := getNodeText(NodeList1[I], 'name');
      if name <> '' then
      begin
        formula := getNodeText(NodeList1[I], 'formula');
        PT.CalculatedFields.Add(name, formula, True);
        PT.PivotFields(name).Orientation := xlDataField;
      end
    end;
    orient := getNodeText(Node1, 'orientation');
    if orient = 'xlColumnField' then
      PT.DataPivotField.Orientation := xlColumnField
    else if orient = 'xlRowField' then
      PT.DataPivotField.Orientation := xlRowField;
  end;
}
begin
{
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q1REPDATA.AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
  sp1.Close;
  sp1.SQL.Text := getNodeText(Node1, 'sql');
  if q1PARAMS.Value <> '' then
  begin
    if not SetParams(q1PARAMS.Value, sp1.Params, q1.FBN('ReportID').Value) then Exit;
  end;
  SetDopParams(sp1.Params);
  str := sp1.SQL.Text;
  for I := 0 to sp1.ParamCount - 1 do
    str := StringReplace(str, ':'+sp1.Params[I].Name, ''''+sp1.Params[I].AsString+'''', [rfReplaceAll]);
  DoPivotLate;
  }
end;

procedure TfReports1.ExecWordReport(Sender: TObject);
{var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  F: TextFile;
  I: Integer;
  FileName: String;
  s: TStringList;}
begin
{
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q1REPDATA.AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
  sp1.Close;
  sp1.SQL.Text := getNodeText(Node1, 'sql');
  if FDopParamStr <> '' then
  if sp1.ParamCount > 0 then
  begin
    if not SetParams(q1PARAMS.Value, sp1.Params, q1.FBN('ReportID').Value) then Exit;
  end;
  SetDopParams(sp1.Params);
  s := TStringList.Create;
  Screen.Cursor := crSQLWait;
  try
    sp1.ExecQuery;
    if sp1.Eof then
    begin
      Screen.Cursor := crDefault;
      Application.MessageBox('Не найдены данные для отчета', PAnsiChar(Application.Title), MB_ICONERROR);
    end
    else
    begin
      I := LastDelimiter('\', q1URL.Value);
      FileName := 'c:\TW4\'+Copy(q1URL.Value, I+1, Length(q1URL.Value)-I-3)+'txt';
      AssignFile(F, FileName);
      try
        Rewrite(F);
        NodeList1 := Node1.selectNodes('TField');

        for I := 0 to NodeList1.length-1 do
        begin
          if I <> 0 then Write(f, Chr(9));
          Write(f, getNodeText(NodeList1[I], 'display'));
          s.Add(getNodeText(NodeList1[I], 'name'));
        end;
        while not sp1.Eof do
        begin
          Writeln(F, '');
          for I := 0 to s.Count-1 do
          begin
            if I <> 0 then Write(f, Chr(9));
            Write(F, sp1.FieldByName(s[I]).AsString);
          end;
          sp1.Next;
        end;
      finally
        Flush(f);
        CloseFile(f);
      end;
      ShellExecute(Handle, 'open', PChar(q1URL.Value), nil, nil, SW_SHOWNORMAL);
    end;
    sp1.Close;
  except
  end;
  Screen.Cursor := crDefault;
  }
end;

procedure TfReports1.acExec1Execute(Sender: TObject);
begin
  if q1.FieldByName('RepTypeID').Value = 1 then
    ExecWebReport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 2 then
    ExecFastReport1(Sender)
  else if q1.FieldByName('RepTypeID').Value = 3 then
    ExecExcelReport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 4 then
    ExecWordReport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 5 then
    ExecPivotReport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 6 then
    ExecTextReport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 7 then
    ExecFastReport7(Sender)
  else if q1.FieldByName('RepTypeID').Value = 8 then
    ExecTextImport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 9 then
    ExecImpDocLines(Sender)
  else if q1.FieldByName('RepTypeID').Value = 10 then
    ExecExcelExport(Sender)
  else if q1.FieldByName('RepTypeID').Value = 11 then
    ExecExcelImport(Sender)
end;

procedure TfReports1.acInsert1Execute(Sender: TObject);
var
	fReportC1: TfReportC1;
  fRepType1: TfRepType1;
  FRepType: Integer;
begin
  fRepType1 := TfRepType1.Create(Self);
  try
    FRepType := 0;
    fRepType1.qRepType1.Locate('RepTypeID', q1.FieldByName('RepTypeID').Value, []);
    if fRepType1.ShowModal = IDOK then
    begin
      FRepType := fRepType1.qRepType1.FieldByName('RepTypeID').Value;
    end
  finally
    fRepType1.Free;
  end;
  if FRepType > 0 then
  begin
    CreateReportC(fReportC1, FRepType);
    if fReportC1 = nil then Exit;
	  try
		  fReportC1.q1.ParamByName('ReportID').Value := 0;
     	fReportC1.q1.Open;
      fReportC1.q1.Append;
      if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
        fReportC1.q1.FieldByName('RepTreeID').Value := TRTRec(TreeView1.Selected.Data).RepTreeID;
      fReportC1.q1.FieldByName('RepTypeID').Value := FRepType;
     	fReportC1.q1.FieldByName('Hidden').Value := 0;
      fReportC1.q1.FieldByName('Orientation').Value := 1;
  		if fReportC1.ShowModal = IDOK then
	  	begin
		  	q1.Close;
        q1.Open;
			  q1.Locate('ReportID', fReportC1.q1.FieldByName('ReportID').Value, []);
  		end;
    finally
		  fReportC1.Free;
    end;
  end;
end;


procedure TfReports1.acChange1Execute(Sender: TObject);
var
	fReportC1: TfReportC1;
begin
  CreateReportC(fReportC1, q1.FieldByName('RepTypeID').Value);
	try
		fReportC1.q1.ParamByName('ReportID').Value := q1.FieldByName('ReportID').Value;
   	fReportC1.q1.Open;
    fReportC1.q1.Edit;
  	if fReportC1.ShowModal = IDOK then
    begin
			q1.Close;
      q1.Open;
			q1.Locate('ReportID', fReportC1.q1.FieldByName('ReportID').Value, []);
		end;
  finally
		fReportC1.Free;
  end;
end;

procedure TfReports1.RTExpand(ParentID: Integer; Node: TTreeNode);
var
	CNode: TTreeNode;
	RTRec: TRTRec;
begin
	qRepTree1.ParamByName('ParentID').Value := ParentID;
	qRepTree1.Close;
  qRepTree1.Open;
	if not qRepTree1.Eof then
	begin
		if Node <> nil then Node.DeleteChildren;
		while not qRepTree1.Eof do
		begin
			RTRec := TRTRec.Create(qRepTree1.FieldByName('RepTreeID').Value, qRepTree1.FieldByName('ParentID').Value);
			if Node = nil then
				CNode := TreeView1.Items.AddObject(nil, qRepTree1.FieldByName('Name').Value, RTRec)
			else
				CNode := TreeView1.Items.AddChildObject(Node, qRepTree1.FieldByName('Name').Value, RTRec);
      CNode.SelectedIndex := 1;
			CNode := TreeView1.Items.AddChild(CNode, '<Новый>');
			CNode.ImageIndex := 2;
			CNode.SelectedIndex := CNode.ImageIndex;
			qRepTree1.Next;
		end;
	end;
end;

procedure TfReports1.acInsert2Execute(Sender: TObject);
var
	NewString: string;
	RTRec: TRTRec;
	CNode: TTreeNode;
	CNode1: TTreeNode;
begin
{
  if InputQuery(Caption, 'Введите наименование новой группы', NewString) then
 	begin
    if NewString = '' then Exit;
 		if (TreeView1.Selected <> nil) and (TreeView1.Selected.Parent <> nil) then
      spPMREPTREE_I.ParamByName('ParentID').Value := TRTRec(TreeView1.Selected.Parent.Data).RepTreeID
    else
      spPMREPTREE_I.ParamByName('ParentID').Value := 0;
    spPMREPTREE_I.ParamByName('Name').Value := NewString;
    spPMREPTREE_I.ExecProc;
    RTRec := TRTRec.Create(spPMREPTREE_I.ParamByName('RepTreeID').Value, spPMREPTREE_I.ParamByName('ParentID').Value);
    if (TreeView1.Selected = nil) or (TreeView1.Selected.Data <> nil) then
       CNode := TreeView1.Items.AddObject(TreeView1.Selected, NewString, RTRec)
    else
  	begin
	  	CNode := TreeView1.Selected;
		 	CNode.Text := NewString;
		  CNode.Data := RTRec;
  	end;
(*  		if TRTRec(CNode.Data).ParentID <> 0 then
	  	begin
		  	CNode.ImageIndex := 3
  		end
	  	else*)
    begin
			 CNode.ImageIndex := 0;
  		CNode1 := TreeView1.Items.AddChild(CNode, '<Новый>');
	  	CNode1.ImageIndex := 2;
      CNode1.SelectedIndex := CNode1.ImageIndex;
  	end;
 	  CNode.SelectedIndex := CNode.ImageIndex;
    CNode.Selected := False;
		CNode.Selected := True;
  end;}
end;

procedure TfReports1.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
	RTExpand(TRTRec(Node.Data).RepTreeID, Node);
end;

procedure TfReports1.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
	if Node.Data <> nil then
		TRTRec(Node.Data).Free;
end;

procedure TfReports1.acChange2Execute(Sender: TObject);
//var
//	NewString: string;
begin
{
  NewString := TreeView1.Selected.Text;
  if InputQuery(Caption, 'Введите новое наименование группы', NewString) then
 	begin
    if NewString = '' then Exit;
    spPMREPTREE_U.ParamByName('RepTreeID').Value := TRTRec(TreeView1.Selected.Data).RepTreeID;
    spPMREPTREE_U.ParamByName('Name').Value := NewString;
    spPMREPTREE_U.ExecProc;
    TreeView1.Selected.Text := NewString;
  end;
  }
end;

procedure TfReports1.acChange2Update(Sender: TObject);
begin
	acChange2.Enabled := False;
	if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
		if TRTRec(TreeView1.Selected.Data).RepTreeID <> 0 then
			acChange2.Enabled := True;
end;

procedure TfReports1.acDelete2Update(Sender: TObject);
begin
	acDelete2.Enabled := False;
	if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
		if TRTRec(TreeView1.Selected.Data).RepTreeID <> 0 then
			acDelete2.Enabled := True;
end;

procedure TfReports1.acDelete2Execute(Sender: TObject);
//var
//	CParentNode: TTreeNode;
//	CNode1: TTreeNode;
begin
{
	if TreeView1.Selected.Data <> nil then
	begin
		if Application.MessageBox(PChar('Удалить "'+TreeView1.Selected.Text+'"?'),PChar(Caption),MB_ICONQUESTION+MB_OKCANCEL) <> IDOK then
			Abort;
		spPMREPTREE_D.ParamByName('RepTreeID').Value := TRTRec(TreeView1.Selected.Data).RepTreeID;
		spPMREPTREE_D.ExecProc;
	  CParentNode := TreeView1.Selected.Parent;
	  TreeView1.Selected.Delete;
		if (CParentNode <> nil) and (not CParentNode.HasChildren) then
		begin
			CNode1 := TreeView1.Items.AddChild(CParentNode, '<Новый>');
			CNode1.ImageIndex := 2;
			CNode1.SelectedIndex := CNode1.ImageIndex;
			CNode1.Selected := True;
		end;
	end;}
end;

procedure TfReports1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
  begin
    q1.ParamByName('RepTreeID').Value := TRTRec(TreeView1.Selected.Data).RepTreeID;
    q1.ParamByName('hidden').Value := FHidden;
    q1.Close;
    q1.Open;
  end;
end;

procedure TfReports1.acHidden1Execute(Sender: TObject);
begin
  if FHidden = 0 then
    FHidden := 1
  Else
    FHidden := 0;
  q1.ParamByName('Hidden').Value := FHidden;
  q1.Close;
  q1.Open;
end;

procedure TfReports1.acHidden1Update(Sender: TObject);
begin
  if FHidden = 1 then
    acHidden1.Checked := True
  else
    acHidden1.Checked := False;
end;

procedure TfReports1.acInsert3Execute(Sender: TObject);
var
	fReportC1: TfReportC1;
begin
  fReportC1 := TfReportC1.Create(Self);
	try
		fReportC1.q1.ParamByName('ReportID').Value := 0;
   	fReportC1.q1.Open;
  	fReportC1.q1.Append;
    fReportC1.q1.FieldByName('hidden').Value := q1.FieldByName('Hidden').Value;
    fReportC1.q1.FieldByName('Name').Value := q1.FieldByName('Name').Value;
    fReportC1.q1.FieldByName('URL').Value := q1.FieldByName('URL').Value;
    fReportC1.q1.FieldByName('Params').Value := q1.FieldByName('Params').Value;
    fReportC1.q1.FieldByName('RepTypeID').Value := q1.FieldByName('RepTypeID').Value;
    fReportC1.q1.FieldByName('RepTreeID').Value := q1.FieldByName('RepTreeID').Value;
    fReportC1.q1.FieldByName('Orientation').Value := q1.FieldByName('Orientation').Value;
		if fReportC1.ShowModal = IDOK then
		begin
			q1.Close;
      q1.Open;
			q1.Locate('ReportID', fReportC1.q1.FieldByName('ReportID').Value, []);
		end;
  finally
		fReportC1.Free;
  end;

end;

procedure TfReports1.acDesignUpdate(Sender: TObject);
begin
  inherited;
	if not q1.IsEmpty and ((q1.FieldByName('RepTypeID').Value = 2) or (q1.FieldByName('RepTypeID').Value = 7)) then
		acDesign.Enabled := True
	else
		acDesign.Enabled := False;
  acDesign.Visible := acDesign.Enabled;
end;

procedure TfReports1.acDelete1Execute(Sender: TObject);
begin
	if Application.MessageBox(PChar('Удалить запись?'),PChar(Caption),MB_ICONQUESTION+MB_OKCANCEL) <> IDOK then
		Abort;
	{spPMREPORT_D.ParamByName('ReportID').Value := q1REPORTID.Value;
  try
  	spPMREPORT_D.ExecProc;
	except
		on E: Exception do
		begin
			Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
		end;
	end;
  q1.Next;
	q1.ReopenLocate('ReportID');}
end;

procedure TfReports1.acDelete1Update(Sender: TObject);
begin
  inherited;
	if not q1.IsEmpty then
		acDelete1.Enabled := True
	else
		acDelete1.Enabled := False;
end;

procedure TfReports1.acInsert3Update(Sender: TObject);
begin
	if not q1.IsEmpty then
		acInsert3.Enabled := True
	else
		acInsert3.Enabled := False;
end;

procedure TfReports1.acChange1Update(Sender: TObject);
begin
	if not q1.IsEmpty then
		acChange1.Enabled := True
	else
		acChange1.Enabled := False;
end;

function TfReports1.SetParams(ParamStr: String; fibparams: TMSParams; ID: Integer): boolean;
var
  params: TStringList;
begin
  SetParams := False;
  params := TStringList.Create;
  try
    if ParamStr <> '' then
    begin
      params.Delimiter := Chr(32);
      SetDelimitedText(params, ParamStr);
      if (params.Count > 0) then
      begin
        fParam1 := TfParam1.Create(Self);
        try
          if not fParam1.FormInit(fibparams, params, ID, 1, FDopParamStr) then
            Exit;
          if fParam1.ShowModal <> mrOK then
            Exit;
        finally
          fParam1.Free;
        end;
      end;
    end;
  finally
    params.Free;
  end;
  SetParams := True;
end;

function TfReports1.frxReport1UserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if MethodName = 'MONEYF2TXT' then
    Result := MoneyF2Txt(Params[0], Params[1])
  else if MethodName = 'MONEY2TXT' then
    Result := Money2Txt(Params[0])
  else if MethodName = 'NUM2TXT' then
    Result := Num2Txt(Params[0], Params[1]);
end;

procedure TfReports1.FormCreate(Sender: TObject);
begin
  inherited;
  frxReport1.AddFunction('function MoneyF2Txt(Num: Currency; Fund: Integer): String', 'Num2Txt', '');
  frxReport1.AddFunction('function Money2Txt(inpar: Currency): String', 'Num2Txt', '');
  frxReport1.AddFunction('function Num2Txt(CNum: String; Mode: Integer): String', 'Num2Txt', '');
  frxDBDataset1 := TfrxDBDataset.Create(Self);
end;

procedure TfReports1.FormDestroy(Sender: TObject);
begin
  frxDBDataset1.Free;
end;

procedure TfReports1.acDesignExecute(Sender: TObject);
begin
  if q1.ParamByName('RepTypeD').Value = 2 then
  	acDesign1Execute(Self)
  else if q1.ParamByName('RepTypeID').Value = 7 then
  	acDesign7Execute(Self)
  else
  begin
    Application.MessageBox(CNoForm, 'Ошибка', MB_ICONERROR+MB_OK);
    Exit;
  end;
end;

end.

