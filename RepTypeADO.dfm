object fRepTypeADO1: TfRepTypeADO1
  Left = 416
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1058#1080#1087' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 196
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AvEhGrid1: TAvEhGrid
    Left = 8
    Top = 8
    Width = 209
    Height = 179
    Align = alCustom
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstAll]
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dsRepTypeADO1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    HorzScrollBar.Visible = False
    Options = [dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth]
    PopupMenu = PopupMenu1
    RowHeight = 17
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 15
    OnDblClick = AvEhGrid1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
      end>
  end
  object dsRepTypeADO1: TDataSource
    DataSet = qRepTypeADO1
    Left = 152
    Top = 16
  end
  object ActionList1: TActionList
    Left = 48
    Top = 32
    object acSelect1: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = acSelect1Execute
      OnUpdate = acSelect1Update
    end
    object acEscape1: TAction
      Caption = 'acEscape1'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 32
    object N1: TMenuItem
      Action = acSelect1
      Default = True
      ShortCut = 13
    end
  end
  object qRepTypeADO1: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from taRepType')
    Left = 104
    Top = 24
  end
end
