unit AddOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DB, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ADODB,
  ExtCtrls, GridsEh, FilterPart, ToolEdit, ActnList, Buttons, Tabenter;

type
  TfAddOption = class(TForm)
    lcBaseSecGroup1: TDBLookupComboboxEh;
    dstBaseSecGroup1: TDataSource;
    tBaseSecGroup1: TADOQuery;
    Button1: TButton;
    lcBaseSec1: TDBLookupComboboxEh;
    tBaseSecurity1: TADOQuery;
    dsBaseSecurity1: TDataSource;
    cbContrType1: TDBComboBoxEh;
    cbClass1: TDBComboBoxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rgPayType1: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    lcSec1: TDBLookupComboboxEh;
    qSec1: TADOQuery;
    dsSecurity1: TDataSource;
    eSec1: TDBEditEh;
    qSec2: TADOQuery;
    dsSec2: TDataSource;
    cbVariation: TCheckBox;
    neNominal: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    cbFund1: TDBComboBoxEh;
    gOpt1: TAvEhGrid;
    qSecOpt1: TADOQuery;
    dsSecOpt1: TDataSource;
    Panel1: TPanel;
    neEmissionValue: TDBNumberEditEh;
    Label8: TLabel;
    Label9: TLabel;
    deExecDate1: TDateEdit;
    deEndServiceDate1: TDateEdit;
    Label10: TLabel;
    Label11: TLabel;
    deDateStart1: TDateEdit;
    Label12: TLabel;
    deDateEndFact1: TDateEdit;
    bAdd1: TButton;
    cmdSecOptDel1: TADOCommand;
    qSecOptAdd1: TADOQuery;
    spExecAddOptionJob: TADOStoredProc;
    bRefresh1: TButton;
    bSelect1: TButton;
    ActionList1: TActionList;
    acRefresh1: TAction;
    acSelect1: TAction;
    kEnterAsTab1: TkEnterAsTab;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lcBaseSecGroup1Change(Sender: TObject);
    procedure tBaseSecurity1AfterOpen(DataSet: TDataSet);
    procedure tBaseSecurity1AfterClose(DataSet: TDataSet);
    procedure lcBaseSec1Change(Sender: TObject);
    procedure eSec1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure qSec2AfterOpen(DataSet: TDataSet);
    procedure qSec2AfterClose(DataSet: TDataSet);
    procedure bAdd1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acRefresh1Execute(Sender: TObject);
    procedure acSelect1Update(Sender: TObject);
    procedure acSelect1Execute(Sender: TObject);
    procedure gOpt1DblClick(Sender: TObject);
  private
    procedure SetPanelState(Enabled: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAddOption: TfAddOption;

implementation

uses DM, TableADO, Clipbrd, StrUtils, getNode, DateUtils;
{$R *.dfm}

procedure TfAddOption.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfAddOption.FormCreate(Sender: TObject);
begin
  tBaseSecGroup1.Open;
end;

procedure TfAddOption.lcBaseSecGroup1Change(Sender: TObject);
begin
  tBaseSecurity1.Close;
  tBaseSecurity1.Parameters.ParamByName('SecurityGroupID').Value := tBaseSecGroup1.FieldByName('ID').Value;
  tBaseSecurity1.Open;
  eSec1.Enabled := False;
  qSec2.Close;
end;

procedure TfAddOption.tBaseSecurity1AfterOpen(DataSet: TDataSet);
begin
  lcBaseSec1.Enabled := True;
end;

procedure TfAddOption.tBaseSecurity1AfterClose(DataSet: TDataSet);
begin
  lcBaseSec1.Enabled := False;
  lcBaseSec1.KeyValue := Null;
end;

procedure TfAddOption.lcBaseSec1Change(Sender: TObject);
begin
  qSec1.Close;
  qSec1.Parameters.ParamByName('BaseSecurityID').Value := tBaseSecurity1.FieldByName('ID').Value;
  qSec1.Open;
  eSec1.Enabled := not qSec1.Eof;
  qSec2.Close;
  lcSec1.KeyValue := Null;
end;

procedure TfAddOption.eSec1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  fTableADO: TfTableADO;
begin
  fTableADO := TfTableADO.Create(Self);
  try
    fTableADO.Position := poDesktopCenter;
    fTableADO.Caption := 'Опционы';
    fTableADO.q1.SQL.Text := qSec1.SQL.Text;
    fTableADO.q1.Parameters.ParamByName('BaseSecurityID').Value := tBaseSecurity1.FieldByName('ID').Value;
    fTableADO.AvEhGrid1.Columns := lcSec1.DropDownBox.Columns;
    fTableADO.acExec1.ShortCut := 13;
    fTableADO.acRefresh1Execute(nil);
    if fTableADO.ShowModal = mrOk then
    begin
      qSec2.Close;
      qSec2.Parameters.ParamByName('SecurityID').Value := fTableADO.q1.FieldByName('ID').Value;
      qSec2.Open;
    end;
  finally
    fTableADO.Free;
  end;
end;

procedure TfAddOption.qSec2AfterOpen(DataSet: TDataSet);
begin
  cbContrType1.ItemIndex := qSec2.FieldByName('ContrType').Value;
  cbClass1.ItemIndex := qSec2.FieldByName('Class').Value;
  rgPayType1.ItemIndex := qSec2.FieldByName('PayType').Value;
  cbVariation.Checked := qSec2.FieldByName('EmptyBillFlag').Value = 1;
  neNominal.Value := qSec2.FieldByName('Nominal').Value;
  cbFund1.Value := qSec2.FieldByName('FundID').Value;
  qSecOpt1.Close;
  qSecOpt1.Parameters.ParamByName('ParentID').Value := qSec2.Parameters.ParamByName('SecurityID').Value;
  qSecOpt1.Open;
  acRefresh1.Enabled := True;
  SetPanelState(True);
end;

procedure TfAddOption.SetPanelState(Enabled: Boolean);
var
  i: Integer;
begin
  for i := 0 to Panel1.ControlCount - 1 do
  begin
    if not (Panel1.Controls[i] is TLabel) then
      (Panel1.Controls[i] as TControl).Enabled := Enabled;
  end;
end;

procedure TfAddOption.qSec2AfterClose(DataSet: TDataSet);
begin
  cbContrType1.ItemIndex := -1;
  cbClass1.ItemIndex := -1;
  rgPayType1.ItemIndex := -1;
  cbVariation.Checked := False;
  neNominal.Value := Null;
  cbFund1.Value := Null;
  qSecOpt1.Close;
  SetPanelState(False);
  acRefresh1.Enabled := False;
end;

procedure TfAddOption.bAdd1Click(Sender: TObject);
var
  OldCaption: TCaption;
begin
  if (not (neEmissionValue.Value > 0)) or (deExecDate1.Date = 0) or (deEndServiceDate1.Date = 0) or (deDateStart1.Date = 0) or (deDateEndFact1.Date = 0) or (deExecDate1.Date > deEndServiceDate1.Date) or (deDateStart1.Date > deDateEndFact1.Date) then
  begin
    Application.MessageBox('Неверное значение', PAnsiChar(Application.Title), MB_ICONERROR);
    //neEmissionValue.SetFocus;
    Abort;
  end;
  if Application.MessageBox('Выполнить добавление ?', 'Отчет', MB_YESNO or MB_ICONQUESTION) = IDYES then
  begin
    OldCaption := bAdd1.Caption;
    bAdd1.Caption := 'Выполнение...';
    Application.ProcessMessages;
    try
      cmdSecOptDel1.Execute;
      qSecOptAdd1.Parameters.ParamByName('ParentID').Value := qSec2.Parameters.ParamByName('SecurityID').Value;
      qSecOptAdd1.Parameters.ParamByName('EmissionValue').Value := neEmissionValue.Value;
      qSecOptAdd1.Parameters.ParamByName('ExecDate').Value := deExecDate1.Date;
      qSecOptAdd1.Parameters.ParamByName('EndServiceDate').Value := deEndServiceDate1.Date;
      qSecOptAdd1.Parameters.ParamByName('DateStart').Value := deDateStart1.Date;
      qSecOptAdd1.Parameters.ParamByName('DateEndFact').Value := deDateEndFact1.Date;
      qSecOptAdd1.ExecSQL;
      spExecAddOptionJob.ExecProc;
      qSecOpt1.Close;
      qSecOpt1.Open;
    finally
      bAdd1.Caption := OldCaption;
    end;
  end;
end;

procedure TfAddOption.FormShow(Sender: TObject);
begin
  SetPanelState(False);
end;

procedure TfAddOption.acRefresh1Execute(Sender: TObject);
begin
  qSecOpt1.Close;
  qSecOpt1.Open;
end;

procedure TfAddOption.acSelect1Update(Sender: TObject);
begin
  acSelect1.Enabled := not qSecOpt1.Eof;
end;

procedure TfAddOption.acSelect1Execute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfAddOption.gOpt1DblClick(Sender: TObject);
begin
  if not qSecOpt1.IsEmpty then
    acSelect1Execute(Sender);
end;

end.
