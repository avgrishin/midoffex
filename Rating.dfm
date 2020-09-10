object fRating: TfRating
  Left = 268
  Top = 183
  Width = 870
  Height = 640
  Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1101#1084#1080#1090#1077#1085#1090#1086#1074
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
    Width = 854
    Height = 601
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1069#1084#1080#1090#1077#1085#1090#1099
      OnEnter = TabSheet1Enter
      OnExit = TabSheet1Exit
      object AvEhGrid1: TAvEhGrid
        Left = 0
        Top = 0
        Width = 846
        Height = 573
        Align = alClient
        AllowedOperations = []
        AllowedSelections = [gstRecordBookmarks, gstAll]
        AutoFitColWidths = True
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
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
        PopupMenu = TBXPopupMenu1
        RowHeight = 17
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 15
        OnDblClick = AvEhGrid1DblClick
        OptionsAv = [aegFilter]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NameBrief'
            Footers = <>
            Title.Caption = #1069#1084#1080#1090#1077#1085#1090
          end
          item
            EditButtons = <>
            FieldName = 'Name'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          end
          item
            EditButtons = <>
            FieldName = 'LName'
            Footers = <>
            Title.Caption = #1069#1084#1080#1090#1077#1085#1090' '#1080#1079' '#1088#1077#1081#1090#1080#1085#1075#1072
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1081#1090#1080#1085#1075
      ImageIndex = 1
      OnEnter = TabSheet2Enter
      OnExit = TabSheet2Exit
      object TBXDock3: TTBXDock
        Left = 0
        Top = 0
        Width = 846
        Height = 17
        object TBXToolbar3: TTBXToolbar
          Left = 0
          Top = 0
          Caption = 'TBXToolbar3'
          TabOrder = 0
          object TBControlItem1: TTBControlItem
            Control = DBText1
          end
          object TBXSeparatorItem1: TTBXSeparatorItem
            Blank = True
          end
          object TBControlItem2: TTBControlItem
            Control = DBText2
          end
          object DBText1: TDBText
            Left = 0
            Top = 0
            Width = 50
            Height = 13
            AutoSize = True
            DataField = 'NameBrief'
            DataSource = ds1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object DBText2: TDBText
            Left = 56
            Top = 0
            Width = 50
            Height = 13
            AutoSize = True
            DataField = 'Name'
            DataSource = ds1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
      end
      object AvEhGrid2: TAvEhGrid
        Left = 0
        Top = 17
        Width = 846
        Height = 556
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
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
        PopupMenu = TBXPopupMenu2
        RowHeight = 17
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleHeight = 15
        OnDblClick = AvEhGrid2DblClick
        OptionsAv = [aegFilter]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'LName'
            Footers = <>
            Title.Caption = #1069#1084#1080#1090#1077#1085#1090#1099' '#1080#1079' '#1088#1077#1081#1090#1080#1085#1075#1086#1074
          end>
      end
    end
  end
  object q1: TMSQuery
    SQLUpdate.Strings = (
      'UPDATE taLib'
      'SET'
      '  LID1 = :LID1'
      'WHERE'
      '  LID = :LID')
    SQLRefresh.Strings = (
      'select fi.FinancialInstitutionID, fi.NameBrief, l.LName'
      'from tFinancialInstitution fi'
      
        ' left join taLib l on l.lid1 = fi.FinancialInstitutionID and l.l' +
        'concept = 2'
      'where fi.FinancialInstitutionID = :FinancialInstitutionID')
    Connection = DM1.MSConnection1
    SQL.Strings = (
      
        'select fi.FinancialInstitutionID, fi.Name, fi.NameBrief, l.lid, ' +
        'l.lid1, l.LName'
      'from tFinancialInstitution fi'
      
        ' left join taLib l on l.lid1 = fi.FinancialInstitutionID and l.l' +
        'concept = 2'
      'where fi.FinancialInstitutionID in ('
      '  select s.IssuerID'
      '  from tAccount a'
      '   join tAccountBalance ab on ab.AccountID = a.AccountID'
      '   join tSecurity s on s.SecurityID = a.SecurityID'
      '  where ab.BalanceDate = :Date'
      '    and a.TreatyID = :TreatyID)'
      'order by 2')
    RefreshOptions = [roAfterUpdate]
    AfterOpen = q1AfterOpen
    Options.StrictUpdate = False
    Left = 92
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TreatyID'
        ParamType = ptInput
      end>
  end
  object ds1: TDataSource
    DataSet = q1
    Left = 132
    Top = 120
  end
  object q2: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select l.lid, l.LName'
      'from taLib l '
      'where l.lconcept = 2'
      'order by l.LName')
    Options.StrictUpdate = False
    Left = 92
    Top = 160
  end
  object ds2: TDataSource
    DataSet = q2
    Left = 132
    Top = 160
  end
  object ActionList1: TActionList
    Left = 220
    Top = 120
    object acLink1: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072
      OnExecute = acLink1Execute
      OnUpdate = acLink1Update
    end
    object acRefresh1: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh1Execute
    end
    object acRefresh2: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = acRefresh2Execute
    end
    object acExecLink1: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100
      OnExecute = acExecLink1Execute
      OnUpdate = acExecLink1Update
    end
    object acUnLink1: TAction
      Caption = #1054#1090#1074#1103#1079#1072#1090#1100
      OnExecute = acUnLink1Execute
      OnUpdate = acUnLink1Update
    end
    object acCopy1: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnExecute = acCopy1Execute
    end
    object acCopy2: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnExecute = acCopy2Execute
    end
  end
  object TBXPopupMenu1: TTBXPopupMenu
    Left = 172
    Top = 120
    object TBXItem1: TTBXItem
      Action = acLink1
      ShortCut = 13
    end
    object TBXItem5: TTBXItem
      Action = acUnLink1
    end
    object TBXItem2: TTBXItem
      Action = acRefresh1
    end
    object TBXItem6: TTBXItem
      Action = acCopy1
    end
  end
  object TBXPopupMenu2: TTBXPopupMenu
    Left = 172
    Top = 160
    object TBXItem3: TTBXItem
      Action = acExecLink1
    end
    object TBXItem4: TTBXItem
      Action = acRefresh2
    end
    object TBXItem7: TTBXItem
      Action = acCopy2
    end
  end
end
