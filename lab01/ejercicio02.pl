% Ejercicio 2 - Reglas basicas


% ==================================================
% PARTE 1 - VUELOS
% ==================================================

% Base de conocimientos de vuelos

ciudad(bogota).
ciudad(medellin).
ciudad(cali).
ciudad(cartagena).
ciudad(manizales).
ciudad(barranquilla).
ciudad(pasto).
ciudad(monteria).

vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).


% Determina si dos ciudades estan conectadas mediante una escala.
conexion_escala(Origen, Destino) :-
    vuelo(Origen, Escala),
    vuelo(Escala, Destino).


% Determina si existe un viaje directo o con una escala.
viaje(Origen, Destino) :-
    vuelo(Origen, Destino).

viaje(Origen, Destino) :-
    conexion_escala(Origen, Destino).


% Devuelve todos los destinos alcanzables directamente
% desde una ciudad.
destinos(Ciudad, Destino) :-
    vuelo(Ciudad, Destino).


% --------------------------------------------------
% CONSULTAS Y RESPUESTAS - VUELOS
% --------------------------------------------------

% 1. Verificar si existe una conexion de Bogota a Barranquilla.
%
% Consulta:
% conexion_escala(bogota, barranquilla).
%
% Respuesta:
% true.
%
% Ruta:
% Bogota -> Medellin -> Barranquilla.


% 2. Ciudades a las que se puede llegar desde Cali
%    con una escala.
%
% Consulta:
% conexion_escala(cali, Destino).
%
% Respuestas:
% Destino = medellin ;
% Destino = cartagena ;
% Destino = pasto.
%
% Ruta:
% Cali -> Bogota -> Medellin
% Cali -> Bogota -> Cartagena
% Cali -> Bogota -> Pasto.


% 3. Verificar si existe un viaje de Bogota a Pasto.
%
% Consulta:
% viaje(bogota, pasto).
%
% Respuesta:
% true.
%
% Existe un vuelo directo.


% 4. Destinos alcanzables directamente desde Bogota.
%
% Consulta:
% destinos(bogota, Destino).
%
% Respuestas:
% Destino = medellin ;
% Destino = cartagena ;
% Destino = pasto.


% ==================================================
% PARTE 2 - MASCOTAS
% ==================================================

% Hechos de mascotas

perro(firulais).
perro(bruno).
perro(max).

gato(misu).
gato(luna).
gato(chanel).
gato(orion).

ave(piolin).

% Relaciones entre personas y mascotas

dueno(ana, firulais).
dueno(ana, misu).
dueno(luis, luna).
dueno(luis, orion).
dueno(luis, firulais).
dueno(maria, piolin).
dueno(julia, chanel).
dueno(pedro, bruno).


% Determina si una persona tiene un perro.
tiene_perro(Persona) :-
    dueno(Persona, Mascota),
    perro(Mascota).


% Determina si una persona tiene un gato.
tiene_gato(Persona) :-
    dueno(Persona, Mascota),
    gato(Mascota).


% Determina si una persona tiene multiples tipos de mascota.
multiples_mascotas(Persona) :-
    tipo_mascota(Persona, Tipo1),
    tipo_mascota(Persona, Tipo2),
    Tipo1 \= Tipo2.


% Identifica dueños que tienen tanto perro como gato.
amante_animales(Persona) :-
    tiene_perro(Persona),
    tiene_gato(Persona).


% Determina si dos personas comparten una mascota.
mascota_compartida(Persona1, Persona2) :-
    dueno(Persona1, Mascota),
    dueno(Persona2, Mascota),
    Persona1 \= Persona2.


% Asocia una persona con el tipo de mascota que tiene.
tipo_mascota(Persona, perro) :-
    dueno(Persona, Mascota),
    perro(Mascota).

tipo_mascota(Persona, gato) :-
    dueno(Persona, Mascota),
    gato(Mascota).

tipo_mascota(Persona, ave) :-
    dueno(Persona, Mascota),
    ave(Mascota).


% --------------------------------------------------
% CONSULTAS Y RESPUESTAS - MASCOTAS
% --------------------------------------------------

% 1. Dueños de perros.
%
% Consulta:
% tiene_perro(Persona).
%
% Respuestas:
% Persona = ana ;
% Persona = luis ;
% Persona = pedro.


% 2. Dueños de gatos.
%
% Consulta:
% tiene_gato(Persona).
%
% Respuestas:
% Persona = ana ;
% Persona = luis ;
% Persona = julia.


% 3. Dueños de multiples tipos de mascota.
%
% Consulta:
% multiples_mascotas(Persona).
%
% Respuestas:
% Persona = ana ;
% Persona = luis.


% 4. Personas que tienen tanto perro como gato.
%
% Consulta:
% amante_animales(Persona).
%
% Respuestas:
% Persona = ana ;
% Persona = luis.


% 5. Personas que comparten mascota.
%
% Consulta:
% mascota_compartida(Persona1, Persona2).
%
% Respuestas relevantes:
% Persona1 = ana,
% Persona2 = luis.
%
% Tambien se obtiene la relacion inversa:
% Persona1 = luis,
% Persona2 = ana.


% 6. Tipo de mascota de cada persona.
%
% Consulta:
% tipo_mascota(Persona, Tipo).
%
% Resultados:
%
% Ana -> perro
% Ana -> gato
% Luis -> gato
% Luis -> perro
% Maria -> ave
% Julia -> gato
% Pedro -> perro
