man(ivor).
man(bakay).
man(zhidislav).
man(conon).
man(onisim).
man(ferapont).
man(nikon).
man(sidor).
man(ermak).

woman(vera).
woman(varvara).
woman(miroslava).
woman(lada).
woman(marfa).
woman(mstislava).
woman(predslava).
woman(lyubava).
woman(antonida).

parent(ivor,bakay).
parent(ivor,miroslava).
parent(ivor,conon).
parent(ivor,marfa).

parent(vera,bakay).
parent(vera,miroslava).
parent(vera,conon).
parent(vera,marfa).

parent(zhidislav,ferapont).
parent(zhidislav,nikon).
parent(varvara,ferapont).
parent(varvara,nikon).

parent(conon,predslava).
parent(conon,lyubava).
parent(lada,predslava).
parent(lada,lyubava).

parent(onisim,antonida).
parent(onisim,ermak).
parent(marfa,antonida).
parent(marfa,ermak).

allman(X):-man(X),write(X),write(","),fail.
allwoman(X):-woman(X),write(X),write(","),fail.

children(X,Y):-parent(Y,X).
allchildren(X):-children(Y,X),write(Y),write(","),fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

son(X,Y):-parent(Y,X),man(X),!.
son(X):-son(Y,X),write(Y),nl,fail.

brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),woman(Z).
brother(X):-brother(Y,X),write(Y),write(", "),fail.

husband(X,Y):-children(Z,X),children(Z,Y),man(X).
husband(X):-husband(Y,X),write(Y).

b_s(X,Y):-parent(Z,X),parent(Z,Y),woman(Z).
b_s(X):-b_s(Y,X),write(Y),write(","),fail.

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).
grand_pas(X):-grand_pa(Y,X),write(Y),write(", "),fail.

grand_da(X,Y):-woman(X),parent(Z,X),parent(Y,Z).
grand_dats(X):-parent(X,Y),parent(Y,Z),woman(Z),write(Z),nl,fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y),!;grand_pa(Y,X),man(X),!.
grand_pa_and_da(X,Y):-grand_da(X,Y),woman(Y),!;grand_da(Y,X),woman(X),!.

grand_pa_and_da(X,Y):-parent(X,Z),parent(Z,Y),man(X),woman(Y).

uncle(X,Y):-parent(Z,H),parent(H,Y),parent(Z,X),X\=H,man(X),man(Z).
uncle(X):-uncle(Y,X),write(Y),write(", "),fail.

niece(X,Y):-parent(Z,Y),parent(Z,D),parent(D,X),Y\=D,woman(Z),woman(X).
nieces(X):-niece(Y,X),write(Y),write(", "),fail.
