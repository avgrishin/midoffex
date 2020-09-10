unit getNode;

interface

uses MSXML2_TLB, SysUtils, Windows, Classes, TypInfo, Controls, DBCtrls;

function getNodeText(Node1: IXMLDOMNode; AttrName: string): WideString;
function getNodeInt(Node1: IXMLDOMNode; AttrName: string; DefaultValue: Integer): Integer;
procedure ShowFbErrMessage(Message: String);
procedure SetDelimitedText(sl: TStringList; const Value: string);
procedure SetObjectValues(node: IXMLDOMNode; obj: TObject);
procedure SetChildTaborders(const Parent: TWinControl);

implementation

function getNodeText(Node1: IXMLDOMNode; AttrName: string): WideString;
begin
	if Node1.attributes.getNamedItem(AttrName) <> nil then
		getNodeText := Node1.attributes.getNamedItem(AttrName).text
	else
		getNodeText := '';
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

procedure ShowFbErrMessage(Message: String);
var
  s: TStringList;
begin
  s := TStringList.Create;
  s.Text := Message;
  if s.Count > 1 then
  begin
    s.Delete(0);
    if Pos('exception', s.Strings[0]) <> 0 then
      s.Delete(0);
  end;
  try
    MessageBox(0, PAnsiChar(s.Text), 'Œ¯Ë·Í‡', MB_OK);
  finally
    s.Free;
  end;
end;

procedure SetDelimitedText(sl: TStringList; const Value: string);
var
  P, P1: PChar;
  S: string;
begin
  sl.BeginUpdate;
  try
    sl.Clear;
    P := PChar(Value);
    while P^ <> #0 do
    begin
      begin
        P1 := P;
        while (P^ <> #0) and (P^ <> sl.Delimiter) do
          P := CharNext(P);
        SetString(S, P1, P - P1);
      end;
      sl.Add(S);
      if P^ = sl.Delimiter then
      begin
        P1 := P;
        if CharNext(P1)^ = #0 then
          sl.Add('');
        P := CharNext(P);
      end;
    end;
  finally
    sl.EndUpdate;
  end;
end;

procedure SetObjectValues(node: IXMLDOMNode; obj: TObject);
var
  J, K: Integer;
  FPropInfo: PPropInfo;
  nodeName: WideString;
  prop: TStringList;
  o: TObject;
begin
  prop := TStringList.Create;
  try
    prop.Delimiter := '.';
    for J := 0 to node.attributes.length-1 do
    begin
      nodeName := node.attributes.item[J].nodeName;
      SetDelimitedText(prop, nodeName);
      o := obj;
      for K := 0 to prop.Count-2 do
      begin
        o := GetObjectProp(o, prop[K]);
      end;
      FPropInfo := GetPropInfo(o, prop[prop.Count-1]);
      if FPropInfo <> nil then
      begin
        case FPropInfo^.PropType^.Kind of
          tkInteger:
            SetOrdProp(o, FPropInfo, getNodeInt(node, nodeName, GetOrdProp(o, FPropInfo)));
          tkString, tkLString:
            SetStrProp(o, FPropInfo, getNodeText(node, nodeName));
          tkEnumeration:
            SetEnumProp(o, FPropInfo, getNodeText(node, nodeName));
        end;
      end;
    end;
  finally
    prop.Free;
  end;
end;

procedure SetChildTaborders(const Parent: TWinControl);

  procedure FixTabOrder(const Parent: TWinControl);
  var
    ctl, L: Integer;
    Top1, Top2, Left1, Left2: Integer;
    List: TList;
  begin
    List := TList.Create;
    try
      for ctl := 0 to Parent.ControlCount - 1 do
      begin
        if Parent.Controls[ctl] is TWinControl then
        begin
          if List.Count = 0 then
            L := 0
          else
          begin
            if Parent.Controls[ctl] is TDBRadioGroup then
            begin
              Top1 := Parent.Controls[ctl].Top+17;
              Left1 := Parent.Controls[ctl].Left+8;
            end
            else
            begin
              Top1 := Parent.Controls[ctl].Top;
              Left1 := Parent.Controls[ctl].Left;
            end;

            for L := 0 to List.Count - 1 do
            begin
              if TControl(List[L]) is TDBRadioGroup then
              begin
                Top2 := TControl(List[L]).Top+17;
                Left2 := TControl(List[L]).Left+8;
              end
              else
              begin
                Top2 := TControl(List[L]).Top;
                Left2 := TControl(List[L]).Left;
              end;

              if (Top1 < Top2) or ((Top1 = Top2) and (Left1 < Left2)) then Break;
            end

          end;

          List.Insert(L, Parent.Controls[ctl]);
          FixTabOrder(TWinControl(Parent.Controls[ctl]));
        end;
      end;
      for ctl := 0 to List.Count - 1 do
        TWinControl(List[ctl]).TabOrder := ctl;
    finally
      List.Free;
    end;
  end;

begin
  FixTabOrder(Parent);
end;

end.
