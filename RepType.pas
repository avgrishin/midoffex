unit RepType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, FilterPart, ActnList, Menus, MemDS,
  DBAccess, MSAccess, GridsEh;

type
  TfRepType1 = class(TForm)
    AvEhGrid1: TAvEhGrid;
    dsRepType1: TDataSource;
    ActionList1: TActionList;
    acSelect1: TAction;
    acEscape1: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    qRepType1: TMSQuery;
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
  fRepType1: TfRepType1;

implementation

uses DM;

{$R *.dfm}

procedure TfRepType1.acSelect1Execute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfRepType1.acSelect1Update(Sender: TObject);
begin
	if qRepType1.IsEmpty then
		acSelect1.Enabled := False
	else
		acSelect1.Enabled := True;
end;

procedure TfRepType1.AvEhGrid1DblClick(Sender: TObject);
begin
	if not qRepType1.IsEmpty then
		acSelect1.Execute;
end;

procedure TfRepType1.FormCreate(Sender: TObject);
begin
  qRepType1.Open;
end;

end.
