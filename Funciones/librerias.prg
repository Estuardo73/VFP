*----------------------------
FUNCTION PC_USER(tn)
*----------------------------
* Retorna en nombre de la PC o el nombre del usuario
* Parametros: tn = 1 - Retorna el nombre de PC
*             tn = 2 - Retorna el nombre de usuario
*----------------------------
LOCAL lc, ln
  lc = SYS(0)
  ln = AT('#',lc)
  tn = IIF(EMPTY(tn) or type('tn')#'N',1,tn)
  IF tn = 1
    lc = LEFT(lc,ln-1)
  ELSE
    lc = SUBS(lc,ln+2)
  ENDIF

  RETURN lc
ENDFUNC
*----------------------------

* LIBRERIAS DEL PROGRAMA
*!*-------------------------------------------------------------------
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

*!*¨Regresa directorios para trabajo y acceso
function fGetDirCafe
	*return "c:\CAFE2002\"
	return "K:\CAFE\CAFE2002\"
function fGetDirAtlantic
	*return "C:\atla2001\"
	return "K:\ATLANTIC\ATLA2002\"		
function fGetDirTemp
	return "C:\temp\"		
*!*-------------------------------------------------------------------
Function fGetFactFam
	Para pfamilia
	private r
	Do case
		Case pfamilia = 1
			r = 8.60  && maduro
		Case pfamilia = 2
			r = 1.89 &&"PERGAMINO PRIMERAS"
		Case pfamilia = 3
			r = 2.025 &&"PERGAMINO DE VERDES"
		Case pfamilia = 4
			r = 3  &&"PERGAMINO NATAS"
		Case pfamilia = 5
			r = 3 &&"PERGAMINO HUMEDO"
		Case pfamilia = 6
			r = 3.3 &&"CEREZA NATURAL"
		Case pfamilia = 7
			r = 1.5 &&"ORO PRIMERAS"
		Case pfamilia = 8
			r = 1.5 &&"ORO DE VERDES"
		Case pfamilia = 9
			r = 2.0  &&"ORO NATAS"
		Case pfamilia = 10
			r = 1.5  &&"SUB-PRODUCTOS/ORO"
		Other
			r = 1 && "NO REGISTRADO"
	Endcase

Return r
*!*--------------------------------------------------------
Function fGetCodFam
	Para pclase, ptipo
	Private r
	Do case
		Case pclase = 1 or pclase = 2
			r = 1  &&  MADURO
		Case pclase = 3 or pclase = 8
			If ptipo < 19
				r = 2  && PERGAMINO PRIMERAS
			Else
				If ptipo = 22
					r = 3 && PERGAMININO DE VERDES
				Else
					r = 4 && pergamino natas
				Endi
			Endi
		Case pclase = 4
			r = 5   && Pergamino Humedo
		Case pclase = 5 or pclase = 6
			r = 6  && Cereza Natural
		Case pclase = 7 or pclase = 9
			If ptipo < 19
				r = 7  && ORO PRIMERAS
			Else
				If ptipo = 22
					r = 8 && ORO DE VERDES
				Else
					r = 9 && ORO NATAS
				Endi
			Endi
		Case pclase = 13
			r = 10  && SUB-PRODUCTOS
		Other
			r = 99  && NO REGISTRADO
	Endcase
Return r

Function fGetNomFam
	Para pfamilia
	private r
	Do case
		Case pfamilia = 1
			r = "MADURO"
		Case pfamilia = 2
			r = "PERGAMINO PRIMERAS"
		Case pfamilia = 3
			r = "PERGAMINO DE VERDES"
		Case pfamilia = 4
			r = "PERGAMINO NATAS"
		Case pfamilia = 5
			r = "PERGAMINO HUMEDO"
		Case pfamilia = 6
			r = "CEREZA NATURAL"
		Case pfamilia = 7
			r = "ORO PRIMERAS"
		Case pfamilia = 8
			r = "ORO DE VERDES"
		Case pfamilia = 9
			r = "ORO NATAS"
		Case pfamilia = 10
			r = "SUB-PRODUCTOS/ORO"
		Other
			r = "NO REGISTRADO"
	Endcase
Return r

*!* ------------------------------------------
Function Fgettipo
	parameter wtipo,aliasw
	
	SELECT TiposCafe
	Seek wTipo Order Tag Codigo In TiposCafe
	If Found()
		r = tab_nombre
	Else
		r = "******"
	Endif
	Select &aliasw

Return r

Function Fgetsubtipo
	parameter wtipo,aliasw
	
	Select TiposSubProductos
	Seek wTipo Order Tag Codigo In TiposSubProductos
	If Found()
		r = tab_nombre
	Else
		r = "******"
	Endif
	Select &aliasw

Return r


Function Fgetclase
	parameter wclase,aliasw

	Select ClasesCafe
	Seek wclase Order Tag Codigo In ClasesCafe
	If Found()
		r = tab_nombre
	Else
		r = "******"
	Endif
	Select &aliasw

Return r


Function fgetsacos
	parameter wtipo,aliasw

	Select TiposSacos
	Seek wTipo Order Tag Codigo In TiposSacos
	If found()
		r = tab_nombre
	Else
		r = "******"
	Endif
	Select &aliasw
Return R	

