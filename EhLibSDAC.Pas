{*******************************************************}
{                                                       }
{                       EhLib v3.5                      }
{          Register object that sort data in            }
{                TADODataSet, TADOQuery                 }
{                                                       }
{   Copyright (c) 2002, 2003 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}

{*******************************************************}
{ Add this unit to 'uses' clause of any unit of your    }
{ project to allow TDBGridEh to sort data in            }
{ TADOQuery automatically after sorting markers         }
{ will be changed.                                      }
{ TSQLDatasetFeaturesEh will try to find line in        }
{ TADOQuery.SQL string that begin from 'ORDER BY' phrase}
{ and replace line by 'ORDER BY FieldNo1 [DESC],....'   }
{ using SortMarkedColumns.                              }
{*******************************************************}

unit EhLibSDAC;

{$I EhLib.Inc}

interface

uses
  DbUtilsEh, MSAccess, DB, DBGridEh;

implementation

uses Classes;

//type
//  TADODataSetCr ack = class(TADODataSet);

function ADODataSetDriverName(DataSet: TMSQuery): String;
begin
  Result := 'MSACCESS';
end;

function DateValueToADOSQLStringProc(DataSet: TDataSet; Value: Variant): String;
begin
  Result := DateValueToDataBaseSQLString('MSACCESS', Value)
end;

procedure SortDataInMSQuery(Grid: TCustomDBGridEh; DataSet: TMSQuery);
var
  s: String;
  i: Integer;
begin
  s := '';
  for i := 0 to Grid.SortMarkedColumns.Count - 1 do
  begin
    s := s + '[' + Grid.SortMarkedColumns[i].FieldName + ']';
    if Grid.SortMarkedColumns[i].Title.SortMarker = smUpEh
      then s := s + ' DESC; '
      else s := s + '; ';
  end;
  DataSet.IndexFieldNames := s;
end;

type

  TSDACFeaturesEh = class(TSQLDatasetFeaturesEh)
  public
    procedure ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
    constructor Create; override;
  end;

//implementation

{ TSDACFeaturesEh }

procedure TSDACFeaturesEh.ApplySorting(Sender: TObject;
  DataSet: TDataSet; IsReopen: Boolean);
begin
  if Sender is TCustomDBGridEh then
    if TCustomDBGridEh(Sender).SortLocal then
      SortDataInMSQuery(TCustomDBGridEh(Sender), TMSQuery(DataSet))
    else if (TMSQuery(DataSet)).IsQuery then
      inherited ApplySorting(Sender, DataSet, IsReopen);
end;

constructor TSDACFeaturesEh.Create;
begin
  inherited Create;
  DateValueToSQLString := DateValueToADOSQLStringProc;
  SupportsLocalLike := True;
end;


initialization
  RegisterDatasetFeaturesEh(TSDACFeaturesEh, TMSQuery);
end.
