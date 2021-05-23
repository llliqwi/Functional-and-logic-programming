read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

%1.1. Дан файл. Прочитать из файла строки и вывести длину наибольшей
% строки.
pr1_1:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(_, LengthList),seen,max_member(Max,LengthList),write(Max).

%1.2. Дан файл. Определить, сколько в файле строк, не содержащих
% пробелы.
pr1_2:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(ListStr,_),seen,pr1_2(ListStr,Res),write(Res).

pr1_2(ListStr,Res):-pr1_2(ListStr,0,Res).
pr1_2([],Res,Res):-!.
pr1_2([H|T],Cur_res,Res):-not(member(32,H)),Cur_res1 is Cur_res+1,pr1_2(T,Cur_res1,Res),!.
pr1_2([_|T],Cur_res,Res):-pr1_2(T,Cur_res,Res).

%1.3. Дан файл, найти и вывести на экран только те строки, в которых букв
% А больше, чем в среднем на строку.

pr1_3:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(ListStr,_),seen,count_A_list(ListStr,Count_A_list),sum_list(Count_A_list,Sum),length(ListStr,Lenght),Sr is Sum/Lenght,pr1_3_write(ListStr,Count_A_list,Sr).

pr1_3_write([],[],_):-!.
pr1_3_write([H|T],[HA|TA],Sr):-HA>Sr,write_str(H),nl,pr1_3_write(T,TA,Sr),!.
pr1_3_write([_|T],[_|TA],Sr):-pr1_3_write(T,TA,Sr).

count_A_list(ListStr,Res):-count_A_list(ListStr,[],Res).
count_A_list([],Res,Res):-!.
count_A_list([H|T],Cur_res,Res):-count_A(H,Count_A),append(Cur_res,[Count_A],Cur_res1),count_A_list(T,Cur_res1,Res).

count_A(Str,Res):-count_A(Str,0,Res).
count_A([],Res,Res):-!.
count_A([H|T],Cur_res,Res):-H=65,Cur_res1 is Cur_res+1,count_A(T,Cur_res1,Res),!.
count_A([_|T],Cur_res,Res):-count_A(T,Cur_res,Res).

%1.4. Дан файл, вывести самое частое слово.

pr1_4:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(ListStr),seen,add_enter(ListStr,ListStr1),append(ListStr1,Str),pr1_4(Str,0,[],Res),write_str(Res).

add_enter(ListStr,Res):-add_enter(ListStr,[],Res).
add_enter([],Res,Res):-!.
add_enter([H|T],Cur_res,Res):-append(H,[10],H1),append(Cur_res,[H1],Cur_res1),add_enter(T,Cur_res1,Res).

pr1_4([],_,Res,Res):-!.
pr1_4(Str,Cur_count,Cur_word,Res):-skip_space_marks(Str,Str1),get_word(Str1,Word,Str2),numb_same_words(Word,Str1,Count),(Count>Cur_count->pr1_4(Str2,Count,Word,Res);pr1_4(Str2,Cur_count,Cur_word,Res)).

skip_space_marks([H|T],Str1):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47;H=10),skip_space_marks(T,Str1),!.
skip_space_marks(Str1,Str1).

skip_space([32|T],Str1):-skip_space(T,Str1),!.
skip_space(Str1,Str1).

%get_word([],[],[]):-!.
get_word(Str,Word,Str2):-get_word(Str,[],Word,Str2).
get_word([],Word,Word,[]).
get_word([H|T],Word,Word,T):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47;H=10),!.
get_word([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word(T,Word2,Word1,Str2).

numb_same_words(Word,Str,Count):-numb_same_words(Word,Str,1,Count),!.
numb_same_words(_,[],Count,Count):-!.
numb_same_words(Word,Str,Cur_count,Count):-skip_space_marks(Str,Str1),get_word(Str1,Word1,Str2),(Word=Word1->Cur_count1 is Cur_count+1,numb_same_words(Word,Str2,Cur_count1,Count);numb_same_words(Word,Str2,Cur_count,Count)).

%2.5. Дана строка. Необходимо перемешать все символы строки в случайном
% порядке.

pr2_5:-read_str(Str,_,_),random_permutation(Str,Str1),write_str(Str1).


%2.14. Дана строка в которой записаны слова через пробел. Необходимо
% упорядочить слова по количеству букв в каждом слове.

pr2_14:-read_str(Str,_,_),split(Str,Str1),bubble(Str1,Res),write_list_str(Res).

split(Str,Res):-split(Str,[],Res).
split([],Res,Res):-!.
split(Str,Cur_res,Res):-get_word_space(Str,Word,Str1),append(Cur_res,[Word],Cur_res1),split(Str1,Cur_res1,Res),!.

%get_word_space([],[],[]):-!.
get_word_space(Str,Word,Str2):-get_word_space(Str,[],Word,Str2).
get_word_space([],Word,Word,[]).
get_word_space([H|T],Word,Word,T):-H=32,!.
get_word_space([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word_space(T,Word2,Word1,Str2).

bubble_iter([X,Y|T],[Y,X|T]) :- length(X, LengthX), length(Y, LengthY), LengthX > LengthY, !.
bubble_iter([X|T],[X|T1]) :- bubble_iter(T, T1).
bubble(List,List_res) :- bubble_iter(List, List1), bubble(List1,List_res),!.
bubble(List,List):-!.

%3. Дана строка. Необходимо найти все даты, которые описаны в
% виде "31 февраля 2007".

pr3:-read_str(Str,_,_),pr3(Str,Res),write_list_str(Res).

pr3(Str,Res):-pr3(Str,[],Res).
pr3([],Res,Res):-!.
pr3([H,H1,H2|T],Cur_res,Res):-H>=48,H=<57,H1>=49,H1=<57,H2=32,get_word_space(T,Month,T1),month(Month),get_year(T1,Year,T2),append([H,H1,H2,32],[],Date),append(Date,Month,Date1),append(Date1,[32],Date2),append(Date2,Year,Date3),append(Cur_res,[Date3],Cur_res1),pr3(T2,Cur_res1,Res),!.
pr3([_|T],Cur_res,Res):-pr3(T,Cur_res,Res).

get_year(Str,Year,Str1):-get_year(Str,4,[],Year,Str1).
get_year(Str,0,Year,Year,Str):-!.
get_year([H|T],I,Cur_year,Year,Str1):-H>=48,H=<57,I1 is I-1,append(Cur_year,[H],Cur_year1),get_year(T,I1,Cur_year1,Year,Str1).

get_month(Str,Word,Str2):-get_month(Str,[],Word,Str2).
get_month([H|T],Word,Word,[H|T]):-H<1072,!;H>1103,!.
get_month([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_month(T,Word2,Word1,Str2).

month([1103,1085,1074,1072,1088,1103]).
month([1092,1077,1074,1088,1072,1083,1103]).
month([1084,1072,1088,1090,1072]).
month([1072,1087,1088,1077,1083,1103]).
month([1084,1072,1103]).
month([1080,1102,1085,1103]).
month([1080,1102,1083,1103]).
month([1072,1074,1075,1091,1089,1090,1072]).
month([1089,1077,1085,1090,1103,1073,1088,1103]).
month([1086,1082,1090,1103,1073,1088,1103]).
month([1085,1086,1103,1073,1088,1103]).
month([1076,1077,1082,1072,1073,1088,1103]).

%4.5. Дана строка. Необходимо найти наибольшее количество идущих
% подряд символов кириллицы.

pr4_5:-read_str(Str,_,_),pr4_5(Str,Res),write(Res).

pr4_5(Str,Res):-pr4_5(Str,0,0,Res).
pr4_5([],I,Cur_res,Res):-I>Cur_res->Res is I;Res is Cur_res,!.
pr4_5([H|T],I,Cur_res,Res):-H>=1040,H=<1103->I1 is I+1,pr4_5(T,I1,Cur_res,Res),!.
pr4_5([_|T],I,Cur_res,Res):-I>Cur_res->Cur_res1 is I,pr4_5(T,0,Cur_res1,Res);pr4_5(T,0,Cur_res,Res).

%4.7. Дана строка. Необходимо найти минимальное из имеющихся в ней
%натуральных чисел.

pr4_7:-read_str(Str,_,_),pr4_7(Str,Res),write(Res).

pr4_7(Str,Res):-pr4_7_first(Str,[],Str1,First_num),pr4_7(Str1,[],First_num,Res).

pr4_7_first([H|T],Num,Str,Res):-H>=49,H=<57,append(Num,[H],Num1),pr4_7_first(T,Num1,Str,Res),!.
pr4_7_first([_|T],[],Str,Res):-pr4_7_first(T,[],Str,Res),!.
pr4_7_first([_|T],Num,Str,Res):-number_chars(Res,Num),Str=T.

pr4_7([],Num,Cur_res,Res):-number_chars(Number,Num),(Number<Cur_res->Res=Number;Res=Cur_res),!.
pr4_7([H|T],Num,Cur_res,Res):-H>=49,H=<57,append(Num,[H],Num1),pr4_7(T,Num1,Cur_res,Res),!.
pr4_7([_|T],[],Cur_res,Res):-pr4_7(T,[],Cur_res,Res),!.
pr4_7([_|T],Num,Cur_res,Res):-number_chars(Number,Num),Number<Cur_res,pr4_7(T,[],Number,Res),!.
pr4_7([_|T],_,Cur_res,Res):-pr4_7(T,[],Cur_res,Res).


%4.14. Дана строка. Необходимо найти наибольшее количество идущих
% подряд цифр.

pr4_14:-read_str(Str,_,_),pr4_14(Str,Res),write(Res).

pr4_14(Str,Res):-pr4_14(Str,0,0,Res).
pr4_14([],I,Cur_res,Res):-I>Cur_res->Res is I;Res is Cur_res,!.
pr4_14([H|T],I,Cur_res,Res):-H>=48,H=<57->I1 is I+1,pr4_14(T,I1,Cur_res,Res),!.
pr4_14([_|T],I,Cur_res,Res):-I>Cur_res->Cur_res1 is I,pr4_14(T,0,Cur_res1,Res);pr4_14(T,0,Cur_res,Res).

%5. Задание 5 Прочитать список строк из файла. Упорядочить по длине
% строки.

pr5:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(ListStr),seen,bubble(ListStr,Res),write_list_str(Res).

%6. Задание 6 Дан список строк из файла. Упорядочить по количеству слов в
% строке.

pr6:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(ListStr),seen,bubble_count_words(ListStr,Res),write_list_str(Res).

count_words(Str,Count):-count_words(Str,0,Count).
count_words([],K,K):-!.
count_words(Str,I,K):-skip_space_marks(Str,Str1),get_word(Str1,Word,Str2),Word\=[],I1 is I+1,count_words(Str2,I1,K),!.
count_words(_,K,K).

bubble_count_words_iter([X,Y|T],[Y,X|T]) :- count_words(X,Count_X),count_words(Y,Count_Y), Count_X > Count_Y, !.
bubble_count_words_iter([X|T],[X|T1]) :- bubble_count_words_iter(T, T1).
bubble_count_words(List,List_res) :- bubble_count_words_iter(List, List1), bubble_count_words(List1,List_res),!.
bubble_count_words(List,List):-!.

%7. Дан список строк из файла. Упорядочить по количеству слов
% идущих после чисел.

pr7:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/lab8txt.txt'),read_list_str(ListStr),seen,bubble_count_an(ListStr,Res),write_list_str(Res).

bubble_count_an_iter([X,Y|T],[Y,X|T]) :- count_after_num(X,Count_X),count_after_num(Y,Count_Y), Count_X > Count_Y, !.
bubble_count_an_iter([X|T],[X|T1]) :- bubble_count_an_iter(T, T1).
bubble_count_an(List,List_res) :- bubble_count_an_iter(List, List1), bubble_count_an(List1,List_res),!.
bubble_count_an(List,List):-!.

count_after_num(Str,Count):-count_after_num(Str,0,Count).
count_after_num([],K,K):-!.
count_after_num(Str,I,K):-skip_space(Str,Str1),get_num(Str1,_,Str2),skip_space(Str2,Str3),get_word_num(Str3,Word,Str4),(Word\=[]->I1 is I+1,count_after_num(Str4,I1,K);K is I),!.
count_after_num(Str,I,K):-skip_space(Str,Str1),get_word_num(Str1,_,Str2),count_after_num(Str2,I,K).

%get_word([],[],[]):-!.
get_num([H|T],Word,Str2):-(H=45;(H>=48,H=<57)),get_num([H|T],[],Word,Str2).
get_num([],Word,Word,[]).
get_num([H|T],Word,Word,[H|T]):-not(H=46;(H>=48,H=<57)),!.
get_num([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_num(T,Word2,Word1,Str2).

%get_word_num([],[],[]):-!.
get_word_num(Str,Word,Str2):-get_word_num(Str,[],Word,Str2).
get_word_num([],Word,Word,[]).
get_word_num([H|T],Word,Word,[H|T]):-(H=32;(H>=48,H=<57)),!.
get_word_num([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word_num(T,Word2,Word1,Str2).
