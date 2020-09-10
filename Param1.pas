unit Param1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, stdctrls, Mask, ToolEdit, OleCtrls, SHDocVw, ExtCtrls,
  CurrEdit, Math, RxLookup, Buttons, Tabenter, Variants,
  OleServer, MSXML2_TLB, Placemnt, MemDS, DBAccess, MSAccess;

type
  TfParam1 = class(TForm)
    Panel1: TPanel;
		Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
		Button2: TButton;
		kEnterAsTab1: TkEnterAsTab;
    qParamValue: TMSQuery;
    spParamValueUpd: TMSStoredProc;
    qParams: TMSQuery;
    qDescr: TMSQuery;
    XmlDoc1: TFreeThreadedDOMDocument;
    qParamsName: TStringField;
    qParamsPrompt: TStringField;
    qParamsParamType: TWordField;
    qParamsRequired: TBooleanField;
    qParamsWidth: TIntegerField;
    qParamsDisplayFormat: TStringField;
    qParamsDropDownCount: TIntegerField;
    qParamsDropDownWidth: TIntegerField;
    qParamsLookupSQL: TStringField;
    qParamsLookupField: TStringField;
    qParamsLookupDisplay: TStringField;
    qParamsListsType: TWordField;
    qParamsForm: TStringField;
    qParamsVisible: TBooleanField;
    qParamValueparamValue: TStringField;
		procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
	private
    FFibparams: TMSParams;
    FParams: TStringList;
    procedure lcDocTW1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure btnFormClick(Sender: TObject; var Handled: Boolean);
    procedure btnClearClick(Sender: TObject; var Handled: Boolean);
		{ Private declarations }
	public
		function FormInit(fibparams: TMSParams; params: TStringList; ID, Type1: Integer; ADopParamStr: string): Boolean;
		{ Public declarations }
	end;
var
	fParam1: TfParam1;

implementation

uses DBLookupEh, DBGridEh, ToolCtrlsEh, DM, DBCtrlsEh,
  StrUtils, Table, Menus, Sprav1;

{$R *.DFM}

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

function TfParam1.FormInit(fibparams: TMSParams; params: TStringList; ID, Type1: Integer; ADopParamStr: string): Boolean;
var
	i: integer;
	h: integer;
	w: integer;
	w2: integer;
	q: TMSQuery;
	ds: TDataSource;
  P: Integer;
  dp: TStringList;
begin
  FFibparams := fibparams;
  FParams := params;
	h := 5;
	w := 0;
	w2 := 0;
	FormInit := True;
	qParamValue.ParamByName('ID').Value := ID;
	qParamValue.ParamByName('ParamType').Value := Type1;
	spParamValueUpd.ParamByName('id').Value := ID;
	spParamValueUpd.ParamByName('ParamType').Value := Type1;
	for i := 0 to FParams.Count-1 do
	begin
    FParams.Strings[i] := StringReplace(FParams.Strings[i], ':', '', [rfReplaceAll]);
		qParamValue.ParamByName('Name').Value := FParams.Strings[i];
		qParamValue.Close;
		qParamValue.Open;
		qParams.ParamByName('Name').Value := UpperCase(FParams.Strings[i]);
		qParams.Close;
		qParams.Open;
		if qParams.Eof then
		begin
			FormInit := False;
			Application.MessageBox(PChar('Не найден параметр "'+string(FParams.Strings[i])+'"'),PChar(Caption),MB_ICONERROR+MB_OK);
			Exit;
		end;
    if not qParamsVisible.Value then
    begin
      if not qParamValue.Eof then
        FFibparams.ParamByName(FParams.Strings[i]).Value := qParamValueparamValue.Value;
    end
    else
    begin
  		with TLabel.Create(Self) do
	  	begin
		  	Parent := Panel1;
  			Top := h;
	  		Left := 10;
		  	Caption := qParamsPROMPT.Value;
			  w := max(w, Width);
  		end;
	  	case qParamsPARAMTYPE.Value of
		  	1:
			  begin
  				with TEdit.Create(Panel2) do
	  			begin
		  			Parent := Panel2;
			  		Top := h;
				  	Left := 0;
					  if qParamsWIDTH.Value > 0 then Width := qParamsWIDTH.Value;
  					Name := qParamsNAME.Value;
            if qParamsREQUIRED.Value then Tag := 1 else Tag := 0;
		  			if not qParamValue.Eof then Text := qParamValuePARAMVALUE.Value else Text := '';
			  		h := h+Height+5;
				  	w2 := max(w2, Width);
  				end;
	  		end;
		  	2:
			  begin
				  with TDateEdit.Create(Panel2) do
  				begin
	  				Parent := Panel2;
		  			Top := h;
			  		GlyphKind := gkDropDown;
				  	if qParamsWIDTH.Value > 0 then Width := qParamsWIDTH.Value;
					  Name := qParamsNAME.Value;
  					if qParamsREQUIRED.Value then Tag := 1 else Tag := 0;
	  				if not qParamValue.Eof then Date := qParamValuePARAMVALUE.AsDateTime;
		  			h := h+Height+5;
			  		w2 := max(w2, Width);
  				end;
	  		end;
		  	3:
			  begin
				  with TRxCalcEdit.Create(Panel2) do
  				begin
	  				Parent := Panel2;
		  			Top := h;
			  		GlyphKind := gkDropDown;
				  	FormatOnEditing := True;
					  if qParamsWIDTH.Value > 0 then Width := qParamsWIDTH.Value;
  					DisplayFormat := qParamsDISPLAYFORMAT.Value;
	  				ZeroEmpty := False;
		  			Name := qParamsNAME.Value;
			  		if qParamsREQUIRED.Value then Tag := 1 else Tag := 0;
				  	if not qParamValue.Eof then
					  begin
						  try
							  Value := qParamValuePARAMVALUE.AsFloat;
  						except
	  						Value := 0;
		  				end;
			  		end;
				  	h := h + Height+5;
					  w2 := max(w2, Width);
	  			end;
		  	end;
			  4:
  			begin
	  			with TRxDBLookupCombo.Create(Panel2) do
		  		begin
			  		Parent := Panel2;
				  	Top := h;
            if not qParamsREQUIRED.Value then
            begin
  					  EmptyValue := '-1';
    					DisplayEmpty := '<Все>';
            end;
	  				Name := qParamsNAME.Value;
		  			if qParamsREQUIRED.Value then Tag := 1 else Tag := 0;
			  		if qParamsWIDTH.Value > 0 then Width := qParamsWIDTH.Value;
				  	DropDownWidth := qParamsDROPDOWNWIDTH.Value;
					  DropDownCount := qParamsDROPDOWNCOUNT.Value;
  					FieldsDelimiter := '-';
	  				if qParamsLISTSTYPE.Value = 0 then
		  				ListStyle := lsDelimited
			  		else
				  		ListStyle := lsFixed;
					  q := TMSQuery.Create(Self);
  					q.Connection := DM1.MSConnection1;
	  				q.SQL.Text := qParamsLOOKUPSQL.Value;
		  			q.Open;
			  		ds := TDataSource.Create(Self);
				  	ds.DataSet := q;
					  LookupSource := ds;
  					LookupField := qParamsLOOKUPFIELD.Value;
	  				LookupDisplay := qParamsLOOKUPDISPLAY.Value;
		  			if not qParamValue.Eof then Value := qParamValuePARAMVALUE.Value;
			  		h := h + Height+5;
				  	w2 := max(w2, Width);
  				end;
        end;
			  5:
  			begin
	  			with TDBLookupComboboxEh.Create(Panel2) do
		  		begin
			  		Parent := Panel2;
				  	Top := h;
	  				Name := qParamsNAME.Value;
		  			if qParamsREQUIRED.Value then Tag := 1 else Tag := 0;
			  		if qParamsWIDTH.Value > 0 then Width := qParamsWIDTH.Value;
					  q := TMSQuery.Create(Self);
  					q.Connection := DM1.MSConnection1;
	  				q.SQL.Text := qParamsLOOKUPSQL.Value;
            if q.ParamCount > 0 then
            begin
              if ADopParamStr <> '' then
              begin
                dp := TStringList.Create;
                try
                  dp.Text := ADopParamStr;
                  for P := 0 to dp.Count-1 do
                  begin
                    if q.FindParam(dp.Names[P]) <> nil then
                      q.ParamByName(dp.Names[P]).Value := dp.Values[dp.Names[P]];
                  end
                finally
                  FreeAndNil(dp);
                end;
              end;
            end;
		  			q.Open;
			  		ds := TDataSource.Create(Self);
				  	ds.DataSet := q;
					  ListSource := ds;
  					KeyField := qParamsLOOKUPFIELD.Value;
	  				ListField := qParamsLOOKUPDISPLAY.Value;
            Value := Null;
		  			if not qParamValue.Eof then
            begin
              if q.Locate(KeyField, qParamValuePARAMVALUE.AsVariant, []) then
                Value := qParamValuePARAMVALUE.AsVariant
            end;
            DropDownBox.ColumnDefValues.EndEllipsis := True;
            DropDownBox.Options := [dlgColumnResizeEh, dlgColLinesEh];
            if qParamsFORM.Value <> '' then
            begin
              with EditButtons.Add do
              begin
                ShortCut := 32807;
                Style := ebsEllipsisEh;
                if qParamsFORM.Value = 'doctw4' then
                  OnClick := lcDocTW1EditButtons0Click;
              end;
            end;
			  		h := h + Height+5;
				  	w2 := max(w2, Width);
  				end;
        end;
        6:
  			begin
	  			with TDBEditEh.Create(Panel2) do
		  		begin
            ReadOnly := True;
			  		Parent := Panel2;
				  	Top := h;
	  				Name := qParamsNAME.Value;
		  			if qParamsREQUIRED.Value then Tag := 1 else Tag := 0;
			  		if qParamsWIDTH.Value > 0 then Width := qParamsWIDTH.Value;
				  	//DropDownWidth := qParams1DropDownWidth.Value;
					  //DropDownCount := qParams1DropDownCount.Value;
					  q := TMSQuery.Create(Self);
  					q.Connection := DM1.MSConnection1;
	  				q.SQL.Text := qParamsLOOKUPSQL.Value;
		  			if not qParamValue.Eof
            then q.Params[0].Value := qParamValuePARAMVALUE.AsVariant
            else q.Params[0].Clear;
		  			q.Open;
			  		ds := TDataSource.Create(Self);
				  	ds.DataSet := q;
					  DataSource := ds;
	  				DataField := qParamsLOOKUPDISPLAY.Value;
            with EditButtons.Add do
            begin
              ShortCut := 32807;
              Style := ebsEllipsisEh;
              if LeftStr(qParamsFORM.Value, 1) = 'f' then
              begin
                OnClick := btnFormClick;
                q.Tag := StrToInt(RightStr(qParamsFORM.Value, Length(qParamsForm.Value)-1));
              end
            end;
            with EditButtons.Add do
            begin
              Style := ebsMinusEh;
              OnClick := btnClearClick;
            end;
			  		h := h + Height+5;
				  	w2 := max(w2, Width);
  				end;
        end;
			end;
		end;
	end;
 	Panel1.Width := w+20;
  ClientHeight := Panel3.Height+h;
 	ClientWidth := max(170, Panel1.Width + w2 + 10);
  Button1.Left := Panel3.Width div 2 - (Button1.Width + 5);
 	Button2.Left := Panel3.Width div 2 + 5;
  Button1.Enabled := True;
	qParams.Close;
	qParamValue.Close;
end;

procedure TfParam1.Button1Click(Sender: TObject);
var
	i: integer;
	tc: TControl;
  param: TMSParam;
  val: Variant;
begin
	for i := 0 to Panel2.ComponentCount - 1 do
	begin
		if Panel2.Components[i].Tag > 0 then
		begin
			try
				if Panel2.Components[i] is TDateEdit then
				begin
					if (Panel2.Components[i] as TDateEdit).Date = 0 then
						Abort;
				end
        else if Panel2.Components[i] is TDBEditEh then
        begin
					if ((Panel2.Components[i] as TDBEditEh).DataSource.DataSet as TMSQuery).Params[0].Value = Null then
						Abort;
        end
				else if Panel2.Components[i] is TDBLookupComboboxEh then
				begin
					if (Panel2.Components[i] as TDBLookupComboboxEh).Value = Null then
						Abort;
				end
				else if Panel2.Components[i] is TRxDBLookupCombo then
				begin
					if (Panel2.Components[i] as TRxDBLookupCombo).Value = (Panel2.Components[i] as TRxDBLookupCombo).EmptyValue then
						Abort;
				end
				else if Panel2.Components[i] is TRxCalcEdit then
				begin
					if (Panel2.Components[i] as TRxCalcEdit).Value = 0.0 then
						Abort;
				end
				else if Panel2.Components[i] is TEdit then
				begin
          if (Panel2.Components[i] as TEdit).Text = '' then
            Abort;
        end
      except
        Application.MessageBox('Не заполнено обязательное поле',PChar(Caption),MB_ICONERROR+MB_OK);
        (Panel2.Components[i] as TWinControl).SetFocus;
        Abort;
      end;
    end;
  end;
	for i := 0 to FParams.Count-1 do
  begin
		tc := Panel2.FindChildControl(FParams.Strings[i]);
    if tc <> nil then
    begin
      if tc is TDateEdit then
	 			val := (tc as TDateEdit).Date
	  	else if tc is TDBLookupComboboxEh then
		  	val := (tc as TDBLookupComboboxEh).Value
  		else if tc is TDBEditEh then
	 			val := ((tc as TDBEditEh).DataSource.DataSet as TMSQuery).Params[0].Value
	  	else if tc is TRxDBLookupCombo then
		  	val := (tc as TRxDBLookupCombo).Value
  		else if tc is TRxCalcEdit then
	 			val := (tc as TRxCalcEdit).Value
	  	else if tc is TEdit then
  	  	val := (tc as TEdit).Text
      else
        val := Null;
      param := FFibparams.FindParam(FParams.Strings[i]);
      if param <> nil then param.Value := val;
			spParamValueUpd.ParamByName('Name').Value := FParams.Strings[i];
      if val = Null then
        spParamValueUpd.ParamByName('ParamValue').Clear
      else
  			spParamValueUpd.ParamByName('ParamValue').Value := String(val);
			spParamValueUpd.ExecProc;
		end;
	end;
	ModalResult := mrOK
end;

procedure TfParam1.lcDocTW1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
end;


procedure TfParam1.Button2Click(Sender: TObject);
begin
  //
end;

procedure TfParam1.btnFormClick(Sender: TObject; var Handled: Boolean);
var
  mr: Integer;
  q: TMSQuery;
  OutValue: Variant;
begin
  q := (((Sender as TEditButtonControlEh).Parent as TDBEditEh).DataSource.DataSet as TMSQuery);
  ShowSprav(q.Tag, q.Params[0].Value, OutValue, mr);
  if mr = mrOk then
  begin
  	q.Params[0].Value := OutValue;
    q.Close;
    q.Open;
  end;
end;

{
procedure TfParam1.btnFormClick(Sender: TObject; var Handled: Boolean);
var
	IXmlDoc1: IXMLDOMDocument2;
  Node1: IXMLDOMNode;
  NodeList1: IXMLDOMNodeList;
	f: TfTable;
  mr: Integer;
  q: TpFIBDataSet;
  KeyField: String;
  I: Integer;
  c: TColumnEh;
begin
  q := (((Sender as TEditButtonControlEh).Parent as TDBEditEh).DataSource.DataSet as TpFIBDataSet);
  IXmlDoc1 := XmlDoc1.DefaultInterface;
  qDescr.Params[0].Value := q.Tag;
  qDescr.CloseOpen(False);
  IXmlDoc1.loadXML(qDescr.FieldByName('INFO').AsString);
  qDescr.Close;
  Node1 := IXmlDoc1.documentElement.selectSingleNode('c');
  KeyField := getNodeText(Node1, 'KeyField');
  if KeyField = '' then
  begin
    Application.MessageBox('KeyField не указано', 'Ошибка', MB_ICONERROR);
    Exit;
  end;

	f := TfTable.Create(Self);
	try
    f.BorderIcons := f.BorderIcons-[biMinimize]-[biMaximize];
    f.FormStyle := fsNormal;
    f.Visible := False;
    f.miSelect.Visible := True;
    f.miSelect.ShortCut := ShortCut(VK_RETURN, []);
    f.FormPlacement1.IniSection := IntToStr(q.Tag);
    f.FormPlacement1.Options := [fpPosition];
    f.FormPlacement1.Active := True;
    if UpperCase(getNodeText(Node1, 'UseMultiTitle')) = 'TRUE' then
      f.AvEhGrid1.UseMultiTitle := True
    else
      f.AvEhGrid1.UseMultiTitle := False;
    f.q1.CachedUpdates := False;
    f.q1.SQLs.SelectSQL.Text := getNodeText(Node1, 'Sql');
    f.q1.DisableControls;
    f.acRefresh1Execute(Sender);
    f.Caption := getNodeText(Node1, 'Title');
    NodeList1 := Node1.selectNodes('TField');
    for I := 0 to NodeList1.length-1 do
    begin
      c := f.AvEhGrid1.Columns.Add;
      c.FieldName := getNodeText(NodeList1[I], 'name');
      c.Title.Caption := getNodeText(NodeList1[I], 'display');
      c.Width := getNodeInt(NodeList1[I], 'DisplayWidth', c.Width);
      c.DisplayFormat := getNodeText(NodeList1[I], 'DisplayFormat');
    end;
    f.q1.EnableControls;
    if (q.Params[0].Value <> NULL) and (KeyField <> '') then
    	f.q1.Locate(KeyField, q.Params[0].Value, []);
		mr := f.ShowModal;
    if mr = mrOK then
    begin
			q.Params[0].Value := f.q1.FieldByName(KeyField).Value;
      q.CloseOpen(False);
    end
	finally
		f.Free;
	end;
end;
}
procedure TfParam1.btnClearClick(Sender: TObject; var Handled: Boolean);
var
  q: TMSQuery;
begin
  q := (((Sender as TEditButtonControlEh).Parent as TDBEditEh).DataSource.DataSet as TMSQuery);
  q.Params[0].Clear;
  q.Close;
  q.Open;
end;

end.

