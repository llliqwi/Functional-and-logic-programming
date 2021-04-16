sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_ein2:-FriendHair=[_,_,_],

in_list(FriendHair,[belokurov,_]),
in_list(FriendHair,[rizhov,_]),
in_list(FriendHair,[chernov,_]),
in_list(FriendHair,[_,blond]),
in_list(FriendHair,[_,brunet]),
in_list(FriendHair,[_,red]),
not(in_list(FriendHair,[belokurov,blond])),
not(in_list(FriendHair,[belokurov,brunet])),
not(in_list(FriendHair,[rizhov,red])),
not(in_list(FriendHair,[chernov,brunet])),
write(FriendHair).

pr_ein3:- Outfit=[_,_,_],

in_list(Outfit,[anna,_,_]),
in_list(Outfit,[valya,_,_]),
in_list(Outfit,[natasha,_,_]),
in_list(Outfit,[_,white,_]),
in_list(Outfit,[_,green,_]),
in_list(Outfit,[_,blue,_]),
in_list(Outfit,[_,_,white]),
in_list(Outfit,[_,_,green]),
in_list(Outfit,[_,_,blue]),
(   in_list(Outfit,[anna,white,white]);
in_list(Outfit,[anna,green,green]);
in_list(Outfit,[anna,blue,blue])),
not(in_list(Outfit,[valya,white,_])),
not(in_list(Outfit,[valya,_,white])),
not(in_list(Outfit,[valya,white,white])),
    in_list(Outfit,[natasha,_,green]),
not(in_list(Outfit,[valya,green,green])),
not(in_list(Outfit,[valya,blue,blue])),
not(in_list(Outfit,[natasha,white,white])),
not(in_list(Outfit,[natasha,green,green])),
not(in_list(Outfit,[natasha,blue,blue])),
write(Outfit).


pr_ein4:- Jobs = [_,_,_],
in_list(Jobs,[ivanov,_,_,_]),
in_list(Jobs,[semenov,_,_,_]),
in_list(Jobs,[_,tokar,_,_]),
in_list(Jobs,[_,svarshik,_,_]),
in_list(Jobs,[_,_,_,old]),
in_list(Jobs,[_,_,_,middle]),
in_list(Jobs,[_,_,indefinitely,_]),
in_list(Jobs,[_,slesar,no,young]),
in_list(Jobs,[borisov,_,have,_]),
not(in_list(Jobs,[_,tokar,_,old])),
not(in_list(Jobs,[semenov,tokar,_,_])),
not(in_list(Jobs,[semenov,_,_,young])),
write(Jobs).

pr_ein5:- Drinks = [_,_,_,_],
in_list(Drinks,[bottle,_]),
in_list(Drinks,[glass,_]),
in_list(Drinks,[jug,_]),
in_list(Drinks,[bank,_]),
in_list(Drinks,[_,milk]),
in_list(Drinks,[_,lemonade]),
in_list(Drinks,[_,kvass]),
in_list(Drinks,[_,water]),
not(in_list(Drinks,[bottle,milk])),
not(in_list(Drinks,[bottle,water])),
not(in_list(Drinks,[jug,lemonade])),
not(in_list(Drinks,[jug,kvass])),
not(in_list(Drinks,[bank,lemonade])),
not(in_list(Drinks,[bank,water])),
not(in_list(Drinks,[glass,milk])),
not(in_list(Drinks,[bank,milk])),
write(Drinks).

pr_ein6:- Talents = [_,_,_,_],
in_list(Talents,[voronov,_]),
in_list(Talents,[pavlov,_]),
in_list(Talents,[levitic,_]),
in_list(Talents,[saharov,_]),
in_list(Talents,[_,dancer]),
in_list(Talents,[_,painter]),
in_list(Talents,[_,singer]),
in_list(Talents,[_,writer]),
not(in_list(Talents,[voronov,singer])),
not(in_list(Talents,[levitic,singer])),
not(in_list(Talents,[pavlov,writer])),
not(in_list(Talents,[pavlov,painter])),
not(in_list(Talents,[voronov,painter])),
not(in_list(Talents,[saharov,writer])),
not(in_list(Talents,[voronov,writer])),
write(Talents).

pr_ein7:- Sport = [_,_,_],
in_list(Sport,[mikle,_,basketball]),
in_list(Sport,[simon,israel,_]),
in_list(Sport,[ritzard ,_,_]),
in_list(Sport,[_,_,tennis]),
in_list(Sport,[_,_,cricket]),
in_list(Sport,[_,amerikan,_]),
in_list(Sport,[_,australian,_]),
not(in_list(Sport,[mikle,amerikan,_])),
not(in_list(Sport,[simon,_,tennis])),
in_list(Sport,[Who1,australian,_]),
in_list(Sport,[ritzard ,_,Who2]),
write(Sport), nl,
write(Who1), write(" -   Australian"), nl,
write("Ritzard goes in for "),	write(Who2).

