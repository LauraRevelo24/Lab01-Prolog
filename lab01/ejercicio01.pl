% Ejercicio 1 - Hechos y consultas simples

% Hechos: relacion entre ciudades
ciudad(bogota).
ciudad(medellin).
ciudad(cali).
ciudad(cartagena).
ciudad(manizales).
ciudad(barranquilla).
ciudad(pasto).
ciudad(monteria).

% Hechos: vuelos directos
vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).


% --------------------------------------------------
% CONSULTAS Y RESPUESTAS
% --------------------------------------------------

% 1. ¿Existe un vuelo directo de Bogota a Medellin?
%
% Consulta:
% vuelo(bogota, medellin).
%
% Respuesta:
% true.


% 2. ¿Que destinos se pueden alcanzar directamente desde Bogota?
%
% Consulta:
% vuelo(bogota, Destino).
%
% Respuestas:
% Destino = medellin ;
% Destino = cartagena ;
% Destino = pasto.


% 3. ¿Desde que destinos se puede alcanzar Medellin?
%
% Consulta:
% vuelo(Origen, medellin).
%
% Respuesta:
% Origen = bogota.


% 4. ¿Hay alguna forma de llegar directamente a Cali?
%
% Consulta:
% vuelo(Origen, cali).
%
% Respuesta:
% false.
