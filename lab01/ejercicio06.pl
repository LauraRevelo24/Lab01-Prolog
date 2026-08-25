% Ejercicio 6 - Listas


% ==================================================
% 1. MIEMBRO
% ==================================================

% Verifica si un elemento pertenece a una lista.

miembro(Elemento, [Elemento | _]).

miembro(Elemento, [_ | Cola]) :-
    miembro(Elemento, Cola).


% ==================================================
% 2. LONGITUD
% ==================================================

% La lista vacia tiene longitud 0.

longitud([], 0).

% Una lista tiene una longitud igual a la longitud
% de su cola mas 1.

longitud([_ | Cola], N) :-
    longitud(Cola, N1),
    N is N1 + 1.


% ==================================================
% 3. CONCATENA
% ==================================================

% Concatenar una lista vacia con otra lista
% devuelve la segunda lista.

concatena([], Lista, Lista).

concatena([Cabeza | Cola], Lista2, Resultado) :-
    concatena(Cola, Lista2, Resto),
    Resultado = [Cabeza | Resto].


% ==================================================
% 4. FIBONACCI
% ==================================================

fibonacci(0, 0).

fibonacci(1, 1).

fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.


% ==================================================
% 5. PRIMEROS N ELEMENTOS DE FIBONACCI
% ==================================================

% Caso base: cero elementos.

lista_fibonacci(0, []).

% Caso recursivo.

lista_fibonacci(N, Lista) :-
    N > 0,
    Indice is N - 1,
    fibonacci(Indice, Valor),
    lista_fibonacci(Indice, Resto),
    append([Valor], Resto, Lista).


% --------------------------------------------------
% CONSULTAS Y RESPUESTAS
% --------------------------------------------------

% 1. Verificar si un elemento pertenece a una lista.
%
% Consulta:
% miembro(3, [1,2,3,4]).
%
% Respuesta:
% true.


% 2. Obtener la longitud de una lista.
%
% Consulta:
% longitud([1,2,3,4], N).
%
% Respuesta:
% N = 4.


% 3. Concatenar dos listas.
%
% Consulta:
% concatena([1,2], [3,4], Resultado).
%
% Respuesta:
% Resultado = [1,2,3,4].


% 4. Obtener los primeros 7 elementos de Fibonacci.
%
% Consulta:
% lista_fibonacci(7, Lista).
%
% Respuesta:
% Lista = [0,1,1,2,3,5,8].
