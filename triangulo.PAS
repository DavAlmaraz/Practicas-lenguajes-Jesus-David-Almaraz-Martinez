program Triangulo;
uses crt;
var
   i, j, k, n: integer;
   digito: array[0..9] of integer;
begin
   clrscr;
   n := 10;
   for i := 0 to 9 do
     digito[i] := i;
   for i := 1 to n do
   begin
        {Espacios en blanco para centrar}
        for j := n downto i do
            write(' ');
        {parte asendente}
        for j := i to (2*i - 1) do
            write(digito[j mod 10]);

        {parte decendente}
        for j := (2*i - 2) downto i do
            write(digito[j mod  10]);
        writeln;
   end;
   readln;
end.