object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 839
  Top = 201
  Height = 150
  Width = 215
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=studio;Persist Security Info=True;U' +
      'ser ID=GrishinAV;Initial Catalog=MiddleOffice;Data Source=assets' +
      'mgr;Application Name=midoff'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
end
