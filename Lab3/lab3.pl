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

fibUp(1,1):-!.                                                     
fibUp(2,1):-!.
fibUp(N,X):-N1 is N-1, fibUp(N1,X1), N2 is N-2, fibUp(N2,X2), X is X1+X2.

fibDown(1,_,Y2,Y2):-!.
fibDown(2,_,Y2,Y2):-!.
fibDown(N,Y1,Y2,X):-Y3 is Y1+Y2, N1 is N-1, fibDown(N1,Y2,Y3,X).
fibD(N,X):-fibDown(N,1,1,X).

sumUp(N,N):-N<10,!.     
sumUp(N,Sum):-N1 is N mod 10, N2 is N div 10, sumUp(N2,Sum1),Sum is Sum1+N1.

sum(N,X):-sum(N,0,X),!.
sum(0,CurX,CurX):-!.             
sum(N,CurX,X):-N1 is N mod 10,N2 is N div 10,X2 is CurX+N1,sum(N2,X2,X).

maxUp(X,X):- X<10,!.         
maxUp(X,N):- X1 is X div 10, X2 is X mod 10, maxUp(X1,N1), ( X2<N1 ->  N =  N1;N = X2).

maxDown(0, Max, Max) :- !.
maxDown(N, CurM, Max):-N1 is N mod 10, N2 is N div 10,(N1 < CurM -> CurM1 is CurM; CurM1 is N1),maxDown(N2, CurM1, Max).
maxDown(N, Max):- maxDown(N, 0, Max).
