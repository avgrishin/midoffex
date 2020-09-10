inherited fSprav1: TfSprav1
  Left = 498
  Top = 119
  BorderIcons = [biSystemMenu]
  Caption = 'fSprav1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ActionList1: TActionList
    inherited acExec1: TAction
      ShortCut = 13
    end
  end
  inherited FormPlacement1: TFormPlacement
    Active = True
    Options = [fpPosition]
  end
  object qDescr: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select info from taLibDesc where concept = :concept')
    Left = 352
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'concept'
      end>
  end
  object XmlDoc1: TFreeThreadedDOMDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 384
    Top = 192
  end
end
