program TableroAjedrez;
uses crt;
var
   i, j: integer;
begin
     clrscr;
     for i := 1 to 8 do
     begin
          for j := 1 to 8 do
          begin
               if (i + j) mod 2 = 0 then
                  write('* ')   { casilla negra }
               else
                  write(' ');  { casilla blanca }
          end;
          writeln;
     end;
     readkey; { espera una tecla antes de cerrar }
end.
