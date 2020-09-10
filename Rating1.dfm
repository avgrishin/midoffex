object fRating1: TfRating1
  Left = 232
  Top = 127
  Width = 917
  Height = 640
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 909
    Height = 606
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    TabStop = False
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090#1099
      PopupMenu = TBXPopupMenu1
      OnEnter = TabSheet1Enter
      OnExit = TabSheet1Exit
      object AvEhGrid1: TAvEhGrid
        Left = 0
        Top = 25
        Width = 901
        Height = 517
        Align = alClient
        AllowedOperations = []
        AllowedSelections = [gstRecordBookmarks, gstAll]
        ColumnDefValues.Title.Alignment = taCenter
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds1
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth]
        RowHeight = 17
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 15
        OnDblClick = AvEhGrid1DblClick
        StatusBar = fMain1.StatusBar1
        OptionsAv = [aegFilter]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PRCDATE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CLIENTNAME'
            Footers = <>
          end
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'PRICEWNDS'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
          end
          item
            EditButtons = <>
            FieldName = 'SROK'
            Footers = <>
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 542
        Width = 901
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label2: TLabel
          Left = 8
          Top = 10
          Width = 94
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072':'
        end
        object Label4: TLabel
          Left = 312
          Top = 10
          Width = 74
          Height = 13
          Caption = #1057#1088#1086#1082' '#1087#1083#1072#1090#1077#1078#1072':'
        end
        object Button1: TButton
          Left = 472
          Top = 8
          Width = 75
          Height = 25
          Action = acPlSave1
          TabOrder = 1
        end
        object Button2: TButton
          Left = 552
          Top = 8
          Width = 75
          Height = 25
          Action = acPlCancel1
          TabOrder = 2
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Left = 104
          Top = 8
          Width = 89
          Height = 21
          DataField = 'PRCDATE'
          DataSource = ds1
          EditButtons = <>
          HighlightRequired = True
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
        end
        object DBCheckBoxEh1: TDBCheckBoxEh
          Left = 208
          Top = 8
          Width = 81
          Height = 17
          Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
          DataField = 'PRICEWNDS'
          DataSource = ds1
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBNumberEditEh1: TDBNumberEditEh
          Left = 392
          Top = 8
          Width = 41
          Height = 21
          DataField = 'SROK'
          DataSource = ds1
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
      end
      object TBXDock1: TTBXDock
        Left = 0
        Top = 0
        Width = 901
        Height = 25
        object TBXToolbar1: TTBXToolbar
          Left = 0
          Top = 0
          Caption = 'TBXToolbar1'
          TabOrder = 0
          object TBControlItem1: TTBControlItem
            Control = Label1
          end
          object TBControlItem2: TTBControlItem
            Control = deDateB1
          end
          object TBControlItem3: TTBControlItem
            Control = Label3
          end
          object TBControlItem4: TTBControlItem
            Control = deDateE1
          end
          object TBXItem22: TTBXItem
            Action = acShow1
          end
          object Label1: TLabel
            Left = 0
            Top = 4
            Width = 40
            Height = 13
            Caption = #1044#1072#1090#1099' '#1089' '
            Transparent = True
          end
          object Label3: TLabel
            Left = 139
            Top = 4
            Width = 18
            Height = 13
            Caption = ' '#1087#1086' '
            Transparent = True
          end
          object deDateB1: TDateEdit
            Left = 40
            Top = 0
            Width = 99
            Height = 21
            GlyphKind = gkDropDown
            NumGlyphs = 1
            TabOrder = 0
          end
          object deDateE1: TDateEdit
            Left = 157
            Top = 0
            Width = 99
            Height = 21
            GlyphKind = gkDropDown
            NumGlyphs = 1
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
      ImageIndex = 1
      PopupMenu = TBXPopupMenu2
      OnEnter = TabSheet2Enter
      OnExit = TabSheet2Exit
      object AvEhGrid2: TAvEhGrid
        Left = 0
        Top = 21
        Width = 901
        Height = 557
        Align = alClient
        AllowedOperations = []
        AllowedSelections = [gstRecordBookmarks, gstAll]
        AutoFitColWidths = True
        ColumnDefValues.Title.Alignment = taCenter
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds2
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth]
        RowHeight = 16
        RowLines = 4
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 10
        OnDblClick = AvEhGrid2DblClick
        OnDrawColumnCell = AvEhGrid2DrawColumnCell
        StatusBar = fMain1.StatusBar1
        OptionsAv = [aegFilter]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PRODNAME'
            Footer.FieldName = 'PRODNAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Tag = 1
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'|'#1050#1086#1076' '#1090#1086#1074#1072#1088#1072'|'#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'|'#1057#1090#1088#1072#1085#1072
            Width = 295
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'PRODCODE'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'PLANT'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'COUNTRY'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'NUM'
            Footers = <>
            Tag = 5
            Title.Caption = #1050#1086#1083'-'#1074#1086'|'#1062#1077#1085#1072'|'#1053#1044#1057'|'#1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
          end
          item
            EditButtons = <>
            FieldName = 'BPRICE'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'NDS'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'PRICEIN'
            Footers = <>
            Visible = False
            Width = 93
          end
          item
            Color = cl3DLight
            EditButtons = <>
            FieldName = 'OURPRODNAME'
            Footers = <>
            Tag = 9
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'|'#1040#1088#1090#1080#1082#1091#1083'|'#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'|'#1057#1090#1088#1072#1085#1072
            Width = 429
          end
          item
            EditButtons = <>
            FieldName = 'OURARTICLE'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'OURPLANT'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'OURCOUNTRY'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'BARCODE'
            Footers = <>
            Tag = 13
            Title.Caption = #1064#1090#1088#1080#1093'-'#1050#1086#1076'|'#1059#1087#1072#1082#1086#1074#1082#1072'|'#1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080'| '
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'PACKING'
            Footers = <>
            Visible = False
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'DATEEND'
            Footers = <>
            Visible = False
          end>
      end
      object TBXDock4: TTBXDock
        Left = 0
        Top = 0
        Width = 901
        Height = 21
        object TBXToolbar4: TTBXToolbar
          Left = 0
          Top = 0
          Caption = 'TBXToolbar3'
          TabOrder = 0
          object TBControlItem9: TTBControlItem
            Control = TBXCheckBox2
          end
          object TBXCheckBox2: TTBXCheckBox
            Left = 0
            Top = 0
            Width = 140
            Height = 17
            Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1072#1088#1093#1080#1074#1085#1099#1081' '#1090#1086#1074#1072#1088
            Caption = #1055#1088#1080#1074#1103#1079#1072#1085#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080
            TabOrder = 0
            OnChange = TBXCheckBox2Change
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 2
      PopupMenu = TBXPopupMenu3
      OnEnter = TabSheet3Enter
      OnExit = TabSheet3Exit
      object AvEhGrid3: TAvEhGrid
        Left = 0
        Top = 21
        Width = 901
        Height = 557
        Align = alClient
        AllowedOperations = []
        AllowedSelections = [gstRecordBookmarks, gstAll]
        AutoFitColWidths = True
        ColumnDefValues.Title.Alignment = taCenter
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds3
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth]
        RowHeight = 17
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 14
        OnDblClick = AvEhGrid3DblClick
        StatusBar = fMain1.StatusBar1
        OptionsAv = [aegFilter]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ARTICLE'
            Footer.FieldName = 'ARTICLE'
            Footer.ValueType = fvtCount
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PRODNAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PLANT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'COUNTRY'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'BARCODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NDS'
            Footers = <>
            Width = 29
          end>
      end
      object TBXDock3: TTBXDock
        Left = 0
        Top = 0
        Width = 901
        Height = 21
        object TBXToolbar3: TTBXToolbar
          Left = 0
          Top = 0
          Caption = 'TBXToolbar3'
          TabOrder = 0
          object TBControlItem8: TTBControlItem
            Control = TBXCheckBox1
          end
          object TBXCheckBox1: TTBXCheckBox
            Left = 0
            Top = 0
            Width = 110
            Height = 17
            Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1072#1088#1093#1080#1074#1085#1099#1081' '#1090#1086#1074#1072#1088
            Caption = #1040#1088#1093#1080#1074#1085#1099#1081' '#1090#1086#1074#1072#1088
            TabOrder = 0
            OnChange = TBXCheckBox1Change
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1047#1072#1082#1072#1079
      ImageIndex = 3
      PopupMenu = TBXPopupMenu4
      OnEnter = TabSheet4Enter
      OnExit = TabSheet4Exit
      object AvEhGrid4: TAvEhGrid
        Left = 0
        Top = 17
        Width = 901
        Height = 561
        Align = alClient
        AllowedOperations = []
        AllowedSelections = [gstRecordBookmarks, gstAll]
        AutoFitColWidths = True
        ColumnDefValues.Title.Alignment = taCenter
        ColumnDefValues.Title.TitleButton = True
        DataSource = ds4
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth]
        RowHeight = 17
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 14
        OnDblClick = AvEhGrid4DblClick
        StatusBar = fMain1.StatusBar1
        OptionsAv = [aegFilter]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ARTICLE'
            Footer.Alignment = taRightJustify
            Footer.FieldName = 'ARTICLE'
            Footer.ValueType = fvtCount
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PRODNAME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PLANT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'COUNTRY'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'BARCODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NDS'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'ZAKAZ'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NUM'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'BPRICE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DATEEND'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PACKING'
            Footers = <>
            Title.Alignment = taLeftJustify
          end>
      end
      object TBXDock2: TTBXDock
        Left = 0
        Top = 0
        Width = 901
        Height = 17
        object TBXToolbar2: TTBXToolbar
          Left = 0
          Top = 0
          Caption = 'TBXToolbar2'
          TabOrder = 0
          object TBControlItem5: TTBControlItem
            Control = DBText1
          end
          object TBControlItem6: TTBControlItem
            Control = Label5
          end
          object TBControlItem7: TTBControlItem
            Control = DBText2
          end
          object DBText1: TDBText
            Left = 0
            Top = 0
            Width = 42
            Height = 13
            AutoSize = True
            DataField = 'PPRODNAME'
            DataSource = ds4
            Transparent = True
          end
          object Label5: TLabel
            Left = 42
            Top = 0
            Width = 6
            Height = 13
            Caption = ', '
            Transparent = True
          end
          object DBText2: TDBText
            Left = 48
            Top = 0
            Width = 42
            Height = 13
            AutoSize = True
            DataField = 'PPLANT'
            DataSource = ds4
            Transparent = True
          end
        end
      end
    end
  end
  object q1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PMPRCLST'
      'SET '
      '    CLIENTID = :CLIENTID,'
      '    PRCDATE = :PRCDATE,'
      '    PRICEWNDS = :PRICEWNDS,'
      '    SROK = :SROK'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PMPRCLST'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PMPRCLST('
      '    ID,'
      '    CLIENTID,'
      '    PRCDATE,'
      '    PRICEWNDS,'
      '    SROK'
      ')'
      'VALUES('
      '    :ID,'
      '    :CLIENTID,'
      '    :PRCDATE,'
      '    :PRICEWNDS,'
      '    :SROK'
      ')')
    RefreshSQL.Strings = (
      
        'select p.*, l.lname clientname from pmprclst p left join lib l o' +
        'n l.lid = p.clientid where(  p.prcdate between :dateb and :datee'
      '     ) and (     P.ID = :OLD_ID'
      '     )'
      '     ')
    SelectSQL.Strings = (
      
        'select p.*, l.lname clientname from pmprclst p left join lib l o' +
        'n l.lid = p.clientid where p.prcdate between :dateb and :datee o' +
        'rder by p.prcdate desc')
    AutoUpdateOptions.UpdateTableName = 'PMPRCLST'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_PLNK_ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.ParamsToFieldsLinks.Strings = (
      'CLIENTID=CLIENTID')
    Transaction = DM1.trRead
    Database = DM1.pFIBDatabase1
    UpdateTransaction = DM1.trWrite
    AutoCommit = True
    RefreshTransactionKind = tkUpdateTransaction
    Left = 100
    Top = 112
    object q1ID: TFIBIntegerField
      FieldName = 'ID'
    end
    object q1CLIENTID: TFIBIntegerField
      FieldName = 'CLIENTID'
    end
    object q1PRCDATE: TFIBDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'PRCDATE'
      DisplayFormat = 'dd.mm.yy'
    end
    object q1PRICEWNDS: TFIBIntegerField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      FieldName = 'PRICEWNDS'
    end
    object q1SROK: TFIBIntegerField
      DisplayLabel = #1054#1090#1089#1088#1086#1095#1082#1072
      FieldName = 'SROK'
    end
    object q1DID: TFIBIntegerField
      FieldName = 'DID'
    end
    object q1CLIENTNAME: TFIBStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'CLIENTNAME'
      Size = 80
      EmptyStrToNull = True
    end
  end
  object ds1: TDataSource
    DataSet = q1
    Left = 140
    Top = 112
  end
  object ActionList1: TActionList
    Left = 260
    Top = 72
    object acPlSave1: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = acPlSave1Execute
    end
    object acPlCancel1: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = acPlCancel1Execute
    end
    object acPlAdd1: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acPlAdd1Execute
      OnUpdate = acPlAdd1Update
    end
    object acPlChange1: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = acPlChange1Execute
      OnUpdate = acPlChange1Update
    end
    object acPlDel1: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acPlDel1Execute
      OnUpdate = acPlDel1Update
    end
    object acImpPrc1: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
      OnExecute = acImpPrc1Execute
    end
    object acImpPrc2: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072' ('#1080#1085#1076'.)'
      OnExecute = acImpPrc2Execute
    end
    object acLink2: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088
      OnExecute = acLink2Execute
      OnUpdate = acLink2Update
    end
    object acLink3: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088
      OnExecute = acLink3Execute
      OnUpdate = acLink3Update
    end
    object acExec1: TAction
      Caption = #1042#1099#1073#1086#1088' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072
      OnExecute = acExec1Execute
      OnUpdate = acExec1Update
    end
    object acExec2: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1090#1086#1074#1072#1088#1072
      OnExecute = acExec2Execute
      OnUpdate = acExec2Update
    end
    object acExec4: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1090#1086#1074#1072#1088#1072
      OnExecute = acExec4Execute
      OnUpdate = acExec4Update
    end
    object acRefresh1: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh1Execute
      OnUpdate = acRefresh1Update
    end
    object acRefresh2: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh2Execute
    end
    object acRefresh3: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh3Execute
    end
    object acRefresh4: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh4Execute
    end
    object acCopy1: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16451
      OnExecute = acCopy1Execute
    end
    object acUnLink4: TAction
      Caption = #1054#1090#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088
      OnExecute = acUnLink4Execute
      OnUpdate = acUnLink4Update
    end
    object acUnLink2: TAction
      Caption = #1054#1090#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088
      OnExecute = acUnLink2Execute
      OnUpdate = acUnLink2Update
    end
    object acExpOrder1: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1079#1072#1082#1072#1079#1072
      OnExecute = acExpOrder1Execute
    end
    object acShow1: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      OnExecute = acShow1Execute
    end
    object acExport1: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090
      OnExecute = acExport1Execute
    end
  end
  object TBXPopupMenu1: TTBXPopupMenu
    Left = 208
    Top = 256
    object TBXItem23: TTBXItem
      Action = acShow1
    end
    object TBXItem8: TTBXItem
      Action = acExec1
      MaskOptions = [tboDefault]
    end
    object TBXItem3: TTBXItem
      Action = acPlAdd1
    end
    object TBXItem1: TTBXItem
      Action = acPlChange1
    end
    object TBXSeparatorItem1: TTBXSeparatorItem
    end
    object TBXItem2: TTBXItem
      Action = acPlDel1
    end
    object TBXSeparatorItem2: TTBXSeparatorItem
    end
    object TBXItem4: TTBXItem
      Action = acRefresh1
    end
    object TBXItem12: TTBXItem
      Action = acCopy1
    end
  end
  object q2: TpFIBDataSet
    RefreshSQL.Strings = (
      'select pi.*,'
      '  l1.lid ourproductid, '
      '  l1.ltext1 ourarticle, '
      '  l1.lname ourprodname, '
      '  l2.lname ourplant, '
      '  l3.lname ourcountry,'
      
        '  (select first 1 prime_cost from p101_price where goods_id = p.' +
        'id1 and flag = 0) pricein'
      'from pmprclst pl'
      ' left join pmprclstitm pi on pi.prclstid = pl.id'
      
        ' left join plnk p on p.id2 = pi.prodcode and p.concept = 0 and p' +
        '.id3 = pl.clientid'
      ' left join lib l1 on l1.lid = p.id1'
      ' left join lib l2 on l2.lid = l1.lid3'
      ' left join lib l3 on l3.lid = l2.lid1'
      'where(  pl.id = :id'
      '  and pi.id is not null'
      '  @@f1@'
      '     ) and (     PI.ID = :OLD_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select pi.*,'
      '  l1.lid ourproductid, '
      '  l1.ltext1 ourarticle, '
      '  l1.lname ourprodname, '
      '  l2.lname ourplant, '
      '  l3.lname ourcountry,'
      
        '  (select first 1 prime_cost from p101_price where goods_id = p.' +
        'id1 and flag = 0) pricein'
      'from pmprclst pl'
      ' left join pmprclstitm pi on pi.prclstid = pl.id'
      
        ' left join plnk p on p.id2 = pi.prodcode and p.concept = 0 and p' +
        '.id3 = pl.clientid'
      ' left join lib l1 on l1.lid = p.id1'
      ' left join lib l2 on l2.lid = l1.lid3'
      ' left join lib l3 on l3.lid = l2.lid1'
      'where pl.id = :id'
      '  and pi.id is not null'
      '  @@f1@'
      'order by pi.prodname')
    Transaction = DM1.trRead
    Database = DM1.pFIBDatabase1
    UpdateTransaction = DM1.trWrite
    RefreshTransactionKind = tkUpdateTransaction
    DataSource = ds1
    Left = 236
    Top = 112
    object q2ID: TFIBIntegerField
      FieldName = 'ID'
    end
    object q2PRCLSTID: TFIBIntegerField
      FieldName = 'PRCLSTID'
    end
    object q2PRODCODE: TFIBIntegerField
      FieldName = 'PRODCODE'
    end
    object q2PRODNAME: TFIBStringField
      FieldName = 'PRODNAME'
      Size = 120
      EmptyStrToNull = True
    end
    object q2PLANT: TFIBStringField
      FieldName = 'PLANT'
      Size = 80
      EmptyStrToNull = True
    end
    object q2COUNTRY: TFIBStringField
      FieldName = 'COUNTRY'
      Size = 80
      EmptyStrToNull = True
    end
    object q2NUM: TFIBIntegerField
      FieldName = 'NUM'
    end
    object q2BPRICE: TFIBFloatField
      FieldName = 'BPRICE'
      DisplayFormat = '0.00'
    end
    object q2NDS: TFIBFloatField
      FieldName = 'NDS'
      DisplayFormat = '0'
    end
    object q2TDATEEND: TFIBStringField
      FieldName = 'TDATEEND'
      Size = 10
      EmptyStrToNull = True
    end
    object q2DATEEND: TFIBDateTimeField
      Alignment = taRightJustify
      FieldName = 'DATEEND'
      DisplayFormat = 'dd.mm.yy'
    end
    object q2OURPRODUCTID: TFIBIntegerField
      FieldName = 'OURPRODUCTID'
    end
    object q2OURARTICLE: TFIBStringField
      FieldName = 'OURARTICLE'
      Size = 30
      EmptyStrToNull = True
    end
    object q2OURPRODNAME: TFIBStringField
      FieldName = 'OURPRODNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object q2OURPLANT: TFIBStringField
      FieldName = 'OURPLANT'
      Size = 80
      EmptyStrToNull = True
    end
    object q2OURCOUNTRY: TFIBStringField
      FieldName = 'OURCOUNTRY'
      Size = 80
      EmptyStrToNull = True
    end
    object q2BARCODE: TFIBStringField
      FieldName = 'BARCODE'
      EmptyStrToNull = True
    end
    object q2PACKING: TFIBIntegerField
      FieldName = 'PACKING'
    end
    object q2PRICEIN: TFIBFloatField
      FieldName = 'PRICEIN'
      DisplayFormat = '0.00'
    end
  end
  object ds2: TDataSource
    DataSet = q2
    Left = 268
    Top = 112
  end
  object TBXPopupMenu2: TTBXPopupMenu
    Left = 248
    Top = 256
    object TBXItem17: TTBXItem
      Action = acLink2
    end
    object TBXItem16: TTBXItem
      Action = acExec2
    end
    object TBXItem19: TTBXItem
      Action = acUnLink2
    end
    object TBXItem5: TTBXItem
      Action = acImpPrc1
    end
    object TBXItem21: TTBXItem
      Action = acImpPrc2
    end
    object TBXSeparatorItem4: TTBXSeparatorItem
    end
    object TBXItem7: TTBXItem
      Action = acRefresh2
    end
    object TBXItem13: TTBXItem
      Action = acCopy1
    end
  end
  object q3: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select l1.lid productid, l1.lcode barcode, l1.ltext1 article, l1' +
        '.lname prodname, l2.lname plant, l3.lname country, l1.lnum5 nds'
      'from lib l1 '
      ' left join lib l2 on l2.lid = l1.lid3'
      ' left join lib l3 on l3.lid = l2.lid1'
      'where l1.lconcept = 800'
      '  and l1.lflag in (7,8)'
      '  @@f1@'
      'order by l1.lname, l2.lname'
      ''
      '')
    Transaction = DM1.trRead
    Database = DM1.pFIBDatabase1
    UpdateTransaction = DM1.trWrite
    SQLScreenCursor = crSQLWait
    RefreshTransactionKind = tkUpdateTransaction
    Left = 368
    Top = 112
    poSQLINT64ToBCD = True
    object q3ARTICLE: TFIBStringField
      DisplayLabel = #1040#1088#1090#1080#1082#1091#1083
      DisplayWidth = 8
      FieldName = 'ARTICLE'
      Size = 30
      EmptyStrToNull = True
    end
    object q3PRODNAME: TFIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'PRODNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object q3PLANT: TFIBStringField
      DisplayLabel = #1048#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'PLANT'
      Size = 80
      EmptyStrToNull = True
    end
    object q3COUNTRY: TFIBStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      DisplayWidth = 20
      FieldName = 'COUNTRY'
      Size = 80
      EmptyStrToNull = True
    end
    object q3PRODUCTID: TFIBIntegerField
      FieldName = 'PRODUCTID'
    end
    object q3BARCODE: TFIBStringField
      DisplayLabel = #1064#1090#1088#1080#1093'-'#1082#1086#1076
      DisplayWidth = 15
      FieldName = 'BARCODE'
      EmptyStrToNull = True
    end
    object q3NDS: TFIBFloatField
      DisplayLabel = #1053#1044#1057
      DisplayWidth = 5
      FieldName = 'NDS'
      DisplayFormat = '0'
    end
  end
  object ds3: TDataSource
    DataSet = q3
    Left = 400
    Top = 112
  end
  object spSetLink1: TpFIBStoredProc
    Transaction = DM1.trWrite
    Database = DM1.pFIBDatabase1
    SQL.Strings = (
      
        'EXECUTE PROCEDURE PMTWCLNSTAT84A (?CLIENTID, ?PRODUCTID, ?CODE, ' +
        '?CONCEPT)')
    StoredProcName = 'PMTWCLNSTAT84A'
    Left = 428
    Top = 114
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object TBXPopupMenu3: TTBXPopupMenu
    Left = 288
    Top = 256
    object TBXItem6: TTBXItem
      Action = acLink3
    end
    object TBXSeparatorItem3: TTBXSeparatorItem
    end
    object TBXItem9: TTBXItem
      Action = acRefresh3
    end
    object TBXItem14: TTBXItem
      Action = acCopy1
    end
  end
  object q4: TpFIBDataSet
    RefreshSQL.Strings = (
      
        'select l1.lid productid, l1.lcode barcode, l1.ltext1 article, l1' +
        '.lname prodname, l2.lname plant, l3.lname country, l1.lnum5 nds,' +
        ' e.eid, e.enum12 zakaz, pli.prodname pprodname, pli.plant pplant' +
        ', pli.num, pli.bprice, pli.dateend, pli.packing, p.id2 prodcode'
      'from lin e'
      ' left join lib l1 on l1.lid = e.eid1'
      ' left join lib l2 on l2.lid = l1.lid3'
      ' left join lib l3 on l3.lid = l2.lid1'
      ' left join pmprclst pl on pl.id = :id'
      
        ' left join plnk p on p.id1 = e.eid1 and p.concept = 0 and p.id3 ' +
        '= pl.clientid'
      
        ' left join pmprclstitm pli on pli.prclstid = pl.id and pli.prodc' +
        'ode = p.id2'
      'where(  e.eiddoc = :docid'
      '     ) and (     E.EID = :OLD_EID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select l1.lid productid, l1.lcode barcode, l1.ltext1 article, l1' +
        '.lname prodname, l2.lname plant, l3.lname country, l1.lnum5 nds,' +
        ' e.eid, e.enum12 zakaz, pli.prodname pprodname, pli.plant pplant' +
        ', pli.num, pli.bprice, pli.dateend, pli.packing, p.id2 prodcode'
      'from lin e'
      ' left join lib l1 on l1.lid = e.eid1'
      ' left join lib l2 on l2.lid = l1.lid3'
      ' left join lib l3 on l3.lid = l2.lid1'
      ' left join pmprclst pl on pl.id = :id'
      
        ' left join plnk p on p.id1 = e.eid1 and p.concept = 0 and p.id3 ' +
        '= pl.clientid'
      
        ' left join pmprclstitm pli on pli.prclstid = pl.id and pli.prodc' +
        'ode = p.id2'
      'where e.eiddoc = :docid'
      'order by l1.lname, l2.lname')
    Transaction = DM1.trRead
    Database = DM1.pFIBDatabase1
    UpdateTransaction = DM1.trWrite
    SQLScreenCursor = crSQLWait
    RefreshTransactionKind = tkUpdateTransaction
    DataSource = ds1
    Left = 496
    Top = 112
    poSQLINT64ToBCD = True
    object q4ARTICLE: TFIBStringField
      DisplayLabel = #1040#1088#1090#1080#1082#1091#1083
      DisplayWidth = 8
      FieldName = 'ARTICLE'
      Size = 30
      EmptyStrToNull = True
    end
    object q4PRODNAME: TFIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'PRODNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object q4PLANT: TFIBStringField
      DisplayLabel = #1048#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'PLANT'
      Size = 80
      EmptyStrToNull = True
    end
    object q4COUNTRY: TFIBStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      DisplayWidth = 20
      FieldName = 'COUNTRY'
      Size = 80
      EmptyStrToNull = True
    end
    object q4PRODUCTID: TFIBIntegerField
      FieldName = 'PRODUCTID'
      Visible = False
    end
    object q4BARCODE: TFIBStringField
      DisplayLabel = #1064#1090#1088#1080#1093'-'#1082#1086#1076
      DisplayWidth = 15
      FieldName = 'BARCODE'
      EmptyStrToNull = True
    end
    object q4NDS: TFIBFloatField
      DefaultExpression = '0'
      DisplayLabel = #1053#1044#1057
      DisplayWidth = 5
      FieldName = 'NDS'
      DisplayFormat = '0'
      EditFormat = '0.0000'
    end
    object q4EID: TFIBIntegerField
      FieldName = 'EID'
    end
    object q4ZAKAZ: TFIBFloatField
      DefaultExpression = '0'
      DisplayLabel = #1047#1072#1082#1072#1079#1072#1085#1086
      FieldName = 'ZAKAZ'
      DisplayFormat = '0'
      EditFormat = '0.0000'
    end
    object q4NUM: TFIBIntegerField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'NUM'
      DisplayFormat = '0'
    end
    object q4BPRICE: TFIBFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'BPRICE'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object q4DATEEND: TFIBDateTimeField
      DisplayLabel = #1057#1088#1086#1082' '#1075#1086#1076#1085'.'
      DisplayWidth = 10
      FieldName = 'DATEEND'
      DisplayFormat = 'dd.mm.yy'
    end
    object q4PRODCODE: TFIBIntegerField
      FieldName = 'PRODCODE'
    end
    object q4PPRODNAME: TFIBStringField
      FieldName = 'PPRODNAME'
      Size = 120
      EmptyStrToNull = True
    end
    object q4PPLANT: TFIBStringField
      FieldName = 'PPLANT'
      Size = 80
      EmptyStrToNull = True
    end
    object q4PACKING: TFIBIntegerField
      DisplayLabel = #1060#1072#1089#1086#1074#1082#1072
      DisplayWidth = 5
      FieldName = 'PACKING'
    end
  end
  object ds4: TDataSource
    DataSet = q4
    Left = 528
    Top = 112
  end
  object TBXPopupMenu4: TTBXPopupMenu
    Left = 328
    Top = 256
    object TBXItem10: TTBXItem
      Action = acExec4
    end
    object TBXItem18: TTBXItem
      Action = acUnLink4
    end
    object TBXItem20: TTBXItem
      Action = acExpOrder1
    end
    object TBXItem24: TTBXItem
      Action = acExport1
    end
    object TBXSeparatorItem5: TTBXSeparatorItem
    end
    object TBXItem11: TTBXItem
      Action = acRefresh3
    end
    object TBXItem15: TTBXItem
      Action = acCopy1
    end
  end
  object spSetLink2: TpFIBStoredProc
    Transaction = DM1.trWrite
    Database = DM1.pFIBDatabase1
    SQL.Strings = (
      
        'EXECUTE PROCEDURE PMTWCLNSTAT84B (?CLIENTID, ?PRODUCTID, ?CODE, ' +
        '?CONCEPT)')
    StoredProcName = 'PMTWCLNSTAT84B'
    Left = 300
    Top = 114
    qoAutoCommit = True
    qoStartTransaction = True
  end
end
