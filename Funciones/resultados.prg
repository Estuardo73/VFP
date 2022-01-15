SET DELETED ON
SET DATE TO dmy


SELECT 0
USE rendimientosdetalle
CursorSetProp("Buffering", 5, "rendimientosdetalle")

WAIT WINDOW "ELIMINANDO DETALLE DE RENDIMIENTOS..." NOWAIT
SELECT rendimientosdetalle
DELETE all
TableUpdate(2, .t., "rendimientosdetalle")

SELECT * from c:\cafe2002\ccf28 WHERE !DELETED() INTO CURSOR xdetalle

SELECT xdetalle
SCAN all
	SCATTER memvar
	
	WAIT WINDOW "CCF28 Detalle de rendimiento  : "+STR(m.dbh_numben,6) nowait
		
	m.dbh_numben		= IIF(IsNull(m.dbh_numben),0,m.dbh_numben)	
	m.dbh_numrec		= IIF(IsNull(m.dbh_numrec),0,m.dbh_numrec)
	m.dbh_cntreq		= IIF(IsNull(m.dbh_cntreq),0.00,m.dbh_cntreq)
	m.dbh_fchsis		= IIF(IsNull(m.dbh_fchsis),ctod("31/12/2099"),m.dbh_fchsis)
	m.dbh_hrasis		= IIF(IsNull(m.dbh_hrasis),"",m.dbh_hrasis)
	m.dbh_firma			= IIF(IsNull(m.dbh_firma),"",m.dbh_firma)	
	m.dbh_usradd		= IIF(IsNull(m.dbh_usradd),"",m.dbh_usradd)
	m.dbh_fchadd		= IIF(IsNull(m.dbh_fchadd),ctod("31/12/2099"),m.dbh_fchadd)
	m.dbh_hraadd		= IIF(IsNull(m.dbh_hraadd),"",m.dbh_hraadd)
	m.dbh_usrupd		= IIF(IsNull(m.dbh_usrupd),"",m.dbh_usrupd)
	m.dbh_fchupd		= IIF(IsNull(m.dbh_fchupd),ctod("31/12/2099"),m.dbh_fchupd)
	m.dbh_hraupd		= IIF(IsNull(m.dbh_hraupd),"",m.dbh_hraupd)
	m.dbh_update		= IIF(m.dbh_update,.t.,.f.)
	
	INSERT INTO rendimientosdetalle FROM memvar
	
	SELECT xdetalle
	
	
ENDSCAN
	
If TableUpdate(2, .t., "rendimientosdetalle")
		Wait Window "Detalle  Actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, CCF28.", 0+48+0, "Advertencia" )
EndIf
