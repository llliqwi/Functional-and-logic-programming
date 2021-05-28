:-dynamic country/2,armor/2,canon/2,tower/2,weight/2,power/2.

read_str(A) :-get0(X),r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-append(B, [X], B1),get0(X1),r_str(X1, A, B1).

country_r(X,Y):-repeat,(country(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(country(X,Y)));X=nil,Y=nil).
armor_r(X,Y):-repeat,(armor(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(armor(X,Y)));X=nil,Y=nil).
canon_r(X,Y):-repeat,(canon(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(canon(X,Y)));X=nil,Y=nil).
tower_r(X,Y):-repeat,(tower(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(tower(X,Y)));X=nil,Y=nil).
weight_r(X,Y):-repeat,(weight(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(weight(X,Y)));X=nil,Y=nil).
power_r(X,Y):-repeat,(power(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(power(X,Y)));X=nil,Y=nil).

prTell:-tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/1.txt'),country_r(X1,_),X1=nil,told,
     tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/2.txt'),armor_r(X2,_),X2=nil,told,
     tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/3.txt'),canon_r(X3,_),X3=nil,told,
     tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/4.txt'),tower_r(X4,_),X4=nil,told,
     tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/5.txt'),weight_r(X5,_),X5=nil,told,
     tell('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/6.txt'),power_r(X6,_),X6=nil,told.

prSee:-see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/1.txt'), get0(Sym1), read_data(Sym1,1), seen,
     see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/2.txt'), get0(Sym2), read_data(Sym2,2), seen,
     see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/3.txt'), get0(Sym3), read_data(Sym3,3), seen,
     see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/4.txt'), get0(Sym4), read_data(Sym4,4), seen,
     see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/5.txt'), get0(Sym5), read_data(Sym5,5), seen,
     see('C:/Users/liqwi/Desktop/УНИВЕР/Функциональное и логическое программирование/My/Lab11/6.txt'), get0(Sym6), read_data(Sym6,6), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-read_str(Lang),name(X, Lang),read(Y),
            (
              Flag = 1 ->asserta(country(X, Y));
            (
              Flag = 2 ->asserta(armor(X, Y));
            (
              Flag = 3 ->asserta(canon(X, Y));
            (
              Flag = 4 ->asserta(tower(X, Y));
            (
              Flag = 5 ->asserta(weight(X, Y));
            (
              Flag = 6 ->asserta(power(X, Y)))))))),

         get0(Sym),
         read_data(Sym, Flag).


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



pr :-prSee,question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
        question6(X6),
        (country(X,X1),armor(X,X2),canon(X,X3),tower(X,X4),weight(X,X5),
         power(X,X6),write(X);
         (write("Tanks -> "),
          read(tanks),
          asserta(country(tanks, X1)),
          asserta(armor(tanks, X2)),
          asserta(canon(tanks, X3)),
          asserta(tower(tanks, X4)),
          asserta(weight(tanks, X5)),
          asserta(power(tanks, X1)),
          prTell,nl,
          write("Tanks was added!"))).
