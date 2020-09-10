inherited fReports1: TfReports1
  Left = 333
  Top = 123
  Height = 600
  ActiveControl = AvEhGrid1
  Caption = #1054#1090#1095#1077#1090#1099
  PopupMenu = nil
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 153
    Top = 10
    Height = 563
  end
  inherited AvEhGrid1: TAvEhGrid
    Left = 156
    Width = 532
    Height = 563
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
    PopupMenu = TBXPopupMenu1
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
      end>
  end
  object TreeView1: TTreeView [2]
    Left = 0
    Top = 10
    Width = 153
    Height = 563
    Align = alLeft
    Indent = 19
    PopupMenu = TBXPopupMenu2
    TabOrder = 1
    OnChange = TreeView1Change
    OnDeletion = TreeView1Deletion
    OnExpanding = TreeView1Expanding
  end
  inherited TBXDock2: TTBXDock
    inherited TBXToolbar2: TTBXToolbar
      ParentShowHint = False
      object TBXItem16: TTBXItem [0]
        Action = acExec1
      end
    end
  end
  inherited Panel1: TPanel
    Left = 240
    Top = 344
  end
  inherited q1: TMSQuery
    SQL.Strings = (
      
        'select * from taReports where Hidden = :Hidden and RepTreeID = :' +
        'RepTreeID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Hidden'
      end
      item
        DataType = ftUnknown
        Name = 'RepTreeID'
      end>
  end
  inherited ds1: TDataSource
    Left = 296
    Top = 176
  end
  inherited ActionList1: TActionList
    inherited acExec1: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 8
      ShortCut = 13
    end
    object acDesign: TAction
      Caption = #1044#1080#1079#1072#1081#1085' '#1086#1090#1095#1077#1090#1072
      ShortCut = 113
      OnExecute = acDesignExecute
      OnUpdate = acDesignUpdate
    end
    object acInsert1: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
      OnExecute = acInsert1Execute
    end
    object acChange1: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = acChange1Execute
      OnUpdate = acChange1Update
    end
    object acDelete1: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDelete1Execute
      OnUpdate = acDelete1Update
    end
    object acInsert2: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acInsert2Execute
    end
    object acChange2: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = acChange2Execute
      OnUpdate = acChange2Update
    end
    object acDelete2: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDelete2Execute
      OnUpdate = acDelete2Update
    end
    object acInsert3: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acInsert3Execute
      OnUpdate = acInsert3Update
    end
    object acHidden1: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1082#1088#1099#1090#1099#1077
      OnExecute = acHidden1Execute
      OnUpdate = acHidden1Update
    end
  end
  inherited TBXPopupMenu1: TTBXPopupMenu
    Left = 408
    Top = 104
    object TBXItem9: TTBXItem [2]
      Action = acInsert1
    end
    object TBXItem10: TTBXItem [3]
      Action = acChange1
    end
    object TBXItem11: TTBXItem [4]
      Action = acDelete1
      ShortCut = 16430
    end
    object TBXItem8: TTBXItem [5]
      Action = acDesign
    end
    object TBXSeparatorItem2: TTBXSeparatorItem [6]
    end
    inherited TBXItem1: TTBXItem [7]
    end
    inherited TBXItem6: TTBXItem [8]
    end
    inherited TBXItem2: TTBXItem [9]
    end
    inherited TBXItem7: TTBXItem [10]
    end
    object TBXItem15: TTBXItem
      Action = acHidden1
    end
  end
  inherited FormPlacement1: TFormPlacement
    Options = [fpPosition]
  end
  object frxReport1: TfrxReport
    Version = '4.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38658.510813611110000000
    ReportOptions.LastChange = 38658.510813611110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnUserFunction = frxReport1UserFunction
    Left = 416
    Top = 256
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    Left = 472
    Top = 256
  end
  object TBXPopupMenu2: TTBXPopupMenu
    Left = 48
    Top = 320
    object TBXItem12: TTBXItem
      Action = acInsert2
      ShortCut = 45
    end
    object TBXItem14: TTBXItem
      Action = acChange2
      ShortCut = 16397
    end
    object TBXSeparatorItem3: TTBXSeparatorItem
    end
    object TBXItem13: TTBXItem
      Action = acDelete2
      ShortCut = 16430
    end
  end
  object XmlDoc1: TFreeThreadedDOMDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 360
    Top = 176
  end
  object frxXLSExport1: TfrxXLSExport
    FileName = 'c:\tmp\file'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 528
    Top = 256
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 584
    Top = 256
  end
  object frxBDEComponents1: TfrxBDEComponents
    DefaultSession = 'Default'
    Left = 408
    Top = 176
  end
  object qRepTree1: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select * from taRepTree where ParentID = :ParentID'
      'order by Name')
    Left = 48
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ParentID'
      end>
  end
end
