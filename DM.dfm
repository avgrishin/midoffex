object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 733
  Top = 349
  Height = 349
  Width = 273
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=studio;Persist Security Info=True;U' +
      'ser ID=GrishinAV;Initial Catalog=MiddleOffice;Data Source=assets' +
      'mgr;Application Name=midoff'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ImageList1: TImageList
    Left = 96
    Top = 16
  end
  object Small: TImageList
    Left = 152
    Top = 16
  end
  object TBXSwitcher1: TTBXSwitcher
    Theme = 'OfficeXP'
    Left = 205
    Top = 16
  end
  object MSConnection1: TMSConnection
    Database = 'MiddleOffice'
    Options.PersistSecurityInfo = True
    Options.ApplicationName = 'midoff'
    Options.WorkstationID = 'MOW16-S00039'
    Options.Provider = prSQL
    Username = 'GrishinAV'
    Password = 'studio'
    Server = 'assetsmgr'
    LoginPrompt = False
    Left = 32
    Top = 72
  end
end
