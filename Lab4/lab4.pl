rList(N, L) :- rList(N, 0, [], L), !.
rList(N, N, L, L) :- !.
rList(N, CurN, CurL, L) :- CurN1 is CurN + 1, read(X), append(CurL, [X], CurL1),rList(N, CurN1, CurL1, L).

writeList([]):-!.
writeList([H|T]):-write(H),nl,writeList(T).

sum_list_down(List,Sum):- sList(List,0,Sum).
sList([],Sum,Sum):-!.
sList([H|L], CurSum, Sum):- CurSum1 is CurSum+H,sList(L,CurSum1,Sum).

sum_list_up([],0):-!.
sum_list_up([H|L],Sum):-sum_list_up(L,Sum1),Sum is Sum1+H.

listElNumb(List,Elem,Number):-listElNumb(List,Elem,0,Number).
listElNumb([H|_],H,Number,Number):-!.
listElNumb([_|T],Elem,I,Number):-I1 is I+1,listElNumb(T,Elem,I1,Number).

 write_num4:-write("кол-во элементов :
 "),read(N),nl,write("Введите список"),rList(N,List),nl,write("Введите элемент: "),read(Elem),nl,listElNumb(List,Elem,Number),write(Number),!.
write_num4:-write("Нет элемента").

write_5:-write("Количество элементов: "),read(N),nl,write("Введите список"),rList(N,List),nl,write("Введите номер элемента: "),
read(Number),nl,listElNumb(List,Elem,Number),write(Elem),!.
write_5:-write("Такого нет").

min_listUp([MinElem], MinElem):-write("Минимальный элемент"),!.
min_listUp([Head|L], MinElem):- min_listUp(L, TailMinElem),( TailMinElem < Head -> MinElem = TailMinElem; MinElem = Head).

min_list_down(List,MinElem):- min_list_down(List,10000,MinElem).
min_list_down([],MinElem,MinElem):-write("Минимальный элемент"),!.
min_list_down([Head|L],CurM,MinElem):-(Head<CurM -> Min1 is Head;Min1 is CurM),min_list_down(L,Min1,MinElem).

readMinElem:-write("Количество элементов: "),
   read(N),nl,write("Введите элементы списка "),
   rList(N,L),min_list_down(L,MinElem),
   write(MinElem),!.

member_List(X,[X|_]):-!.
member_List(X,[_|T]):-member_List(X,T).

reverse(L,X):-rev(L,[],X).
rev([],X,X):-!.
rev([H|T],CurL,X):-rev(T,H|CurL,X).

p([], _) :- !.
p([SubHead|SubTail], [Head|Tail]) :- (SubHead = Head -> p(SubTail, Tail); p([SubHead|SubTail], Tail)).


delete_ind(0,[_|Z],Z):- !.
delete_ind(X,[Head|T],[Head|R]) :- X1 is X-1,delete_ind(X1,T,R).

delete_1([], _Elem, []):-!.
delete_1([Elem|Tail], Elem, ResultTail):- delete_1(Tail, Elem, ResultTail), !.
delete_1([Head|Tail], Elem, [Head|ResultTail]):-delete_1(Tail, Elem, ResultTail).

unique([]):-!.
unique([Head|Tail]):- member(Head, Tail), !, fail; unique(Tail).

removeDub([],[]).
removeDub([H|T],List):- rd1(H,T,T1), removeDub(T1,ListT),List=[H|ListT].
rd1(_,[],[]):-!.
rd1(H,[H|T],List):-    rd1(H,T,List).
rd1(X,[H|T],List):-    rd1(X,T,Lx1),List=[H|Lx1].

count_num([Head|Tail],X,R):-count_num([Head|Tail],X,0,R).
count_num([],_,Res,Res):-!.
count_num([Head|Tail],X,I,Res):-(Head=X -> I1 is I+1,count_num(Tail,X,I1,Res);count_num(Tail,X,I,Res)).

length_1(List, Length):- length_1(List, 0, Length).
length_1([], Length, Length):-!.
length_1([_Head|Tail], X, Length):- X1 is X + 1, length_1(Tail, X1, Length).

