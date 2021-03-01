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

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).











