program Volcan;
uses crt;

var
   i, j, k, filas, ancho: integer;
begin
     clrscr;
     filas := 6; {numero de lineas: 2,4,8,16,32,64}
     ancho := 1 shl (filas);

     for i := 1 to filas-1 do
     begin
          {Espacios}
          for j := 1 to (ancho - (1 shl i)) div 2 do
              write(' ');

          {Asteriscos: 2^i}
          for k := 1 to (1 shl i) do
              write('*');
          writeln;
     end;
     readln;
end.