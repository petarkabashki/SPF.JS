
: JDUP  0 JPICK ;
: JOVER 1 JPICK ;
: JSWAP 1 JROLL ;
: JROT 2 JROLL ;

: JNIP JSWAP JDROP ;

: .JS
   JDEPTH
   BEGIN
     DUP 0 > SWAP 1- SWAP
   WHILE
     DUP JPICK S" console.log(stack[stack.length-1])" JEVAL JDROP JDROP
   REPEAT DROP
;

VARIABLE JVAR_COUNT

: JVALUE
   HEADER
   [ ' JSVAL-FETCH LIT, ] ,
   HERE
   JVAR_COUNT @ ,
   JVAR_COUNT 1+!
   TOJS-VAL \ init
   [ C' TOJS-VAL LIT, ] ,   
;

: NULL 
    S" null"  JEVAL
;
