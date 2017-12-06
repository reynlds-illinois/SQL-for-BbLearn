/* Use this to convert blob entries to xml so they can be read. Just open
   this in a new tab in SQL Developer, and run. You should see a
   "FUNCTION BLOB2CLOB compiled" result. Then you can run your regular
   query that depends on this function.    
   contributed by reynlds@illinois.edu */

CREATE OR REPLACE FUNCTION BLOB2CLOB(L_BLOB BLOB) RETURN CLOB IS
L_CLOB CLOB;
L_SRC_OFFSET NUMBER;
L_DEST_OFFSET NUMBER;
L_BLOB_CSID NUMBER := DBMS_LOB.DEFAULT_CSID;
V_LANG_CONTEXT NUMBER := DBMS_LOB.DEFAULT_LANG_CTX;
L_WARNING NUMBER;
L_AMOUNT NUMBER;
BEGIN
DBMS_LOB.CREATETEMPORARY(L_CLOB, TRUE);
L_SRC_OFFSET := 1;
L_DEST_OFFSET := 1;
L_AMOUNT := DBMS_LOB.GETLENGTH(L_BLOB);
DBMS_LOB.CONVERTTOCLOB(L_CLOB,
L_BLOB,
L_AMOUNT,
L_SRC_OFFSET,
L_DEST_OFFSET,
1,
V_LANG_CONTEXT,
L_WARNING);
RETURN L_CLOB;
END;
/