SUB Ornaments(n) STATIC
  chars$="uiox"
  FOR i=0 TO n-1
    IF RND(1) < .2 THEN
      PRINT MID$(chars$, INT(RND(1) * LEN(chars$)) + 1, 1);
    ELSE
      PRINT " ";
    END IF
  NEXT i
END SUB

SUB Space(n) STATIC
  FOR i=0 TO n-1
    PRINT " ";
  NEXT i
END SUB

SUB DrawGroup(n, length) STATIC
  CALL Space(length - n)
  PRINT "/";
  CALL Ornaments(n*2)
  PRINT "\"
  CALL Space(length - n - 1)
  PRINT "/";
  CALL Ornaments((n+1)*2)
  PRINT "\"
END SUB

SUB DrawTrunk(n) STATIC
  CALL Space(n)
  PRINT "||"
  CALL Space(n)
  PRINT "||"
END SUB

SUB DrawTree(n) STATIC
  FOR i=0 TO n-1
    CALL DrawGroup(i, n)
  NEXT i
  FOR i=0 TO n*2
    PRINT "-";
  NEXT i
  PRINT "-"
  CALL DrawTrunk(n)
END SUB

RANDOMIZE TIMER
groups=9
CALL DrawTree(groups)
