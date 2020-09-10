unit ReportsADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableADO, frxDesgn, frxClass, TB2Item, TBX, Menus, ActnList, DB,
  TB2Dock, TB2Toolbar, Grids, DBGridEh, FilterPart,
  ExtCtrls, ComCtrls, Printers, ReportCADO1,
  OleServer, MSXML2_TLB, StdCtrls, ComObj, ActiveX, frxExportXLS, Buttons,
  Tabenter, frxBarcode, Mask, DBCtrlsEh, Placemnt,
  DBTables, frxDBSet, DBCtrls, GridsEh, MemDS, ADODB, TBXSwitcher, XPStyleActnCtrls,
  frxADOComponents, frxExportPDF, MSAccess, PropFilerEh, PropStorageEh,
  frxChart, fs_iformsrtti, fs_iinterpreter, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessage, IdMessageClient, IdSMTP, IdCoderMIME,
  frxBDEComponents;

type
  TfReportsADO1 = class(TfTableADO)
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
    qRepTree1: TADOQuery;
    sp1: TADOQuery;
    ADOQuery1: TADOQuery;
    frxPDFExport1: TfrxPDFExport;
    frxADOComponents1: TfrxADOComponents;
    TBXItem5: TTBXItem;
    frxChartObject1: TfrxChartObject;
    fsFormsRTTI1: TfsFormsRTTI;
    q2: TADOQuery;
    IdSMTP1: TIdSMTP;
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
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure acRefresh1Execute(Sender: TObject); override;
    procedure IdSMTP1Connected(Sender: TObject);
    procedure IdSMTP1Disconnected(Sender: TObject);
  private
    Form: TfTableADO;
    frxDBDataset1: TfrxDBDataset;
    FHidden: Shortint;
    FDopParamStr: string;
    function SetParams(ParamStr: String; fibparams: TParameters; ID: Integer): Boolean;
    procedure RTExpand(ParentID: Integer; Node: TTreeNode);
    procedure ExecWebReport(Sender: TObject);
    procedure ExecFastReport1(Sender: TObject);
    procedure ExecFastReport7(AReportID: integer; ADopParamStr: string; IsEmail: Boolean);
    procedure CreateReportC(var fReportC: TfReportCADO1; RepTypeID: Integer);
    procedure ExecWordReport(Sender: TObject);
    procedure ExecPivotReport(Sender: TObject);
    procedure ExecExcelReport(Sender: TObject);
    procedure ExecTextReport(Sender: TObject);
    procedure ExecTextImport(Sender: TObject);
    procedure ExecImpDocLines(Sender: TObject);
    procedure ExecExcelExport(AReportID: integer; ADopParamStr: string; IsEmail: Boolean);
    procedure ExecExcelImport(Sender: TObject);
    procedure SetDopParams(ADopParamStr: string; prm: TParameters);
    procedure acShowDesc1Execute(Sender: TObject);
    procedure acExcel1Execute(Sender: TObject);
    procedure ExecEmitentLink(Sender: TObject);
    procedure ExecExcelReportMS(AReportID: integer; ADopParamStr: string);
    procedure ExecSQLQuery(AReportID: integer; ADopParamStr: string);
    procedure acCopy1Execute(Sender: TObject);
    procedure acFilter2Execute(Sender: TObject);
    procedure acFilter2Update(Sender: TObject);
    procedure MSQueryAfterRefresh(DataSet: TDataSet);
    function CallMethod(Instance: TObject; ClassType: TClass;
      const MethodName: String; var Params: Variant): Variant;
    procedure SetDopParamsMS(ADopParamStr: string; prm: TParams);
    { Private declarations }
  public
    procedure UpdateQ2(AReportID: integer);
    procedure FormInit(AParentID: Integer; AHidden: Shortint;
      ADopParamStr: string);
    procedure ExecReportEmail(AReportID: integer; ADopParamStr: string);
    procedure ExecuteReport(Sender: TObject; AReportID: Integer; ADopParamStr: string; IsEmail: Boolean);
    { Public declarations }
  end;

	TRTRec = class
		RepTreeID: Integer;
		ParentID: Integer;
	public
		constructor Create(ARepTreeID, AParentID: Integer); virtual;
	end;

  TPersistentCracker = class(TPersistent);

var
  fReportsADO1: TfReportsADO1;

const
  CNoForm = 'Нет формы для данной операции';

implementation

uses DM, RepTypeADO, ParamADO1, ReportCADO3, ShellApi, StrUtils, ExcelXP, Math, Number2Txt,
  getNode, ReportCADO7, frxVariables, ReportCADO4, Table, Rating, DBAccess, Clipbrd,
  fs_ievents, TypInfo, ToolCtrlsEh;

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

procedure TfReportsADO1.CreateReportC(var fReportC: TfReportCADO1; RepTypeID: Integer);
begin
  if RepTypeID = 1 then
  	fReportC := TfReportCADO1.Create(Self)
  else if RepTypeID = 2 then
  	fReportC := TfReportCADO1.Create(Self)
  else if RepTypeID = 3 then
  	fReportC := TfReportCADO3.Create(Self)
  else if RepTypeID = 4 then
  	fReportC := TfReportCADO4.Create(Self)
//  else if RepTypeID = 5 then
//  	fReportC := TfReportC4.Create(Self)
//  else if RepTypeID = 6 then
//  	fReportC := TfReportC4.Create(Self)
  else if RepTypeID = 7 then
  	fReportC := TfReportCADO7.Create(Self)
  else if RepTypeID = 8 then
  	fReportC := TfReportCADO4.Create(Self)
//  else if RepTypeID = 9 then
//  	fReportC := TfReportC4.Create(Self)
  else if RepTypeID = 10 then
  	fReportC := TfReportCADO4.Create(Self)
//  else if RepTypeID = 11 then
//  	fReportC := TfReportC4.Create(Self)
  else if RepTypeID = 12 then
  	fReportC := TfReportCADO3.Create(Self)
  else if RepTypeID = 13 then
  	fReportC := TfReportCADO3.Create(Self)
  else if RepTypeID = 14 then
  	fReportC := TfReportCADO3.Create(Self)
  else
  begin
    Application.MessageBox(CNoForm, 'Ошибка', MB_ICONERROR+MB_OK);
    Exit;
  end;
end;

procedure TfReportsADO1.FormInit(AParentID: Integer; AHidden: Shortint; ADopParamStr: string);
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

procedure TfReportsADO1.ExecWebReport(Sender: TObject);
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

procedure TfReportsADO1.ExecFastReport1(Sender: TObject);
var
	I, P: Integer;
  o: TPrinterOrientation;
  ms: TMemoryStream;
begin
  UpdateQ2(q1.FieldByName('ReportID').Value);
  sp1.SQL.Text := q2.FieldByName('Params').AsString;
  if sp1.Parameters.Count > 0 then
  begin
    if not SetParams(q2.FieldByName('Params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
  end;
  if FDopParamStr <> '' then
  begin
    P := Pos('=', FDopParamStr);
    if sp1.SQL.Text <> '' then sp1.SQL.Text := sp1.SQL.Text+' ' else sp1.SQL.Text := ':p160932 ';
    sp1.SQL.Text := sp1.SQL.Text+':'+LeftStr(FDopParamStr, P-1);
    if sp1.Parameters.Count > 0 then
      sp1.Parameters.ParamByName(LeftStr(FDopParamStr, P-1)).Value := MidStr(FDopParamStr, P+1, Length(FDopParamStr)-P);
  end;
  frxReport1.Clear;
  ms := TMemoryStream.Create;
  try
    TBlobField(q2.FieldByName('RepData1')).SaveToStream(ms);
    ms.Position := 0;
    frxReport1.LoadFromStream(ms);
  finally
    ms.Free;
  end;
  for I := 0 to sp1.Parameters.Count - 1 do
  begin
    P := frxReport1.Variables.IndexOf('_'+sp1.Parameters[I].Name);
    if P = -1 then
      with frxReport1.Variables.Add do
      begin
        Name := '_'+sp1.Parameters[I].Name;
        Value := sp1.Parameters[I].Value;
      end
    else
      frxReport1.Variables.Items[P].Value := sp1.Parameters[I].Value;
  end;
(*
  for I := 0 to frxReport1.DataSets.Count - 1 do
  begin
    if frxReport1.DataSets.Items[I].DataSet is TfrxADOQuery then
    begin
      q := frxReport1.DataSets.Items[I].DataSet as TfrxADOQuery;
      for J := 0 to q.Params.Count - 1 do
      begin
        fibparam := sp1.Parameters.FindParam(q.Params[J].Name);
        if fibparam <> nil then
          q.Params[J].Value{Expression} := fibparam.Value;
      end;
    end
    else if frxReport1.DataSets.Items[I].DataSet is TfrxBDEQuery then
    begin
      qb := frxReport1.DataSets.Items[I].DataSet as TfrxBDEQuery;
      for J := 0 to qb.Params.Count - 1 do
      begin
        fibparam := sp1.Parameters.FindParam(qb.Params[J].Name);
        if fibparam <> nil then
          qb.Params[J].Value{Expression} := fibparam.Value;
      end;
    end
  end;
 *)
  if q2.FieldByName('Orientation').AsInteger = 0 then
    o := poLandscape
  else
    o := poPortrait;
  for I := 0 to frxReport1.PagesCount -1 do
    if frxReport1.Pages[I] is TfrxReportPage then
      (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
  frxReport1.ShowReport();
end;

procedure TfReportsADO1.acDesign1Execute(Sender: TObject);
var
  I, P: Integer;
  o: TPrinterOrientation;
  ms: TMemoryStream;
begin
  frxReport1.Clear;
  UpdateQ2(q1.FieldByName('ReportID').Value);
  if q2.FieldByName('RepData1').AsString <> '' then
  begin
    ms := TMemoryStream.Create;
    try
      TBlobField(q2.FieldByName('RepData1')).SaveToStream(ms);
      ms.Position := 0;
      frxReport1.LoadFromStream(ms);
    finally
      ms.Free;
    end
  end;
  sp1.SQL.Text := q2.FieldByName('Params').AsString;
  if FDopParamStr <> '' then
  begin
    P := Pos('=', FDopParamStr);
    if sp1.SQL.Text <> '' then sp1.SQL.Text := sp1.SQL.Text+' ' else sp1.SQL.Text := ':p160932 ';
    sp1.SQL.Text := sp1.SQL.Text+':'+LeftStr(FDopParamStr, P-1);
    if sp1.Parameters.Count > 0 then
      sp1.Parameters.ParamByName(LeftStr(FDopParamStr, P-1)).Value := MidStr(FDopParamStr, P+1, Length(FDopParamStr)-P);
  end;
  for I := 0 to sp1.Parameters.Count - 1 do
  begin
    if frxReport1.Variables.IndexOf('_'+sp1.Parameters[I].Name) = -1 then
      with frxReport1.Variables.Add do
      begin
        Name := '_'+sp1.Parameters[I].Name;
        Value := sp1.Parameters[I].Value;
      end
  end;
  if q2.FieldByName('Orientation').Value = 0 then
    o := poLandscape
  else
    o := poPortrait;
  for I := 0 to frxReport1.PagesCount -1 do
    if frxReport1.Pages[I] is TfrxReportPage then
      (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
  frxReport1.DesignReport;
  if frxReport1.Modified and (Application.MessageBox('Сохранить отчет ?', 'Отчет', MB_YESNO or MB_ICONQUESTION) = IDYES) then
  begin
    ms := TMemoryStream.Create;
    try
      frxReport1.SaveToStream(ms);
      q2.Edit;
      TBlobField(q2.FieldByName('RepData1')).LoadFromStream(ms);
      q2.Post;
    finally
      ms.Free;
    end
  end;
end;

procedure TfReportsADO1.ExecFastReport7(AReportID: Integer; ADopParamStr: string; IsEmail: Boolean);
var
  o: TPrinterOrientation;
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, P: Integer;
  qms, qp: TMSQuery;
  frxDBDS1: TfrxDBDataset;
  fibparam: TParameter;
  ms: TMemoryStream;
  SqlText: String;
  field: TField;
  ef: TfrxCustomExportFilter;
  AMsg: TIdMessage;
  AAttach: TIdAttachment;
  param: TParameter;
begin
  frxReport1.Clear;
  UpdateQ2(AReportID);
  sp1.SQL.Text := q2.FieldByName('Params').AsString;
  if not IsEmail and (sp1.Parameters.Count > 0) then
  begin
    if not SetParams(q2.FieldByName('PARAMS').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
  end;
  SetDopParams(ADopParamStr, sp1.Parameters);
  {
  if FDopParamStr <> '' then
  begin
    P := Pos('=', FDopParamStr);
    if sp1.SQL.Text <> '' then sp1.SQL.Text := sp1.SQL.Text+' ' else sp1.SQL.Text := ':p160932 ';
    sp1.SQL.Text := sp1.SQL.Text+':'+LeftStr(FDopParamStr, P-1);
    if sp1.Parameters.Count > 0 then
      sp1.Parameters.ParamByName(LeftStr(FDopParamStr, P-1)).Value := MidStr(FDopParamStr, P+1, Length(FDopParamStr)-P);
  end;
  }
  DM1.MSConnection1.Close;
  DM1.MSConnection1.ConnectString := DM1.ADOConnection1.ConnectionString;
  DM1.MSConnection1.Open;
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q2.FieldByName('REPDATA').AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQueries');
  if IsEmail and (sp1.Parameters.Count > 0) then
  begin
    SqlText := getNodeText(Node1, 'paramsql', '');
    if SqlText <> '' then
    begin
      qp := TMSQuery.Create(Self);
      qp.Connection := DM1.MSConnection1;
      qp.CommandTimeout := 600;
      qp.SQL.Text := SqlText;
      qp.Open;
      if not qp.Eof then
      begin
        for P := 0 to sp1.Parameters.Count - 1 do
        begin
          field := qp.FindField(sp1.Parameters[P].Name);
          if field <> nil then
            sp1.Parameters[P].Value := field.Value;
        end;
      end;
      qp.Close;
      FreeAndNil(qp);
    end;
  end;
  NodeList1 := Node1.selectNodes('TQuery');

  for I := 0 to NodeList1.length-1 do
  begin
    qms := TMSQuery.Create(Self);
    qms.Connection := DM1.MSConnection1;
    qms.CommandTimeout := 600;
    qms.SQL.Text := getNodeText(NodeList1[I], 'sql', '');

    frxDBDS1 := TfrxDBDataset.Create(Self);
    frxDBDS1.UserName := getNodeText(NodeList1[I], 'name', '');
    frxDBDS1.DataSet := qms;
    frxReport1.DataSets.Add(frxDBDS1);
    frxReport1.EnabledDataSets.Add(frxDBDS1);
    for P := 0 to qms.ParamCount - 1 do
    begin
      fibparam := sp1.Parameters.FindParam(qms.Params[P].Name);
      if fibparam <> nil then
        qms.Params[P].Value := fibparam.Value
      else
        qms.Params[P].Value := Null;
    end;
  end;

  ms := TMemoryStream.Create;
  try
    TBlobField(q2.FieldByName('RepData1')).SaveToStream(ms);
    ms.Position := 0;
    frxReport1.LoadFromStream(ms);
  finally
    ms.Free;
  end;
  if q2.FieldByName('Orientation').AsInteger = 0 then
    o := poLandscape
  else
    o := poPortrait;
  for I := 0 to frxReport1.PagesCount -1 do
    if frxReport1.Pages[I] is TfrxReportPage then
      (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
  for I := 0 to sp1.Parameters.Count - 1 do
  begin
    P := frxReport1.Variables.IndexOf('_'+sp1.Parameters[I].Name);
    if P = -1 then
      with frxReport1.Variables.Add do
      begin
        Name := '_'+sp1.Parameters[I].Name;
        Value := sp1.Parameters[I].Value;
      end
    else
      frxReport1.Variables.Items[P].Value := sp1.Parameters[I].Value;
  end;
  if not IsEmail then
  begin
    frxReport1.PrintOptions.ShowDialog := True;
    frxReport1.ShowReport();
  end
  else
  begin
    ef := TfrxCustomExportFilter(frxPDFExport1);
    ef.ShowDialog := False;
    ef.FileName := 'c:\tmp\report.pdf';
    if FileExists(ef.FileName) then
      DeleteFile(ef.FileName);
    frxReport1.PrepareReport;
    frxReport1.Export(ef);

    AMsg := TIdMessage.Create(Self);
    try
      qp := TMSQuery.Create(Self);
      qp.Connection := DM1.MSConnection1;
      qp.CommandTimeout := 600;
      SqlText := getNodeText(Node1, 'To', '');
      if SqlText <> '' then
      begin
        qp.SQL.Text := SqlText;
        for P := 0 to qp.Params.Count - 1 do
        begin
          param := sp1.Parameters.FindParam(qp.Params[P].Name);
          if param <> nil then
            qp.Params[P].Value := param.Value
          else
            qp.Params[P].Value := Null;
        end;
        qp.Open;
        if not qp.Eof then
          AMsg.Recipients.EMailAddresses := qp.Fields[0].AsString;
        qp.Close;
      end;

      SqlText := getNodeText(Node1, 'Subject', '');
      if SqlText <> '' then
      begin
        qp.SQL.Text := SqlText;
        for P := 0 to qp.Params.Count - 1 do
        begin
          param := sp1.Parameters.FindParam(qp.Params[P].Name);
          if param <> nil then
            qp.Params[P].Value := param.Value
          else
            qp.Params[P].Value := Null;
        end;
        qp.Open;
        if not qp.Eof then
        begin
          with TIdEncoderMIME.Create(Self) do
          begin
            AMsg.ExtraHeaders.Add('Subject: =?windows-1251?B?'+Encode(qp.Fields[0].AsString)+'=?=');
            Free;
          end;
        end;
        qp.Close;
      end;
      FreeAndNil(qp);

      AMsg.From.Address := 'assets_msg@am-uralsib.ru';
      AMsg.From.Name := getNodeText(Node1, 'FromName', 'MiddleOffice');
      AMsg.Priority := mpHigh;
      AMsg.Body.Text := '';
      AMsg.CharSet := 'Windows-1251';
      AMsg.ContentTransferEncoding := '8bit';
      AMsg.ContentType := 'text/html';
      AMsg.Encoding := meMIME;
      AAttach := TIdAttachment.Create(AMsg.MessageParts, ef.FileName);
      try
        AAttach.FileName := 'otchet.pdf';
        if IdSMTP1.Tag = 0 then
          IdSMTP1.Connect();
        IdSMTP1.Send(AMsg);
        IdSMTP1.Disconnect;
      finally
        FreeAndNil(AAttach);
      end;
    finally
      FreeAndNil(AMsg);
    end;

  end;
  for I := 0 to frxReport1.EnabledDataSets.Count-1 do
  begin
    frxDBDS1 := TfrxADOQuery(frxReport1.DataSets[0].DataSet);
    frxReport1.EnabledDataSets.Delete(0);
    qms := TMSQuery(frxDBDS1.DataSet);
    FreeAndNil(qms);
    FreeAndNil(frxDBDS1);
  end;
  DM1.MSConnection1.Close;
end;

procedure TfReportsADO1.acDesign7Execute(Sender: TObject);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, P: Integer;
  o: TPrinterOrientation;
  qds: TADOQuery;
  frxDBDS1: TfrxADOQuery;
  ms: TMemoryStream;
begin
  frxReport1.Clear;
  UpdateQ2(q1.FieldByName('ReportID').Value);
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q2.FieldByName('REPDATA').AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQueries');
  NodeList1 := Node1.selectNodes('TQuery');
  for I := 0 to NodeList1.length-1 do
  begin
    qds := TADOQuery.Create(Self);
    qds.Connection := q1.Connection;
    qds.ParamCheck := True;
    qds.CommandTimeout := 600;
    qds.SQL.Text := getNodeText(NodeList1[I], 'sql', '');
    frxDBDS1 := TfrxADOQuery.Create(Self);
    frxDBDS1.UserName := getNodeText(NodeList1[I], 'name', '');
    frxDBDS1.DataSet := qds;
    frxReport1.DataSets.Add(frxDBDS1);
    frxReport1.EnabledDataSets.Add(frxDBDS1);
  end;
  if q2.FieldByName('RepData1').AsString <> '' then
  begin
    ms := TMemoryStream.Create;
    try
      TBlobField(q2.FieldByName('RepData1')).SaveToStream(ms);
      ms.Position := 0;
      frxReport1.LoadFromStream(ms);
    finally
      ms.Free;
    end
  end;
  sp1.SQL.Text := q2.FieldByName('Params').AsString;
  if FDopParamStr <> '' then
  begin
    P := Pos('=', FDopParamStr);
    if sp1.SQL.Text <> '' then sp1.SQL.Text := sp1.SQL.Text+' ' else sp1.SQL.Text := ':p160932 ';
    sp1.SQL.Text := sp1.SQL.Text+':'+LeftStr(FDopParamStr, P-1);
    if sp1.Parameters.Count > 0 then
      sp1.Parameters.ParamByName(LeftStr(FDopParamStr, P-1)).Value := MidStr(FDopParamStr, P+1, Length(FDopParamStr)-P);
  end;
  for I := 0 to sp1.Parameters.Count - 1 do
  begin
    if frxReport1.Variables.IndexOf('_'+sp1.Parameters[I].Name) = -1 then
      with frxReport1.Variables.Add do
      begin
        Name := '_'+sp1.Parameters[I].Name;
        Value := sp1.Parameters[I].Value;
      end
  end;
  if q2.FieldByName('Orientation').Value = 0 then
    o := poLandscape
  else
    o := poPortrait;
  for I := 0 to frxReport1.PagesCount -1 do
    if frxReport1.Pages[I] is TfrxReportPage then
      (frxReport1.Pages[I] as TfrxReportPage).Orientation := o;
  frxReport1.DesignReport;
  if frxReport1.Modified and (Application.MessageBox('Сохранить отчет ?', 'Отчет', MB_YESNO or MB_ICONQUESTION) = IDYES) then
  begin
    ms := TMemoryStream.Create;
    try
      frxReport1.SaveToStream(ms);
      q2.Edit;
      TBlobField(q2.FieldByName('RepData1')).LoadFromStream(ms);
      q2.Post;
    finally
      ms.Free;
    end
  end;

  for I := 0 to frxReport1.EnabledDataSets.Count-1 do
  begin
    frxDBDS1 := TfrxADOQuery(frxReport1.DataSets[0].DataSet);
    frxReport1.EnabledDataSets.Delete(0);
    qds := TADOQuery(frxDBDS1.DataSet);
    FreeAndNil(qds);
    FreeAndNil(frxDBDS1);
  end;
end;

procedure TfReportsADO1.acExcel1Execute(Sender: TObject);
begin
  ExcelExport(TAvEhGrid(Ptr(TAction(Sender).Tag)));
end;

procedure TfReportsADO1.acCopy1Execute(Sender: TObject);
begin
  if TAvEhGrid(Ptr(TAction(Sender).Tag)).SelectedField <> nil then
    Clipboard.SetTextBuf(PChar(TAvEhGrid(Ptr(TAction(Sender).Tag)).SelectedField.AsString));
end;

procedure TfReportsADO1.acFilter2Execute(Sender: TObject);
var
  g: TAvEhGrid;
begin
  g := TAvEhGrid(Ptr(TAction(Sender).Tag));
  if g.DataSource.DataSet <> nil then
  begin
	  g.DataSource.DataSet.Filtered := False;
	  g.DataSource.DataSet.Filter := '';
  end
end;

procedure TfReportsADO1.acFilter2Update(Sender: TObject);
var
  g: TAvEhGrid;
begin
  g := TAvEhGrid(Ptr(TAction(Sender).Tag));
  if g.DataSource.DataSet <> nil then
  begin
    TAction(Sender).Enabled := g.DataSource.DataSet.Filtered;
  	TAction(Sender).Checked := g.DataSource.DataSet.Filtered;
  end
end;

procedure TfReportsADO1.acShowDesc1Execute(Sender: TObject);
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

procedure TfReportsADO1.ExecExcelReport(Sender: TObject);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1, NodeList2: IXMLDOMNodeList;
  I, J: Integer;
  tbxExcel1, tbxDesc, tbxItem: TTBXItem;
  c: TColumnEh;
  sColor, vt: String;
  //vParser: TSQLParser;
  o: TAvEhGrid;
  p: TParameter;
  pnl: TPanel;
  prnt: TWinControl;
  field: TField;
begin
  try
    UpdateQ2(q1.FieldByName('ReportID').Value);
    IXmlDoc1 := XmlDoc1.DefaultInterface;
    IXmlDoc1.loadXML(q2.FieldByName('RepData').AsString);
    Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
    Form := TfTableADO.Create(Self);
    try
      Form.acEscape1 := nil;
      Form.Caption := q1.FieldByName('NAME').Value;
      Form.miSelect.Visible := False;
      Form.AvEhGrid1.OnDblClick := nil;
      Form.AvEhGrid1.Options := Form.AvEhGrid1.Options-[dgCancelOnExit]-[dgTabs];
      Form.q1.Close;
      //Form.q1.WaitEndMasterInterval := getNodeInt(Node1, 'WaitEndMasterInterval', Form.q1.WaitEndMasterInterval);
      Form.q1.SQL.Text := getNodeText(Node1, 'sql', '');
      //Form.q1.SQLUpdate.Text := getNodeText(Node1, 'updsql', '');
      //Form.q1.SQLRefresh.Text := getNodeText(Node1, 'refsql', '');
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
      end;
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
        Form.q1.CachedUpdates := False;}
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
      if Form.q1.Parameters.Count > 0 then
      begin
        if not SetParams(q2.FieldByName('PARAMS').Value, Form.q1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
      end;
      SetDopParams(FDopParamStr, Form.q1.Parameters);

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
            field := Form.AvEhGrid1.DataSource.DataSet.FieldByName(c.FieldName);
            if field is TBlobField then
            begin
              if (field as TBlobField).BlobType = ftMemo then
              begin
                c.AlwaysShowEditButton := True;
              end
            end
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
            if Height > ClientHeight-200 then
              Height := ClientHeight-200;
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
            o.PopupMenu := TTBXPopupMenu.Create(Form);
            with o.PopupMenu as TTBXPopupMenu do
            begin
              Images := DM1.ImageList1;
              tbxItem := TTBXItem.Create(Form);
              Items.Add(tbxItem);
              tbxItem.Action := TAction.Create(Self);
              with tbxItem.Action as TAction do
              begin
                Caption := 'Выгрузить в Excel';
                ImageIndex := 3;
                Tag := Integer(o);
                OnExecute := acExcel1Execute;
              end;
            end;
            Align := alClient;
            Parent := pnl;
            OptionsEh := [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth];
            OptionsAv := [aegFilter];
            ColumnDefValues.Title.Alignment := taCenter;
            ColumnDefValues.Title.TitleButton := True;
            IndicatorTitle.ShowDropDownSign := True;
            IndicatorTitle.TitleButton := True;
            SortLocal := True;
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
            Options := Options-[dgCancelOnExit]-[dgTabs]+[dgAlwaysShowSelection]+[dgColumnResize];
            DataSource := TDataSource.Create(Self);
            DataSource.DataSet := TADOQuery.Create(Self);
            with DataSource.DataSet as TADOQuery do
            begin
              Connection := DM1.ADOConnection1;
              CommandTimeout := 600;
              CursorType := ctStatic;
              LockType := ltBatchOptimistic;
              SQL.Text := getNodeText(NodeList1[I], 'sql', '');
              DataSource := Form.ds1;
              ParamCheck := False;
              //SQLUpdate.Text := getNodeText(NodeList1[I], 'updsql', '');
              //SQLRefresh.Text := getNodeText(NodeList1[I], 'refsql', '');
              for J := 0 to Form.q1.Parameters.Count-1 do
              begin
                p := Parameters.FindParam(Form.q1.Parameters[J].Name);
                if p <> nil then
                  p.Value := Form.q1.Parameters[J].Value;
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
              end;
              if SQLUpdate.Text <> '' then
              begin
                CachedUpdates := True;
                (o as TAvEhGrid).Options := (o as TAvEhGrid).Options+[dgEditing];
                AllowedOperations := AllowedOperations+[alopUpdateEh];
                //AfterUpdateRecord := qAfterUpdateRecord;
              end
              else
                CachedUpdates := False;}
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
                c.Footer.FieldName := getNodeText(NodeList2[J], 'FooterFieldName', c.FieldName);
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
        Form.FormStyle := FormStyle;
        if FormStyle = fsNormal then
        begin
          Form.WindowState := wsMaximized;
          Form.ShowModal;
        end;
      end;
    finally
      if FormStyle = fsNormal then
        Form.Free;
    end;
  except
		on E: Exception do
		begin
			Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
		end;
  end;
end;

procedure TfReportsADO1.ExecExcelReportMS(AReportID: integer; ADopParamStr: string);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1, NodeList2: IXMLDOMNodeList;
  I, J: Integer;
  tbxExcel1, tbxDesc, tbxItem: TTBXItem;
  c: TColumnEh;
  sColor, vt: String;
  //vParser: TSQLParser;
  o: TAvEhGrid;
  param: TParameter;
  p: TMSParam;
  pnl: TPanel;
  prnt: TWinControl;
  Form: TfTable;
  iq: TMSQuery;
  PI: PPropInfo;
  fsScript1: TfsScript;
begin
  try
    UpdateQ2(AReportID);
    sp1.SQL.Text := q2.FieldByName('Params').AsString;
    if sp1.Parameters.Count > 0 then
    begin
      if not SetParams(q2.FieldByName('params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
    end;
    //SetDopParams(ADopParamStr, sp1.Parameters);

    IXmlDoc1 := XmlDoc1.DefaultInterface;
    IXmlDoc1.loadXML(q2.FieldByName('RepData').AsString);
    Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
    if not DM1.MSConnection1.Connected then
    begin
      DM1.MSConnection1.ConnectString := DM1.ADOConnection1.ConnectionString;
      DM1.MSConnection1.Open;
    end;
    if getNodeText(Node1, 'initsql', '') <> '' then
    begin
      iq := TMSQuery.Create(Self);
      iq.Connection := DM1.MSConnection1;
      iq.CommandTimeout := 600;
      iq.SQL.Text := getNodeText(Node1, 'initsql', '');
      iq.Execute;
      FreeAndNil(iq);
    end;

    Form := TfTable.Create(Self);
    fsScript1 := TfsScript.Create(Self);
    try
      Form.acEscape1 := nil;
      Form.Caption := q2.FieldByName('NAME').Value;

      fsScript1.SyntaxType := 'PascalScript';
      fsScript1.Lines.Text := getNodeText(Node1, 'fs', '');
      Form.miSelect.Visible := False;
      Form.AvEhGrid1.OnDblClick := nil;
      Form.AvEhGrid1.Options := Form.AvEhGrid1.Options-[dgCancelOnExit]-[dgTabs];
      Form.q1.Close;
      Form.q1.SQL.Text := getNodeText(Node1, 'sql', '');
      Form.q1.SQLUpdate.Text := getNodeText(Node1, 'updsql', '');
      Form.q1.SQLRefresh.Text := getNodeText(Node1, 'refsql', '');
      if Form.q1.SQLUpdate.Text <> '' then
      begin
        Form.AvEhGrid1.Options := Form.AvEhGrid1.Options+[dgEditing];
        Form.AvEhGrid1.AllowedOperations := Form.AvEhGrid1.AllowedOperations+[alopUpdateEh];
      end;
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

      for J := 0 to Form.q1.ParamCount - 1 do
      begin
        param := sp1.Parameters.FindParam(Form.q1.Params[J].Name);
        if param <> nil then
          Form.q1.Params[J].Value := param.Value
        else
          Form.q1.Params[J].Clear;
      end;
      SetDopParamsMS(ADopParamStr, Form.q1.Params);

      Form.q1.DisableControls;
      Form.acRefresh1Execute(Self);
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
            c.Field.ReadOnly := False;
            if c.Field is TBlobField then
            begin
              if (c.Field as TBlobField).BlobType = ftMemo then
              begin
                c.AlwaysShowEditButton := True;
                with c.EditButtons.Add do
                begin
                  ShortCut := 32807;
                  Style := ebsEllipsisEh;
                  OnClick := Form.EditMemoClick;
                  //Parent := Form.AvEhGrid1;
                end
              end
            end
          end
          else
            c.ReadOnly := True;
          c.Footer.FieldName := getNodeText(NodeList1[I], 'FooterFieldName', c.FieldName);
          vt := getNodeText(NodeList1[I], 'FooterValueType', '');
          if vt <> '' then
          begin
            PI := GetPropInfo(c.Footer, 'ValueType');
            SetEnumProp(c.Footer, PI, vt);
//            if vt = 'fvtSum' then
//              c.Footer.ValueType := fvtSum
//            else if vt = 'fvtCount' then
//              c.Footer.ValueType := fvtCount;
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
            if Height > ClientHeight-200 then
              Height := ClientHeight-200;
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
            o.Parent := Form;
            o.Name := 'Grid'+IntToStr(I);
            o.PopupMenu := TTBXPopupMenu.Create(Form);
            with o.PopupMenu as TTBXPopupMenu do
            begin
              Images := DM1.ImageList1;
              tbxItem := TTBXItem.Create(Form);
              Items.Add(tbxItem);
              tbxItem.Action := TAction.Create(Self);
              with tbxItem.Action as TAction do
              begin
                Caption := 'Выгрузить в Excel';
                ImageIndex := 3;
                Tag := Integer(o);
                OnExecute := acExcel1Execute;
              end;
              tbxItem := TTBXItem.Create(Form);
              Items.Add(tbxItem);
              tbxItem.Action := TAction.Create(Self);
              with tbxItem.Action as TAction do
              begin
                Caption := 'Копировать';
                Tag := Integer(o);
                OnExecute := acCopy1Execute;
              end;
              (tbxItem.Action as TAction).ShortCut := ShortCut(Word('C'), [ssCtrl]);
              tbxItem := TTBXItem.Create(Form);
              Items.Add(tbxItem);
              tbxItem.Action := TAction.Create(Self);
              with tbxItem.Action as TAction do
              begin
                Caption := 'Снятие фильтра';
                Tag := Integer(o);
                OnExecute := acFilter2Execute;
                OnUpdate := acFilter2Update;
              end;
            end;
            Align := alClient;
            Parent := pnl;
            Options := Options-[dgCancelOnExit]-[dgTabs]+[dgAlwaysShowSelection]+[dgColumnResize];
            OptionsAv := [aegFilter];
            OptionsEh := [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth];
            ColumnDefValues.Title.Alignment := taCenter;
            ColumnDefValues.Title.TitleButton := True;
            IndicatorTitle.ShowDropDownSign := True;
            IndicatorTitle.TitleButton := True;
            SortLocal := True;
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
            DataSource := TDataSource.Create(Self);
            DataSource.DataSet := TMSQuery.Create(Self);
            with DataSource.DataSet as TMSQuery do
            begin
              Connection := DM1.MSConnection1;
              CommandTimeout := 600;
              SQL.Text := getNodeText(NodeList1[I], 'sql', '');
              SQLUpdate.Text := getNodeText(NodeList1[I], 'updsql', '');
              SQLRefresh.Text := getNodeText(NodeList1[I], 'refsql', '');
              Options.StrictUpdate := False;
              Options.DetailDelay := getNodeInt(NodeList1[I], 'delay', 0);
              RefreshOptions := RefreshOptions + [roAfterUpdate];
              MasterSource := Form.ds1;
              if Form.q1.SQLRefresh.Text <> '' then
                AfterRefresh := MSQueryAfterRefresh;
              ParamCheck := False;
              if SQLUpdate.Text <> '' then
              begin
                o.Options := o.Options+[dgEditing];
                o.AllowedOperations := o.AllowedOperations+[alopUpdateEh];
              end;
              for J := 0 to Form.q1.ParamCount-1 do
              begin
                p := Params.FindParam(Form.q1.Params[J].Name);
                if p <> nil then
                  p.Value := Form.q1.Params[J].Value;
              end;
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
                c.Footer.FieldName := getNodeText(NodeList2[J], 'FooterFieldName', c.FieldName);
                vt := getNodeText(NodeList2[J], 'FooterValueType', '');
                if vt <> '' then
                begin
                  PI := GetPropInfo(c.Footer, 'ValueType');
                  SetEnumProp(c.Footer, PI, vt);
//                  if vt = 'fvtSum' then
//                    c.Footer.ValueType := fvtSum
//                  else if vt = 'fvtCount' then
//                    c.Footer.ValueType := fvtCount;
                  c.Footer.DisplayFormat := c.DisplayFormat;
                end;
              end;
              Open;
            end;
          end;
        end;
        if fsScript1.Lines.Text <> '' then
        begin
          fsScript1.Parent := fsGlobalUnit;
          fsGlobalUnit.Clear;
          fsGlobalUnit.AddForm(Form);
          //fsGlobalUnit.AddForm(fReportsADO1);
          with fsGlobalUnit.AddClass(TAvEhGrid, 'TEhGrid') do
          begin
            AddEvent('OnDblClick', TfsNotifyEvent);
          end;
          fsScript1.AddMethod('procedure ExecExcelReportMS(AReportID: integer; ADopParamStr: string)', CallMethod);
          fsScript1.AddMethod('procedure ExecSQLQuery(AReportID: integer; ADopParamStr: string)', CallMethod);
          fsScript1.AddMethod('function MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Word', CallMethod);
          if fsScript1.Compile then
            fsScript1.Execute
          else
            ShowMessage(fsScript1.ErrorMsg);
        end;
        Form.FormStyle := FormStyle;
        if FormStyle = fsNormal then
        begin
          Form.WindowState := wsMaximized;
          Form.ShowModal;
        end;
      end;
    finally
      fsScript1.Free;
      if FormStyle = fsNormal then
        Form.Free;
      //DM1.MSConnection1.Close;
    end;
  except
		on E: Exception do
		begin
			Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
		end;
  end;
end;

function TfReportsADO1.CallMethod(Instance: TObject; ClassType: TClass; const MethodName: String; var Params: Variant): Variant;
begin
  if MethodName = 'EXECEXCELREPORTMS' then
    ExecExcelReportMS(Params[0], Params[1])
  else if MethodName = 'EXECSQLQUERY' then
    ExecSQLQuery(Params[0], Params[1])
  else if MethodName = 'MESSAGEDLG' then
  begin
    //Word(PWordSet(@B)^) := Params[2];
    Result := MessageDlg(Params[0], Params[1], [mbYes, mbNo], Params[3]);
  end;
end;

procedure TfReportsADO1.MSQueryAfterRefresh(DataSet: TDataSet);
begin
  if (DataSet as TMSQuery).MasterSource <> nil then
    ((DataSet as TMSQuery).MasterSource.DataSet as TMSQuery).RefreshRecord;
end;

procedure TfReportsADO1.ExecTextReport(Sender: TObject);
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

procedure TfReportsADO1.ExecTextImport(Sender: TObject);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, lines, errors: Integer;
  OpenDialog: TOpenDialog;
  q, qi: TMSQuery;
  F: TextFile;
  pl, sl: TStringList;
  S: String;
  param: TParameter;
begin
  OpenDialog := TOpenDialog.Create(Self);
  DM1.MSConnection1.Close;
  DM1.MSConnection1.ConnectString := DM1.ADOConnection1.ConnectionString;
  DM1.MSConnection1.Open;
  q := TMSQuery.Create(Self);
  sl := TStringList.Create;
  pl := TStringList.Create;
  pl.Delimiter := ';';
  try
    OpenDialog.DefaultExt := 'csv';
    OpenDialog.Filter := 'Текстовый файл (*.csv)|*.csv';
    if OpenDialog.Execute then
    begin
      UpdateQ2(q1.FieldByName('ReportID').Value);
      IXmlDoc1 := XmlDoc1.DefaultInterface;
      IXmlDoc1.loadXML(q2.FieldByName('REPDATA').AsString);
      Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');
      q.Connection := DM1.MSConnection1;
      q.CommandTimeout := 600;
      q.SQL.Text := getNodeText(Node1, 'sql', '');
      sp1.SQL.Text := q2.FieldByName('Params').AsString;
      if sp1.Parameters.Count > 0 then
      begin
        if not SetParams(q2.FieldByName('params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
      end;
      SetDopParams(FDopParamStr, sp1.Parameters);
      for I := 0 to q.ParamCount - 1 do
      begin
        param := sp1.Parameters.FindParam(q.Params[I].Name);
        if param <> nil then
          q.Params[I].Value := param.Value
        else
          q.Params[I].Clear;
      end;
      DM1.MSConnection1.StartTransaction;
      //SetDopParams(q.Params);
      NodeList1 := Node1.selectNodes('TColumn');
      for I := 0 to NodeList1.length-1 do
      begin
        sl.Add(getNodeText(NodeList1[I], 'value', ''));
      end;
      AssignFile(F, OpenDialog.FileName);
      Reset(F);
      lines := 0;
      errors := 0;
      try
        if getNodeText(Node1, 'initsql', '') <> '' then
        begin
          qi := TMSQuery.Create(Self);
          qi.Connection := DM1.MSConnection1;
          qi.CommandTimeout := 600;
          qi.SQL.Text := getNodeText(Node1, 'initsql', '');
          for I := 0 to qi.ParamCount - 1 do
            begin
            param := sp1.Parameters.FindParam(qi.Params[I].Name);
            if param <> nil then
              qi.Params[I].Value := param.Value
            else
              qi.Params[I].Clear;
          end;
          qi.Execute;
          FreeAndNil(qi);
        end;
        if not Eof(F) then
        begin
          Readln(F, S);
          while not Eof(F) do
          begin
            Readln(F, S);
            SetDelimitedText(pl, S);
            for I := 0 to sl.Count-1 do
            begin
              if I < pl.Count then
                q.Params[StrToInt(sl.Names[I])-1].Value := pl.Strings[StrToInt(sl.ValueFromIndex[i])-1]
              else
                q.Params[StrToInt(sl.Names[I])-1].Clear;
            end;
            try
              q.Execute;
              lines := lines+1;
            except
              on ex: Exception do
              begin
                errors := errors+1;
                DM1.MSConnection1.Rollback;
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
      DM1.MSConnection1.Commit;
      Application.MessageBox(PAnsiChar('Обработано строк - '+IntToStr(Lines)+'. Ошибок - '+IntToStr(Errors)), PAnsiChar(Caption), MB_ICONINFORMATION);
    end
  finally
    sl.Free;
    pl.Free;
    q.Free;
    OpenDialog.Free;
  end
end;

procedure TfReportsADO1.ExecImpDocLines(Sender: TObject);
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

procedure TfReportsADO1.ExecExcelImport(Sender: TObject);
begin

end;

procedure TfReportsADO1.ExecExcelExport(AReportID: integer; ADopParamStr: string; IsEmail: Boolean);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList0, NodeList1, NodeCol1: IXMLDOMNodeList;
	XlsApp: TExcelApplication;
	XlsWs1: TExcelWorksheet;
  Data: OleVariant;
  sl: TStringList;
  q, qh, iq, qp: TADOQuery;
  K, I, J, FirstRow, FirstCol, ColCount, P, nRow, wbTemp, wbData: Integer;
  FileName, ListNameField, SqlText: String;
  param: TParameter;
  field: TField;
  DefaultLCID: LCID;
  AMsg: TIdMessage;
  AAttach: TIdAttachment;
begin
  UpdateQ2(AReportID);
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q2.FieldByName('RepData').AsString);
  sp1.SQL.Text := q2.FieldByName('Params').AsString;

  NodeList0 := IXmlDoc1.documentElement.selectNodes('TQueries');
  if NodeList0 <> nil then
  begin
    if not IsEmail and (sp1.Parameters.Count > 0) then
    begin
      if not SetParams(q2.FieldByName('params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
    end;
    SetDopParams(ADopParamStr, sp1.Parameters);
    Panel1.Caption := 'Выгрузка в Excel...';
    Panel1.Left := (Width - Panel1.Width) div 2;
    Panel1.Top := (Height - Panel1.Height) div 2;
    Panel1.Visible := True;
    Application.ProcessMessages;

    qh := TADOQuery.Create(Self);

    DefaultLCID := GetUserDefaultLCID;
    XlsApp := TExcelApplication.Create(Self);
    XlsWs1 := TExcelWorksheet.Create(Self);
    try
      XlsApp.ConnectKind := ckNewInstance; //ckRunningOrNew;
      XlsApp.Connect;
      XlsApp.AutoQuit := False;
      XlsApp.ScreenUpdating[DefaultLCID] := False;
      XlsApp.DisplayAlerts[DefaultLCID] := False;
      //XlsApp.Calculation[0] := xlManual;
      XlsApp.Visible[DefaultLCID] := False;
      qh.CommandTimeout := 600;
      qh.Connection := DM1.ADOConnection1;
      for K := 0 to NodeList0.length-1 do
      begin
        if IsEmail and (sp1.Parameters.Count > 0) then
        begin
          SqlText := getNodeText(NodeList0[K], 'paramsql', '');
          if SqlText <> '' then
          begin
            qp := TADOQuery.Create(Self);
            qp.Connection := DM1.ADOConnection1;
            qp.CommandTimeout := 600;
            qp.SQL.Text := getNodeText(NodeList0[K], 'paramsql', '');
            qp.Open;
            if not qp.Eof then
            begin
              for P := 0 to sp1.Parameters.Count - 1 do
              begin
                field := qp.FindField(sp1.Parameters[P].Name);
                if field <> nil then
                  sp1.Parameters[P].Value := field.Value
                else
                  sp1.Parameters[P].Value := Null;
              end;
            end;
            qp.Close;
            FreeAndNil(qp);
          end;
        end;
        if getNodeText(NodeList0[K], 'initsql', '') <> '' then
        begin
          iq := TADOQuery.Create(Self);
          iq.Connection := DM1.ADOConnection1;
          iq.CommandTimeout := 600;
          iq.SQL.Text := getNodeText(NodeList0[K], 'initsql', '');
          iq.ExecSQL;
          FreeAndNil(iq);
        end;
        qh.SQL.Text := getNodeText(NodeList0[K], 'sql', 'select ''Лист'' ListName');
        if qh.SQL.Text = '' then Exit;
        for P := 0 to qh.Parameters.Count - 1 do
        begin
          param := sp1.Parameters.FindParam(qh.Parameters[P].Name);
          if param <> nil then
            qh.Parameters[P].Value := param.Value
          else
            qh.Parameters[P].Value := Null;
        end;
        qh.Open;
        if qh.Eof then Exit;

        ListNameField := getNodeText(NodeList0[K], 'ListName', 'ListName');
        FileName := getNodeText(NodeList0[K], 'Template', '');
        if FileName <> '' then
          XlsApp.Workbooks.Add(FileName, DefaultLCID)
        else
          XlsApp.Workbooks.Add(EmptyParam, DefaultLCID);
        wbTemp := XlsApp.Workbooks.Count;

        if getNodeText(NodeList0[K], 'FillToTemplate', 'False') = 'False' then
        begin
          XlsApp.Workbooks.Add(EmptyParam, DefaultLCID);
          wbData := XlsApp.Workbooks.Count;
        end
        else
          wbData := wbTemp;

        while not qh.Eof do
        begin
          Panel1.Caption := 'Выгрузка '+qh.FieldByName(ListNameField).AsString;
          Application.ProcessMessages;
          if wbData <> wbTemp then
            for I := 1 to XlsApp.Workbooks[wbTemp].Worksheets.Count do
              (XlsApp.Workbooks[wbTemp].Worksheets[I] as _Worksheet).Copy(EmptyParam, XlsApp.Workbooks[wbData].Worksheets[XlsApp.Workbooks[wbData].Worksheets.Count], DefaultLCID);
          XlsWs1.ConnectTo(XlsApp.Workbooks[wbData].Worksheets[XlsApp.Workbooks[wbData].Worksheets.Count] as _Worksheet);
          if ListNameField <> '' then
            XlsWs1.Name := qh.FieldByName(ListNameField).AsString;

          NodeList1 := NodeList0[K].selectNodes('TQuery');
          for I := 0 to NodeList1.length-1 do
          begin
            Node1 := NodeList1[I];
            q := TADOQuery.Create(Self);
            q.CommandTimeout := 600;
            sl := TStringList.Create;
            try
              q.Connection := DM1.ADOConnection1;
              q.SQL.Text := getNodeText(Node1, 'sql', '');

              for P := 0 to q.Parameters.Count - 1 do
              begin
                param := sp1.Parameters.FindParam(q.Parameters[P].Name);
                if param <> nil then
                  q.Parameters[P].Value := param.Value
                else
                begin
                  field := qh.FindField(q.Parameters[P].Name);
                  if field <> nil then
                    q.Parameters[P].Value := field.Value
                  else
                    q.Parameters[P].Value := Null;
                end;
              end;
              Screen.Cursor := crSQLWait;
              try
                q.Open;
              finally
                Screen.Cursor := crDefault;
              end;
              if not q.Eof then
              begin
                NodeCol1 := Node1.selectNodes('TColumn');
                for J := 0 to NodeCol1.length-1 do
                begin
                  sl.Add(getNodeText(NodeCol1[J], 'value', ''));
                end;
                FirstRow := getNodeInt(Node1, 'FirstRow', 2);
                FirstCol := getNodeInt(Node1, 'FirstCol', 1);
                ColCount := getNodeInt(Node1, 'ColCount', sl.Count)-1;
                Data := VarArrayCreate([0, ColCount], varVariant);
                while not q.Eof do
                begin
                  for J := 0 to sl.Count-1 do
                  begin
                    if sl.Names[J] = '' then
                    begin
                      //ShowMessage(q.FieldByName(sl.Strings[J]).AsString);
                      Data[J] := q.FieldByName(sl.Strings[J]).AsVariant;
                    end
                    else
                      Data[StrToInt(sl.Values[sl.Names[J]])-1] := q.FieldByName(sl.Names[J]).AsVariant;
                  end;
                  XlsWs1.Range[XlsWs1.Cells.Item[FirstRow,FirstCol], XlsWs1.Cells.Item[FirstRow,FirstCol+ColCount]].FormulaR1C1 := Data;
                  FirstRow := FirstRow+1;
                  q.Next;
                end;
                q.Close;
              end;
            except
      		    on E: Exception do
        		  begin
        			  Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
        		  end;
            end;
            q.Free;
            sl.Free;
          end;
          qh.Next;
        end;
        (XlsApp.Workbooks[wbData].Worksheets[1] as _Worksheet).Delete(0);
        if wbTemp <> wbData then
          XlsApp.Workbooks[wbTemp].Close(False, EmptyParam, EmptyParam, DefaultLCID);
        if IsEmail then
        begin
          if FileExists('c:\tmp\email.xls') then
            DeleteFile('c:\tmp\email.xls');
          XlsApp.Workbooks[wbTemp]._SaveAs('c:\tmp\email.xls', xlNormal, EmptyParam, EmptyParam, EmptyParam, EmptyParam, xlExclusive, EmptyParam, EmptyParam, EmptyParam, EmptyParam, DefaultLCID);
          XlsApp.Workbooks[wbTemp].Close(False, EmptyParam, EmptyParam, DefaultLCID);

          AMsg := TIdMessage.Create(Self);
          try
            AMsg.Recipients.EMailAddresses := getNodeText(NodeList0[K], 'To', 'GrishinAV@am-uralsib.ru');
            AMsg.From.Address := 'assets_msg@am-uralsib.ru';
            AMsg.From.Name := getNodeText(NodeList0[K], 'FromName', 'MiddleOffice');
            AMsg.Priority := mpHigh;
            SqlText := getNodeText(NodeList0[K], 'Subject', '');
            if SqlText <> '' then
            begin
              qp := TADOQuery.Create(Self);
              qp.Connection := DM1.ADOConnection1;
              qp.CommandTimeout := 600;
              qp.SQL.Text := SqlText;
              for P := 0 to qp.Parameters.Count - 1 do
              begin
                param := sp1.Parameters.FindParam(qp.Parameters[P].Name);
                if param <> nil then
                  qp.Parameters[P].Value := param.Value
                else
                  qp.Parameters[P].Value := Null;
              end;
              qp.Open;
              if not qp.Eof then
              begin
                with TIdEncoderMIME.Create(Self) do
                begin
                  AMsg.ExtraHeaders.Add('Subject: =?windows-1251?B?'+Encode(qp.Fields[0].AsString)+'=?=');
                  Free;
                end;
              end;
              qp.Close;
              FreeAndNil(qp);
            end;

            AMsg.Body.Text := '';
            AMsg.CharSet := 'Windows-1251';
            AMsg.ContentTransferEncoding := '8bit';
            AMsg.ContentType := 'text/html';
            AMsg.Encoding := meMIME;
            AAttach := TIdAttachment.Create(AMsg.MessageParts, 'c:\tmp\email.xls');
            try
              AAttach.FileName := 'otchet.xls';
              if IdSMTP1.Tag = 0 then
                IdSMTP1.Connect();
              IdSMTP1.Send(AMsg);
              IdSMTP1.Disconnect;
            finally
              FreeAndNil(AAttach);
            end;
          finally
            FreeAndNil(AMsg);
          end;
          SqlText := getNodeText(NodeList0[K], 'SaveTo', '');
          if SqlText <> '' then
          begin
            qp := TADOQuery.Create(Self);
            qp.Connection := DM1.ADOConnection1;
            qp.CommandTimeout := 600;
            qp.SQL.Text := SqlText;
            for P := 0 to qp.Parameters.Count - 1 do
            begin
              param := sp1.Parameters.FindParam(qp.Parameters[P].Name);
              if param <> nil then
                qp.Parameters[P].Value := param.Value
              else
                qp.Parameters[P].Value := Null;
            end;
            qp.Open;
            if not qp.Eof then
            begin
              if FileExists(qp.Fields[0].AsString) then
                DeleteFile(qp.Fields[0].AsString);
              CopyFile('c:\tmp\email.xls', PAnsiChar(qp.Fields[0].AsString), false);
            end;
            qp.Close;
            FreeAndNil(qp);
          end;
        end;
      end;
      if not IsEmail then
      begin
        XlsApp.ScreenUpdating[DefaultLCID] := True;
        XlsApp.Calculation[DefaultLCID] := xlAutomatic;
        XlsApp.Visible[DefaultLCID] := True;
      end;
    finally
	    XlsApp.Free;
	    XlsWs1.Free;
      qh.Free;
      Panel1.Visible := False;
    end;
  end;
end;

procedure TfReportsADO1.ExecSQLQuery(AReportID: integer; ADopParamStr: string);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I, P: Integer;
  q: TADOQuery;
  param: TParameter;
  dt: TDateTime;
begin
  UpdateQ2(AReportID);
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q2.FieldByName('RepData').AsString);
  sp1.SQL.Text := q2.FieldByName('Params').AsString;
  if sp1.Parameters.Count > 0 then
  begin
    if not SetParams(q2.FieldByName('params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
  end;
  SetDopParams(ADopParamStr, sp1.Parameters);
  //SetDopParamsMS(ADopParamStr, sp1.Parameters);
  NodeList1 := IXmlDoc1.documentElement.selectNodes('TQuery');
  q := TADOQuery.Create(Self);
  q.CommandTimeout := 600;
  q.Connection := DM1.ADOConnection1;
  Screen.Cursor := crSQLWait;
  try
    dt := Now;
    for I := 0 to NodeList1.length-1 do
    begin
      Node1 := NodeList1[I];
      q.SQL.Text := getNodeText(Node1, 'sql', '');

      for P := 0 to q.Parameters.Count - 1 do
      begin
        param := sp1.Parameters.FindParam(q.Parameters[P].Name);
        if param <> nil then
          q.Parameters[P].Value := param.Value
        else
          q.Parameters[P].Value := Null;
      end;
      SetDopParams(ADopParamStr, q.Parameters);
      q.ExecSQL;
    end;
    Screen.Cursor := crDefault;
    Application.MessageBox(PAnsiChar('Операция выполнена за '+TimeToStr(Now-dt)+'.'), 'Инфо', MB_ICONINFORMATION+MB_OK);
  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
    end;
  end;
  q.Free;
end;

procedure TfReportsADO1.SetDopParams(ADopParamStr: string; prm: TParameters);
var
  dp: TStringList;
  P: Integer;
begin
  if ADopParamStr <> '' then
  begin
    dp := TStringList.Create;
    dp.Delimiter := ';';
    try
      dp.DelimitedText := ADopParamStr;
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

procedure TfReportsADO1.SetDopParamsMS(ADopParamStr: string; prm: TParams);
var
  dp: TStringList;
  P: Integer;
begin
  if ADopParamStr <> '' then
  begin
    dp := TStringList.Create;
    try
      dp.Text := ADopParamStr;
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

procedure TfReportsADO1.ExecPivotReport(Sender: TObject);
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

procedure TfReportsADO1.ExecEmitentLink(Sender: TObject);
var
	IXmlDoc1: IXMLDOMDocument2;
  nl1, nl2: IXMLDOMNodeList;
  I, J, P: Integer;
  param: TParameter;
  c: TColumnEh;
  sColor, vt: String;
  grid: TAvEhGrid;
  q: TMSQuery;
  sTabSheet: String;
begin
  UpdateQ2(q1.FieldByName('ReportID').Value);
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q2.FieldByName('REPDATA').AsString);
  nl1 := IXmlDoc1.documentElement.selectSingleNode('TQueries').selectNodes('TQuery');

  sp1.SQL.Text := q2.FieldByName('Params').AsString;
  if sp1.Parameters.Count > 0 then
  begin
    if not SetParams(q2.FieldByName('params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
  end;
  SetDopParams(FDopParamStr, sp1.Parameters);

  DM1.MSConnection1.Close;
  DM1.MSConnection1.ConnectString := DM1.ADOConnection1.ConnectionString;
  DM1.MSConnection1.Open;
  with TfRating.Create(Self) do
  begin
    try
      for I := 0 to nl1.length-1 do
      begin
        q := TMSQuery(FindComponent(getNodeText(nl1[I], 'name', '')));
        q.CommandTimeout := 600;
        q.SQL.Text := getNodeText(nl1[I], 'sql', '');
        q.SQLUpdate.Text := getNodeText(nl1[I], 'updsql', '');
        q.SQLRefresh.Text := getNodeText(nl1[I], 'refsql', '');
        for P := 0 to q.ParamCount - 1 do
        begin
          param := sp1.Parameters.FindParam(q.Params[P].Name);
          if param <> nil then
            q.Params[P].Value := param.Value
          else
            q.Params[P].Clear;
        end;
        q.Open;
        sTabSheet := getNodeText(nl1[I], 'Sheet', '');
        if sTabSheet <> '' then
          TTabSheet(FindComponent(sTabSheet)).Caption := getNodeText(nl1[I], 'SheetName', TTabSheet(FindComponent(sTabSheet)).Caption);
        grid := TAvEhGrid(FindComponent(getNodeText(nl1[I], 'grid', '')));
        grid.Columns.Clear;
        nl2 := nl1[I].selectNodes('TColumn');
        for J := 0 to nl2.length-1 do
        begin
          c := grid.Columns.Add;
          c.FieldName := getNodeText(nl2[J], 'name', '');
          c.Title.Caption := getNodeText(nl2[J], 'display', c.Title.Caption);
          c.Width := getNodeInt(nl2[J], 'DisplayWidth', c.Width)*8;
          c.DisplayFormat := getNodeText(nl2[J], 'DisplayFormat', '');
          c.KeyList.Text := getNodeText(nl2[J], 'KeyList', '');
          c.PickList.Text := getNodeText(nl2[J], 'PickList', '');
          sColor := getNodeText(nl2[J], 'Color', '');
          if sColor <> '' then c.Color := StringToColor(sColor);
          if UpperCase(getNodeText(nl2[J], 'ReadOnly', '')) = 'FALSE' then
          begin
            c.ReadOnly := False;
            c.Color := cl3DLight;
          end
          else
            c.ReadOnly := True;
          c.Footer.FieldName := getNodeText(nl2[J], 'FooterFieldName', c.FieldName);
          vt := getNodeText(nl2[J], 'FooterValueType', '');
          if vt <> '' then
          begin
            if vt = 'fvtSum' then
              c.Footer.ValueType := fvtSum
            else if vt = 'fvtCount' then
              c.Footer.ValueType := fvtCount;
            c.Footer.DisplayFormat := c.DisplayFormat;
          end;
        end;
      end;
      ShowModal;
    finally
      Free;
    end;
  end;
  DM1.MSConnection1.Close;
end;

procedure TfReportsADO1.ExecWordReport(Sender: TObject);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  F: TextFile;
  I: Integer;
  FileName: String;
  s: TStringList;
begin
  UpdateQ2(q1.FieldByName('ReportID').Value);
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  IXmlDoc1.loadXML(q2.FieldByName('REPDATA').AsString);
  Node1 := IXmlDoc1.documentElement.selectSingleNode('TQuery');

  sp1.Close;
  sp1.SQL.Text := getNodeText(Node1, 'sql', '');
  if sp1.Parameters.Count > 0 then
  begin
    if not SetParams(q2.FieldByName('Params').AsString, sp1.Parameters, q2.FieldByName('ReportID').Value) then Exit;
  end;
  SetDopParams(FDopParamStr, sp1.Parameters);
  s := TStringList.Create;
  Screen.Cursor := crSQLWait;
  try
    sp1.Open;
    if sp1.Eof then
    begin
      Screen.Cursor := crDefault;
      Application.MessageBox('Не найдены данные для отчета', PAnsiChar(Application.Title), MB_ICONERROR);
    end
    else
    begin
      I := LastDelimiter('\', q2.FieldByName('Path').AsString);
      FileName := 'c:\temp\'+Copy(q2.FieldByName('Path').AsString, I+1, Length(q2.FieldByName('Path').AsString)-I-3)+'txt';
      AssignFile(F, FileName);
      try
        Rewrite(F);
        NodeList1 := Node1.selectNodes('TField');

        for I := 0 to NodeList1.length-1 do
        begin
          if I <> 0 then Write(f, Chr(9));
          Write(f, getNodeText(NodeList1[I], 'display', ''));
          s.Add(getNodeText(NodeList1[I], 'name', ''));
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
      ShellExecute(Handle, 'open', PChar(q2.FieldByName('Path').AsString), nil, nil, SW_SHOWNORMAL);
    end;
    sp1.Close;
  except
  end;
  Screen.Cursor := crDefault;
end;

procedure TfReportsADO1.acExec1Execute(Sender: TObject);
begin
  ExecuteReport(Sender, q1.FieldByName('ReportID').Value, '', false);
end;

procedure TfReportsADO1.ExecuteReport(Sender: TObject; AReportID: Integer; ADopParamStr: string; IsEmail: Boolean);
begin
  UpdateQ2(AReportID);
  if q2.FieldByName('RepTypeID').Value = 1 then
    ExecWebReport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 2 then
    ExecFastReport1(Sender)
  else if q2.FieldByName('RepTypeID').Value = 3 then
    ExecExcelReport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 4 then
    ExecWordReport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 5 then
    ExecPivotReport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 6 then
    ExecTextReport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 7 then
    ExecFastReport7(AReportID, ADopParamStr, IsEmail)
  else if q2.FieldByName('RepTypeID').Value = 8 then
    ExecTextImport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 9 then
    ExecImpDocLines(Sender)
  else if q2.FieldByName('RepTypeID').Value = 10 then
    ExecExcelExport(AReportID, ADopParamStr, IsEmail)
  else if q2.FieldByName('RepTypeID').Value = 11 then
    ExecExcelImport(Sender)
  else if q2.FieldByName('RepTypeID').Value = 12 then
    ExecEmitentLink(Sender)
  else if q2.FieldByName('RepTypeID').Value = 13 then
    ExecExcelReportMS(q1.FieldByName('ReportID').Value, '')
  else if q2.FieldByName('RepTypeID').Value = 14 then
    ExecSQLQuery(q1.FieldByName('ReportID').Value, '')
end;

procedure TfReportsADO1.acInsert1Execute(Sender: TObject);
var
	fReportC1: TfReportCADO1;
  fRepType1: TfRepTypeADO1;
  FRepType: Integer;
begin
  fRepType1 := TfRepTypeADO1.Create(Self);
  try
    FRepType := 0;
    if q1.FieldByName('RepTypeID').Value <> Null then
      fRepType1.qRepTypeADO1.Locate('RepTypeID', q1.FieldByName('RepTypeID').Value, []);
    if fRepType1.ShowModal = IDOK then
    begin
      FRepType := fRepType1.qRepTypeADO1.FieldByName('RepTypeID').Value;
    end
  finally
    fRepType1.Free;
  end;
  if FRepType > 0 then
  begin
    CreateReportC(fReportC1, FRepType);
    if fReportC1 = nil then Exit;
	  try
		  fReportC1.q1.Parameters.ParamByName('ReportID').Value := 0;
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


procedure TfReportsADO1.acChange1Execute(Sender: TObject);
var
	fReportC1: TfReportCADO1;
begin
  CreateReportC(fReportC1, q1.FieldByName('RepTypeID').Value);
	try
		fReportC1.q1.Parameters.ParamByName('ReportID').Value := q1.FieldByName('ReportID').Value;
   	fReportC1.q1.Open;
    fReportC1.q1.Edit;
  	if fReportC1.ShowModal = IDOK then
    begin
			q1.Close;
      q1.Open;
			q1.Locate('ReportID', fReportC1.q1.FieldByName('ReportID').Value, []);
      q2.Close;
		end;
  finally
		fReportC1.Free;
  end;
end;

procedure TfReportsADO1.RTExpand(ParentID: Integer; Node: TTreeNode);
var
	CNode: TTreeNode;
	RTRec: TRTRec;
begin
	qRepTree1.Parameters.ParamByName('ParentID').Value := ParentID;
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

procedure TfReportsADO1.acInsert2Execute(Sender: TObject);
{var
	NewString: string;
	RTRec: TRTRec;
	CNode: TTreeNode;
	CNode1: TTreeNode;}
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
  end;
  }
end;

procedure TfReportsADO1.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
	RTExpand(TRTRec(Node.Data).RepTreeID, Node);
end;

procedure TfReportsADO1.TreeView1Deletion(Sender: TObject; Node: TTreeNode);
begin
	if Node.Data <> nil then
		TRTRec(Node.Data).Free;
end;

procedure TfReportsADO1.acChange2Execute(Sender: TObject);
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

procedure TfReportsADO1.acChange2Update(Sender: TObject);
begin
	acChange2.Enabled := False;
	if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
		if TRTRec(TreeView1.Selected.Data).RepTreeID <> 0 then
			acChange2.Enabled := True;
end;

procedure TfReportsADO1.acDelete2Update(Sender: TObject);
begin
	acDelete2.Enabled := False;
	if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
		if TRTRec(TreeView1.Selected.Data).RepTreeID <> 0 then
			acDelete2.Enabled := True;
end;

procedure TfReportsADO1.acDelete2Execute(Sender: TObject);
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

procedure TfReportsADO1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
  begin
    q1.Parameters.ParamByName('RepTreeID').Value := TRTRec(TreeView1.Selected.Data).RepTreeID;
    q1.Parameters.ParamByName('hidden').Value := FHidden;
    q1.Close;
    q1.Open;
  end;
end;

procedure TfReportsADO1.acHidden1Execute(Sender: TObject);
begin
  if FHidden = 0 then
    FHidden := 1
  Else
    FHidden := 0;
  q1.Parameters.ParamByName('Hidden').Value := FHidden;
  q1.Close;
  q1.Open;
end;

procedure TfReportsADO1.acHidden1Update(Sender: TObject);
begin
  if FHidden = 1 then
    acHidden1.Checked := True
  else
    acHidden1.Checked := False;
end;

procedure TfReportsADO1.acInsert3Execute(Sender: TObject);
var
	fReportC1: TfReportCADO1;
begin
  CreateReportC(fReportC1, q1.FieldByName('RepTypeID').AsInteger);
  if fReportC1 = nil then Exit;
	try
		fReportC1.q1.Parameters.ParamByName('ReportID').Value := 0;
   	fReportC1.q1.Open;
  	fReportC1.q1.Append;
    UpdateQ2(q1.FieldByName('ReportID').Value);
    fReportC1.q1.FieldByName('hidden').Value := q2.FieldByName('Hidden').Value;
    fReportC1.q1.FieldByName('Name').Value := q2.FieldByName('Name').Value;
    fReportC1.q1.FieldByName('Path').Value := q2.FieldByName('Path').Value;
    fReportC1.q1.FieldByName('Params').Value := q2.FieldByName('Params').Value;
    fReportC1.q1.FieldByName('RepTypeID').Value := q2.FieldByName('RepTypeID').Value;
    fReportC1.q1.FieldByName('RepTreeID').Value := q2.FieldByName('RepTreeID').Value;
    fReportC1.q1.FieldByName('Orientation').Value := q2.FieldByName('Orientation').Value;
    fReportC1.q1.FieldByName('RepData').Value := q2.FieldByName('RepData').Value;
    fReportC1.q1.FieldByName('RepData1').Value := q2.FieldByName('RepData1').Value;
    fReportC1.q1.FieldByName('RepDesc').Value := q2.FieldByName('RepDesc').Value;
		if fReportC1.ShowModal = IDOK then
		begin
      q2.Close;
			q1.Close;
      q1.Open;
			q1.Locate('ReportID', fReportC1.q1.FieldByName('ReportID').Value, []);
		end;
  finally
		fReportC1.Free;
  end;
end;

procedure TfReportsADO1.acDesignUpdate(Sender: TObject);
begin
  inherited;
	if not q1.IsEmpty and ((q1.FieldByName('RepTypeID').Value = 2) or (q1.FieldByName('RepTypeID').Value = 7)) then
		acDesign.Enabled := True
	else
		acDesign.Enabled := False;
  acDesign.Visible := acDesign.Enabled;
end;

procedure TfReportsADO1.acDelete1Execute(Sender: TObject);
begin
	if Application.MessageBox(PChar('Удалить запись?'),PChar(Caption),MB_ICONQUESTION+MB_OKCANCEL) <> IDOK then
		Abort;
  q1.Delete;
end;

procedure TfReportsADO1.acDelete1Update(Sender: TObject);
begin
  inherited;
	if not q1.IsEmpty then
		acDelete1.Enabled := True
	else
		acDelete1.Enabled := False;
end;

procedure TfReportsADO1.acInsert3Update(Sender: TObject);
begin
	if not q1.IsEmpty then
		acInsert3.Enabled := True
	else
		acInsert3.Enabled := False;
end;

procedure TfReportsADO1.acChange1Update(Sender: TObject);
begin
	if not q1.IsEmpty then
		acChange1.Enabled := True
	else
		acChange1.Enabled := False;
end;

function TfReportsADO1.SetParams(ParamStr: String; fibparams: TParameters; ID: Integer): boolean;
var
  params: TStringList;
  fParam1: TfParamADO1;
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
        fParam1 := TfParamADO1.Create(Self);
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

function TfReportsADO1.frxReport1UserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if MethodName = 'MONEYF2TXT' then
    Result := MoneyF2Txt(Params[0], Params[1])
  else if MethodName = 'MONEY2TXT' then
    Result := Money2Txt(Params[0])
  else if MethodName = 'NUM2TXT' then
    Result := Num2Txt(Params[0], Params[1]);
end;

procedure TfReportsADO1.FormCreate(Sender: TObject);
begin
  inherited;
  frxReport1.AddFunction('function MoneyF2Txt(Num: Currency; Fund: Integer): String', 'Num2Txt', '');
  frxReport1.AddFunction('function Money2Txt(inpar: Currency): String', 'Num2Txt', '');
  frxReport1.AddFunction('function Num2Txt(CNum: String; Mode: Integer): String', 'Num2Txt', '');
  frxDBDataset1 := TfrxDBDataset.Create(Self);
  DBGridEhCenter.IndicatorTitleMenus := DBGridEhCenter.IndicatorTitleMenus - [itmCut, itmPaste, itmDelete, itmCopy, itmSelectAll];
  DBGridEhFindDialogKey := ShortCut(Word('G'), [ssCtrl]);
  DBGridEhInplaceSearchTimeOut := 3000;
end;

procedure TfReportsADO1.FormDestroy(Sender: TObject);
begin
  frxDBDataset1.Free;
end;

procedure TfReportsADO1.acDesignExecute(Sender: TObject);
begin
  if q1.FieldByName('RepTypeID').Value = 2 then
  	acDesign1Execute(Self)
  else if q1.FieldByName('RepTypeID').Value = 7 then
  	acDesign7Execute(Self)
  else
  begin
    Application.MessageBox(CNoForm, 'Ошибка', MB_ICONERROR+MB_OK);
    Exit;
  end;
end;

procedure TfReportsADO1.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  inherited;
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then TTreeView(Sender).Selected := tmpNode;
end;

procedure TfReportsADO1.UpdateQ2(AReportID: integer);
begin
  if not ((q2.Parameters.ParamByName('ReportID').Value = AReportID) and q2.Active) then
  begin
    q2.Parameters.ParamByName('ReportID').Value := AReportID;
    q2.Close;
    q2.Open;
  end;
end;

procedure TfReportsADO1.acRefresh1Execute(Sender: TObject);
begin
  inherited;
  q2.Close;
end;

procedure TfReportsADO1.ExecReportEmail(AReportID: integer;
  ADopParamStr: string);
begin
  //ExecExcelExport(AReportID, ADopParamStr, True);
  ExecuteReport(nil, AReportID, ADopParamStr, True);
end;

procedure TfReportsADO1.IdSMTP1Connected(Sender: TObject);
begin
  inherited;
  (Sender as TIdSMTP).Tag := 1;
end;

procedure TfReportsADO1.IdSMTP1Disconnected(Sender: TObject);
begin
  inherited;
  (Sender as TIdSMTP).Tag := 0;
end;

end.

