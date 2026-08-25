% Ejercicio 5 - Problema de los 4 colores

% Colores disponibles

color(red).
color(blue).
color(yellow).
color(green).


% Dos regiones adyacentes deben tener
% colores diferentes.

adjacent(Color1, Color2) :-
    Color1 \= Color2.


% Restricciones de adyacencia del mapa.

map(A, B, C, D, E) :-
    color(A),
    color(B),
    color(C),
    color(D),
    color(E),
    adjacent(A, B),
    adjacent(A, D),
    adjacent(A, E),
    adjacent(B, C),
    adjacent(B, D),
    adjacent(B, E),
    adjacent(C, D),
    adjacent(C, E),
    adjacent(D, E).
