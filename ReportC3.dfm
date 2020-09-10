inherited fReportC3: TfReportC3
  Left = 322
  Top = 207
  Caption = 'fReportC3'
  ClientHeight = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label2: TLabel
    Width = 32
    Caption = #1060#1072#1081#1083':'
  end
  inherited Button1: TButton
    Top = 464
  end
  inherited Button2: TButton
    Top = 464
  end
  inherited DBCheckBox1: TDBCheckBox
    Left = 416
    Top = 152
  end
  inherited rgOrientation1: TDBRadioGroup
    Width = 177
    Height = 41
    Columns = 2
    Visible = False
  end
  object DBMemo1: TDBMemo [14]
    Left = 16
    Top = 200
    Width = 537
    Height = 249
    DataField = 'REPDATA'
    DataSource = dsReportC1
    ScrollBars = ssVertical
    TabOrder = 9
  end
  inherited dsReportC1: TDataSource
    Left = 512
  end
end
