object fAddOption: TfAddOption
  Left = 335
  Top = 231
  Width = 671
  Height = 720
  BorderIcons = [biSystemMenu]
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1086#1087#1094#1080#1086#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    655
    681)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 160
    Width = 75
    Height = 13
    Caption = #1057#1090#1080#1083#1100' '#1086#1087#1094#1080#1086#1085#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 128
    Width = 74
    Height = 13
    Caption = #1042#1080#1076' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
  end
  object Label3: TLabel
    Left = 24
    Top = 32
    Width = 153
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1073#1072#1079#1086#1074#1086#1075#1086' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1072
  end
  object Label4: TLabel
    Left = 24
    Top = 64
    Width = 107
    Height = 13
    Caption = #1041#1072#1079#1086#1074#1099#1081' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090
  end
  object Label5: TLabel
    Left = 24
    Top = 96
    Width = 38
    Height = 13
    Caption = #1054#1087#1094#1080#1086#1085
  end
  object Label6: TLabel
    Left = 24
    Top = 256
    Width = 94
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
  end
  object Label7: TLabel
    Left = 24
    Top = 288
    Width = 94
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072' '#1082#1086#1090#1080#1088#1086#1074#1082#1080
  end
  object kEnterAsTab1: TkEnterAsTab
    Left = 480
    Top = 8
    Width = 27
    Height = 27
    Caption = 'ET'
  end
  object lcBaseSecGroup1: TDBLookupComboboxEh
    Left = 184
    Top = 32
    Width = 177
    Height = 19
    AlwaysShowBorder = True
    DropDownBox.ColumnDefValues.EndEllipsis = True
    DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
    EditButtons = <>
    Flat = True
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dstBaseSecGroup1
    Style = csDropDownEh
    TabOrder = 0
    Visible = True
    OnChange = lcBaseSecGroup1Change
  end
  object Button1: TButton
    Left = 560
    Top = 640
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1042#1099#1093#1086#1076
    ModalResult = 2
    TabOrder = 13
  end
  object lcBaseSec1: TDBLookupComboboxEh
    Left = 184
    Top = 64
    Width = 177
    Height = 19
    AlwaysShowBorder = True
    DropDownBox.Columns = <
      item
        FieldName = 'NameBrief'
        Width = 40
      end
      item
        FieldName = 'Name1'
        Width = 70
      end>
    DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
    DropDownBox.Sizable = True
    DropDownBox.Width = 300
    Enabled = False
    EditButtons = <>
    Flat = True
    KeyField = 'ID'
    ListField = 'Name1'
    ListSource = dsBaseSecurity1
    Style = csDropDownEh
    TabOrder = 1
    Visible = True
    OnChange = lcBaseSec1Change
  end
  object cbContrType1: TDBComboBoxEh
    Left = 184
    Top = 128
    Width = 177
    Height = 19
    AlwaysShowBorder = True
    Enabled = False
    EditButtons = <>
    Flat = True
    Items.Strings = (
      #1055#1086#1089#1090#1072#1074#1086#1095#1085#1099#1081
      #1056#1072#1089#1095#1077#1090#1085#1099#1081)
    TabOrder = 3
    Visible = True
  end
  object cbClass1: TDBComboBoxEh
    Left = 184
    Top = 160
    Width = 177
    Height = 19
    AlwaysShowBorder = True
    Enabled = False
    EditButtons = <>
    Flat = True
    Items.Strings = (
      #1045#1074#1088#1086#1087#1077#1081#1089#1082#1080#1081
      #1040#1084#1077#1088#1080#1082#1072#1085#1089#1082#1080#1081)
    TabOrder = 4
    Visible = True
  end
  object rgPayType1: TRadioGroup
    Left = 24
    Top = 192
    Width = 89
    Height = 57
    Caption = #1058#1080#1087' '#1086#1087#1094#1080#1086#1085#1072
    Enabled = False
    Items.Strings = (
      'Call'
      'Put')
    TabOrder = 5
  end
  object lcSec1: TDBLookupComboboxEh
    Left = 488
    Top = 144
    Width = 73
    Height = 19
    AlwaysShowBorder = True
    DropDownBox.Columns = <
      item
        FieldName = 'NameBrief'
        Title.Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
        Width = 32
      end
      item
        FieldName = 'Name1'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        FieldName = 'PayTypeS'
        Title.Caption = #1058#1080#1087' '#1054#1087#1094#1080#1085#1072
      end
      item
        FieldName = 'ClassS'
        Title.Caption = #1057#1090#1080#1083#1100' '#1054#1087#1094#1080#1086#1085#1072
      end
      item
        FieldName = 'ContrTypeS'
        Title.Caption = #1042#1080#1076' '#1050#1086#1085#1090#1088#1072#1082#1090#1072
      end>
    DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
    DropDownBox.Rows = 10
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    DropDownBox.Width = 400
    Enabled = False
    EditButtons = <>
    Flat = True
    KeyField = 'ID'
    ListField = 'Name1'
    ListSource = dsSecurity1
    Style = csDropDownEh
    TabOrder = 6
    Visible = False
  end
  object eSec1: TDBEditEh
    Left = 184
    Top = 96
    Width = 241
    Height = 19
    AlwaysShowBorder = True
    DataField = 'Name1'
    DataSource = dsSec2
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = eSec1EditButtons0Click
      end>
    Enabled = False
    Flat = True
    TabOrder = 2
    Visible = True
  end
  object cbVariation: TCheckBox
    Left = 184
    Top = 200
    Width = 137
    Height = 17
    Caption = #1042#1072#1088#1080#1072#1094#1080#1086#1085#1085#1099#1081' '#1086#1087#1094#1080#1086#1085
    Enabled = False
    TabOrder = 7
  end
  object neNominal: TDBNumberEditEh
    Left = 184
    Top = 256
    Width = 121
    Height = 19
    AlwaysShowBorder = True
    Enabled = False
    EditButtons = <>
    Flat = True
    TabOrder = 8
    Visible = True
  end
  object cbFund1: TDBComboBoxEh
    Left = 184
    Top = 288
    Width = 121
    Height = 19
    AlwaysShowBorder = True
    Enabled = False
    EditButtons = <>
    Flat = True
    Items.Strings = (
      #1056#1086#1089#1089#1080#1081#1089#1082#1080#1077' '#1088#1091#1073#1083#1080
      #1044#1086#1083#1083#1072#1088#1099' '#1057#1064#1040
      #1045#1074#1088#1086)
    KeyItems.Strings = (
      '39191'
      '39192'
      '39199')
    TabOrder = 9
    Visible = True
  end
  object gOpt1: TAvEhGrid
    Left = 24
    Top = 320
    Width = 609
    Height = 136
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstAll]
    Anchors = [akLeft, akTop, akRight]
    AutoFitColWidths = True
    DataSource = dsSecOpt1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
    RowHeight = 17
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 40
    OnDblClick = gOpt1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NameBrief'
        Footers = <>
        Title.Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      end
      item
        EditButtons = <>
        FieldName = 'Name1'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        EditButtons = <>
        FieldName = 'EmissionValue'
        Footers = <>
        Title.Alignment = taRightJustify
        Title.Caption = #1062#1077#1085#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      end
      item
        DisplayFormat = 'dd.mm.yyyy'
        EditButtons = <>
        FieldName = 'DateStart'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1089
      end
      item
        DisplayFormat = 'dd.mm.yyyy'
        EditButtons = <>
        FieldName = 'DateEndFact'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086
      end
      item
        DisplayFormat = 'dd.mm.yyyy'
        EditButtons = <>
        FieldName = 'ExecDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1077#1088#1074#1099#1081' '#1090#1086#1088#1075#1086#1074#1099#1081' '#1076#1077#1085#1100
      end
      item
        DisplayFormat = 'dd.mm.yyyy'
        EditButtons = <>
        FieldName = 'EndServiceDate'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1090#1086#1088#1075#1086#1074#1099#1081' '#1076#1077#1085#1100
      end>
  end
  object Panel1: TPanel
    Left = 24
    Top = 504
    Width = 609
    Height = 121
    TabOrder = 11
    object Label8: TLabel
      Left = 16
      Top = 8
      Width = 89
      Height = 13
      Caption = #1062#1077#1085#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
    end
    object Label9: TLabel
      Left = 16
      Top = 32
      Width = 118
      Height = 13
      Caption = #1055#1077#1088#1074#1099#1081' '#1090#1086#1088#1075#1086#1074#1099#1081' '#1076#1077#1085#1100
    end
    object Label10: TLabel
      Left = 288
      Top = 32
      Width = 134
      Height = 13
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1090#1086#1088#1075#1086#1074#1099#1081' '#1076#1077#1085#1100
    end
    object Label11: TLabel
      Left = 16
      Top = 56
      Width = 97
      Height = 13
      Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1089
    end
    object Label12: TLabel
      Left = 288
      Top = 56
      Width = 106
      Height = 13
      Caption = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103'  '#1087#1086
    end
    object neEmissionValue: TDBNumberEditEh
      Left = 152
      Top = 6
      Width = 121
      Height = 21
      AlwaysShowBorder = True
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object deExecDate1: TDateEdit
      Left = 152
      Top = 32
      Width = 121
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
    end
    object deEndServiceDate1: TDateEdit
      Left = 432
      Top = 32
      Width = 121
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
    end
    object deDateStart1: TDateEdit
      Left = 152
      Top = 56
      Width = 121
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
    end
    object deDateEndFact1: TDateEdit
      Left = 432
      Top = 56
      Width = 121
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
    end
    object bAdd1: TButton
      Left = 256
      Top = 88
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 5
      OnClick = bAdd1Click
    end
  end
  object bRefresh1: TButton
    Left = 472
    Top = 464
    Width = 75
    Height = 25
    Action = acRefresh1
    TabOrder = 14
  end
  object bSelect1: TButton
    Left = 560
    Top = 464
    Width = 75
    Height = 25
    Action = acSelect1
    TabOrder = 15
  end
  object dstBaseSecGroup1: TDataSource
    DataSet = tBaseSecGroup1
    Left = 400
    Top = 32
  end
  object tBaseSecGroup1: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select ID = SecurityGroupID, Name '
      'from tSecurityGroup '
      'where SecurityGroupID in (708, 100, 694, 492, 746)')
    Left = 368
    Top = 32
  end
  object tBaseSecurity1: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterOpen = tBaseSecurity1AfterOpen
    AfterClose = tBaseSecurity1AfterClose
    Parameters = <
      item
        Name = 'SecurityGroupID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select ID = s.SecurityID, s.Name1, s.NameBrief'
      'from tSecuritySecurityGroup ssg'
      
        ' join tSecurity s on s.SecurityID = ssg.SecurityID and s.IsDelet' +
        'ed = 0'
      'where ssg.SecurityGroupID = :SecurityGroupID'
      'order by s.NameBrief')
    Left = 368
    Top = 64
  end
  object dsBaseSecurity1: TDataSource
    DataSet = tBaseSecurity1
    Left = 400
    Top = 64
  end
  object qSec1: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'BaseSecurityID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '  ID = s.SecurityID,'
      '  Name1 = rtrim(s.Name1),'
      '  NameBrief = rtrim(s.NameBrief),'
      '  PayType,'
      '  Class,'
      '  ContrType,'
      
        '  PayTypeS = case s.PayType when 0 then '#39'Call'#39' when 1 then '#39'Put'#39 +
        ' end,'
      
        '  ClassS = case s.Class when 0 then '#39#1045#1074#1088#1086#1087#1077#1081#1089#1082#1080#1081#39' when 1 then '#39#1040 +
        #1084#1077#1088#1080#1082#1072#1085#1089#1082#1080#1081#39' end,'
      
        '  ContrTypeS = case s.ContrType when 0 then '#39#1055#1086#1089#1090#1072#1074#1086#1095#1085#1099#1081#39' when 1' +
        ' then '#39#1056#1072#1089#1095#1077#1090#1085#1099#1081#39' end'
      'from tSecurity s '
      'where s.BaseSecurityID = :BaseSecurityID'
      '  and s.IsDeleted = 0'
      '  and s.ParentID is null'
      '  and s.SecType = 24'
      'order by s.NameBrief')
    Left = 408
    Top = 134
  end
  object dsSecurity1: TDataSource
    DataSet = qSec1
    Left = 440
    Top = 133
  end
  object qSec2: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    AfterOpen = qSec2AfterOpen
    AfterClose = qSec2AfterClose
    Parameters = <
      item
        Name = 'SecurityID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '  ID = s.SecurityID,'
      '  Name1 = rtrim(s.Name1),'
      '  NameBrief = rtrim(s.NameBrief),'
      '  PayType,'
      '  Class,'
      '  ContrType,'
      '  s.EmptyBillFlag,'
      '  Nominal = s.NominalOriginal,'
      '  FundID = s.RatedSecurityID'
      'from tSecurity s '
      'where s.SecurityID = :SecurityID and s.SecType = 24')
    Left = 432
    Top = 94
  end
  object dsSec2: TDataSource
    DataSet = qSec2
    Left = 464
    Top = 93
  end
  object qSecOpt1: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ParentID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '  ID = s.SecurityID,'
      '  NameBrief = rtrim(s.NameBrief),'
      '  s.Name1,'
      '  s.EmissionValue,'
      
        '  DateStart = coalesce(nullif(s.DateStart, '#39'19000101'#39'), s.DateEn' +
        'dFact),'
      '  s.DateEndFact,'
      '  s.ExecDate,'
      '  s.EndServiceDate'
      'from tSecurity s'
      'where s.ParentID = :ParentID'
      '  and s.IsDeleted = 0'
      '  and s.SecType = 24')
    Left = 232
    Top = 392
  end
  object dsSecOpt1: TDataSource
    DataSet = qSecOpt1
    Left = 280
    Top = 392
  end
  object cmdSecOptDel1: TADOCommand
    CommandText = 'delete pSecOptionAdd'
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 384
    Top = 560
  end
  object qSecOptAdd1: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ParentID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'EmissionValue'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'ExecDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'EndServiceDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'DateStart'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'DateEndFact'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'insert pSecOptionAdd (ParentID, EmissionValue, ExecDate, EndServ' +
        'iceDate, DateStart, DateEndFact)'
      
        'values (:ParentID, :EmissionValue, :ExecDate, :EndServiceDate, :' +
        'DateStart, :DateEndFact)')
    Left = 424
    Top = 560
  end
  object spExecAddOptionJob: TADOStoredProc
    Connection = DM1.ADOConnection1
    CommandTimeout = 6000
    ProcedureName = 'up_avgExecAddOptionJob'
    Parameters = <>
    Left = 464
    Top = 560
  end
  object ActionList1: TActionList
    Left = 32
    Top = 640
    object acRefresh1: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh1Execute
    end
    object acSelect1: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = acSelect1Execute
      OnUpdate = acSelect1Update
    end
  end
end
