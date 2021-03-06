*--------------------------------------------------------------------------------------------
*
*	inicio.prg:	Configuraci?n de ambiente para M?dulo de Cuenta Corriente.
*	-----------
*
*--------------------------------------------------------------------------------------------
*
*	dd-mmm-aaaa	hh:mm	Usuario		Descripci?n.
*	-----------	-------	-----------	---------------------------------------------------------
*
*	24-abr-2001	18:40	ORamirezO	Creaci?n de la funci?n.
*
*
*	Modificaci?n de ventana principal de Visual FoxPro
*	--------------------------------------------------
*
_VFP.Visible = .f.
Set SysMenu To
With _Screen
	.Caption		= "Sistema de Cafe"
	.ScaleMode		= 3
	.MinWidth		= SYSMETRIC(1)
	.MinHeight		= SYSMETRIC(2)-110
	.MaxWidth		= SYSMETRIC(1)
	.MaxHeight		= SYSMETRIC(2)-110
	.Width			= SYSMETRIC(1)
	.Height			= SYSMETRIC(2)-110
	.AutoCenter		= .t.
	.top			= 45
	.titlebar 		= 1
EndWith
*
*	Se determina la versi?n del programa.
*	-------------------------------------
*
lnResultado = AGetFileVersion(laDatosAplicacion, Sys(16, 0))
If lnResultado < 1
	Dimension laDatosAplicacion(12)
	laDatosAplicacion = "1.0"
EndIf
*
*	Asignaci?n de opciones de trabajo
*	---------------------------------
*
Set Notify Off
Set Decimals To 10
Set Currency To "Q"
Set Display to VGA25
Set UDFParms Reference
Set Echo Off
Set Talk Off
Set Deleted On
Set Date To DMY
Set Exclusive Off
Set Escape Off
Set Safety Off
Set Exact On
Set Century On
Set Reprocess to Automatic
Set MultiLocks On
* Set SysMenu Automatic
SET SYSMENU off
Set Collate To "Spanish"
Set NullDisplay To "[Valor nulo]"
Set Help Off
Set Seconds On
*!* Set ClassLib to MenuLib Additive

SET ENGINEBEHAVIOR 70

Set Seconds On
SET PROCEDURE TO librerias
On Shutdown Do Cierre

* _Screen.AutoCenter = .f.
_VFP.Visible = .t.





objAmbiente	= CreateObject("clsAmbiente")
With objAmbiente
	.NombreModulo  = "Inventarios"
	.VersionModulo = "Versi?n 1.0" 
EndWith

*
*	Creaci?n de matriz con lista de impresoras del sistema.
*	-------------------------------------------------------
*
Public Array gaExtension(10), gaTipoArchivo(10)

lnNumeroImpresoras = APrinters(laImpresoras)
If lnNumeroImpresoras < 1
	lnNumeroImpresoras = 1
EndIf
Public Array gaImpresoras(lnNumeroImpresoras, 2)
gaImpresoras = ""
lnNumeroImpresoras = APrinters(gaImpresoras)
For i = 1 to lnNumeroImpresoras
	gaImpresoras(i, 1) = Proper(gaImpresoras(i, 1))
EndFor
*
*	Verificaci?n de conexi?n ODBC a base de datos de infraestructura
*	----------------------------------------------------------------
*
lcArchivo = AllTrim(CurDir()) + "CAFE.Ini"
If !File(lcArchivo)
	lcArchivo = ""
EndIf
If Empty(lcArchivo)
	MessageBox( "No se encontr? archivo de configuraci?n (Cafe.ini)", 0+16+0, ;
	"Error" )
ELSE

	

	objAmbiente.BaseDatosLocal	= objAmbiente.ValorIni(lcArchivo, "BaseDatosLocal")
	objAmbiente.BaseDatosRemota	= objAmbiente.ValorIni(lcArchivo, "BaseDatosRemota")
	objAmbiente.NombreEstacion	= objAmbiente.ValorIni(lcArchivo, "NombreEstacion")
	ObjAmbiente.Localidad	 	= Val(ObjAmbiente.ValorIni(lcArchivo, "Localidad"))
	ObjAmbiente.Indicador		= Val(ObjAmbiente.ValorIni(lcArchivo, "Localidad"))
	objAmbiente.Servidor     	= objAmbiente.ValorIni(lcArchivo, "Servidor")
*!*		ObjAmbiente.Cosecha			= objAmbiente.ValorIni(lcArchivo, "Cosecha")
*!*		objAmbiente.Estacion		= objAmbiente.ValorIni(lcArchivo, "Estacion")
	
	ObjAmbiente.Titulo			= objAmbiente.ValorIni(lcArchivo, "Titulo")
	ObjAmbiente.Archivos		= objAmbiente.ValorIni(lcArchivo, "Temp")
	ObjAmbiente.NombreEmpresa	= objAmbiente.ValorIni(lcArchivo, "Empresa")	

	PUBLIC glnuevo,glmodifica,glelimina,glexiste
	STORE .f. TO glnuevo,glmodifica,glelimina,glexiste
	
	If Empty(objAmbiente.BaseDatosLocal)
		MessageBox( "No se ha especificado base de datos local.   " ;
			+ "Consulte el administrador del sistema.", 0+16+0, "Error" )
	Else
		lcOnError = On("Error")
		llError   = .f.
*		On Error llError = .t.
		Open Database (objAmbiente.BaseDatosLocal)
		On Error &lcOnError
		If llError
			MessageBox( "Error al intentar abrir base de datos local (" ;
				+ AllTrim(objAmbiente.BaseDatosLocal) + ").", 0+16+0, "Error" )
		Else
			WAIT windows "Realizando conexi?n al servidor..." Nowait
*			Crea la conexi?n con SQL
*			-----------------------------------------		
			lcStringConexion = "DRIVER=SQL Server;" ;
							 + "DSN=" + AllTrim(objAmbiente.BaseDatosRemota) + ";" ;
							 + "SERVER=" + AllTrim(objAmbiente.Servidor) + ";" ;
							 + "DATABASE=" + AllTrim(objAmbiente.BaseDatosRemota) + ";" ;
		 					 + "WSID=" +ALLTRIM(PC_USER(2))+";";
							 + "APP=ATL CAFE;" ; 
							 + "LANGUAGE=Espa?ol"

			*!* CREATE CONNECTION cafe CONNSTRING (lcStringConexion)
*			----------------------------------------------------
*
*			Definici?n de ventana para impresiones preliminares
*			---------------------------------------------------
*
			Define Window wndPreview In Screen ;
				Name wndPreview ;
				At 0, 0 ;
				Size WRows("") * .97, WCols("") * .97 ;
				Title "Impresi?n Preliminar" ;
				Float ;
				Close ;
				Minimize ;
				Grow ;
				Zoom ;
				System ;
				Icon File Reporte.ico
			wndPreview.AlwaysOnTop = .t.
*
*			Llamada a la ventana de autorizaci?n del usuario.   Si no es usuario v?lido
*			se devuelven los datos del mismo en blanco.
*			---------------------------------------------------------------------------
*
			Do Form Acceso
			Read Events
	
		EndIf
	EndIf
EndIf
On Shutdown

*=====================================================================================
*
*	Definici?n de clases.
*	---------------------
*
Define Class clsAmbiente As Custom
	Usuario					= ""	
	NombreUsuario			= ""
	NombreEmpresa			= "VICTOR H COFFEE"
	NIT						= ""
	Direccion				= ""
	Telefono				= ""
	BaseDatosLocal			= ""
	BaseDatosRemota			= ""
	BaseDatosRemota01		= ""
	NombreEstacion			= ""
	Acceso					= .f.
	Agregar    				= .f.
	Modificar				= .f.
	Eliminar				= .f.
	Imprimir				= .f.
	Super                   = .f.
	Coneccion               = 0
	Servidor				= ""
	NombreModulo  			= ""
	VersionModulo 			= ""
	Vertical				= 0
	Horizontal				= 50
	Nivel					= ''
	CodigoEmpresa			= ''
	LogoEmpresa				= ''
	ultimoemp				= ''
	Regresar				= ''
	Localidad				= 0
	Indicador				= 0
	Anio					= 0
	Monitor					= 0
	CosechaActual			= 0	
	Acarreo					= 0
	TituloC					= ""
	Titulo					= ""
	Archivos				= ""
	Cosecha					= ""
	numeroerror				= 0 
	Regresar				= 0
	Recibe					= "C:\RECIBE\"
	Envia					= "C:\ENVIA\"
	Estacion				= ""
	FinCosecha				= "30/09/2015"
	Retencion				= 0.07

*--------------------------------------------------------------------------------------------
*
*	ValorIni:	Devuelve el valor de un par?metro en archivo de configuraci?n del sistema.
*	---------
*
*	Par?metros:
*
*		o	pcArchivo			Ubicaci?n y nombre de archivo de configuraci?n (.ini).
*		o	pcPropiedadABuscar	Texto que contiene la propiedad a buscar en archivo.
*
*--------------------------------------------------------------------------------------------
*
*	dd-mmm-aaaa	hh:mm	Usuario		Descripci?n
*	-----------	-------	-----------	---------------------------------------------------------
*	05-feb-1999	12:00	ORamirezO	Creaci?n de la funci?n.
*	21-sep-2000	17:25	ORamirezO	Cambio de funci?n a m?todo en una clase a integrar dentro
*									de una biblioteca de enlace din?mico (DLL).
*	14-jun-2001	11:25	ORamirezO	Cambio de m?todo en clase visual a funci?n de la clase
*									clsAmbiente.
*
	Function ValorIni
		Parameters pcArchivo, pcPropiedadABuscar
		lcValor = ""
		lcPropiedadABuscar = AllTrim(Upper(pcPropiedadABuscar))
		lnArchivo = FOpen(pcArchivo)

		If lnArchivo > 0
			Do While Empty(lcValor) And !FEOF(lnArchivo)
				lcLinea = FGetS(lnArchivo)
				lnPosicion = 1
				lcPropiedad = ""
				Do While SubStr(lcLinea, lnPosicion, 1) # "=" And lnPosicion <= Len(lcLinea)
					lcPropiedad = lcPropiedad + SubStr(lcLinea, lnPosicion, 1)
					lnPosicion = lnPosicion + 1
				EndDo

				lcPropiedad = AllTrim(Upper(lcPropiedad))

				If lcPropiedad = lcPropiedadABuscar
					lnPosicion = lnPosicion + 1
					Do While lnPosicion <= Len(lcLinea)
						lcValor = lcValor + SubStr(lcLinea, lnPosicion, 1)
						lnPosicion = lnPosicion + 1
					EndDo
					lcValor = AllTrim(lcValor)
				EndIf
			EndDo
		EndIf

		FClose(lnArchivo)

		Return lcValor
	EndFunc
*--------------------------------------------------------------------------------------------
*
*	NombreMes:	Devuelve el nombre de un mes.
*	----------
*
*	Par?metros:
*
*		o	pnNumeroMes			N?mero del mes.
*
*--------------------------------------------------------------------------------------------
*
*	dd-mmm-aaaa	hh:mm	Usuario		Descripci?n
*	-----------	-------	-----------	---------------------------------------------------------
*	28-jun-2001	11:25	ORamirezO	Creaci?n del m?todo.
*
	Function NombreMes
		Parameters pnNumeroMes
		lcValor = ""
		Do Case
			Case pnNumeroMes = 1
				lcValor = "enero"
			Case pnNumeroMes = 2
				lcValor = "febrero"
			Case pnNumeroMes = 3
				lcValor = "marzo"
			Case pnNumeroMes = 4
				lcValor = "abril"
			Case pnNumeroMes = 5
				lcValor = "mayo"
			Case pnNumeroMes = 6
				lcValor = "junio"
			Case pnNumeroMes = 7
				lcValor = "julio"
			Case pnNumeroMes = 8
				lcValor = "agosto"
			Case pnNumeroMes = 9
				lcValor = "septiembre"
			Case pnNumeroMes = 10
				lcValor = "octubre"
			Case pnNumeroMes = 11
				lcValor = "noviembre"
			Case pnNumeroMes = 12
				lcValor = "diciembre"
		EndCase
		Return lcValor
	EndFunc
EndDefine
*
*	Clase con variables del m?dulo de Cuenta Corriente.
*	---------------------------------------------------
*
Define Class clsCuentaCorriente As Custom
	Version						= "Inventarios de C?fe"
	TipoDocumento				= 0
	NumeroDocumento				= 0
	TextoBusqueda				= ""
	NumeroContrato				= 0
	ClaseCafe					= 0
	TipoCafe					= 0
	CodigoProveedor				= 0
	CodigoCosecha				= 0
	LetraContrato				= " "
	NumeroContrato				= 0
	AnoContrato					= 0
	NumeroRecibo				= 0
	CodigoProductor				= 0
EndDefine
