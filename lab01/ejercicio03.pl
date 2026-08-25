% Ejercicio 3 - Predicados con condiciones aritmeticas


% ==================================================
% NOTAS
% ==================================================

% Hechos: estudiante y su nota final

nota(ana, 4.5).
nota(luis, 2.8).
nota(maria, 3.7).
nota(juan, 5.0).
nota(pedro, 2.3).


% Determina si un estudiante reprueba.
reprueba(Estudiante) :-
    nota(Estudiante, Nota),
    Nota < 3.0.


% Determina si un estudiante aprueba.
aprueba(Estudiante) :-
    nota(Estudiante, Nota),
    Nota >= 3.0.


% Determina si la nota de un estudiante esta
% entre Min y Max.
rango(Estudiante, Min, Max) :-
    nota(Estudiante, Nota),
    Nota >= Min,
    Nota =< Max.


% Clasificacion segun la nota.
%
% 0.0 - 2.9 -> reprobado
% 3.0 - 3.9 -> aprobado
% 4.0 - 4.4 -> notable
% 4.5 - 5.0 -> excelente

clasificacion(Estudiante, reprobado) :-
    nota(Estudiante, Nota),
    Nota >= 0.0,
    Nota < 3.0.

clasificacion(Estudiante, aprobado) :-
    nota(Estudiante, Nota),
    Nota >= 3.0,
    Nota < 4.0.

clasificacion(Estudiante, notable) :-
    nota(Estudiante, Nota),
    Nota >= 4.0,
    Nota < 4.5.

clasificacion(Estudiante, excelente) :-
    nota(Estudiante, Nota),
    Nota >= 4.5,
    Nota =< 5.0.


% ==================================================
% DISTANCIA EUCLIDIANA
% ==================================================

% Calcula la distancia euclidiana entre dos puntos.

distancia((X1, Y1), (X2, Y2), D) :-
    D is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).


% Casos base proporcionados por el taller.

distancia_total([], 0).

distancia_total([_], 0).


% Calcula la suma de las distancias entre
% puntos consecutivos de una lista.

distancia_total([P1, P2 | Resto], Total) :-
    distancia(P1, P2, D),
    distancia_total([P2 | Resto], RestoTotal),
    Total is D + RestoTotal.


% --------------------------------------------------
% CONSULTAS Y RESPUESTAS
% --------------------------------------------------

% 1. Estudiantes que reprueban.
%
% Consulta:
% reprueba(Estudiante).
%
% Respuestas:
% Estudiante = luis ;
% Estudiante = pedro.


% 2. Estudiantes que aprueban.
%
% Consulta:
% aprueba(Estudiante).
%
% Respuestas:
% Estudiante = ana ;
% Estudiante = maria ;
% Estudiante = juan.


% 3. Estudiantes con nota entre 3.0 y 3.9.
%
% Consulta:
% rango(Estudiante, 3.0, 3.9).
%
% Respuesta:
% Estudiante = maria.


% 4. Clasificacion de los estudiantes.
%
% Consulta:
% clasificacion(Estudiante, Categoria).
%
% Resultados:
%
% Ana -> excelente
% Luis -> reprobado
% Maria -> aprobado
% Juan -> excelente
% Pedro -> reprobado


% 5. Distancia entre dos puntos.
%
% Ejemplo:
% distancia((0,0), (3,4), D).
%
% Respuesta:
% D = 5.0.


% 6. Distancia total de una lista de puntos.
%
% Ejemplo:
% distancia_total([(0,0), (3,4), (6,4)], D).
%
% Respuesta:
% D = 8.0.
