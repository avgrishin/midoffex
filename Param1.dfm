object fParam1: TfParam1
  Left = 358
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
  object qParamValue: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select paramValue'
      'from taParamValue'
      'where paramType = :paramtype'
      '  and ID = :ID '
      '  and Name = :Name'
      '  and UserName = SYSTEM_USER')
    Left = 353
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'paramtype'
      end
      item
        DataType = ftUnknown
        Name = 'ID'
      end
      item
        DataType = ftUnknown
        Name = 'Name'
      end>
    object qParamValueparamValue: TStringField
      FieldName = 'paramValue'
      Size = 50
    end
  end
  object spParamValueUpd: TMSStoredProc
    StoredProcName = 'up_avgSetParamValue'
    Connection = DM1.MSConnection1
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL up_avgSetParamValue (:ParamType, :ID, :Nam' +
        'e, :ParamValue)}')
    Left = 385
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'ParamType'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
        Size = 20
      end
      item
        DataType = ftString
        Name = 'ParamValue'
        ParamType = ptInput
        Size = 120
      end>
  end
  object qParams: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select * from taParams where Name = :Name')
    Left = 321
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
      end>
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
  object qDescr: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select info from pmlibdesc where concept = :concept')
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
