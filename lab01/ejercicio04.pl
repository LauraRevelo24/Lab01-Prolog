% Ejercicio 4 - Recursion simple
% Serie de Fibonacci


% Caso base
fibonacci(0, 0).

% Caso base
fibonacci(1, 1).


% Caso recursivo
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.


% --------------------------------------------------
% CONSULTAS Y RESPUESTAS
% --------------------------------------------------

% 1. Fibonacci de 0.
%
% Consulta:
% fibonacci(0, F).
%
% Respuesta:
% F = 0.


% 2. Fibonacci de 1.
%
% Consulta:
% fibonacci(1, F).
%
% Respuesta:
% F = 1.


% 3. Fibonacci de 5.
%
% Consulta:
% fibonacci(5, F).
%
% Respuesta:
% F = 5.


% 4. Fibonacci de 7.
%
% Consulta:
% fibonacci(7, F).
%
% Respuesta:
% F = 13.
