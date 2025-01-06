program hello_xmas;

function RepeatChar(char: Char; amount: Integer): String;
var
   I: Integer;
   Output: String;
begin
     Output := '';
     for I := 0 TO amount - 1 do
     begin
          Output := Output + char;
     end;
     RepeatChar := Output;
end;

procedure PrintSpaces(amount: Integer);
begin
     Write(RepeatChar(' ', amount));
end;

procedure PrintGroups(groups: Integer);
var
   I: Integer;
begin
     for I := 0 TO groups - 1 do
     begin
          PrintSpaces(groups-I);
          Write('/');
          PrintSpaces(I*2);
          Writeln('\');
          PrintSpaces(groups-I-1);
          Write('/');
          PrintSpaces((I+1)*2);
          Writeln('\');
     end;
end;

procedure PrintTrunk(groups: Integer);
begin
     PrintSpaces(groups);
     Writeln('||');
     PrintSpaces(groups);
     Writeln('||');
end;

var
   groups: Integer;

begin
     groups := 7;
     PrintGroups(groups);

     Writeln(RepeatChar('-', groups*2+2));

     PrintTrunk(groups);
     Readln;
end.