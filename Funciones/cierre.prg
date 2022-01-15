
	On Shutdown
	On Error llError = .t.
	Dimension laForma(10)
	laForma = ""
	lnForma = 0
	For lnCuenta = 1 To _Screen.FormCount
		With _Screen.Forms(lnCuenta)
			.Show
			.Release
		EndWith
	EndFor
*   Cierra y Borra la conección a SQL
*   -----------------	
    SQLDISCONNECT(objAmbiente.Coneccion)
   *!*  DELETE CONNECTION cafe
*   ----------------- 
	Inkey(0.1, "H")
	Clear Events
	
	

