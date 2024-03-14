#let colorS = color.rgb("#B4D3B4")

#set page(
  paper: "a4",
)

#set document(
  author: "Zalán",
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
  inset: 5pt,
  radius: 4pt,
)[#it]

#show heading.where(level: 3): it => [#underline[#it]]

= Bizonyítással kért tételek

== Teljes indukció elve

Tegyük fel, hogy minden $n$ természetes számra adott egy $A(n)$ állítás, és azt tudjuk, hogy

+ $A(0)$ igaz
+ ha $A(n)$ állítás igaz, akkor $A(n+1)$ is igaz

Ekkor az $A(n)$ állítás minden $n$ természetes számra igaz.

=== Bizonyítás

Legyen

$ S colon.eq {n in NN bar A(n) "igaz"} $

Ekkor $S subset NN$ és $S$ induktív halmaz, hiszen $0 in S$, és ha $n in S$, azaz $A(n)$ igaz, akkor $A(n + 1)$ is igaz, ezért $n + 1 in S$ teljesül, következésképpen $S$ induktív halmaz. Mivel $NN$ a legszűkebb induktív halmaz, ezért az $NN subset S$ tartalmazás is fennáll, tehát $S eq NN$. Ez pedig azt jelenti, hogy minden $n$ természetes számra igaz.

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

== Az arkhimédészi tulajdonság

Minden $a gt 0$ és minden $b$ valós számhoz létezik olyan $n$ természetes szám, hogy $b gt n dot a$, azaz

$ forall a gt 0 "és" forall b in RR: exists n in NN: b gt n dot a $

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
Indirekt módon tegyük fel azt is, hogy $A_1 eq A_2$.

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

== Monoton részsorozatok létezésére vonatkozó tétel

Minden $a eq (a_n)$ valós sorozatnak létezik monoton részsorozata, azaz létezik olyan $v eq (v_n)$ indexsorozat, amellyel $a compose v$ monoton növekvő vagy monoton csökkenő.

=== Bizonyítás

Az állítás igazolásához bevezetjük egy sorozat csúcsának a fogalmát: Azt mondjuk, hogy $a_n_0$ az $(a_n)$ sorozat csúcsa (vagy csúcseleme), ha

$ forall n gt.eq n_0 "indexre" a_n lt.eq a_n_0 $

#pagebreak()

Két eset lehetséges:

+ A sorozatnak végtelen sok csúcsa van. Ez azt jelenti, hogy $ exists v_0 in NN: a_v_0 "csúcselem, azaz " forall n gt.eq v_0: a_n lt.eq a_v_0 $ $ exists v_1 gt v_0: a_v_1 "csúcselem, azaz " forall n gt.eq v_1: a_n lt.eq a_v_1 (lt.eq a_v_0) $ Ezek a lépések folytathatók, mert végtelen sok csúcselem van. Így olyan $v_0 lt v_1 lt v_2 lt dots$ indexsorozatot kapunk, amelyre $ a_v_0 gt.eq a_v_1 gt.eq a_v_2 gt.eq dots"," $ ezért a csúcsok $(a_v_n)$ sorozata $(a_n)$-nek egy monoton csökkenő részsorozata.

+ A sorozatnak legfejlebb véges sok csúcsa van. Ez azt jelenti, hogy $ exists N in NN, forall n lt.eq N "esetén" a_n "már nem csúcs" $ Mivel $a_N$ nem csúcselem, ezért $ exists v_0 gt N: a_v_0 gt a_N $ Azonban $a_v_0$ sem csúcselem, ezért $ exists v_1 gt v_0: a_v_1 gt a_v_1 (gt a_N) $ Az eljárást folytatva most olyan $v_0 lt v_1 lt v_2 lt dots$ indexsorozatot kapunk, amelyre $ a_v_0 lt a_v_1 lt a_v_2 lt dots $ Ebben az esetben tehát $(a_v_0)$ sorozat $(a_n)$-nek egy (szigorúan) monoton növekvő részsorozata.

== A sorozatokra vonatkozó közrefogási elv

== A határérték és a rendezés kapcsolata

== Műveletek nullsorozatokkal

== Konvergens sorozatok szorzatára vonatkozó tétel

== Konvergens sorozatok hányadosára vonatkozó tétel

== Monoton növekvő sorozatok határértékére vonatkozó tétel (véges és végtelen eset)

== Az $a_n colon.eq (1 + 1 / n)^n (n in NN^(+))$ sorozat konvergenciája

== Newton-féle iterációs eljárás m-edik gyökök keresésére

== A Cauchy-féle konvergenciakritérium sorozatokra
