unit MyForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfMyForm1 = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMyForm1: TfMyForm1;

implementation

{$R *.dfm}

procedure TfMyForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree
end;

end.
