program ArbolBinarioPascal;
uses
    Crt;

type
    PNodo = ^Nodo;
    Nodo = record
        dato: integer;
        izquierdo: PNodo;
        derecho: PNodo;
    end;
    
var
    arbol: PNodo;
    opcion, dato: integer;

function insertarRecursivo(actual: PNodo; dato: integer): PNodo;
var
    nuevo: PNodo;
begin
    if actual = nil then
    begin
        New(nuevo);
        nuevo^.dato := dato;
        nuevo^.izquierdo := nil;
        nuevo^.derecho := nil;
        insertarRecursivo := nuevo;
    end
    else
    begin
        if dato < actual^.dato then
            actual^.izquierdo := insertarRecursivo(actual^.izquierdo, dato)
        else if dato > actual^.dato then
            actual^.derecho := insertarRecursivo(actual^.derecho, dato);
        insertarRecursivo := actual;
    end;
end;

procedure insertar(dato: integer);
begin
    arbol := insertarRecursivo(arbol, dato);
end;

procedure preorden(nodo: PNodo);
begin
    if nodo <> nil then
    begin
        Write(nodo^.dato, ' ');
        preorden(nodo^.izquierdo);
        preorden(nodo^.derecho);
    end;
end;

procedure inorden(nodo: PNodo);
begin
    if nodo <> nil then
    begin
        inorden(nodo^.izquierdo);
        Write(nodo^.dato, ' ');
        inorden(nodo^.derecho);
    end;
end;

procedure postorden(nodo: PNodo);
begin
    if nodo <> nil then
    begin
        postorden(nodo^.izquierdo);
        postorden(nodo^.derecho);
        Write(nodo^.dato, ' ');
    end;
end;

procedure liberarArbol(nodo: PNodo);
begin
    if nodo <> nil then
    begin
        liberarArbol(nodo^.izquierdo);
        liberarArbol(nodo^.derecho);
        Dispose(nodo);
    end;
end;

begin
    arbol := nil;
    
    repeat
        ClrScr;
        Writeln('=== MENU ARBOL BINARIO ===');
        Writeln('1. Insertar nodo');
        Writeln('2. Preorden');
        Writeln('3. Inorden');
        Writeln('4. Postorden');
        Writeln('5. Todos los recorridos');
        Writeln('6. Salir');
        Write('Opcion: ');
        Readln(opcion);
        
        case opcion of
            1: begin
                Write('Valor: ');
                Readln(dato);
                insertar(dato);
                Writeln('Insertado.');
                Readln;
            end;
            
            2: begin
                if arbol = nil then
                    Writeln('Arbol vacio.')
                else
                begin
                    Write('Preorden: ');
                    preorden(arbol);
                    Writeln;
                end;
                Readln;
            end;
            
            3: begin
                if arbol = nil then
                    Writeln('Arbol vacio.')
                else
                begin
                    Write('Inorden: ');
                    inorden(arbol);
                    Writeln;
                end;
                Readln;
            end;
            
            4: begin
                if arbol = nil then
                    Writeln('Arbol vacio.')
                else
                begin
                    Write('Postorden: ');
                    postorden(arbol);
                    Writeln;
                end;
                Readln;
            end;
            
            5: begin
                if arbol = nil then
                    Writeln('Arbol vacio.')
                else
                begin
                    Write('Preorden: ');
                    preorden(arbol);
                    Writeln;
                    Write('Inorden: ');
                    inorden(arbol);
                    Writeln;
                    Write('Postorden: ');
                    postorden(arbol);
                    Writeln;
                end;
                Readln;
            end;
            
            6: begin
                Writeln('Adios!');
            end;
            
            else
                Writeln('Opcion invalida.');
                Readln;
        end;
        
    until opcion = 6;
    
    liberarArbol(arbol);
end.