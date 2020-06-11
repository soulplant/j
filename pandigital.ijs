ds2=: 3 : '(10&| , <.@(%&10))^:(i.nd y) y'
ds3=: 3 : 0"0
 r=.0$0
 while. y do.
  r=.r,10|y
  y=.<.y%10
 end.
 r
)
ds4=: 3 : 0"0
 10 | y <.@% (10 ^ i.-nd y)
)
ds=: "."0@":"0
ds5=: (nd#10"_) #: ]
pd=: [: (9 = #@~.) ds
nd=: >:@<.@(10&^.)
p=: (* 10 ^ nd) + ]
cp=: x:@p/@:*

NB. largest pandigital number that can be formed with x cp >:i.n with n > 1
NB. trivial solution of x=123456789 is ruled out because n = 1
NB. if we have n=2, we have no solutions because 5=nd x and so no solutions


NB. we can hold n constant and then we can search for bounds

NB. we don't have to just set up a big loop - we can define functions that do
NB. more interesting things and operators that do the search in an interesting
NB. way

NB. I wonder how many of these problems are ultimately just sudokus, i.e., you
NB. narrow down the search space with mathematical observations and then brute
NB. force

NB. Oh, the only candidates are i.1000, because 

t=: pd@cp

ts=: 6!:2, 7!:2@]

NB. when searching for numbers we can bail as soon as we see a duplicate digit,
NB. but that's probably more expensive than just continuing until 9=nd


NB. even numbers can never produce all digits... maybe?

NB. Project Euler 43

N=: 1406357289
D=: 1234567890

dgs=: (3) 10&#.\ ds
ssd=: *./@(=&0)@(p:@i.@# | ]) @ }.

perms=: i.@!@# A. ]
DD=: perms ds D
R=: (#~ ssd@dgs"0) 10 #. DD

NB. TODO: Optimise the above.
