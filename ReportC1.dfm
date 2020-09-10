object fReportC1: TfReportC1
  Left = 290
  Top = 381
  BorderStyle = bsDialog
  Caption = 'fReportC1'
  ClientHeight = 220
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 44
    Height = 13
    Caption = #1050#1072#1090#1072#1083#1086#1075':'
  end
  object Label3: TLabel
    Left = 16
    Top = 16
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 16
    Top = 96
    Width = 62
    Height = 13
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099':'
  end
  object kEnterAsTab1: TkEnterAsTab
    Left = 424
    Top = 0
    Width = 27
    Height = 27
    Caption = 'ET'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 22
    Height = 13
    Caption = #1042#1080#1076':'
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 32
    Width = 537
    Height = 21
    DataField = 'NAME'
    DataSource = dsReportC1
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 72
    Width = 449
    Height = 21
    DataField = 'Path'
    DataSource = dsReportC1
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 16
    Top = 112
    Width = 537
    Height = 21
    DataField = 'PARAMS'
    DataSource = dsReportC1
    TabOrder = 2
  end
  object Button1: TButton
    Left = 392
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 480
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 16
    Top = 152
    Width = 161
    Height = 21
    DropDownCount = 8
    DataField = 'REPTREEID'
    DataSource = dsReportC1
    LookupField = 'RepTreeID'
    LookupDisplay = 'Name'
    LookupSource = dsRepTree1
    TabOrder = 3
  end
  object DBCheckBox1: TDBCheckBox
    Left = 16
    Top = 184
    Width = 57
    Height = 17
    Caption = #1057#1082#1088#1099#1090#1100
    DataField = 'HIDDEN'
    DataSource = dsReportC1
    TabOrder = 6
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object rgOrientation1: TDBRadioGroup
    Left = 200
    Top = 144
    Width = 105
    Height = 65
    Caption = #1054#1088#1080#1077#1085#1090#1072#1094#1080#1103
    DataField = 'ORIENTATION'
    DataSource = dsReportC1
    Items.Strings = (
      #1050#1085#1080#1078#1085#1072#1103
      #1040#1083#1100#1073#1086#1084#1085#1072#1103)
    TabOrder = 7
    Values.Strings = (
      '1'
      '0')
  end
  object btnBrowse1: TButton
    Left = 480
    Top = 72
    Width = 75
    Height = 25
    Caption = #1054#1073#1079#1086#1088
    TabOrder = 8
    OnClick = btnBrowse1Click
  end
  object dsReportC1: TDataSource
    DataSet = q1
    Left = 376
    Top = 152
  end
  object dsRepTree1: TDataSource
    DataSet = qRepTree1
    Left = 104
    Top = 144
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'fr3'
    Filter = 'FastReport 3 (*.fr3)|*.fr3'
    Left = 344
    Top = 72
  end
  object q1: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO taReports'
      
        '  (RepTypeID, Name, Path, Params, RepTreeID, Hidden, Orientation' +
        ', RepData)'
      'VALUES'
      
        '  (:RepTypeID, :Name, :Path, :Params, :RepTreeID, :Hidden, :Orie' +
        'ntation, :RepData)'
      'SET :ReportID = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM taReports'
      'WHERE'
      '  ReportID = :Old_ReportID')
    SQLUpdate.Strings = (
      'UPDATE taReports'
      'SET'
      
        '  RepTypeID = :RepTypeID, Name = :Name, Path = :Path, Params = :' +
        'Params, RepTreeID = :RepTreeID, Hidden = :Hidden, Orientation = ' +
        ':Orientation, RepData = :RepData'
      'WHERE'
      '  ReportID = :Old_ReportID')
    SQLRefresh.Strings = (
      
        'SELECT taReports.RepTypeID, taReports.Name, taReports.Path, taRe' +
        'ports.Params, taReports.RepTreeID, taReports.Hidden, taReports.O' +
        'rientation, taReports.RepData FROM taReports'
      'WHERE'
      '  ReportID = :ReportID')
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select * from taReports where ReportID = :ReportID')
    Left = 344
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ReportID'
      end>
  end
  object qRepTree1: TMSQuery
    Connection = DM1.MSConnection1
    SQL.Strings = (
      'select RepTreeID,'
      ' case when ParentName is null then '#39#39' else ParentName + '#39'.'#39' end'
      '         + Name Name'
      'from taRepTree order by 2')
    Left = 64
    Top = 144
  end
end
