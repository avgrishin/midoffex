object MainForm: TMainForm
  Left = 300
  Top = 173
  Width = 825
  Height = 643
  Caption = #1059#1050' '#1059#1088#1072#1083#1057#1080#1073
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 585
    Width = 809
    Height = 19
    Panels = <
      item
        Text = #1042#1099#1076#1077#1083#1077#1085#1086' 0 '#1089#1090#1088#1086#1082
        Width = 50
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object TBXDock1: TTBXDock
    Left = 0
    Top = 559
    Width = 809
    Height = 26
    Position = dpBottom
    object TBXToolbar1: TTBXToolbar
      Left = 0
      Top = 0
      Align = alClient
      AutoResize = False
      BorderStyle = bsNone
      Caption = 'TBXToolbar1'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object TBXMDIWindowItem1: TTBXMDIWindowItem
      end
    end
  end
  object TBXDock2: TTBXDock
    Left = 0
    Top = 0
    Width = 809
    Height = 25
    object TBXToolbar2: TTBXToolbar
      Left = 0
      Top = 0
      Caption = 'TBXToolbar2'
      CloseButton = False
      FullSize = True
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBXSubmenuItem1: TTBXSubmenuItem
        Caption = '&'#1060#1072#1081#1083
        object TBXItem17: TTBXItem
          Action = acClose1
        end
      end
      object TBXSubmenuItem2: TTBXSubmenuItem
        Caption = '&'#1054#1087#1077#1088#1072#1094#1080#1080
        object TBXItem23: TTBXItem
          Action = acReport1
        end
        object TBXItem4: TTBXItem
          Action = acReportA1
        end
        object TBXItem5: TTBXItem
          Action = acMyForm1
        end
        object TBXItem6: TTBXItem
          Action = acRep1
        end
        object TBXItem7: TTBXItem
          Action = acEmail1
        end
        object TBXItem8: TTBXItem
          Action = acAddOption1
        end
        object TBXItem9: TTBXItem
          Action = acEMailTest
        end
      end
      object TBXSubmenuItem3: TTBXSubmenuItem
        Caption = '&'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
        object TBXItem38: TTBXItem
          Action = acTest
        end
      end
      object TBXSubmenuItem5: TTBXSubmenuItem
        Caption = #1054'&'#1082#1085#1072
        object TBXItem3: TTBXItem
          Caption = #1050#1072#1089#1082#1072#1076
          OnClick = acCascade1Execute
        end
        object TBXItem2: TTBXItem
          Caption = #1063#1077#1088#1077#1087#1080#1094#1072
          OnClick = acTile1Execute
        end
        object TBXSeparatorItem1: TTBXSeparatorItem
        end
        object TBXMDIWindowItem2: TTBXMDIWindowItem
        end
      end
      object TBXSubmenuItem6: TTBXSubmenuItem
        Caption = '&?'
        object TBXItem1: TTBXItem
          Action = acAbout1
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083' (*.txt)|*.txt'
    Left = 288
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083' (*.txt)|*.txt'
    Left = 328
    Top = 168
  end
  object TBXMDIHandler1: TTBXMDIHandler
    Toolbar = TBXToolbar2
    Left = 528
    Top = 248
  end
  object ActionList1: TActionList
    Left = 432
    Top = 168
    object acClose1: TAction
      Caption = #1042#1099#1093#1086#1076
      ShortCut = 27
      OnExecute = acClose1Execute
    end
    object acRefresh1: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 116
    end
    object acFilter1: TAction
      Caption = #1057#1085#1103#1090#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 1
    end
    object acAbout1: TAction
      Category = '?'
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      OnExecute = acAbout1Execute
    end
    object acReport1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = #1054#1090#1095#1077#1090#1099
      ShortCut = 113
      OnExecute = acReport1Execute
    end
    object acTest: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = 'Test'
    end
    object acReportA1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = #1054#1090#1095#1077#1090#1099' MDI'
      OnExecute = acReportA1Execute
    end
    object acReportB1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = #1054#1090#1095#1077#1090#1099'B'
      OnExecute = acReportB1Execute
    end
    object acMyForm1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = 'acMyForm1'
      OnExecute = acMyForm1Execute
    end
    object acCBonds: TAction
      Caption = 'CBonds'
    end
    object acRep1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = #1050#1083#1080#1077#1085#1090#1089#1082#1080#1081' '#1086#1090#1095#1077#1090
      OnExecute = acRep1Execute
    end
    object acEmail1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = 'Email '#1086#1090#1095#1077#1090
      OnExecute = acEmail1Execute
    end
    object acAddOption1: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1054#1087#1094#1080#1086#1085
      ShortCut = 114
      OnExecute = acAddOption1Execute
    end
    object acEMailTest: TAction
      Category = #1054#1087#1077#1088#1072#1094#1080#1080
      Caption = 'Test EMail'
      OnExecute = acEMailTestExecute
    end
  end
  object acDocsTW1: TAction
    Category = 'TW4'
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'm.am-uralsib.ru'
    Port = 25
    AuthenticationType = atNone
    Left = 144
    Top = 96
  end
end
