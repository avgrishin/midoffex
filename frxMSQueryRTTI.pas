unit frxMSQueryRTTI;

interface

implementation

uses fs_iinterpreter, MSAccess;

type
  TFunctions = class(TfsRTTIModule)
  private
  public
    constructor Create(AScript: TfsScript); override;
  end;


{ TFunctions }

constructor TFunctions.Create(AScript: TfsScript);
begin
  inherited Create(AScript);
  with AScript do
  begin
    AddClass(TMSQuery, 'TMSQuery');
  end;
end;

initialization
  fsRTTIModules.Add(TFunctions);

finalization
  if fsRTTIModules <> nil then
    fsRTTIModules.Remove(TFunctions);

end.
