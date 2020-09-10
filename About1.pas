unit About1;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfAbout1 = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout1: TfAbout1;

implementation

{$R *.dfm}

procedure TfAbout1.FormCreate(Sender: TObject);
const
  InfoNum = 4;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'ProductName', 'FileVersion', 'Comments');
var
  S: string;
  n, Len: DWORD;
  Buf: PChar;
  Value: PChar;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    if VerQueryValue(Buf, PChar('StringFileInfo\041904E3\' + InfoStr[1]), Pointer(Value), Len) then
        Copyright.Caption := Copyright.Caption+' '+Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\041904E3\' + InfoStr[2]), Pointer(Value), Len) then
        ProductName.Caption := Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\041904E3\' + InfoStr[3]), Pointer(Value), Len) then
        Version.Caption := 'Версия '+Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\041904E3\' + InfoStr[4]), Pointer(Value), Len) then
        Comments.Caption := Value;
    FreeMem(Buf, n);
  end
end;

end.
 
