#DEFINE NO_ERROR 0
 
DECLARE INTEGER IsUserAnAdmin IN shell32
 
DECLARE INTEGER WNetGetUser IN mpr;
    INTEGER lpName, STRING @lpUserName, INTEGER @lpnLength
 
LOCAL lcUser, lnBufsize
lnBufsize = 250
lcUser = Repli(Chr(0), lnBufsize)
 
IF WNetGetUser(0, @lcUser, @lnBufsize) = NO_ERROR
    ? "Nombre de Usuario:", SUBSTR(lcUser, 1, AT(Chr(0),lcUser)-1)
    ? "Es Administrador:", Iif(IsUserAnAdmin()=0, "No", "Si")
ENDIF


shNetwork = CreateObject('WScript.Network')
lcMessage='Domain = ' + WshNetwork.UserDomain + CHR(13)
lcMessage=lcMessage+ 'Computer Name =' + WshNetwork.ComputerName+CHR(13)
lcMessage=lcMessage+ 'User Name = ' + WshNetwork.UserName
MESSAGEBOX(lcMessage)