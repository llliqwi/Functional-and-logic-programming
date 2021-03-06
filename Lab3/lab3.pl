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

%рекурсией вверх
mn_up(0,0):-!.
mn_up(N,X):- N1 is N div 10, mn_up(N1,Min1),
   N2 is N mod 10, (Min1 = 0 -> ((N3 is N2 mod 2, N3 \= 0) -> X = N2 ;
    X = Min1); (N2 < Min1 -> X = N2 ; X = Min1)).

%рекурсией вниз
mn_down(N,X):- mn_down(N,0,X).
mn_down(0,X,X):-!.
mn_down(N,Curr_min,X):- N1 is N mod 10, N2 is N div 10,
    ((N3 is N1 mod 2, N3 \= 0) -> (Curr_min = 0 -> Min1 = N1 ; (N1 < Curr_min ->
    Min1 = N1 ; Min1 = Curr_min)), mn_down(N2,Min1,X) ;
    mn_down(N2,Curr_min,X)).
    
nod(A,A,A):-!. 
nod(A,B,Nod):-A>=B,C is A mod B, nod(C,B,Nod).
nod(A,B,Nod):-A<B,C is B mod A, nod(A,C,Nod).


%рекурсия вверх
kolvo_nedel3_up(N,X):- kolvo_nedel3_up(N,N,X).
kolvo_nedel3_up(_,1,1):-!.
kolvo_nedel3_up(N,I,X):- I1 is I - 1, kolvo_nedel3_up(N,I1,X1),
    (   (0 is N mod I, N1 is I mod 3, N1\=0) -> X is X1 + 1 ; X = X1).

%рекурсия вниз
kolvo_nedel3_down(N,X):- kolvo_nedel3_down(N,N,0,X).
kolvo_nedel3_down(_,0,X,X):-!.
kolvo_nedel3_down(N,I,P,X):- ((0 is N mod I, N1 is I mod 3, N1\=0)->
    P1 is P + 1 ; P1 = P),I1 is I - 1, kolvo_nedel3_down(N,I1,P1,X).

mult_up(0,1):-!.
mult_up(N,Mult):- N1 is N div 10, mult_up(N1,Mult1), Mult is Mult1 * (N mod 10).

sum_del(_,0,_,_,Sum,Sum):-!.
sum_del(N,I,S,M,Sum1,Sum):- (0 is N mod I, nod(S,I,Nod1),Nod1 = 1, nod(M,I,Nod),
     Nod \= 1) -> (Sum2 is Sum1 + I, I1 is I - 1,sum_del(N,I1,S,M,Sum2,Sum)) ;
    (I1 is I - 1,sum_del(N,I1,S,M,Sum1,Sum)).
task_15 :- read(N), sum_down(N,S), mult_up(N,M), sum_del(N,N,S,M,0,Sum),
    write(Sum).
