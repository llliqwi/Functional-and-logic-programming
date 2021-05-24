get_code:-read_str(Str,_),write(Str).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|T1]):-in_list_exlude(T,El,T1).

del_all([],_,[]):-!.
del_all([H|T],El,[H|T1]):-H\=El,del_all(T,El,T1),!.
del_all([_|T],El,T1):-del_all(T,El,T1).

%1.1.
pr1_1:-read_str(A,_),read(K),tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/1_1.txt'),not(k_arr_rep(A,K,[])),told.

k_arr_rep(_,0,Perm):-write_str(Perm),nl,!,fail.
k_arr_rep(A,N,Perm):-in_list(A,El),N1 is N-1,k_arr_rep(A,N1,[El|Perm]).

%1.2.
pr1_2:-read_str(A,_),tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/1_2.txt'),not(perm(A,[])),told.

perm([],Perm):-write_str(Perm),nl,!,fail.
perm(A,Perm):-in_list_exlude(A,El,A1),perm(A1,[El|Perm]).

%1.3.
pr1_3:-read_str(A,_),read(K),tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/1_3.txt'),not(k_arr(A,K,[])),told.

k_arr(_,0,Perm):-write_str(Perm),nl,!,fail.
k_arr(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,k_arr(A1,N1,[El|Perm]).

%1.4.
pr1_4:-read_str(A,_),tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/1_4.txt'),not(sub(A)),told.

sub(A):-sub(A,Sub),write_str(Sub),nl,fail.
sub([],[]).
sub([H|List],[H|Sub]):-sub(List,Sub).
sub([_|List],Sub):-sub(List,Sub).

%1.5.
pr1_5:-read_str(A,_),read(K),tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/1_5.txt'),not(k_perm(A,K)),told.

k_perm(A,K):-k_perm(A,K,K_perms),write_str(K_perms),nl,fail.
k_perm(_,0,[]):-!.
k_perm([H|List],K,[H|Sub]):-K1 is K-1,k_perm(List,K1,Sub).
k_perm([_|List],K,Sub):-k_perm(List,K,Sub).

%1.6.
pr1_6:-read_str(A,_),read(K),tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/1_6.txt'),not(k_perm_rep(A,K)),told.

k_perm_rep(A,K):-k_perm_rep(A,K,K_perms),write_str(K_perms),nl,fail.
k_perm_rep(_,0,[]):-!.
k_perm_rep([H|List],K,[H|Sub]):-K1 is K-1,k_perm_rep([H|List],K1,Sub).
k_perm_rep([_|List],K,Sub):-k_perm_rep(List,K,Sub).

%2.
pr2:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/2.txt'),not(word_2a(A,5,[])),told.

word_2a(_,0,Perm):-!,count_symb(Perm,a,C),C=2,write_str(Perm),nl,fail.
word_2a(A,N,Perm):-in_list(A,El),N1 is N-1,word_2a(A,N1,[El|Perm]).

%3.
pr3:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/3.txt'),not(word_2a_only(A,5,[])),told.

word_2a_only(_,0,Perm):-!,count_symb(Perm,a,C),C=2,del_all(Perm,a,Perm1),is_set(Perm1),write_str(Perm),nl,fail.
word_2a_only(A,N,Perm):-in_list(A,El),N1 is N-1,word_2a_only(A,N1,[El|Perm]).

count_symb(Str,Symb,Res):-count_symb(Str,Symb,0,Res),!.
count_symb([],_,Res,Res):-!.
count_symb([H|T],H,Cur_res,Res):-Cur_res1 is Cur_res+1,count_symb(T,H,Cur_res1,Res),!.
count_symb([_|T],S,Cur_res,Res):-count_symb(T,S,Cur_res,Res).

%4.
pr4:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/4.txt'),not(word_2_only(A,5,[])),told.

word_2_only(_,0,Perm):-!,count_2_only(Perm),write_str(Perm),nl,fail.
word_2_only(A,N,Perm):-in_list(A,El),N1 is N-1,word_2_only(A,N1,[El|Perm]).

count_2_only(List):-count_2_only(List,List).
count_2_only(List,[H|_]):-count_symb(List,H,C),C=2,del_all(List,H,T1),is_set(T1),!.
count_2_only(List,[_|T]):-count_2_only(List,T).

%5.
pr5:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/5.txt'),not(word_2_2_only(A,6,[])),told.

word_2_2_only(_,0,Perm):-!,count_2_2_only(Perm),write_str(Perm),nl,fail.
word_2_2_only(A,N,Perm):-in_list(A,El),N1 is N-1,word_2_2_only(A,N1,[El|Perm]).


count_2_2_only(List):-count_2_2_only(List,List).
count_2_2_only(List,[H|_]):-count_symb(List,H,C),C=2,del_all(List,H,List1),count_2_only(List1),!.
count_2_2_only(List,[_|T]):-count_2_2_only(List,T).

%6.
pr6:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/6.txt'),not(word_2_3_only(A,7,[])),told.

word_2_3_only(_,0,Perm):-!,count_2_3_only(Perm),write_str(Perm),nl,fail.
word_2_3_only(A,N,Perm):-in_list(A,El),N1 is N-1,word_2_3_only(A,N1,[El|Perm]).

count_2_3_only(List):-count_2_3_only(List,List).
count_2_3_only(List,[H|_]):-count_symb(List,H,C),C=2,del_all(List,H,List1),count_X_only(List1,3),!.
count_2_3_only(List,[_|T]):-count_2_3_only(List,T).

count_X_only(List,X):-count_X_only(List,X,List).
count_X_only(List,X,[H|_]):-count_symb(List,H,C),C=X,del_all(List,H,T1),is_set(T1),!.
count_X_only(List,X,[_|T]):-count_X_only(List,X,T).

%7.
pr7:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/7.txt'),not(word_2_2_3_only(A,9,[])),told.

word_2_2_3_only(_,0,Perm):-!,count_2_2_3_only(Perm),write_str(Perm),nl,fail.
word_2_2_3_only(A,N,Perm):-in_list(A,El),N1 is N-1,word_2_2_3_only(A,N1,[El|Perm]).

count_2_2_3_only(List):-count_2_2_3_only(List,List).
count_2_2_3_only(List,[H|_]):-count_symb(List,H,C),C=3,del_all(List,H,List1),count_2_2_only(List1),!.
count_2_2_3_only(List,[_|T]):-count_2_2_3_only(List,T).

%8.
pr8:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/8.txt'),not(word_more_2a(A,4,[])),told.

word_more_2a(_,0,Perm):-!,count_symb(Perm,a,C),C>2,write_str(Perm),nl,fail.
word_more_2a(A,N,Perm):-in_list(A,El),N1 is N-1,word_more_2a(A,N1,[El|Perm]).

count_more_X(List,X):-count_more_X(List,X,List).
count_more_X(List,X,[H|_]):-count_symb(List,H,C),C>X,!.
count_more_X(List,X,[_|T]):-count_more_X(List,X,T).

%9.
pr9:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/9.txt'),not(word_more_2a(A,7,[])),told.

%10.
pr10:-A=[a,b,c,d,e,f],tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab9txt/10.txt'),not(word_4let(A,7,[])),told.

word_4let(_,0,[H1|T1]):-!,del_all([H1|T1],H1,[H2|T2]),del_all([H2|T2],H2,[H3|T3]),del_all([H3|T3],H3,[H4|T4]),del_all([H4|T4],H4,Str),[H4|T4]\=[],Str=[],write_str([H1|T1]),nl,fail.
word_4let(A,N,Perm):-in_list(A,El),N1 is N-1,word_4let(A,N1,[El|Perm]).
