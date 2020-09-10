unit Sprav1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Table, Placemnt, TB2Item, TBX, Menus, ActnList, DB, ExtCtrls, TB2Dock, TB2Toolbar, Grids, DBGridEh, FilterPart,
  OleServer, MSXML2_TLB, MemDS, DBAccess, MSAccess, GridsEh;

type
  TfSprav1 = class(TfTable)
    qDescr: TMSQuery;
    XmlDoc1: TFreeThreadedDOMDocument;
  private
    { Private declarations }
  public
    procedure FormInit(Concept: Integer; InValue: Variant; var KeyField: String);
    { Public declarations }
  end;

var
  fSprav1: TfSprav1;

procedure ShowSprav(Concept: Integer; InValue: Variant; var OutValue: Variant; var mr: Integer);

implementation

{$R *.dfm}

uses getNode, DM;

procedure ShowSprav(Concept: Integer; InValue: Variant; var OutValue: Variant; var mr: Integer);
var
  KeyField: String;
begin
  with TfSprav1.Create(Application) do
  try
    FormInit(Concept, InValue, KeyField);
    mr := ShowModal;
    if mr = mrOk then
      OutValue := q1.FieldByName(KeyField).Value;
  finally
    Free;
  end;
end;

procedure TfSprav1.FormInit(Concept: Integer; InValue: Variant; var KeyField: String);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
  I: Integer;
  c: TColumnEh;
begin
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  qDescr.Params[0].Value := Concept;
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
  q1.CachedUpdates := False;
  q1.SQL.Text := getNodeText(Node1, 'Sql');
  q1.DisableControls;
  acRefresh1Execute(nil);
  Caption := getNodeText(Node1, 'Title');
  NodeList1 := Node1.selectNodes('TField');
  for I := 0 to NodeList1.length-1 do
  begin
    c := AvEhGrid1.Columns.Add;
    c.FieldName := getNodeText(NodeList1[I], 'name');
    c.Title.Caption := getNodeText(NodeList1[I], 'display');
    c.Width := getNodeInt(NodeList1[I], 'DisplayWidth', c.Width);
    c.DisplayFormat := getNodeText(NodeList1[I], 'DisplayFormat');
  end;
  q1.EnableControls;
  if (InValue <> NULL) and (KeyField <> '') then
  	q1.Locate(KeyField, InValue, []);
end;

end.
