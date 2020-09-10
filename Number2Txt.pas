unit Number2Txt;

interface

uses SysUtils, Math, StrUtils;

function Money2Txt(Num: Currency): String;
function Num2Txt(CNum: String; Mode: Integer): String;
function MoneyF2Txt(Num: Currency; Fund: Integer): String;

implementation

function triada(inpar: String; tn, md: Integer): String;
const
  sotni: Array[1..9] of String = ('сто', 'двести', 'триста', 'четыреста', 'пятьсот', 'шестьсот', 'семьсот', 'восемьсот', 'девятьсот');
  dubl: Array[0..9] of String = ('десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать');
  des: Array[2..9] of String = ('двадцать', 'тридцать', 'сорок', 'пятьдесят', 'шестьдесят', 'семьдесят', 'восемьдесят', 'девяносто');
  ed: Array[1..9] of String = ('один', 'два', 'три', 'четыре', 'пять', 'шесть','семь', 'восемь', 'девять');
  edj: Array[1..9] of String = ('одна', 'две', 'три', 'четыре', 'пять', 'шесть','семь', 'восемь', 'девять');
  ind: Array[1..4] of String = (' тысяч', ' миллион', ' миллиард', ' триллион');
var
  post: String;
begin
  Result := '';
  if inpar = '   ' then Exit;
  if inpar = '000' then Exit;
  if (inpar[1] <> ' ') and (inpar[1] <> '0') then
    Result := Result + sotni[StrToInt(inpar[1])];
  if inpar[2] = '1' then
    Result := Result + ' ' + dubl[StrToInt(inpar[3])]
  else if (inpar[2] <> '1') and (inpar[2] <> ' ') and (inpar[2] <> '0') then
    Result := Result + ' ' + des[StrToInt(inpar[2])];
  if (inpar[3] <> '0') and (inpar[2] <> '1') then
  begin
    if (tn = 1) or ((tn = 0) and (md = 1)) then
      Result := Result + ' ' + edj[StrToInt(inpar[3])]
    else
      Result := Result + ' ' + ed[StrToInt(inpar[3])];
  end;
  if tn > 0 then
  begin
    if inpar[2] <> '1' then
    begin
      if tn = 1 then
        case inpar[3] of
          '1': post := ind[tn] + 'а';
          '2', '3', '4': post := ind[tn] + 'и';
          else post := ind[tn];
        end
      else if (tn = 2) or (tn = 3) or (tn = 4) then
      begin
        case inpar[3] of
          '1': post := ind[tn] + '';
          '2': post := ind[tn] + 'а';
          '3': post := ind[tn] + 'а';
          '4': post := ind[tn] + 'а';
          else post := ind[tn] + 'ов';
        end;
      end
    end
    else
    begin
      case tn of
        1: post := ind[tn];
        else post := ind[tn] + 'ов';
      end
    end;
  end;
  Result := Result + post;
end;

function Num2Txt(CNum: String; Mode: Integer): String;
var
  I, C: Integer;
  Tri: String;
begin
  c := (Length(CNum)-1) div 3;
  for I := 0 to C do
  begin
    Tri := Copy(CNum, Max(1, Length(CNum)-3*(I+1)+1), Min(3, Length(CNum)-3*I));
    Tri := DupeString(' ', 3-Length(Tri))+Tri;
    Result := triada(Tri, I, Mode)+' '+Result;
  end;
end;

function Money2Txt(Num: Currency): String;
var
  CNum, Rubl, Kop: String;
begin
  CNum := FormatFloat('000000000000000.00', Num);
  Rubl := Copy(CNum, 1, Pos(DecimalSeparator, CNum)-1);
  Kop := Copy(CNum, Pos(DecimalSeparator, CNum)+1, 2);
  Result := Num2Txt(Rubl, 0)+ 'рубл';
  if Rubl[Length(Rubl)-1] <> '1' then
    case Rubl[Length(Rubl)] of
      '1': Result := Result+'ь';
      '2','3','4': Result := Result+'я';
      else Result := Result+'ей';
    end
  else
    Result := Result+'ей';
  Result := Result+' '+Kop+' копе';
  if Kop[1] <> '1' then
    case Kop[2] of
      '1': Result := Result+'йка';
      '2','3','4': Result := Result+'йки';
      else Result := Result+'ек';
    end
  else
    Result := Result+'ек';
  Result := TrimLeft(Result);
  Result := AnsiUpperCase(MidStr(Result, 1, 1))+MidStr(Result, 2, Length(Result)-1);
end;

function MoneyF2Txt(Num: Currency; Fund: Integer): String;
var
  CNum, Rubl, Kop: String;
  s1, s2, s3, s4, s5, s6, s7, s8: String;
begin
  CNum := FormatFloat('000000000000000.00', Num);
  Rubl := Copy(CNum, 1, Pos(DecimalSeparator, CNum)-1);
  Kop := Copy(CNum, Pos(DecimalSeparator, CNum)+1, 2);
  Result := Num2Txt(Rubl, 0);
  if Fund = 301 then
  begin
    s1 := 'рубл';
    s2 := 'ь';
    s3 := 'я';
    s4 := 'ей';
    s5 := ' копе';
    s6 := 'йка';
    s7 := 'йки';
    s8 := 'ек';
  end
  else
  if Fund = 302 then
  begin
    s1 := 'доллар';
    s2 := ' США';
    s3 := 'а США';
    s4 := 'ов США';
    s5 := ' цент';
    s6 := '';
    s7 := 'а';
    s8 := 'ов';
  end
  else
  if Fund = 303 then
  begin
    s1 := 'ЕВРО';
    s2 := '';
    s3 := '';
    s4 := '';
    s5 := ' цент';
    s6 := '';
    s7 := 'а';
    s8 := 'ов';
  end;
  Result := Result + s1;
  if Rubl[Length(Rubl)-1] <> '1' then
    case Rubl[Length(Rubl)] of
      '1': Result := Result+s2;
      '2','3','4': Result := Result+s3;
      else Result := Result+s4;
    end
  else
    Result := Result+s4;
  Result := Result+' '+Kop+s5;
  if Kop[1] <> '1' then
    case Kop[2] of
      '1': Result := Result+s6;
      '2','3','4': Result := Result+s7;
      else Result := Result+s8;
    end
  else
    Result := Result+s8;
  Result := TrimLeft(Result);
  Result := AnsiUpperCase(MidStr(Result, 1, 1))+MidStr(Result, 2, Length(Result)-1);
end;

end.
