// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\User\vs\EMail\CBonds\Service References\ServiceCBonds\bond.wsdl
// Encoding : utf-8
// Codegen  : [wfDebug,wfUseSerializerClassForAttrs]
// Version  : 1.0
// (05.09.2008 10:30:51 - 1.33.2.5)
// ************************************************************************ //

unit bond;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"

  Offer                = class;                 { "urn:bond/types" }
  ArrayOffer           = class;                 { "urn:bond/types"[A] }
  Flow                 = class;                 { "urn:bond/types" }
  ArrayFlow            = class;                 { "urn:bond/types"[A] }
  Emission             = class;                 { "urn:bond/types" }
  ArrayEmission        = class;                 { "urn:bond/types"[A] }



  // ************************************************************************ //
  // Namespace : urn:bond/types
  // ************************************************************************ //
  Offer = class(TRemotable)
  private
    Femission_id: Integer;
    Fdate: TXSDate;
    Ftype_: WideString;
    Fprice: Double;
  public
    destructor Destroy; override;
  published
    property emission_id: Integer read Femission_id write Femission_id;
    property date: TXSDate read Fdate write Fdate;
    property type_: WideString read Ftype_ write Ftype_;
    property price: Double read Fprice write Fprice;
  end;

  offers     = array of Offer;                  { "urn:bond/types" }


  // ************************************************************************ //
  // Namespace : urn:bond/types
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  ArrayOffer = class(TRemotable)
  private
    Foffers: offers;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetOfferArray(Index: Integer): Offer;
    function   GetOfferArrayLength: Integer;
    property   OfferArray[Index: Integer]: Offer read GetOfferArray; default;
    property   Len: Integer read GetOfferArrayLength;
  published
    property offers: offers read Foffers write Foffers;
  end;



  // ************************************************************************ //
  // Namespace : urn:bond/types
  // ************************************************************************ //
  Flow = class(TRemotable)
  private
    Femission_id: Integer;
    Fdate: TXSDate;
    Frate: Double;
    Fsum: Double;
    Fredemtion: Double;
    Fdscr: WideString;
  public
    destructor Destroy; override;
  published
    property emission_id: Integer read Femission_id write Femission_id;
    property date: TXSDate read Fdate write Fdate;
    property rate: Double read Frate write Frate;
    property sum: Double read Fsum write Fsum;
    property redemtion: Double read Fredemtion write Fredemtion;
    property dscr: WideString read Fdscr write Fdscr;
  end;

  flows      = array of Flow;                   { "urn:bond/types" }


  // ************************************************************************ //
  // Namespace : urn:bond/types
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  ArrayFlow = class(TRemotable)
  private
    Fflows: flows;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetFlowArray(Index: Integer): Flow;
    function   GetFlowArrayLength: Integer;
    property   FlowArray[Index: Integer]: Flow read GetFlowArray; default;
    property   Len: Integer read GetFlowArrayLength;
  published
    property flows: flows read Fflows write Fflows;
  end;



  // ************************************************************************ //
  // Namespace : urn:bond/types
  // ************************************************************************ //
  Emission = class(TRemotable)
  private
    Fid: Integer;
    Femitents_name: WideString;
    Femitents_type: WideString;
    Femitents_edrpou: WideString;
    Femitents_address: WideString;
    Femitents_phone: WideString;
    Femitents_email: WideString;
    Femitents_site: WideString;
    Fisin_code: WideString;
    Fpfts_code: WideString;
    Femission_number: WideString;
    Fname: WideString;
    Fgov_reg_number: WideString;
    Fcurrency: WideString;
    Fnominal_price: WideString;
    Findexation: WideString;
    Fannounced_volume: Double;
    Fplaced_volume: Double;
    Fcoupon_period: Integer;
    Fkind: WideString;
    Fstatus: WideString;
    Fstart_date: TXSDate;
    Fend_date: TXSDate;
    Fpaying_off_date: TXSDate;
    Fconvertibility: WideString;
  public
    destructor Destroy; override;
  published
    property id: Integer read Fid write Fid;
    property emitents_name: WideString read Femitents_name write Femitents_name;
    property emitents_type: WideString read Femitents_type write Femitents_type;
    property emitents_edrpou: WideString read Femitents_edrpou write Femitents_edrpou;
    property emitents_address: WideString read Femitents_address write Femitents_address;
    property emitents_phone: WideString read Femitents_phone write Femitents_phone;
    property emitents_email: WideString read Femitents_email write Femitents_email;
    property emitents_site: WideString read Femitents_site write Femitents_site;
    property isin_code: WideString read Fisin_code write Fisin_code;
    property pfts_code: WideString read Fpfts_code write Fpfts_code;
    property emission_number: WideString read Femission_number write Femission_number;
    property name: WideString read Fname write Fname;
    property gov_reg_number: WideString read Fgov_reg_number write Fgov_reg_number;
    property currency: WideString read Fcurrency write Fcurrency;
    property nominal_price: WideString read Fnominal_price write Fnominal_price;
    property indexation: WideString read Findexation write Findexation;
    property announced_volume: Double read Fannounced_volume write Fannounced_volume;
    property placed_volume: Double read Fplaced_volume write Fplaced_volume;
    property coupon_period: Integer read Fcoupon_period write Fcoupon_period;
    property kind: WideString read Fkind write Fkind;
    property status: WideString read Fstatus write Fstatus;
    property start_date: TXSDate read Fstart_date write Fstart_date;
    property end_date: TXSDate read Fend_date write Fend_date;
    property paying_off_date: TXSDate read Fpaying_off_date write Fpaying_off_date;
    property convertibility: WideString read Fconvertibility write Fconvertibility;
  end;

  emissions  = array of Emission;               { "urn:bond/types" }


  // ************************************************************************ //
  // Namespace : urn:bond/types
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  ArrayEmission = class(TRemotable)
  private
    Femissions: emissions;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetEmissionArray(Index: Integer): Emission;
    function   GetEmissionArrayLength: Integer;
    property   EmissionArray[Index: Integer]: Emission read GetEmissionArray; default;
    property   Len: Integer read GetEmissionArrayLength;
  published
    property emissions: emissions read Femissions write Femissions;
  end;


  // ************************************************************************ //
  // Namespace : urn:ws/wsdl
  // soapAction: http://data.cbonds.info/ws_api_bond/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : BondSoap
  // service   : Bond
  // port      : BondSoap
  // URL       : http://data.cbonds.info/ws_api_bond/
  // ************************************************************************ //
  BondSoap = interface(IInvokable)
  ['{2716F10F-5E88-7A00-BE91-4191D47EBB3D}']
    function  get_emission_list(const login: WideString; const password: WideString; const date: TXSDate): ArrayEmission; stdcall;
    function  get_offer_list(const login: WideString; const password: WideString; const date: TXSDate): ArrayOffer; stdcall;
    function  get_flow_list(const login: WideString; const password: WideString; const date: TXSDate): ArrayFlow; stdcall;
  end;

function GetBondSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): BondSoap;


implementation

function GetBondSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): BondSoap;
const
  defWSDL = 'D:\User\vs\EMail\CBonds\Service References\ServiceCBonds\bond.wsdl';
  defURL  = 'http://data.cbonds.info/ws_api_bond/';
  defSvc  = 'Bond';
  defPrt  = 'BondSoap';
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
    Result := (RIO as BondSoap);
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


destructor Offer.Destroy;
begin
  if Assigned(Fdate) then
    Fdate.Free;
  inherited Destroy;
end;

constructor ArrayOffer.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor ArrayOffer.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Foffers)-1 do
    if Assigned(Foffers[I]) then
      Foffers[I].Free;
  SetLength(Foffers, 0);
  inherited Destroy;
end;

function ArrayOffer.GetOfferArray(Index: Integer): Offer;
begin
  Result := Foffers[Index];
end;

function ArrayOffer.GetOfferArrayLength: Integer;
begin
  if Assigned(Foffers) then
    Result := Length(Foffers)
  else
  Result := 0;
end;

destructor Flow.Destroy;
begin
  if Assigned(Fdate) then
    Fdate.Free;
  inherited Destroy;
end;

constructor ArrayFlow.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor ArrayFlow.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fflows)-1 do
    if Assigned(Fflows[I]) then
      Fflows[I].Free;
  SetLength(Fflows, 0);
  inherited Destroy;
end;

function ArrayFlow.GetFlowArray(Index: Integer): Flow;
begin
  Result := Fflows[Index];
end;

function ArrayFlow.GetFlowArrayLength: Integer;
begin
  if Assigned(Fflows) then
    Result := Length(Fflows)
  else
  Result := 0;
end;

destructor Emission.Destroy;
begin
  if Assigned(Fstart_date) then
    Fstart_date.Free;
  if Assigned(Fend_date) then
    Fend_date.Free;
  if Assigned(Fpaying_off_date) then
    Fpaying_off_date.Free;
  inherited Destroy;
end;

constructor ArrayEmission.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor ArrayEmission.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Femissions)-1 do
    if Assigned(Femissions[I]) then
      Femissions[I].Free;
  SetLength(Femissions, 0);
  inherited Destroy;
end;

function ArrayEmission.GetEmissionArray(Index: Integer): Emission;
begin
  Result := Femissions[Index];
end;

function ArrayEmission.GetEmissionArrayLength: Integer;
begin
  if Assigned(Femissions) then
    Result := Length(Femissions)
  else
  Result := 0;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(BondSoap), 'urn:ws/wsdl', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(BondSoap), 'http://data.cbonds.info/ws_api_bond/');
  //InvRegistry.RegisterInvokeOptions(TypeInfo(BondSoap), ioLiteral);
  InvRegistry.RegisterInvokeOptions(TypeInfo(BondSoap), ioDocument);
  RemClassRegistry.RegisterXSClass(Offer, 'urn:bond/types', 'Offer');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(Offer), 'type_', 'type');
  RemClassRegistry.RegisterXSInfo(TypeInfo(offers), 'urn:bond/types', 'offers');
  RemClassRegistry.RegisterXSClass(ArrayOffer, 'urn:bond/types', 'ArrayOffer');
  RemClassRegistry.RegisterSerializeOptions(ArrayOffer, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(Flow, 'urn:bond/types', 'Flow');
  RemClassRegistry.RegisterXSInfo(TypeInfo(flows), 'urn:bond/types', 'flows');
  RemClassRegistry.RegisterXSClass(ArrayFlow, 'urn:bond/types', 'ArrayFlow');
  RemClassRegistry.RegisterSerializeOptions(ArrayFlow, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(Emission, 'urn:bond/types', 'Emission');
  RemClassRegistry.RegisterXSInfo(TypeInfo(emissions), 'urn:bond/types', 'emissions');
  RemClassRegistry.RegisterXSClass(ArrayEmission, 'urn:bond/types', 'ArrayEmission');
  RemClassRegistry.RegisterSerializeOptions(ArrayEmission, [xoInlineArrays,xoLiteralParam]);

end. 