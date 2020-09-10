unit SpravADO1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableADO, Placemnt, TB2Item, TBX, Menus, ActnList, DB, ExtCtrls, TB2Dock, TB2Toolbar, Grids, DBGridEh, FilterPart,
  OleServer, MSXML2_TLB, MemDS, DBAccess, MSAccess, GridsEh, ADODB,
  StdCtrls, TB2ExtItems, TBXExtItems;

type
  TfSpravADO1 = class(TfTableADO)
    qDescr: TADOQuery;
    XmlDoc1: TFreeThreadedDOMDocument;
    TBXItem5: TTBXItem;
    acAll1: TAction;
    procedure AvEhGrid1Enter(Sender: TObject);
    procedure AvEhGrid1Exit(Sender: TObject);
    procedure acAll1Update(Sender: TObject);
    procedure acAll1Execute(Sender: TObject);
    procedure q1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure FormInit(Concept: Integer; InValue: Variant; var KeyField: String);
    { Public declarations }
  end;

var
  fSpravADO1: TfSpravADO1;

procedure ShowSprav(Concept: Integer; InValue: Variant; var OutValue: Variant; var mr: Integer);

implementation

{$R *.dfm}

uses getNode, DM, TypInfo, Math;

procedure ShowSprav(Concept: Integer; InValue: Variant; var OutValue: Variant; var mr: Integer);
var
  KeyField: String;
begin
  with TfSpravADO1.Create(Application) do
  try
    FormInit(Concept, InValue, KeyField);
    mr := ShowModal;
    if mr = mrOk then
      OutValue := q1.FieldByName(KeyField).Value;
  finally
    Free;
  end;
end;

procedure TfSpravADO1.FormInit(Concept: Integer; InValue: Variant; var KeyField: String);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I: Integer;
  c: TColumnEh;
begin
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  qDescr.Parameters[0].Value := Concept;
  qDescr.Close;
  qDescr.Open;
  IXmlDoc1.loadXML(qDescr.FieldByName('Info').AsString);
  qDescr.Close;
  Node1 := IXmlDoc1.documentElement.selectSingleNode('c');
  KeyField := getNodeText(Node1, 'KeyField');
  if KeyField = '' then
  begin
    Application.MessageBox('KeyField не указано', 'Ошибка', MB_ICONERROR);
    Exit;
  end;

  FormPlacement1.IniSection := IntToStr(Concept);
  if UpperCase(getNodeText(Node1, 'UseMultiTitle')) = 'TRUE' then
    AvEhGrid1.UseMultiTitle := True
  else
    AvEhGrid1.UseMultiTitle := False;
  (GetObjectProp(q1, 'SQL') as TStrings).Text := getNodeText(Node1, 'Sql');
  q1.DisableControls;
  SetStrProp(Self, 'Caption', getNodeText(Node1, 'Title'));
  NodeList1 := Node1.selectNodes('TField');
  for I := 0 to NodeList1.length-1 do
  begin
    c := AvEhGrid1.Columns.Add;
    SetObjectValues(NodeList1[I], c);
{
      c.FieldName := getNodeText(NodeList1[I], 'name');
      c.Title.Caption := getNodeText(NodeList1[I], 'display');
      c.Width := getNodeInt(NodeList1[I], 'DisplayWidth', c.Width);
      c.DisplayFormat := getNodeText(NodeList1[I], 'DisplayFormat');
      c.Visible := not(getNodeText(NodeList1[I], 'Visible') = 'False');
}
  end;
  //NodeList1 := Node1.selectNodes('TField');
  acAll1Update(nil);
  acRefresh1Execute(nil);
  q1.EnableControls;
  if (InValue <> Null) and (KeyField <> '') then
  	q1.Locate(KeyField, InValue, []);
end;

procedure TfSpravADO1.AvEhGrid1Enter(Sender: TObject);
begin
  inherited;
  acExec1.ShortCut := ShortCut(VK_RETURN, []);
end;

procedure TfSpravADO1.AvEhGrid1Exit(Sender: TObject);
begin
  inherited;
  acExec1.ShortCut := 0;
end;

procedure TfSpravADO1.acAll1Update(Sender: TObject);
begin
  acAll1.Enabled := q1.Parameters.FindParam('ALL') <> nil;
end;

procedure TfSpravADO1.acAll1Execute(Sender: TObject);
begin
  if acAll1.Enabled then
  begin
    acAll1.Checked := not acAll1.Checked;
    if Sender <> nil then
      acRefresh1Execute(Sender);
  end;
end;

procedure TfSpravADO1.q1BeforeOpen(DataSet: TDataSet);
begin
  if acAll1.Enabled then
    q1.Parameters.ParamByName('ALL').Value := IfThen(acAll1.Checked, 1, 0);
end;

end.
