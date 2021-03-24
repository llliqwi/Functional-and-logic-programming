
country(ms1,0).
country(t26,0).
country(cy152,0).
country(is2,0).
country(kv1,0).
country(pzic,1).
country(pz4h,1).
country(stug2,1).
country(tiger,1).
country(mouse,1).
country(t1,2).
country(stuart,2).
country(sherman,2).
country(hellcat,2).
country(t57heavy,2).
country(cruiser,3).
country(valentine,3).
country(churchill,3).
country(at,3).
country(conqueror,3).

armor(ms1,0).
armor(t26,0).
armor(cy152,1).
armor(is2,1).
armor(kv1,1).
armor(pzic,0).
armor(pz4h,0).
armor(stug2,0).
armor(tiger,1).
armor(mouse,1).
armor(t1,0).
armor(stuart,0).
armor(sherman,1).
armor(hellcat,0).
armor(t57heavy,1).
armor(cruiser,0).
armor(valentine,0).
armor(churchill,1).
armor(at,0).
armor(conqueror,1).

canon(ms1,0).
canon(t26,0).
canon(cy152,1).
canon(is2,1).
canon(kv1,1).
canon(pzic,0).
canon(pz4h,0).
canon(stug2,1).
canon(tiger,1).
canon(mouse,1).
canon(t1,0).
canon(stuart,0).
canon(sherman,1).
canon(hellcat,1).
canon(t57heavy,1).
canon(cruiser,0).
canon(valentine,0).
canon(churchill,1).
canon(at,1).
canon(conqueror,1).

tower(ms1,1).
tower(t26,1).
tower(cy152,0).
tower(is2,1).
tower(kv1,1).
tower(pzic,1).
tower(pz4h,1).
tower(stug2,0).
tower(tiger,1).
tower(mouse,1).
tower(t1,1).
tower(stuart,1).
tower(sherman,1).
tower(hellcat,1).
tower(t57heavy,1).
tower(cruiser,1).
tower(valentine,1).
tower(churchill,1).
tower(at,0).
tower(conqueror,1).

weight(ms1,0).
weight(t26,0).
weight(cy152,1).
weight(is2,1).
weight(kv1,1).
weight(pzic,0).
weight(pz4h,0).
weight(stug2,1).
weight(tiger,1).
weight(mouse,1).
weight(t1,0).
weight(stuart,0).
weight(sherman,1).
weight(hellcat,1).
weight(t57heavy,1).
weight(cruiser,0).
weight(valentine,0).
weight(churchill,1).
weight(at,1).
weight(conqueror,1).


power(ms1,0).
power(t26,1).
power(cy152,1).
power(is2,1).
power(kv1,1).
power(pzic,0).
power(pz4h,1).
power(stug2,1).
power(tiger,1).
power(mouse,1).
power(t1,0).
power(stuart,1).
power(sherman,1).
power(hellcat,1).
power(t57heavy,1).
power(cruiser,0).
power(valentine,1).
power(churchill,1).
power(at,1).
power(conqueror,1).

question1(X1):-write("which country is the tank?"),nl,
write("0. ussr"),nl,
write("1. germany"),nl,
write("2. usa"),nl,
write("3. britain"),nl,
read(X1).

question2(X2):-write("the armor of the tank is more than 80mm?"),nl,
write("1. yes"),nl,
write("0. no"),nl,
read(X2).

question3(X3):-write("a tank gun larger than 80mm?"),nl,
write("1. yes"),nl,
write("0. no"),nl,
read(X3).

question4(X4):-write("does the tank have a turret?"),nl,
write("1. yes"),nl,
write("0. no"),nl,
read(X4).

question5(X5):-write("the mass of the tank is more than 20 tons?"),nl,
write("1. yes"),nl,
write("0. no"),nl,
read(X5).

question6(X6):-write("engine power more than 100 hp?"),nl,
write("1. yes"),nl,
write("0. no"),nl,
read(X6).

pr:-question1(X1),
    question2(X2),
    question3(X3),
    question4(X4),
    question5(X5),
    question6(X6),
    country(X,X1),
    armor(X,X2),
    canon(X,X3),
    tower(X,X4),
    weight(X,X5),
    power(X,X6),

write(X),nl,fail.













