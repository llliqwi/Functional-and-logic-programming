max(X,Y,X):-X>Y.
max(_,Y,Y).

max(X,Y,Z,X):-X>=Y,X>=Z.
max(_,Y,Z,Y):-Y>=Z.
max(_,_,Z,Z).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact(1,CurX,CurX):-!.
fact(N,CurX,X):-N1 is N-1,CurX1 is CurX*N, fact(N1,CurX1,X).
factorial(N,X):-fact(N,1,X).
