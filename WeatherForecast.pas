// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.webservicex.net/WeatherForecast.asmx?WSDL
// Encoding : utf-8
// Codegen  : [wfDebug,wfUseSerializerClassForAttrs]
// Version  : 1.0
// (05.09.2008 10:31:55 - 1.33.2.5)
// ************************************************************************ //

unit WeatherForecast;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:float           - "http://www.w3.org/2001/XMLSchema"

  WeatherData          = class;                 { "http://www.webservicex.net" }
  WeatherForecasts     = class;                 { "http://www.webservicex.net" }



  // ************************************************************************ //
  // Namespace : http://www.webservicex.net
  // ************************************************************************ //
  WeatherData = class(TRemotable)
  private
    FDay: WideString;
    FWeatherImage: WideString;
    FMaxTemperatureF: WideString;
    FMinTemperatureF: WideString;
    FMaxTemperatureC: WideString;
    FMinTemperatureC: WideString;
  published
    property Day: WideString read FDay write FDay;
    property WeatherImage: WideString read FWeatherImage write FWeatherImage;
    property MaxTemperatureF: WideString read FMaxTemperatureF write FMaxTemperatureF;
    property MinTemperatureF: WideString read FMinTemperatureF write FMinTemperatureF;
    property MaxTemperatureC: WideString read FMaxTemperatureC write FMaxTemperatureC;
    property MinTemperatureC: WideString read FMinTemperatureC write FMinTemperatureC;
  end;

  ArrayOfWeatherData = array of WeatherData;    { "http://www.webservicex.net" }


  // ************************************************************************ //
  // Namespace : http://www.webservicex.net
  // ************************************************************************ //
  WeatherForecasts = class(TRemotable)
  private
    FLatitude: Single;
    FLongitude: Single;
    FAllocationFactor: Single;
    FFipsCode: WideString;
    FPlaceName: WideString;
    FStateCode: WideString;
    FStatus: WideString;
    FDetails: ArrayOfWeatherData;
  public
    destructor Destroy; override;
  published
    property Latitude: Single read FLatitude write FLatitude;
    property Longitude: Single read FLongitude write FLongitude;
    property AllocationFactor: Single read FAllocationFactor write FAllocationFactor;
    property FipsCode: WideString read FFipsCode write FFipsCode;
    property PlaceName: WideString read FPlaceName write FPlaceName;
    property StateCode: WideString read FStateCode write FStateCode;
    property Status: WideString read FStatus write FStatus;
    property Details: ArrayOfWeatherData read FDetails write FDetails;
  end;


  // ************************************************************************ //
  // Namespace : http://www.webservicex.net
  // soapAction: http://www.webservicex.net/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : WeatherForecastSoap
  // service   : WeatherForecast
  // port      : WeatherForecastSoap
  // URL       : http://www.webservicex.net/WeatherForecast.asmx
  // ************************************************************************ //
  WeatherForecastSoap = interface(IInvokable)
  ['{45A46EB0-5550-8C38-49AC-AE13AD113F74}']
    function  GetWeatherByZipCode(const ZipCode: WideString): WeatherForecasts; stdcall;
    function  GetWeatherByPlaceName(const PlaceName: WideString): WeatherForecasts; stdcall;
  end;

function GetWeatherForecastSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WeatherForecastSoap;


implementation

function GetWeatherForecastSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WeatherForecastSoap;
const
  defWSDL = 'http://www.webservicex.net/WeatherForecast.asmx?WSDL';
  defURL  = 'http://www.webservicex.net/WeatherForecast.asmx';
  defSvc  = 'WeatherForecast';
  defPrt  = 'WeatherForecastSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as WeatherForecastSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor WeatherForecasts.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FDetails)-1 do
    if Assigned(FDetails[I]) then
      FDetails[I].Free;
  SetLength(FDetails, 0);
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(WeatherForecastSoap), 'http://www.webservicex.net', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WeatherForecastSoap), 'http://www.webservicex.net/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WeatherForecastSoap), ioDocument);
  RemClassRegistry.RegisterXSClass(WeatherData, 'http://www.webservicex.net', 'WeatherData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfWeatherData), 'http://www.webservicex.net', 'ArrayOfWeatherData');
  RemClassRegistry.RegisterXSClass(WeatherForecasts, 'http://www.webservicex.net', 'WeatherForecasts');

end. 