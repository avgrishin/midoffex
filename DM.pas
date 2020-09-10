unit DM;

interface

uses
  SysUtils, Classes, DB, DBAccess, MSAccess, FilterPart, OleServer, ExcelXP, Variants,
  ADODB, ImgList, Controls, TBXSwitcher, XPStyleActnCtrls, TBXOfficeXPTheme;

type
  TDM1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ImageList1: TImageList;
    Small: TImageList;
    TBXSwitcher1: TTBXSwitcher;
    MSConnection1: TMSConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DataModuleInit(Conn: _Connection);
    procedure DBGrid1Xsl(Grid: TAvEhGrid);
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

uses Graphics;

{$R *.dfm}

{$R RXIMAGES.RES}

procedure TDM1.DataModuleInit(Conn: _Connection);
begin
  ADOConnection1.ConnectionObject := Conn;
end;

procedure TDM1.DBGrid1Xsl(Grid: TAvEhGrid);
var
	Book: TBookmark;
	i: Integer;
	j: Integer;
  f: Integer;
  fmax: Integer;
	ExcelApplication1: TExcelApplication;
	ExcelWorkbook1: TExcelWorkbook;
	ExcelWorksheet1: TExcelWorksheet;
  Data: OleVariant;
begin
	ExcelApplication1 := TExcelApplication.Create(Self);
	ExcelWorkbook1 := TExcelWorkbook.Create(Self);
	ExcelWorksheet1 := TExcelWorksheet.Create(Self);
	try
		ExcelWorkbook1.ConnectTo( ExcelApplication1.Workbooks.Add(EmptyParam, 0) as _Workbook);
		ExcelWorksheet1.ConnectTo(ExcelWorkbook1.Worksheets[1] as _Worksheet);
		Grid.DataSource.DataSet.DisableControls;
    Data := VarArrayCreate([0, Grid.FieldCount-1], varVariant);
		try
			Book := Grid.DataSource.DataSet.GetBookmark;
      f := 0;
			for i := 0 to Grid.FieldCount-1 do
			begin
				if (Grid.Columns[i].Field <> nil) and Grid.Columns[i].Visible then
        begin
          Data[f] := ''''+Grid.Columns[i].Title.Caption;
          f := f+1;
        end
			end;
      fmax := f;
      ExcelWorksheet1.Range[ExcelWorksheet1.Cells.Item[1,1], ExcelWorksheet1.Cells.Item[1,fmax]].Value2 := Data;
			Grid.DataSource.DataSet.First;
			j := 2;
			while not Grid.DataSource.DataSet.Eof do
			begin
        f := 0;
				for i := 0 to Grid.FieldCount-1 do
				begin
					if (Grid.Fields[i] <> nil) and Grid.Columns[i].Visible then
					begin
						if Grid.Fields[i].DataType = ftString then
              Data[f] := ''''+Grid.Fields[i].AsString
//            else if Grid.Fields[i].DataType = ftBCD then
//              Data[f] := Grid.Fields[i].AsString
            else if Grid.Fields[i].DataType = ftDateTime then
            begin
              Data[f] := Grid.Fields[i].AsVariant;
              ExcelWorksheet1.Cells.Item[j,f+1].NumberFormatLocal := 'ƒƒ.ÃÃ.√√√√';
            end
						else
              Data[f] := Grid.Fields[i].AsVariant;
						if Grid.Fields[i].DataType = ftCurrency then
							ExcelWorksheet1.Cells.Item[j,f+1].NumberFormat := '0'+DecimalSeparator+'00';
            f := f+1;
					end;
				end;
        ExcelWorksheet1.Range[ExcelWorksheet1.Cells.Item[j,1], ExcelWorksheet1.Cells.Item[j,fmax]].Value2 := Data;
				Grid.DataSource.DataSet.Next;
				j := j+1;
			end;
			ExcelWorksheet1.Cells.EntireColumn.AutoFit;
      ExcelApplication1.Visible[0] := True;
			Grid.DataSource.DataSet.GotoBookmark(Book);
		finally
			Grid.DataSource.DataSet.EnableControls;
		end;
	finally
		ExcelApplication1.Free;
		ExcelWorkbook1.Free;
		ExcelWorksheet1.Free;
	end;
end;

procedure TDM1.DataModuleCreate(Sender: TObject);
var
	Bmp: TBitmap;
begin
	Bmp := TBitmap.Create;
  try
    Bmp.LoadFromResourceName(HInstance, 'REFRESH');
		ImageList1.AddMasked(Bmp, clFuchsia);
		Bmp.LoadFromResourceName(HInstance, 'FILTER');
    ImageList1.AddMasked(Bmp, $00A5BFC2);
		Bmp.LoadFromResourceName(HInstance, 'PRINT');
    ImageList1.AddMasked(Bmp, $00DEEDEF);
 		Bmp.LoadFromResourceName(HInstance, 'EXCEL');
    ImageList1.AddMasked(Bmp, clWhite);
 		Bmp.LoadFromResourceName(HInstance, 'POS');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'PRO');
    ImageList1.AddMasked(Bmp, clPurple);
 		Bmp.LoadFromResourceName(HInstance, 'DELETE');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'IMPORT');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'EXPORT');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'IMPLOZIA');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'ARROW1L');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'ARROW1R');
    ImageList1.AddMasked(Bmp, clOlive);
 		Bmp.LoadFromResourceName(HInstance, 'UPFOLDER');
    ImageList1.AddMasked(Bmp, clFuchsia);
 		Bmp.LoadFromResourceName(HInstance, 'LIST');
    ImageList1.AddMasked(Bmp, $00C8D0D4);
    Small.ResourceLoad(rtBitmap, 'SmallImages', clOlive);
  finally
  	Bmp.Free;
  end;
end;

end.
