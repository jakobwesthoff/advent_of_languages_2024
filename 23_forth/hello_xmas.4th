(
     /\
    /  \
    /  \
   /  o \
   /    \
  / u    \
  --------
     ||
     ||
 )

: GROUP ( groups n -- )
  2DUP - SPACES
  ." /"
  DUP 2 * SPACES
  ." \" CR

  2DUP - 1 - SPACES
  ." /"
  DUP 1 + 2 * SPACES
  ." \" CR

  DROP DROP
;

: DIVIDER ( groups -- )
  2 * 2 + 
  0 DO
    ." -"
  LOOP
  CR
;

: TRUNK ( groups -- )
  DUP SPACES
  ." ||" CR
  SPACES
  ." ||" CR
;

: TREE ( groups -- )
  DUP 0 DO
    DUP I GROUP
  LOOP
  DUP DIVIDER
  TRUNK
; 

10 TREE 
bye
