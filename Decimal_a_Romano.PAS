program DecimalRomano;
uses crt;

const
valores: array [1..13] of integer = (1000,900,500,400,100,90,50,40,10,9,5,4,1);
simbolos : array [1..13] of string= ('M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I');

var
numero, i: integer;

begin
clrscr;
write('Introduce un numero decimal: ');
readln(numero);

write('El numero romano es: ');

i:=1;
while numero > 0 do
begin
if numero >= valores [i] then
begin
write(simbolos [i]);
numero:= numero - valores [i];
end
else
i:= i+1;
end;

writeln;
readln;
end.
