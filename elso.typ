#let colorS = color.rgb("#B4D3B4")

#set page(
  paper: "a4",
  numbering: "1.",
  margin: (x: 40pt, y: 40pt)
)

#set document(
  author: "Krasznai Dániel & Tóth Zalán",
  title: "Első Analízis I. ZH kérdései"
)

#set text(
  size: 15pt,
  font: "Times New Roman"
)

#set par(justify: true)

#set enum(numbering: "i.)")

#show heading.where(level: 2): it => block(
  fill: colorS,
  inset: 10pt,
  radius: 4pt,
)[#it]

#show heading.where(level: 1): it => align(center)[#it]

#show heading.where(level: 3): it => [#underline[#it]]

= I. analízis ZH bizonyítással kért tételek

== Teljes indukció elve

Tegyük fel, hogy minden $n$ természetes számra adott egy $A(n)$ állítás, és azt tudjuk, hogy

+ $A(0)$ igaz
+ ha $A(n)$ állítás igaz, akkor $A(n+1)$ is igaz

Ekkor az $A(n)$ állítás minden $n$ természetes számra igaz.

=== Bizonyítás

Legyen

$ S colon.eq {n in NN bar A(n) "igaz"} $

Ekkor $S subset NN$ és $S$ induktív halmaz, hiszen $0 in S$, és ha $n in S$, azaz $A(n)$ igaz, akkor $A(n + 1)$ is igaz, ezért $n + 1 in S$ teljesül, következésképpen $S$ induktív halmaz. Mivel $NN$ a legszűkebb induktív halmaz, ezért az $NN subset S$ tartalmazás is fennáll, tehát $S eq NN$. Ez pedig azt jelenti, hogy minden $n$ természetes számra igaz.

#pagebreak()

== A szuprémum elv

Legyen $H subset RR$ és tegyük fel, hogy

+ $H eq.not emptyset$
+ $H$ felülről korlátos

Ekkor

$ exists min{K in RR bar K "felsőkorlátja" H"-nak"} $

=== Bizonyítás

Legyen

$ A colon.eq H space "és" space B colon.eq {K in RR bar K "felsőkorlátja" H"-nak"} $

A feltételek miatt $A eq.not emptyset "és" B eq.not emptyset$, továbbá

$ forall a in A "és" forall K in B: a lt.eq K $

A teljességi axiómából következik, hogy

$ exists epsilon in RR: a lt.eq epsilon lt.eq K space (a in A, K in B) $

Erre az $epsilon$-ra az teljesül, hogy

+ $epsilon$ felsőkorlátja $H$-nak, hiszen $a lt.eq epsilon$ minden $a in A$ esetén
+ $epsilon$ a legkisebb felső korlát, ui. ha $K$ egy felső korlát (azaz $K in B$), akkor $K gt.eq epsilon$.

Ez pedig pontosan azt jelenti, hogy $epsilon$ a $H$ halmaz legkisebb felső korlátja.

#pagebreak()

== Az arkhimédészi tulajdonság

Minden $a gt 0$ és minden $b$ valós számhoz létezik olyan $n$ természetes szám, hogy $b lt n dot a$, azaz

$ forall a gt 0 "és" forall b in RR: exists n in NN: b lt n dot a $

=== Bizonyítás (indirekt módon)

Tegyük fel, hogy

$ exists a gt 0 "és" exists b in RR: forall n in NN: b gt.eq n dot a $

Legyen

$ H colon.eq {n dot a in RR bar n in NN} $

Ekkor $H eq.not emptyset$ és $H$ felülről korlátos, hiszen $n dot a lt.eq b$ minden $n in NN$-re. A szuprémum elv szerint:

$ exists sup H eq.colon epsilon $

Ekkor $epsilon$ a legkisebb felsőkorlátja $H$-nak, tehát $epsilon - a$ nem felső korlát. Ez azt jelenti, hogy:

$ exists n_0 in NN: n_0 dot a gt epsilon - a arrow.double.r.l.long (n_0 + 1) dot a gt epsilon $

Azonban $(n_0 + 1) dot a in H$, tehát $(n_0 + 1) dot a lt.eq epsilon$, hiszen $epsilon$ felső korlátja a $H$ halmaznak. Így ellentmondáshoz jutunk.

#pagebreak()

== A Cantor-tulajdonság

Tegyük fel, hogy minden n természetes számra adott az $[a_n,b_n] subset RR$ korlátos és zárt intervallum úgy, hogy

$ [a_(n+1),b_(n+1)] subset [a_n,b_n] space (n in NN) $

Ekkor

$ sect.big_(n in NN)[a_n,b_n] eq.not emptyset $

=== Bizonyítás (teljességi axiómát alkalmazva)

Legyen

$ A colon.eq {a_n bar n in NN} "és" B colon.eq {b_n bar n in NN} $

Először belátjuk, hogy

$ a_n lt.eq b_m "tetszőleges" n,m in NN "esetén" $

Valóban,

+ ha $n lt.eq m$, akkor $a_n lt.eq a_m lt.eq b_m$
+ ha $m lt n$, akkor $a_n lt.eq b_n lt.eq b_m$

Mivel $A eq.not emptyset "és" B eq.not emptyset$, ezért "$a_n lt.eq b_m "tetszőleges" n,m in NN "esetén"$" miatt a teljességi axióma feltételei teljesülnek, így

$ exists epsilon in RR: a_n lt.eq epsilon lt.eq b_m space space forall n,m in RR "indexre" $

Ha $n eq m$, akkor azt kapjuk, hogy

$ a_n lt.eq epsilon lt.eq b_n space arrow.double.l.r.long space epsilon in [a_n,b_n] forall n in NN "esetén" $

és azt jelenti, hogy

$ epsilon in sect.big_(n in NN)[a_n,b_n] eq.not emptyset $

#pagebreak()

== Konvergens sorozatok határértékének egyértelműsége

(\*) #h(weak: true,20pt) $exists A in RR: forall epsilon gt 0: exists n_0 in NN: forall n gt n_0 "indexre" |a_n - A| lt epsilon$

Ha az $(a_n) : NN → RR$ sorozat konvergens, akkor a konvergencia definíciójában szereplő $A$ szám egyértelműen létezik.

=== Bizonyítás

Tegyük fel, hogy az $(a_n)$ sorozatra (\*) az $A_1$ és az $A_2$ számokkal is teljesül.
Indirekt módon tegyük fel azt is, hogy $A_1 eq.not A_2$.

Ekkor $forall epsilon gt 0$ számhoz

$ exists n_1 in NN: forall n gt n_1 : abs(a_n − A_1) lt epsilon $
$ exists n_2 in NN: forall n gt n_2 : abs(a_n − A_2) lt epsilon $

Válasszuk itt speciálisan az

$ epsilon colon.eq abs(A_1 - A_2)/2 $

(pozitív) számot. Az ennek megfelelő $n_1, n_2$ indexeket figyelembe véve legyen

$ n_0 colon.eq max{n_1,n_2} $

Ha $n in NN "és" n gt n_0$, akkor nyilván $n gt n_1 "és" n gt n_2$ is fennáll, következésképpen

$ abs(A_1 - A_2) eq abs((A_1 - a_n) + (a_n - A_2))lt.eq abs(a_n - A_1) + abs(a_n - A_2) \ lt epsilon + epsilon eq 2epsilon eq abs(A_1 - A_2) $

amiből (a nyilván nem igaz) $abs(A_1 − A_2) lt abs(A_1 - A_2)$
következne. Ezért csak $A_1 eq A_2$ lehet.

#pagebreak()

== A konvergencia és a korlátosság kapcsolata

Ha az $(a_n)$ sorozat konvergens, akkor korlátos is.

=== Bizonyítás

Tegyük fel, hogy $(a_n)$ konvergens és $lim(a_n) eq A in RR$. Válasszuk a konvergencia definíciója szerinti jelöléssel $epsilon$-t 1-nek. Ehhez a hibakorláthoz

$ exists n_0 in NN, forall n gt n_0: abs(a_n - A) lt 1 $

Így

$ abs(a_n) eq abs((a_n - A) + A) lt.eq abs(a_n - A) + abs(A) lt 1 + abs(A) space space space (n gt n_0) $

Ha $n lt.eq n_0$, akkor

$ abs(a_n) lt.eq max{abs(a_0),abs(a_1),dots,abs(a_n_0)} $

Legyen

$ K colon.eq max{abs(a_0),abs(a_1),dots,abs(a_n_0), 1 + abs(A)} $

Ekkor $abs(a_n) lt.eq K$ minden $n in NN$ indexre,és ez azt jelenti, hogy $(a_n)$ sorozat korlátos.

#pagebreak()

== Monoton részsorozatok létezésére vonatkozó tétel

Minden $a eq (a_n)$ valós sorozatnak létezik monoton részsorozata, azaz létezik olyan $v eq (v_n)$ indexsorozat, amellyel $a compose v$ monoton növekvő vagy monoton csökkenő.

=== Bizonyítás

Az állítás igazolásához bevezetjük egy sorozat csúcsának a fogalmát: Azt mondjuk, hogy $a_n_0$ az $(a_n)$ sorozat csúcsa (vagy csúcseleme), ha

$ forall n gt.eq n_0 "indexre" a_n lt.eq a_n_0 $


Két eset lehetséges:

+ A sorozatnak végtelen sok csúcsa van. Ez azt jelenti, hogy $ exists v_0 in NN: a_v_0 "csúcselem, azaz " forall n gt.eq v_0: a_n lt.eq a_v_0 $ $ exists v_1 gt v_0: a_v_1 "csúcselem, azaz " forall n gt.eq v_1: a_n lt.eq a_v_1 (lt.eq a_v_0) $ Ezek a lépések folytathatók, mert végtelen sok csúcselem van. Így olyan $v_0 lt v_1 lt v_2 lt dots$ indexsorozatot kapunk, amelyre $ a_v_0 gt.eq a_v_1 gt.eq a_v_2 gt.eq dots"," $ ezért a csúcsok $(a_v_n)$ sorozata $(a_n)$-nek egy monoton csökkenő részsorozata.

+ A sorozatnak legfejlebb véges sok csúcsa van. Ez azt jelenti, hogy $ exists N in NN, forall n lt.eq N "esetén" a_n "már nem csúcs" $ Mivel $a_N$ nem csúcselem, ezért $ exists v_0 gt N: a_v_0 gt a_N $ Azonban $a_v_0$ sem csúcselem, ezért $ exists v_1 gt v_0: a_v_1 gt a_v_1 (gt a_N) $ Az eljárást folytatva most olyan $v_0 lt v_1 lt v_2 lt dots$ indexsorozatot kapunk, amelyre $ a_v_0 lt a_v_1 lt a_v_2 lt dots $ Ebben az esetben tehát $(a_v_0)$ sorozat $(a_n)$-nek egy (szigorúan) monoton növekvő részsorozata.

#pagebreak()

== A sorozatokra vonatkozó közrefogási elv

Tegyük fel, hogy az $(a_n), (b_n), (c_n)$ sorozatokra teljesülnek a következők:

#list(
  $ exists N in NN, forall n gt N: a_n lt.eq b_n lt.eq c_n$,
  $ "az" (a_n) "és a" (c_n) "sorozatnak van határértéke, továbbá"$
)

$ lim(a_n) eq lim(c_n)  eq A in macron(RR) $

Ekkor a $(b_n)$ sorozatnak is van határértéke és $lim(b_n) eq A$



#set enum(numbering: "1.")

=== Bizonyítás
Három eset lehetséges:\
*1. eset:* $A in RR$ Legyen epsilon gt 0  tetszőleges valós szám. $lim(a_n) = lim(c_n) = A$ azt jelenti, hogy $(a_n) "és" (c_n)$ azonos A határértékkel rendelkező konvergens sorozatok. A konvergencia definíciója szerint tehát

$ exists n_1 in NN, forall n gt n_1 : A - epsilon lt a_n lt A + epsilon $
$ exists n_2 in NN, forall n gt n_2 : A - epsilon lt c_n lt A + epsilon $

Legyen $n_0 := max{N, n_1, n_2}.$ Ekkor $forall n gt n_0$ indexre

$ A - epsilon lt a_n lt.eq b_n lt.eq c_n lt A + epsilon $

Ez az jelenti, hogy

$ abs(b_n - A) lt epsilon, space "ha" n gt n_0 $

azazo a $(b_0)$ sorozat konvergens, tehát van határértéke, és $lim(b_n) = A$

*2. eset:* $A eq +infinity$ Tegyük fel, hogy $P gt 0$ tetszőleges valós szám. A $lim(a_n) eq +infinity$ értelmezése szerint

$ exists n_1 in NN, forall n gt n_1 : a_n gt P $

Legyen $n_0 := max{N, n_1}.$ Ekkor $forall n gt n_0$ indexre

$ P lt a_n lt.eq b_n $

és ez azt jelenti hogy $lim(b_n) eq +infinity$

*3. eset:* $A eq -infinity$ Tegyük fel, hogy $P lt 0$ tetszőleges valós szám. A $lim(c_n) eq -infinity$ értelemzése szerint

$ exists n_1 in NN, forall n gt n_1 : c_n lt P $

Legyen n_0 := max{N,n_1}, akkor $forall n gt n_0$ indexre

$ P gt c_n gt.eq b_n $

Ez pedig azt jelenti, hogy $lim(b_n) eq -infinity$

#pagebreak()

== A határérték és a rendezés kapcsolata

Tegyük fel, hogy az $(a_n)$ és a $(b_n)$ sorozatnak van határértéke és $ lim(a_n) = A in macron(RR) , lim(b_n) = B in macron(RR) $

Ekkor:

1. $ A lt B arrow.r.double.long exists N in NN, forall n gt N : a_n lt b_n $
2. $ exists N in NN, forall n gt N : a_n lt.eq b_n arrow.r.long.double A lt.eq B$

=== Bizonyítás

*1.* Azt már tudjuk, hogy bármely két különböző $macron(RR)$-beli elem szétválasztható diszjunkt környezetekkel:

$ forall A,B in macron(RR), A != B"-hez" exists r_1,r_2 lt 0, K_"r1"(A) sect K_"r2"(B) = emptyset dot $

Világos, hogy ha $A < B$, akkor $forall x in K_"r1" (A), forall y in K_"r2" (B): x lt y$
Mivel $lim(a_n) = A "és" lim(b_n) = B$ , így a definíció értelmében

$ exists n_1 in NN, forall n > n_1 : a_n in K_"r1" (A) $
$ exists n_2 in NN, forall n > n_2 : b_n in K_"r2" (B) $
Legyen $N := max{n_1,n_2}.$ Ekkor $forall n lt N$ esetén
$ a_n in K_"r1" (A) "és" b_n in K_"r2" (B) arrow.r.long.double a_n lt b_n $

*2.* Indirekt módon bizonyítjuk. Tegyük fel, hogy $A > B$. Ekkor a már igazolt 1. állítás szerint $exists N ∈ NN$, hogy minden $n gt N$ indexre $b_n lt a_n$, ami ellentmond a feltételnek.

#pagebreak()

== Műveletek nullsorozatokkal

Tegyük fel, hogy $lim(a_n) = 0 "és" lim(b_n) = 0$

Ekkor

+ $(a_n + b_n)$ is nullsorozat,
+ ha $(c_n)$ korlátos sorozat, akkor $(c_n dot.op a_n)$ is nullsorozat
+ $(a_n dot.op b_n)$ is nullsorozat

=== Bizonyítás

*1.* Mivel $lim(a_n) = lim(b_n) = 0, "ezért" forall epsilon gt 0"-hoz"$
$ exists n_1 in NN, forall n gt n_1 : abs(a_n) lt epsilon/2 $

$ exists n_2 in NN, forall n gt n_2 : abs(b_n) lt epsilon/2 $

Legyen $n_0 := max{n_1,n_2}$. Ekkor $forall n gt n_0$ indexre

$ abs(a_n + b_n) lt.eq abs(a_n) + abs(b_n) lt epsilon/2 + epsilon/2 eq epsilon, $

és ez azt jelenti, hogy $lim(a_n + b_n) = 0$, azaz $(a_n + b_n)$ valóban nullsorozat.

*2.* A $(c_n)$ sorozat korlátos, ezért

$ exists K gt 0 : abs(c_n) lt K (n in NN) $

Mivel $(a_n)$ nullsorozat, ezért

$ forall epsilon gt 0"-hoz" exists n_0 in NN,  forall n gt n_0 : abs(a_n) lt epsilon/K, $

következésképpen minden $ n gt n_0$ indexre

$ abs(c_n dot.op a_n) eq abs(c_n) dot.op abs(a_n) lt K dot.op epsilon/K eq epsilon, $

azaz $lim(c_n dot.op a_n) eq 0.$

*3.* Mivel minden konvergens sorozat korlátos, ezért a $lim(b_n) = 0$ feltételből következik, hogy $(b_n)$ korlátos sorozat. Az állítás tehát a 2. állítás közvetlen következménye.

#pagebreak()

== Konvergens sorozatok szorzatára vonatkozó tétel

Tegyük fel, hogy az $(a_n)$ és a $(b_n)$ sorozat konvergens. Legyen

$ lim(a_n) = A in RR "és" lim(b_n) = B in RR $

Ekkor

$(a_n dot.op b_n)$ is konvergens és $lim(a_n dot.op b_n) = lim(a_n) dot.op lim(b_n) = A dot.op B$

#set math.cases(reverse: true)
=== Bizonyítás

(\*) #h(weak: true,20pt)$(x_n)$ konvergens, és $alpha in RR$ a határértéke $arrow.r.l.double.long (x_n - alpha)$ nullsorozat

(\*) miatt elég megmutatni, hogy $(a_n b_n - A B)$ nullsorozat. Ez a következő átalakítással igazolható:

$ a_n b_n - A B = a_n b_n - A b_n + A b_n - A B = (b_n) dot.op (a_n - A) + A dot.op (b_n - B) $

A fenti gondolatmenetben a $(b_n)$ sorozat azért korlátos, mert konvergens.

#pagebreak()

== Konvergens sorozatok hányadosára vonatkozó tétel

Tegyük fel, hogy az $(a_n) "és a" (b_n)$ sorozat konvergens. Legyen
$ lim(a_n) = A in RR "és" lim(b_n) = B in RR $

Ekkor ha $b_n != 0 (n in NN) "és" lim(b_n) != 0$, akkor
$ (a_n/b_n) "is konvergens, és" lim(a_n/b_n) = lim(a_n)/lim(b_n) = A/B $

=== Bizonyítás
(\*) $(x_n)$ konvergens, és $alpha in RR$ a határértéke $arrow.r.l.long.double (x_n - alpha)$ nullsorozat.
=== Segédtélel:
Ha $b_n != 0 (n in NN)$ és $(b_n)$ konvergens, továbbá $B := lim(b_n) != 0$, akkor az
$ (1/b_n) $
reciprok-sorozat korlátos.\
Ennek bizonyításához legyen $epsilon := abs(B)/2$. Ekkor egy alkalmas $n_0 in NN$ küszöbindex mellett
$ abs(b_n - B) lt epsilon eq abs(B)/2 space space forall n gt n_0 "indexre." $
Így minden $n gt n_0$ esetén
$ abs(b_n) gt.eq abs(B) - abs(b_n - B) gt abs(B) - abs(B)/2 = abs(B)/2 $

hiszen $abs(B) eq abs(B - b_n + b_n) lt.eq abs(B-b_n) + abs(b_n)$. Tehát

$ abs(1/b_n) lt 2/abs(B)," ha " n gt n_0, $
következésképpen az
$ abs(1/b_n) lt.eq max{1/abs(b_0),1/abs(b_1),....,1/abs(b_n_0), 2/abs(B)} $
egyenlőtlenség már minden $n in NN$ számra teljesül, ezért az $(a/b_n)$ sorozat valóban korlátos. A segédtételt tehát bebizonyítottuk.\
\
Most az látjuk be, hogy az
$ (1/b_n) "sorozat konvergens és" lim(1/b_n) = 1/B $
Ez (\*)-ből következik az alábbi átalakítással:
$ 1/b_n - 1/B eq (B - b_n)/(B dot.op b_n) eq 1/(B dot.op b_n) dot.op (B - b_n) $
Az állítás bizonyításának a befejezéséhez már csak azt kell figyelembe venni, hogy
$ a_n/b_n eq a_n dot.op 1/b_n space (n in NN) $
más szóval az $(a_n/b_n)$ hányados-sorozat két konvergens sorozat szorzata. Így a 2. állítás (konvergens sorozat szorzata) és a reciprok sorozatról az előb mondottak miatt
$ (a_n/b_n) "is konvergens és" lim(a_n/b_n) eq A dot.op 1/B = A/B = lim(a_n)/lim(b_n) $

#pagebreak()

== Monoton növekvő sorozatok határértékére vonatkozó tétel (véges és végtelen eset)

Minden $(a_n)$ monoton sorozatnak van határértéke.
1. Ha $(a_n) arrow.tr$ és felülről korlátos, akkor $(a_n)$ konvergens és
$ lim(a_n) = sup{a_n | n in NN} $
2. Ha $(a_n) arrow.tr$ és felülről nem korlátos, akkor $lim(a_n) = +infinity$

=== Bizonyítás

Tegyük fel, hogy az $(a_n)$ sorozat monoton növekvő és felülről korlátos. Legyen
$ A := sup{a_n | n in NN} in RR. $
Ez azt jelenti, hogy $A$ a szóban forgó halmaznak a legkisebb felső korlátja, azaz
#list($forall n in NN : a_n lt.eq A "és"$,
$forall epsilon gt 0"-hoz" exists n_0 in NN : A - epsilon lt a_"n0" lt.eq A.$)
Mivel a feltételezésünk szerint az $(a_n)$ sorozat monoton növekvő, ezért az
$ A - epsilon lt a_"n0" lt.eq a_n lt.eq A. $
becslés is igaz minden $n gt n_0$ indexre. Azt kaptuk tehát, hogy
$ forall epsilon gt 0"-hoz" exists n_0 in NN, forall n gt n_0 : abs(a_n -A) lt epsilon. $
Ez pontosan azt jelenti, hogy az $(a_n)$ sorozat konvergens, és $lim(a_n) = A$.\
\
2. Tegyük fel, hogy az $(a_n)$ sorozat monoton növekvőls felülről nem korlátos. Ekkor
$ forall P > 0"-hoz" exists n_0 in NN : a_"n0" gt P. $
A monotonitás miat ezért egyúttal az is igaz, hogy
$ forall n gt n_0 : a_n gt.eq a_"n0" gt P, $
és ez pontosan azt jelenti, hogy $lim(a_n) eq +infinity.$

#pagebreak()

== Az $a_n colon.eq (1 + 1 / n)^n (n in NN^(+))$ sorozat konvergenciája

Az $ a_n colon.eq (1 + 1 / n)^n (n in NN^(+)) $ sorozat szigorúan monoton növekvő ls felülről korlátos, tehát konvergens. Legyen
$ e := limits(lim)_(n arrow.r +infinity)(1+1/n)^n. $

=== Bizonyítás
Az állítást a számtani és a mértani közép közötti egyenlőtlenség „ötletes”
felhasználásaival bizonyítjuk.
#list($"A monotonitás igazolásához az egyenlőtlenséget az " (n+1) "darab"$)
$ 1, 1+1/n, 1+ 1/n, ... space, 1+1/n $
számra alkalmazzuk. Mivel ezek nem mind egyenlők, ezért
$ root(n+1,1 dot.op (1+1/n)^n) lt (1+n dot.op (1+1/n))/(n+1) eq (n+2)/(n+1) = 1 +1/(n+1) $
Mindkét oldalt $(n+1)$-edik hatványra emelve azt kapjuk, hogy
$ a_n eq (1+1/n)^n lt (1+ 1/(n+1))^(n+1) eq a_(n+1) (n in NN^(+)) $
amivel beláttuk, hogy a sorozat szigorúan monoton növekvő.
#list("A korlátosság bebizonyításához most az (n+2) darab")
$ 1/2, 1/2, 1+1/n, 1+ 1/n, ... space, 1+1/n  $
számra alkalmazzuk ismét a számtani és a mértani közép közötti egyenlőtlenséget:
$ root(n+2,1/2 dot.op 1/2 dot.op (1+1/n)^n) lt (2 dot.op 1/2 + n dot.op (1+1/n))/(n+2) eq (n+2)/(n+2) = 1 $
Ebből következik, hogy
$ a_n eq (1+1/n)^n lt 4 space space(n in NN^(+)) $
ezért a sorozat felülről korlátos.\
A monoton sorozatok határértékére vonatkozó tételből következik, hogy a sorozat konvergens.

#pagebreak()

== Newton-féle iterációs eljárás m-edik gyökök keresésére

Legyen $A > 0$ valós szám és $m ≥ 2$ természetes szám. Ekkor az
#set math.cases(reverse: false)
$ cases(
  a_0 gt 0 "tetszőleges valós szám,",
  a_(n+1) := 1/m (A/a_n^(m-1) + (m-1)a_n) space (n in NN)
) $
rekurzióval értelmezett $(a_n)$ sorozat konvergens, és az $alpha := lim(a_n)$ határértékére igaz,
hogy $alpha gt 0$ és

$ alpha^m = A. $

=== Bizonyítás
Az állítást több lépésben igazoljuk.\
==== 1.Lépés
Teljes indukcióval könnyen igazolható, hogy az $(a_n)$ sorozat „jól definiált” és
$a_n gt 0 space (n in NN)$.
==== 2.Lépés
Igazoljuk, hogy az $(a_n)$ sorozat konvergens. A monoton sorozatok konvergenciájára vonatkozó tételt fogjuk alkalmazni.\
\
A sorozat alulról korlátos és 0 egy triviális alsó korlát (az 1. lépés alapján).\
\
Most megmutatjuk azt, hogy az (a_n) sorozat a második tagtól kezdve monoton csökkenő, azaz
$ a_(n+1) lt.eq a_n  arrow.l.r.long.double a_(n+1)/a_n lt.eq 1, space space "ha" n eq 1,2,... $
A rekurzív képlet szerint minden $n in NN^(+)$ esetén
$ a_(n+1)/a_n eq 1/m (A/a_n^(m) + m-1) lt.eq 1 arrow.l.r.double.long a_n^m gt.eq A $

A jobb oldali egyenlőtlenség igazolására a számtani és a mértani közép közötti egyenlőtlenség következő alakját fogjuk alkalmazni: ha $x_1, x_2, . . . , x_m$ tetszés szerinti nemnegatív valós számok, akkor\
($triangle$) $ x_1 dot.op x_2 dot.op ... dot.op x_m lt.eq ((x_1 +x_2 + ... + x_m)/m)^m. $
és az egyenlőség akkor és csak akkor áll fenn, ha $x_1 = x_2 = · · · = x_m$. Fontos
hangsúlyozni, hogy lényegében ezt az alakot igazoltuk gyakorlaton, és csak az medik gyök egyértelmű létezése után írhatjuk fel az egyenlőtlenséget a megszokott alakban.\
Vegyük észre, hogy a rekurzív képlet jobb oldalán álló összeg az m darab
$ x_1 := A/(a_n^(m-1)), x_2 = a_n, x_3=a_n, ... ,x_m = a_n space (n in NN) $
pozitív szám számtani közepe. Ezért ($triangle$) miatt
$ a_(n+1)^m eq (1/m dot.op (A/a_n^(m-1) + a_n + ... + a_n))^m eq ((x_1 + x_2 + ... + x_m)/m)^m gt.eq\ x_1 dot.op x_2 dot.op ... dot.op x_m eq A/(a_n^(m-1)) dot.op a_n dot.op a_n dot.op ... dot.op a_n eq A space (n in NN) $

Sikerült igazolnunk tehát, hogy $a_n^m gt.eq A space (n in NN^(+))$, ezzel azt, hogy az $(a_n)$ sorozat a
második tagtól kezdve monoton csökkenő\
Az $(a_n)$ sorozat tehát monoton csökkenő a második tagtól kezdve és alulról korlátos,
ezért a monoton sorozatok határértékére vonatkozó tétel alapján $(a_n)$ konvergens

==== 3.Lépés
Kiszámítjuk a sorozat határértékét. Legyen
$ alpha := lim(a_n) $
Az eddigiekből az következik, hogy $alpha gt.eq 0$. Fontos észrevétel azonban az, hogy az
$alpha gt 0$ egyenlőtlenség is igaz. Ez az állítás a konvergens sorozatok és a műveletek
kapcsolatára vonatkozó tételből, valamint a határérték és a rendezés kapcsolatára
vonatkozó tételből következik, hiszen

$ a_n^m gt.eq a_n arrow.r alpha arrow.long.double.r a_n^m arrow.r a^m gt.eq A gt 0 arrow.long.double.r alpha gt 0 $

Az $(a_n)$ sorozatot megadó rekurzív összefüggésben az $n arrow +infinity$ határátmenetet véve
az $alpha$ határértékre egy egyenletet kapunk. Valóban, ha alkalmazzuk a konvergens
sorozatok és a műveletek kapcsolatára vonatkozó tételeket (itt használjuk az $alpha gt 0$
egyenlőtlenséget), akkor az adódik, hogy

$ alpha arrow.l a_(n+1) eq 1/m (A/a^(m-1)+(m-1) dot.op a_n) arrow 1/m (A/a^(m-1)+(m-1)alpha). $
A határérték egyértelműsége miatt
$ alpha = 1/m (A/a^(m-1)+(m-1)alpha). $
Innen már egyszerű átrendezéssel az kapjuk, hogy
$ m dot.op a^m eq A + (m-1)alpha^m  arrow.r.long.double a^m eq A $

#pagebreak()

== A Cauchy-féle konvergenciakritérium sorozatokra

Legyen $(a_n)$ eg valós sorozat.\
Ekkor\
$ (a_n) "konvergens" arrow.l.r.double.long (a_n) "Cauchy-sorozat" $

=== Bizonyítás

$arrow.double$ Tegyük fel, hogy $(a_n)$ konvergens, és $A := lim(a_n)$ a határértéke. Legyen $epsilon gt 0$ tetszőleges valós szám. A konvergencia definíciója szerint
$ exists n_0 in NN, forall n gt n_0 : abs(a_n - A) lt epsilon/2 $
Így $forall m,n gt n_0$ index esetén
$ abs(a_n - a_m) eq abs((a_n -A) + (A - a_m)) lt.eq abs(a_n - A) + abs(a_m - A) lt epsilon/2 + epsilon/2 = epsilon $

és ez azt jelenit, hogy $(a_n)$ Cauchy-sorozat.

$arrow.double.l$ Tegyük fel, hogy $(a_n)$ Cauchy-sorozat. Több lélpésen keresztül látjuk be, hogy $(a_n)$ konvergens.

==== 1.Lépés

Igazoljuk, hogy $(a_n)$ korlátos sorozat.\
A Cauchy-sorozat definíciójában $epsilon eq 1$-hez van olyan $n_1 in NN$ index, hogy
$ forall m,n gt n_1 : abs(a_n - a_m) lt 1. $
Legyen $m eq n_1 +1$. Ekkor minden $n gt n_1$ esetén
$ abs(a_n) eq abs((a_n - a_(n_1+1)) + a_(n_1+1)) lt.eq abs(a_n - a_(n_1+1)) + abs(a_(n_1+1)) lt 1 + abs(a_(n_1+1)) $
Következésképpen az
$ abs(a_n) lt.eq max{abs(a_0), abs(a_1), ... , abs(a_n_1), 1 + abs(a_(n_1+1))} $
egyenlőtlenség már minden $n in NN$ számra igaz, azaz a sorozat valóban korlátos

==== 2.Lépés
A Bolzano-Weierstrass-féle kiválasztási tételből következik, hogy $(a_n)$-nek
létezik egy $(a_v_n)$ konvergens részsorozata. Jelölje
$ A := lim(a_v_n) in RR $

==== 3.Lépés
Belátjuk, hogy $lim(a_n) = A$ is igaz\
Legyen $epsilon gt 0$ tetszőleges. Ekkor A definíciójából következik, hogy
$ exists n_2 in NN, forall n gt n_2 : abs(a_v_n - A) lt epsilon/2 $
Az $(a_n)$ Cauchy-sorozat, ezért $epsilon$/2-höz
$ exists n_3 in NN, forall n,m gt n_3 : abs(a_n - a_m) lt epsilon/2 $
Mivel $(v_n) : NN arrow NN$ indexsorozat (vagyis $(v_n)$ szigorúan monoton növekvő), ezért
$v_n gt.eq n (n in NN)$, amit teljes indukcióval lehet igazolni.\
\
Ha $n gt n_0 := max{n_2, n_3}$, akkor $v_n gt n_0$, ezért $n$ és $m := v_n$ is nagyobb, mint $n_2 "és" n_3$, tehát alkalmazhatók a fenti egyenlőtlenségek. Ekkor
$ abs(a_n - A) eq abs((a_n - a_v_n) + (a_v_n - A)) lt.eq abs(a_n - a_m) + abs(a_v_n - A) lt epsilon/2 + epsilon/2 eq epsilon $
és ez azt jelenti, hogy az $(a_n)$ sorozat valóban konvergens, és $lim(a_n) eq A$


