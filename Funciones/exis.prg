SELECT 0
USE existencias_actualiza


SET DATE TO dmy
SET CENTURY on


*!* SELECT * FROM k:\cafe\cafe2003\CCF21 WHERE !DELETED() INTO CURSOR Xtencias ORDER BY inv_fchres
SELECT * FROM c:\temp\inventario WHERE !DELETED() INTO CURSOR Xtencias ORDER BY inv_fchres

SELECT Xtencias
GO top
SCAN ALL
	SCATTER MEMO memvar
	
	WAIT WINDOW ("Día: ")+DtoC(m.inv_fchres) nowait
		
	m.inv_fchres = IIF(ISNULL(m.inv_fchres),CTOD("01/01/1900"),m.inv_fchres)
	m.inv_fchsis = IIF(ISNULL(m.inv_fchsis),CTOD("01/01/1900"),m.inv_fchsis)
	m.inv_hrasis = IIF(ISNULL(m.inv_hrasis),"",m.inv_hrasis)
	m.inv_firma  = IIF(ISNULL(m.inv_firma),"",m.inv_firma)
	m.inv_usradd = iif(ISNULL(m.inv_usradd),"",m.inv_usradd)
	m.inv_fchadd = IIF(ISNULL(m.inv_fchadd),CTOD("01/01/1900"),m.inv_fchadd)
	m.inv_hraadd = IIF(ISNULL(m.inv_hraadd),"",m.inv_hraadd)
	m.inv_usrupd = IIF(ISNULL(m.inv_usrupd),"",m.inv_usrupd)
	m.inv_fchupd = IIF(ISNULL(m.inv_fchupd),CTOD("01/01/1900"),m.inv_fchupd)
	m.inv_hraupd = IIF(ISNULL(m.inv_hraupd),"",m.inv_hraupd)
	m.inv_update = IIF(ISNULL(m.inv_update),.f.,.t.)
	
	INSERT INTO existencias_actualiza FROM memvar
	select xtencias
	
ENDSCAN



If TableUpdate(2, .t., "existencias_actualiza")
		Wait Window "Marcas de trillas actualizado...." nowait
Else
	AError(laError)
				lcMensaje = "Se encontró un error al actualizar el correlativo, " ;
						  + "intente de nuevo." + Chr(13) + Chr(13) + laError(2)
				MessageBox( lcMensaje, 0+48+0, "Advertencia" )
ENDIF