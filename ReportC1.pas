unit ReportC1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, Tabenter, ADODB, RxLookup,
  ExtCtrls, frxClass, frxDesgn, frxADOComponents, MemDS, DBAccess, MSAccess;

type
  TfReportC1 = class(TForm)
    DBEdit2: TDBEdit;
    dsReportC1: TDataSource;
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
    q1: TMSQuery;
    qRepTree1: TMSQuery;
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
	fReportC1: TfReportC1;

implementation

uses DM;

{$R *.DFM}

procedure TfReportC1.FormActivate(Sender: TObject);
begin
	if q1.ParamByName('ReportID').Value = 0 then
	begin
		Caption := 'Добавить';
	end
	else
		Caption := 'Изменить';
  if q1.FieldByName('RepTypeID').Value = 1 then
  begin
    btnBrowse1.Visible := False;
  end
  else if q1.FieldByName('RepTypeID').Value = 2 then
  begin
    btnBrowse1.Visible := True;
  end;
end;

procedure TfReportC1.Button1Click(Sender: TObject);
begin
	if q1.FieldByName('Name').AsString = '' then
	begin
		Application.MessageBox('Не введен "Name"',PChar(Caption),MB_ICONERROR+MB_OK);
		DBEdit2.SetFocus;
		Abort;
	end;
	if q1.FieldByName('Path').Value = '' then
	begin
		Application.MessageBox('Не введен "Каталог"',PChar(Caption),MB_ICONERROR+MB_OK);
		DBEdit3.SetFocus;
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

procedure TfReportC1.FormCreate(Sender: TObject);
begin
  qRepTree1.Open;
end;

procedure TfReportC1.btnBrowse1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    q1.FieldByName('URL').Value := OpenDialog1.FileName;
end;

end.
