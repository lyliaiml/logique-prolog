valeur_binaire(o).
valeur_binaire(u).

add(o,o,o).
add(o,u,u).
add(u,o,u).
add(u,u,o).


mul(o,o,o).
mul(o,u,o).
mul(u,o,o).
mul(u,u,u).

% si les listes sont vides = résultat vide
add_vect([],[],[]).

% cas recursif
add_vect([H1|T1],[H2|T2],[R|T]) :-
    add(H1,H2,R),
    add_vect(T1,T2,T).

produit([], _, []).

produit([o|T], [_|M], R) :-
    produit(T, M, R).

produit([u|T], [Ligne|M], R) :-
    produit(T, M, R1),
    ( R1 = [] -> R = Ligne ; add_vect(Ligne, R1, R) ).

vecteur([],0).

vecteur([H|T],N) :-
    N > 0,
    valeur_binaire(H),
    N1 is N-1,
    vecteur(T,N1).

zeros([]).
zeros([o|T]) :-
    zeros(T).

solution(M,V) :-
    length(M,N),
    vecteur(V,N),
    produit(V,M,R),
    zeros(R).



count_u([],0).

count_u([u|T],N) :-
    count_u(T,N1),
    N is N1 + 1.

count_u([o|T],N) :-
    count_u(T,N).


solution_binaire(M,V,Y,Nombre) :-
    length(M,N),
    vecteur(V,N),
    count_u(V,Nombre),
    produit(V,M,Y).


valeur_ternaire(o).
valeur_ternaire(u).
valeur_ternaire(d).
add3(o,o,o).
add3(o,u,u).
add3(o,d,d).

add3(u,o,u).
add3(u,u,d).
add3(u,d,o).

add3(d,o,d).
add3(d,u,o).
add3(d,d,u).


mul3(o,o,o).
mul3(o,u,o).
mul3(o,d,o).

mul3(u,o,o).
mul3(u,u,u).
mul3(u,d,d).

mul3(d,o,o).
mul3(d,u,d).
mul3(d,d,u).


add_vect3([],[],[]).

add_vect3([H1|T1],[H2|T2],[R|T]) :-
    add3(H1,H2,R),
    add_vect3(T1,T2,T).


produit3([], _, []).

produit3([o|T], [_|M], R) :-
    produit3(T, M, R).

produit3([u|T], [Ligne|M], R) :-
    produit3(T, M, R1),
    ( R1 = [] -> R = Ligne ; add_vect3(Ligne, R1, R) ).

produit3([d|T], [Ligne|M], R) :-
    produit3(T, M, R1),
    add_vect3(Ligne, Ligne, Temp),
    ( R1 = [] -> R = Temp ; add_vect3(Temp, R1, R) ).

vecteur3([],0).

vecteur3([H|T],N) :-
    N > 0,
    valeur_ternaire(H),
    N1 is N-1,
    vecteur3(T,N1).


count_ud([],0).

count_ud([o|T],N) :-
    count_ud(T,N).

count_ud([u|T],N) :-
    count_ud(T,N1),
    N is N1 + 1.

count_ud([d|T],N) :-
    count_ud(T,N1),
    N is N1 + 1.


solution_ternaire(M,V,Y,Nombre) :-
    length(M,N),
    vecteur3(V,N),
    count_ud(V,Nombre),
    produit3(V,M,Y).

m_facile([[o,u,o,o,o,u,u,o,o,o,o,o,u],
[o,u,u,u,u,u,u,u,u,o,u,u,o],
[u,o,o,u,o,o,u,o,o,u,u,o,u],
[u,u,o,u,u,o,o,u,u,o,o,u,u],
[u,u,u,o,o,u,o,o,o,o,u,o,o],
[u,o,o,u,u,u,u,o,o,o,o,u,o],
[u,o,o,o,o,o,u,o,u,o,o,o,o],
[o,u,u,o,o,o,u,u,u,u,o,o,o],
[u,u,u,u,u,u,o,o,o,o,u,u,o],
[o,o,u,o,o,u,o,u,u,u,u,u,u],
[u,o,u,u,o,u,o,u,o,o,o,o,o],
[o,u,u,o,u,u,o,o,o,u,u,u,u],
[o,o,u,o,u,o,o,u,u,o,o,o,u],
[o,u,o,u,u,u,u,o,o,u,o,o,o],
[o,u,u,u,o,o,o,o,u,o,u,o,o],
[o,u,u,u,o,o,u,o,o,o,u,u,o],
[u,u,o,o,o,u,u,u,o,o,o,u,o],
[u,o,o,u,u,o,o,o,u,o,o,o,o],
[u,o,u,u,o,u,o,o,u,u,u,u,u],
[u,o,o,u,o,o,o,u,u,o,u,u,u],
[u,u,o,o,o,u,o,o,o,u,u,u,u],
[o,o,u,u,o,o,o,u,u,o,u,u,o],
[o,u,o,o,u,u,o,u,u,o,o,u,o],
[u,u,u,u,o,u,o,u,o,u,o,u,o],
[o,o,o,u,u,u,u,o,u,o,o,o,u],
[o,o,o,o,o,u,u,o,o,o,o,o,u]

]).
y_facile(
[o,u,u,u,o,o,u,u,o,u,o,o,u]).
