ts=: 6!:2 , 7!:2@]
f=: (<.@%~ , |) 10&*@]
NB. y is a two-element array 'a b' that represents 1%x as x * a + b%10.
NB. y is a two-element array 'a b' that represents b%x as x * a + b%10. fn returns the next element of the sequence 

NB. call with integers x a b: x f (a,b)
NB. returns c,d such that (a + b%x) = (c + d%x)%10
NB. the values of a returned from repeated application form the decimal expansion of a + b%x.
fn=: f {:@{:

NB. Generate the values in the decimal expansion of 1%y. Includes two instances
NB. of the value that repeats.
g=: 3 : 0"0
 if. y=0 do. ,:0 0 return. end.
 s=.,: y f 1
 b=. 0
 while. -.b do.
  n=. {:{:s
  r=. y f n
  b=. r e. s
  s=. s,r
 end.
 s
)

hc=: {: e. }:

g3=: [: }. 3 : '($:@(, y&fn))`] @. hc ,:0 1'
g4=: [: }. 3 : '(, y&fn)`] @. hc^:_ ,:0 1'
g5=: [: }. 3 : '(, y&fn)^:(-.@hc)^:_ ,: 0 1'
g6=: [: }. 3 : '(, y&fn)^:(=&# ~.)^:_ ,: 0 1'

z=: 0 0 -: {:
NB. Cycle length of sequence with at most one repetition.
cl=: (# - (i. 2:))@:(+/"1)@=

CL=: cl@g

C=: (-.@z * cl)@g&>
