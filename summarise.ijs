eg=: 5 10
S=: (#~ *@(+/)"1) @ (e.~ ({.,{:);._2 ])&(,&_) >:@i.







S2=: 3 : '(#~ (0 ~: +/)"1) ((e.&(y,100)) ({.,{:);._2 ]) [n=. >:i.100'


collatzv=: 3 : '<. (2|y)} 0 1 + 0.5 3 */y'

cnv=: 3 : 0
 NB. SL=. sequence length
 NB. Powers of 2 have SL = >:@(2&^.)
 NB. m stores a vectorised current step counter. When we advance the values of
 NB. j we increment m. As f stores powers of two, if we find that x = SL n then (SL n*f) = (i.#f) + x
 NB. m -: SL f
 NB. if we find ``x = SL n`` after we've done {.m steps, then we know that (x+m) = SL n * 2^i.#m
 f=. 2^m=. i. <.@(2&^.)&.<: y
 m=. >:m
 C=. 0 ,~ m f} y{._1
 NB. TODO: How do we know that it's okay to only search for the odd numbers < y here?
 j=.i=. 3 + i.@<.&.-: y-2
 while. #i do.
  j=. collatzv j
  b=. 0<(j<.y){C
  p=. , f */  b#i
  q=. , m +/ (b#j){C
  m=. >:m
  i=. (-.b)#i
  j=. (-.b)#j
  b=. y>p
  C=. (b#q) (b#p)}C
 end.
 }:C
)

collatz=: -:`(>:@(3&*))`1: @. (1&= + 2&|)
SL=: #@(collatz^:a:)
