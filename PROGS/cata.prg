
SET STEP ON 

gnConnHandle = 0

STORE SQLCONNECT('cafecat', 'server_el', '3Stuard01973') TO gnConnHandle
IF gnConnHandle <= 0
   = MESSAGEBOX('Cannot make connection', 16, 'SQL Connect Error')
ELSE
   = MESSAGEBOX('Connection made', 48, 'SQL Connect Message')
   = SQLDISCONNECT(gnHandle)
ENDIF
