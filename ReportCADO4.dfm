inherited fReportCADO4: TfReportCADO4
  Left = 449
  Top = 233
  Width = 580
  Height = 524
  BorderStyle = bsSizeable
  Caption = 'fReportC4'
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
    Left = 496
    Top = 160
    TabOrder = 6
  end
  inherited rgOrientation1: TDBRadioGroup
    Width = 169
    Height = 41
    Columns = 2
    TabOrder = 5
  end
  object DBMemo1: TDBMemo [14]
    Left = 16
    Top = 200
    Width = 537
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'REPDATA'
    DataSource = dsReportCADO1
    ScrollBars = ssVertical
    TabOrder = 7
  end
  inherited OpenDialog1: TOpenDialog
    Filter = 'Microsoft Word (*.doc)|*.doc'
  end
end
