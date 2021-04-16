write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

append1([],List,List):-!.
append1([H1|Tail],List,[H1|Tail1]):-append(Tail,List,Tail1).

wr_str3:-read_str(A,Length),write_str(A),write(","),write_str(A),write(","),write_str(A),write(","),write(Length).

kolvo_words:-read_str(A,_),append1([32],A,A1),kol_slov(A1,0,Kol),write(Kol).
kol_slov([_|[]],Kol,Kol):-!.
kol_slov([H1|[H2|T]],K,Kol):-(H1=32,H2\=32 -> K1 is K+1,kol_slov([H2|T],K1,Kol);kol_slov([H2|T],K,Kol)).

reverse(A, Z) :- reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

list_words:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],_,[]).
list_words([],LW,LW,_):-!.
list_words([H|T],LW,LWN,W):-(H=32 -> append1([W],LW,LW1),list_words(T,LW1,LWN,[]);
append1([H],W,W1),list_words(T,LW,LWN,W1)).

kol_repeat_in_list([H|T],X,K):-kol_repeat_in_list([H|T],X,0,K).
kol_repeat_in_list([],_,Kol,Kol):-!.
kol_repeat_in_list([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat_in_list(T,X,K1,Kol);	kol_repeat_in_list(T,X,K,Kol)).

often_word_in_list:-read_str(A,_),append1([32],A,A1),reverse(A1,AR),list_words(AR,[],LW,[]),often_word_in_list(LW,_,Word,0,_),write_str(Word),!.
often_word_in_list([],Word,Word,Kol,Kol):-!.
often_word_in_list([H|T],W,Word,K,Kol):-kol_repeat_in_list([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,often_word_in_list(T,W1,Word,K1,Kol1);often_word_in_list(T,W,Word,K,Kol)).


ex4:-read_str(A,Length),(Length>5 -> ex4(A),reverse(A,RES),ex4(RES);
	   ex4(A,Length)).
ex4([H1|[H2|[H3|_]]]):-put(H1),put(H2),put(H3),!.
ex4([_|_],0):-!.
ex4([H|T],Length):-put(H),L1 is Length-1,ex4([H|T],L1).

ex5:-read_str(Str,_),simbol(Str,Elem),match(Str,Elem,0).
simbol([H],H):-!.
simbol([_|Tail],Elem):-simbol(Tail,Elem).
match([_],_,_):-!.
match([Elem|T],Elem,Res):-write(Res),nl,Res1 is Res+1,match(T,Elem,Res1),!.
match([_|T],Elem,Res):-Res1 is Res+1,match(T,Elem,Res1).

index:-read_str(L,_),index(L,0).
index([],_):-!.
index([H|T],Res):-Res1 is Res+1,(0 is Res1 mod 3 -> put(H),index(T,Res1);index(T,Res1)).

ex7_1:- read_str(S,_), kolvo_p_m(S, Res), write("Количество плюсов и минусов = "),write(Res).
kolvo_p_m([], Res, Res) :- !.
kolvo_p_m([H|T], Count, Res) :-((H = 43 | H = 45) ->Count1 is Count + 1;Count1 is Count),kolvo_p_m(T, Count1, Res).
kolvo_p_m(List, Res) :- kolvo_p_m(List, 0, Res).

ex7_2:- read_str(S,_), count_posle0(S, Res), write("Количество = "),write(Res).
count_posle0([_], Res, Res) :- !.
count_posle0([_|[H2|T]], Count, Res) :-(H2 = 48 ->Count1 is Count + 1;Count1 is Count),count_posle0([H2|T], Count1, Res).
count_posle0(List, Res) :- count_posle0(List, 0, Res).

ex8:-read_str(Str,_),(not((in_list(Str, 119),in_list(Str, 120))) -> write("ошибка");(listElNumb(Str, 119, W),listElNumb(Str, 120, X),(W < X ->write("w  раньше x");write("x раньше w")))).

listElNumb(List,Elem,Number):-listElNumb(List,Elem,0,Number).
listElNumb([H|_],H,Number,Number):-!.
listElNumb([_|T],Elem,I,Number):-I1 is I+1,listElNumb(T,Elem,I1,Number).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

ex9:-read_str(Str1,Number1),read_str(Str2,Number2),(Number1>Number2 -> Number3 is Number1-Number2,write_1(Number3,Str1);Number3 is Number2-Number1,write_1(Number3,Str2)).
write_1(0,_):-!.
write_1(Number,Str):-write_str(Str),Number1 is Number-1,write_1(Number1,Str).

ex10:-read_str(Str,_),ex10(Str,Str1),write_str(Str1).
ex10([H1,H2,H3|T],List1):-H1=97,H2=98,H3=99,List1 = [119,119,119|T],!.
ex10(List,List1):-append1(List,[122,122,122],List1),!.

ex11:-read_str(Str,Length),(Length>10 -> ex11(Str,Str2);ex11(Str,Length,12,Str2)),write_str(Str2).
ex11(Str,Str2):- Str2 = [_,_,_,_,_,_],append1(Str2,_,Str),!.
ex11(Str2,12,_,Str2):-!.
ex11(Str,L,Length,Str2):-L1 is L+1,append1(Str,[111],Str1),ex11(Str1,L1,Length,Str2).

ex13:-read_str(Str,_),ex13(Str,0,[],Str1),reverse(Str1,Res),write_str(Res).
ex13([],_,Str,Str):-!.
ex13([H|T],K,Str1,NStr):-K1 is K+1,0 is K1 mod 2,(H\=97,H\=98-> append([97],Str1,NSt1),ex13(T,K1,NSt1,NStr),!; append([99],Str1,NSt1),ex13(T,K1,NSt1,NStr)),!.
ex13([H|T],K,Str1,NStr):-K1 is K+1,append([H],Str1,NSt1), ex13(T,K1,NSt1,NStr).

ex14:-read_str(Str,_),ex14(Str,0,Kol),write(Kol).
ex14([],Kol,Kol):-!.
ex14([H|T],Kol,Res):-H>47,H<58,K1 is Kol+1,ex14(T,K1,Res),!.
ex14([_|T],Kol,Res):-ex14(T,Kol,Res),!.

ex15:-read_str(Str,_),ex15(Str).
ex15([]):-!.
ex15([H|_]):-H\=97,H\=98,H\=99,!,fail.
ex15([_|T]):-ex15(T).

ex16:-read_str(Str,_),ex16(Str,[],Res),write_str(Res).
ex16([],Res,Res):-!.
ex16([H1|[H2|[H3|[H4|T]]]],Buffer,Res):-(H1=119,H2=111,H3=114,H4=100-> append(Buffer,[108,101,116,116,101,114],BufferN),ex16(T,BufferN,Res)),!.
ex16([H|T],Buffer,Res):-append1(Buffer,[H],BufferN),ex16(T,BufferN,Res),!.

ex17:-read_str(Str,_),ex17(Str,[],Res),write_str(Res).
ex17([],Res,Res):-!.
ex17([120,97,98,99|T],Buffer,Res):-append1(Buffer,[97,98,99],BufferNew),ex17(T,BufferNew,Res),!.
ex17([H|T],Buffer,Res):-append1(Buffer,[H],BufferNew),ex17(T,BufferNew,Res).

ex18:-read_str(Str,_),ex18(Str,[],Res),write_str(Res).
ex18([],Res,Res):-!.
ex18([97,98,99,X|T],Buffer,Res):-(X>47,X<58->append1(Buffer,[X],BufferNew)),ex18(T,BufferNew,Res),!.
ex18([H|T],Buffer,Res):-append1(Buffer,[H],BufferNew),ex18(T,BufferNew,Res).

ex19:-read_str(Str,_),ex19(Str,0,Kolvo),write(Kolvo).
ex19([],Kol,Kol):-!.
ex19([97,98,97|T],Kol,Kolvo):-Kol1 is Kol+1,ex19(T,Kol1,Kolvo),!.
ex19([_|T],Kol,Kolvo):-ex19(T,Kol,Kolvo).

ex20:-read_str(Str,_),ex20(Str,0,[],Str1),ex20(Str1,StStart),reverse(StStart,StEnd),ex20(StEnd,Str2),reverse(Str2,Res),write_str(Res).
ex20([],_,Res,Res):-!.
ex20([32|T],0,L,NL):-append1(L,[32],N),ex20(T,1,N,NL),!.
ex20([32|T],Kol,L,NL):-ex20(T,Kol,L,NL),!.
ex20([H|T],_,L,NL):-append(L,[H],N),ex20(T,0,N,NL),!.
ex20([32|T],NSt):-ex20(T,NSt),!.
ex20(Nst,Nst):-!.

ex21:-read_str([H|T],_),read_str(Str,_),(in_list(Str,H) -> ex21(T,Str,[],[],Res);ex21([H|T],Str,[],[],Res)),write_str(Res).
ex21([],_,[],Res,Res):-!.
ex21([],_,LastW,L,ListW):-append1(L,[LastW],ListW),!.
ex21([H|T],List2,Buffer,L,ListW):-not(in_list(List2,H)),append(Buffer,[H],Buffer2),ex21(T,List2,Buffer2,L,ListW),!.
ex21([_|T],List2,Buffer,L,ListW):-append1(L,[Buffer],NewL),ex21(T,List2,[],NewL,ListW).


ex22:-read_str(St,Length),print_sr(St),print_sr(St,Length).
print_sr([H|T]):-write("First = "),put(H),nl,reverse([H|T],[HR|_]),write("End = "),put(HR),nl.
print_sr(List,Length):-not(0 is Length mod 2),L is Length div 2+1,index(List,El,L,0),write("Middle = "),put(El),!.

index([H|T],El,Num):-index([H|T],El,Num,0).
index([H|T],El,Num,Chet):-Chet1 is Chet+1,(H = El,Num = Chet1 -> !;index(T,El,Num,Chet1)).
