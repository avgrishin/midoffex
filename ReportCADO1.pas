unit ReportCADO1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Tabenter, ADODB, RxLookup,
  ExtCtrls, frxClass, frxDesgn, frxADOComponents, MemDS, DBAccess, MSAccess,
  Placemnt;

type
  TfReportCADO1 = class(TForm)
    DBEdit2: TDBEdit;
    dsReportCADO1: TDataSource;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    kEnterAsTab1: TkEnterAsTab;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsRepTree1: TDataSource;
    DBCheckBox1: TDBCheckBox;
    rgOrientation1: TDBRadioGroup;
    btnBrowse1: TButton;
    OpenDialog1: TOpenDialog;
    qRepTree1: TADOQuery;
    q1: TADOQuery;
    FormPlacement1: TFormPlacement;
    procedure FormActivate(Sender: TObject);
		procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBrowse1Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	fReportCADO1: TfReportCADO1;

implementation

uses DM, getNode;

{$R *.DFM}

procedure TfReportCADO1.FormActivate(Sender: TObject);
begin
 	if q1.Parameters.ParamByName('ReportID').Value = 0 then
	  Caption := 'Добавить'
 	else
  	Caption := 'Изменить';
  with TADOQuery.Create(Self) do
  begin
    Connection := DM1.ADOConnection1;
    SQL.Text := 'select Name from taRepType where RepTypeID = :RepTypeID';
    Parameters[0].Value := q1.FieldByName('RepTypeID').Value;
    Open;
    Caption := Caption+' - '+Fields[0].AsString+' (ID='+q1.FieldByName('ReportID').AsString+')';
    Close;
    Free;
  end;
end;

procedure TfReportCADO1.Button1Click(Sender: TObject);
begin
	if q1.FieldByName('Name').AsString = '' then
	begin
		Application.MessageBox('Не введен "Name"',PChar(Caption),MB_ICONERROR+MB_OK);
		DBEdit2.SetFocus;
		Abort;
	end;
	try
    q1.CheckBrowseMode;
  	ModalResult := mrOK;
	except
		on E: Exception do
		begin
      Application.MessageBox(PChar(E.Message), 'Ошибка', MB_ICONERROR+MB_OK);
		end;
  end;
end;

procedure TfReportCADO1.FormCreate(Sender: TObject);
begin
  qRepTree1.Open;
  SetChildTaborders(Self);
end;

procedure TfReportCADO1.btnBrowse1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    q1.FieldByName('Path').Value := OpenDialog1.FileName;
end;

end.
