object fParamADO1: TfParamADO1
  Left = 412
  Top = 169
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 225
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 184
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 185
    Top = 0
    Width = 241
    Height = 184
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 184
    Width = 426
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object kEnterAsTab1: TkEnterAsTab
      Left = 280
      Top = 8
      Width = 27
      Height = 27
      Caption = 'ET'
    end
    object Button1: TButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object qParamValue: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'paramtype'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'select paramValue'
      'from taParamValue'
      'where paramType = :paramtype'
      '  and ID = :ID '
      '  and Name = :Name'
      '  and UserName = SYSTEM_USER')
    Left = 353
    Top = 160
    object qParamValueparamValue: TStringField
      FieldName = 'paramValue'
      Size = 50
    end
  end
  object spParamValueUpd: TADOStoredProc
    Connection = DM1.ADOConnection1
    ProcedureName = 'up_avgSetParamValue;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ParamType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@ParamValue'
        Attributes = [paNullable]
        DataType = ftString
        Size = 120
        Value = Null
      end>
    Prepared = True
    Left = 385
    Top = 160
  end
  object qParams: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'select * from taParams where Name = :Name')
    Left = 321
    Top = 160
    object qParamsName: TStringField
      FieldName = 'Name'
      Size = 15
    end
    object qParamsPrompt: TStringField
      FieldName = 'Prompt'
      Size = 50
    end
    object qParamsParamType: TWordField
      FieldName = 'ParamType'
    end
    object qParamsRequired: TBooleanField
      FieldName = 'Required'
    end
    object qParamsWidth: TIntegerField
      FieldName = 'Width'
    end
    object qParamsDisplayFormat: TStringField
      FieldName = 'DisplayFormat'
      Size = 10
    end
    object qParamsDropDownCount: TIntegerField
      FieldName = 'DropDownCount'
    end
    object qParamsDropDownWidth: TIntegerField
      FieldName = 'DropDownWidth'
    end
    object qParamsLookupSQL: TStringField
      FieldName = 'LookupSQL'
      Size = 255
    end
    object qParamsLookupField: TStringField
      FieldName = 'LookupField'
      Size = 50
    end
    object qParamsLookupDisplay: TStringField
      FieldName = 'LookupDisplay'
      Size = 50
    end
    object qParamsListsType: TWordField
      FieldName = 'ListsType'
    end
    object qParamsForm: TStringField
      FieldName = 'Form'
      Size = 15
    end
    object qParamsVisible: TBooleanField
      FieldName = 'Visible'
    end
  end
  object qDescr: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'concept'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select info from talibdesc where concept = :concept')
    Left = 352
    Top = 192
  end
  object XmlDoc1: TFreeThreadedDOMDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 384
    Top = 192
  end
end
