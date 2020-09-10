object fTableADO: TfTableADO
  Left = 295
  Top = 274
  Width = 696
  Height = 480
  Caption = 'fTableADO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = TBXPopupMenu1
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AvEhGrid1: TAvEhGrid
    Left = 0
    Top = 26
    Width = 680
    Height = 415
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
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove]
    RowHeight = 17
    SortLocal = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 24
    OnDblClick = AvEhGrid1DblClick
    OnKeyDown = AvEhGrid1KeyDown
    OptionsAv = [aegFilter]
  end
  object TBXDock2: TTBXDock
    Left = 0
    Top = 0
    Width = 680
    Height = 26
    object TBXToolbar2: TTBXToolbar
      Left = 0
      Top = 0
      Caption = 'TBXToolbar1'
      Images = DM1.ImageList1
      TabOrder = 0
      object TBXItem3: TTBXItem
        Action = acRefresh1
      end
      object TBXItem4: TTBXItem
        Action = acFilter1
      end
    end
  end
  object Panel1: TPanel
    Left = 496
    Top = 400
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 3
    Visible = False
  end
  object q1: TADOQuery
    Connection = DM1.ADOConnection1
    CommandTimeout = 600
    Parameters = <>
    Left = 32
    Top = 136
  end
  object ds1: TDataSource
    DataSet = q1
    Left = 64
    Top = 136
  end
  object ActionList1: TActionList
    Images = DM1.ImageList1
    Left = 376
    Top = 104
    object acRefresh1: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 116
      OnExecute = acRefresh1Execute
    end
    object acFilter1: TAction
      Caption = #1057#1085#1103#1090#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      Hint = #1057#1085#1103#1090#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 1
      OnExecute = acFilter1Execute
      OnUpdate = acFilter1Update
    end
    object acExec1: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = acExec1Execute
      OnUpdate = acExec1Update
    end
    object acEscape1: TAction
      Caption = 'acEscape1'
      ShortCut = 27
      OnExecute = acEscape1Execute
    end
    object acExcel1: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 3
      OnExecute = acExcel1Execute
    end
    object acCopy1: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16451
      OnExecute = acCopy1Execute
    end
    object acSearch1: TAction
      Caption = #1055#1086#1080#1089#1082
      ShortCut = 16455
      OnExecute = acSearch1Execute
    end
    object acIncSearch1: TAction
      Caption = #1056#1077#1078#1080#1084' '#1087#1086#1080#1089#1082#1072
      ShortCut = 16454
      OnExecute = acIncSearch1Execute
    end
  end
  object TBXPopupMenu1: TTBXPopupMenu
    Images = DM1.ImageList1
    Left = 144
    Top = 256
    object miSelect: TTBXItem
      Action = acExec1
    end
    object TBXSeparatorItem1: TTBXSeparatorItem
    end
    object TBXItem18: TTBXItem
      Action = acIncSearch1
    end
    object TBXItem17: TTBXItem
      Action = acSearch1
    end
    object TBXItem2: TTBXItem
      Action = acFilter1
    end
    object TBXItem1: TTBXItem
      Action = acRefresh1
    end
    object TBXItem7: TTBXItem
      Action = acCopy1
    end
    object TBXItem6: TTBXItem
      Action = acExcel1
    end
  end
  object FormPlacement1: TFormPlacement
    Active = False
    Left = 184
    Top = 88
  end
end
