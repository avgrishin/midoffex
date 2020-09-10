unit RepTypeADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, FilterPart, ActnList, Menus, MemDS,
  DBAccess, MSAccess, GridsEh, ADODB;

type
  TfRepTypeADO1 = class(TForm)
    AvEhGrid1: TAvEhGrid;
    dsRepTypeADO1: TDataSource;
    ActionList1: TActionList;
    acSelect1: TAction;
    acEscape1: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    qRepTypeADO1: TADOQuery;
    procedure acSelect1Execute(Sender: TObject);
    procedure acSelect1Update(Sender: TObject);
    procedure AvEhGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRepTypeADO1: TfRepTypeADO1;

implementation

uses DM;

{$R *.dfm}

procedure TfRepTypeADO1.acSelect1Execute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfRepTypeADO1.acSelect1Update(Sender: TObject);
begin
	if qRepTypeADO1.IsEmpty then
		acSelect1.Enabled := False
	else
		acSelect1.Enabled := True;
end;

procedure TfRepTypeADO1.AvEhGrid1DblClick(Sender: TObject);
begin
	if not qRepTypeADO1.IsEmpty then
		acSelect1.Execute;
end;

procedure TfRepTypeADO1.FormCreate(Sender: TObject);
begin
  qRepTypeADO1.Open;
end;

end.
