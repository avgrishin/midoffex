inherited fReportsADO1: TfReportsADO1
  Left = 423
  Top = 167
  Height = 600
  Caption = #1054#1090#1095#1077#1090#1099
  PopupMenu = nil
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 153
    Top = 26
    Height = 535
  end
  inherited AvEhGrid1: TAvEhGrid
    Left = 156
    Width = 524
    Height = 535
    EditActions = [geaCopyEh, geaSelectAllEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = TBXPopupMenu1
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end>
  end
  object TreeView1: TTreeView [2]
    Left = 0
    Top = 26
    Width = 153
    Height = 535
    Align = alLeft
    Images = DM1.Small
    Indent = 19
    PopupMenu = TBXPopupMenu2
    TabOrder = 1
    OnChange = TreeView1Change
    OnContextPopup = TreeView1ContextPopup
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
  inherited q1: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Hidden'
        Attributes = [paNullable]
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'RepTreeID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select r.ReportID, r.Name, r.RepTypeID'
      'from taReports r'
      'where Hidden in (:Hidden, 0) and RepTreeID = :RepTreeID'
      'order by r.Name')
    Left = 264
    Top = 176
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
    object acDesign: TAction [6]
      Caption = #1044#1080#1079#1072#1081#1085' '#1086#1090#1095#1077#1090#1072
      ShortCut = 113
      OnExecute = acDesignExecute
      OnUpdate = acDesignUpdate
    end
    object acInsert1: TAction [7]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
      OnExecute = acInsert1Execute
    end
    object acChange1: TAction [8]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = acChange1Execute
      OnUpdate = acChange1Update
    end
    object acInsert3: TAction [9]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1087#1080#1102
      OnExecute = acInsert3Execute
      OnUpdate = acInsert3Update
    end
    object acDelete1: TAction [10]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDelete1Execute
      OnUpdate = acDelete1Update
    end
    object acInsert2: TAction [11]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acInsert2Execute
    end
    object acChange2: TAction [12]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = acChange2Execute
      OnUpdate = acChange2Update
    end
    object acDelete2: TAction [13]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDelete2Execute
      OnUpdate = acDelete2Update
    end
    object acHidden1: TAction [14]
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
    object TBXItem5: TTBXItem [3]
      Action = acInsert3
    end
    object TBXItem10: TTBXItem [4]
      Action = acChange1
    end
    object TBXItem11: TTBXItem [5]
      Action = acDelete1
      ShortCut = 16430
    end
    object TBXItem8: TTBXItem [6]
      Action = acDesign
    end
    object TBXSeparatorItem2: TTBXSeparatorItem [7]
    end
    inherited TBXItem1: TTBXItem [10]
    end
    inherited TBXItem6: TTBXItem [11]
    end
    inherited TBXItem2: TTBXItem [12]
    end
    inherited TBXItem7: TTBXItem [13]
    end
    object TBXItem15: TTBXItem
      Action = acHidden1
    end
  end
  inherited FormPlacement1: TFormPlacement
    Options = [fpPosition]
  end
  object frxReport1: TfrxReport
    Version = '4.9.38'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
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
    Restrictions = [drDontSaveReport]
    RTLLanguage = False
    MemoParentFont = False
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
  object qRepTree1: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ParentID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from taRepTree where ParentID = :ParentID order by Name')
    Left = 48
    Top = 264
  end
  object sp1: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <>
    Left = 456
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = DM1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DATE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'PORTFOLIOID3'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @d smalldatetime set @d=cast(:DATE as smalldatetime) sel' +
        'ect Name, @d d  from tPortfolio where PortfolioID = :PORTFOLIOID' +
        '3')
    Left = 512
    Top = 104
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 624
    Top = 256
  end
  object frxADOComponents1: TfrxADOComponents
    DefaultDatabase = DM1.ADOConnection1
    Left = 456
    Top = 176
  end
  object frxChartObject1: TfrxChartObject
    Left = 368
    Top = 256
  end
  object fsFormsRTTI1: TfsFormsRTTI
    Left = 416
    Top = 296
  end
  object q2: TADOQuery
    Connection = DM1.ADOConnection1
    Parameters = <
      item
        Name = 'ReportID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from taReports where ReportID = :ReportID')
    Left = 264
    Top = 216
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = IdSMTP1Disconnected
    Host = 'm.am-uralsib.ru'
    OnConnected = IdSMTP1Connected
    Port = 25
    AuthenticationType = atNone
    Password = 'Bpgjldsgjldthnf77!'
    Username = 'techadmin'
    Left = 568
    Top = 104
  end
end
