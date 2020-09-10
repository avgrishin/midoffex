inherited fReportCADO3: TfReportCADO3
  Left = 207
  Top = 196
  Height = 530
  BorderStyle = bsSizeable
  Caption = 'fReportCADO3'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label2: TLabel
    Width = 32
    Caption = #1060#1072#1081#1083':'
  end
  inherited Button1: TButton
    Top = 464
    TabOrder = 8
  end
  inherited Button2: TButton
    Top = 464
    TabOrder = 9
  end
  inherited DBCheckBox1: TDBCheckBox
    Left = 416
    Top = 152
    TabOrder = 6
  end
  inherited rgOrientation1: TDBRadioGroup
    Width = 177
    Height = 41
    Columns = 2
    TabOrder = 5
    Visible = False
  end
  object DBMemo1: TDBMemo [14]
    Left = 16
    Top = 200
    Width = 537
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'REPDATA'
    DataSource = dsReportCADO1
    PopupMenu = TBXPopupMenu1
    ScrollBars = ssVertical
    TabOrder = 7
  end
  inherited dsReportCADO1: TDataSource
    Left = 512
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
