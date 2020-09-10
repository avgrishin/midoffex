inherited fReportCADO7: TfReportCADO7
  Left = 664
  Top = 203
  Width = 580
  Height = 524
  BorderStyle = bsSizeable
  Caption = 'fReportC7'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label2: TLabel
    Width = 32
    Caption = #1060#1072#1081#1083':'
  end
  inherited Button1: TButton
    Top = 456
    TabOrder = 8
  end
  inherited Button2: TButton
    Top = 456
    TabOrder = 9
  end
  inherited DBCheckBox1: TDBCheckBox
    Top = 176
  end
  inherited rgOrientation1: TDBRadioGroup
    Top = 136
    Width = 169
    Height = 41
    Columns = 2
  end
  object DBMemo1: TDBMemo [14]
    Left = 16
    Top = 200
    Width = 537
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'REPDATA'
    DataSource = dsReportCADO1
    PopupMenu = TBXPopupMenu1
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object TBXPopupMenu1: TTBXPopupMenu
    Left = 232
    Top = 256
    object TBXItem1: TTBXItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1105
      ShortCut = 16449
      OnClick = TBXItem1Click
    end
  end
end
