inherited fReportC7: TfReportC7
  Left = 643
  Top = 208
  Caption = 'fReportC7'
  ClientHeight = 490
  ClientWidth = 572
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label2: TLabel
    Width = 32
    Caption = #1060#1072#1081#1083':'
  end
  inherited Button1: TButton
    Top = 456
  end
  inherited Button2: TButton
    Top = 456
  end
  object DBMemo1: TDBMemo [14]
    Left = 16
    Top = 216
    Width = 537
    Height = 225
    DataField = 'REPDATA'
    DataSource = dsReportC1
    ScrollBars = ssVertical
    TabOrder = 9
  end
end
