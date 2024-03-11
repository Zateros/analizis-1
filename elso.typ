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

$ sect.big (n in NN)[a_n,b_n] eq.not emptyset $

== Konvergens sorozatok határértékének egyértelműsége

== A konvergencia és a korlátosság kapcsolata

== Monoton részsorozatok létezésére vonatkozó tétel

== A sorozatokra vonatkozó közrefogási elv

== A határérték és a rendezés kapcsolata

== Műveletek nullsorozatokkal

== Konvergens sorozatok szorzatára vonatkozó tétel

== Konvergens sorozatok hányadosára vonatkozó tétel

== Monoton növekvő sorozatok határértékére vonatkozó tétel (véges és végtelen eset)

== Az $a_n colon.eq (1 + 1 / n)^n (n in NN^(+))$ sorozat konvergenciája

== Newton-féle iterációs eljárás m-edik gyökök keresésére

== A Cauchy-féle konvergenciakritérium sorozatokra
