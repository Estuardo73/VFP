*!* Migra la informacion de la ccf40 para crea el encabezado de ordenes de trillas
*!*  Migra la informacion de la ccf40 para crea el encabezado de ordenes de trillas

SET DATE TO DMY
SET CENTURY ON


Select 0
Use EncabezadosTrillas

CursorSetProp("Buffering", 5, "EncabezadosTrillas")

select * from c:\cafe2002\ccf40;
where !delete() and ord_numdoc = 0;
group by 1,2,3 into cursor detalle


Select Detalle
Scan all
	Scatter memo Memvar
	
	m.ord_codcli 	= IIF(IsNull(m.ord_codcli),0,m.ord_codcli)
	m.ord_codben 	= IIF(IsNull(m.ord_codben),0,m.ord_codben)
	m.ord_ordtri 	= IIF(IsNull(m.ord_ordtri),0,m.ord_ordtri)
	m.ord_coment    = IIF(IsNull(m.ord_coment),"",m.ord_coment)
	m.ord_firma		= IIF(IsNull(m.ord_firma),"",m.ord_firma)
	m.ord_fchsis	= IIF(IsNull(m.ord_fchsis),ctod(" /  /  "),m.ord_fchsis)
	m.ord_hrasis	= IIF(IsNull(m.ord_hrasis),"00:00:00",m.ord_hrasis)
	m.ord_usradd	= IIF(IsNull(m.ord_usradd),"",m.ord_usradd)
	m.ord_fchadd	= IIF(IsNull(m.ord_fchadd),ctod(" /  /  "),m.ord_fchadd)
	m.ord_hraadd	= IIF(IsNull(m.ord_hraadd),"00:00:00",m.ord_hraadd)
	m.ord_usrupd	= IIF(IsNull(m.ord_usrupd),"",m.ord_usrupd)
	m.ord_fchupd	= IIF(IsNull(m.ord_fchupd),ctod(" /  /  "),m.ord_fchupd)
	m.ord_update	= IIF(IsNull(m.ord_update),.f.,.t.)
	m.ord_fecha		= date()
	
	m.ord_codvta	= IIF(IsNull(m.ord_codvta),"",m.ord_codvta)
	m.ord_numvta	= IIF(IsNull(m.ord_numvta),0,m.ord_numvta)
	m.ord_tpoenv	= IIF(IsNull(m.ord_tpoenv),"",IIF(M.ORD_TPOENV = "S",1,2))
	
	IF m.ord_fchpto <= CTOD("01/01/1900")
		m.ord_fchpto = CTOD("  /  /    ")
	Endif

	m.ord_fchpto	= IIF(IsNull(m.ord_fchpto),CTOD("  /  /    "),m.ord_fchpto)	
	
	Insert into EncabezadosTrillas from memvar
EndScan


If TableUpdate(2, .t., "EncabezadosTrillas")
		Wait Window "Detalle de sacos Actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
EndIf


 
Select 0
Use OrdenesTrilla

CursorSetProp("Buffering", 5, "OrdenesTrilla")

Select * From c:\cafe2002\ccf40;
	Where !Deleted() AND ord_numdoc > 0;
	order by 1,2,3;
	Into Cursor xtrillas
	
ant = 0
contador = 0	

Select xtrillas
Scan all

	Scatter Memo Memvar
	
	If Ant = 0
		Ant = m.ord_ordtri
	Endif
	If ant = m.ord_ordtri
			contador = contador + 1
	Else
		contador = 1
		ant = m.ord_ordtri
	Endif
			
	
				
	m.ord_numlin	= Contador
	m.ord_codcli 	= IIF(IsNull(m.ord_codcli),0,m.ord_codcli)
	m.ord_codben 	= IIF(IsNull(m.ord_codben),0,m.ord_codben)
	m.ord_ordtri 	= IIF(IsNull(m.ord_ordtri),0,m.ord_ordtri)
	m.ord_tpodoc 	= IIF(IsNull(m.ord_tpodoc),"",m.ord_tpodoc)
	m.ord_numdoc 	= IIF(IsNull(m.ord_tpodoc),0,m.ord_numdoc)
	m.ord_clscaf 	= IIF(IsNull(m.ord_clscaf),0,m.ord_clscaf)
	m.ord_tpocaf 	= IIF(IsNull(m.ord_tpocaf),0,m.ord_tpocaf)
	m.ord_netreq 	= IIF(IsNull(m.ord_netreq),0.00,m.ord_netreq)
	m.ord_stsben	= IIF(IsNull(m.ord_stsben),"",m.ord_stsben)
	m.ord_codsal	= IIF(IsNull(m.ord_codsal),"",m.ord_codsal)
	m.ord_codtar	= IIF(IsNull(m.ord_codtar),0,m.ord_codtar)
	m.ord_camini	= IIF(IsNull(m.ord_camini),0,m.ord_camini)
	m.ord_camfin	= IIF(IsNull(m.ord_camfin),0,m.ord_camfin)
	m.ord_coment    = IIF(IsNull(m.ord_coment),"",m.ord_coment)
	m.ord_firma		= IIF(IsNull(m.ord_firma),"",m.ord_firma)
	m.ord_fchsis	= IIF(IsNull(m.ord_fchsis),ctod(" /  /  "),m.ord_fchsis)
	m.ord_hrasis	= IIF(IsNull(m.ord_hrasis),"00:00:00",m.ord_hrasis)
	m.ord_usradd	= IIF(IsNull(m.ord_usradd),"",m.ord_usradd)
	m.ord_fchadd	= IIF(IsNull(m.ord_fchadd),ctod(" /  /  "),m.ord_fchadd)
	m.ord_hraadd	= IIF(IsNull(m.ord_hraadd),"00:00:00",m.ord_hraadd)
	m.ord_usrupd	= IIF(IsNull(m.ord_usrupd),"",m.ord_usrupd)
	m.ord_fchupd	= IIF(IsNull(m.ord_fchupd),ctod(" /  /  "),m.ord_fchupd)
	m.ord_update	= IIF(IsNull(m.ord_update),.f.,.t.)
			
	Insert Into OrdenesTrilla From Memvar
	
EndScan
	
If TableUpdate(2, .t., "OrdenesTrilla")
		Wait Window "Ordenes de trilla Actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
EndIf


*!* Migra la informacion de rendimientos

*!* ----------- *!*
*+* Encabezados *+*
*!* ----------- *!*

SELECT 0
USE EncabezadosRendimientos

CursorSetProp("Buffering", 5, "EncabezadosRendimientos")

SELECT * From c:\cafe2002\ccf27 WHERE !DELETED() GROUP BY 1 INTO CURSOR xencarend

SELECT xencarend
SCAN all
	SCATTER MEMO memvar
	
	m.beh_numben		= IIF(IsNull(m.beh_numben),0,m.beh_numben)
	m.beh_fchdoc		= IIF(IsNull(m.beh_fchdoc),ctod("31/12/2099"),m.beh_fchdoc)
	m.beh_codcli		= IIF(IsNull(m.beh_codcli),0,m.beh_codcli)
	m.beh_codben		= IIF(IsNull(m.beh_codben),0,m.beh_codben)
	m.beh_codcos		= IIF(IsNull(m.beh_codcos),0,m.beh_codcos)
	m.beh_totreq		= IIF(IsNull(m.beh_totreq),0.00,m.beh_totreq)
	m.beh_stsben		= IIF(IsNull(m.beh_stsben),"",m.beh_stsben)
	m.beh_flgupd		= IIF(IsNull(m.beh_flgupd),"",m.beh_flgupd)
	m.beh_fchsis		= IIF(IsNull(m.beh_fchsis),ctod("31/12/2099"),m.beh_fchsis)
	m.beh_hrasis		= IIF(IsNull(m.beh_hrasis),"",m.beh_hrasis)
	m.beh_firma			= IIF(IsNull(m.beh_firma),"",m.beh_firma)
	m.beh_coment		= IIF(IsNull(m.beh_coment),"",m.beh_coment)
	m.beh_usradd		= IIF(IsNull(m.beh_usradd),"",m.beh_usradd)
	m.beh_fchadd		= IIF(IsNull(m.beh_fchadd),ctod("31/12/2099"),m.beh_fchadd)
	m.beh_hraadd		= IIF(IsNull(m.beh_hraadd),"",m.beh_hraadd)
	m.beh_usrupd		= IIF(IsNull(m.beh_usrupd),"",m.beh_usrupd)
	m.beh_fchupd		= IIF(IsNull(m.beh_fchupd),ctod("31/12/2099"),m.beh_fchupd)
	m.beh_hraupd		= IIF(IsNull(m.beh_hraupd),"",m.beh_hraupd)
	m.beh_update		= IIF(m.beh_update,.t.,.f.)
	
	INSERT INTO encabezadosrendimientos FROM memvar
	
ENDSCAN

If TableUpdate(2, .t., "EncabezadosRendimientos")
		Wait Window "Encabezados Actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
EndIf

*!* ----------------------*!*
*+* Detalle de documentos *+*
*!* --------------------- *!*

SELECT 0
USE rendimientosdetalle

CursorSetProp("Buffering", 5, "rendimientosdetalle")

SELECT * from c:\cafe2002\ccf28 WHERE !DELETED() INTO CURSOR xdetalle

SELECT xdetalle
SCAN all
	SCATTER memvar
	
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
	
ENDSCAN
	
If TableUpdate(2, .t., "rendimientosdetalle")
		Wait Window "Detalle  Actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
EndIf
	
	
*!*---------------------------------------------------------------------------------------------------------
*!* MIGRA INFORMACION DE PROCESO DE TRILLAS
*!*---------------------------------------------------------------------------------------------------------	


PUBLIC gnlocalidad
gnlocalidad = 1
	
SELECT 0
USE EncaTrillas

SET DATE TO dmy
SET CENTURY on


SELECT *;
from c:\cafe2002\ccf17;
where !DELETED() AND ben_numben > 0;
into CURSOR xencatrillas;
order BY 1,3

SELECT xencatrillas
SCAN all
	
	SCATTER MEMO memvar
		
	m.ben_numben 	= IIF(ISNULL(m.ben_numben),0,m.ben_numben)
	m.ben_fchdoc	= IIF(ISNULL(m.ben_fchdoc),CTOD("01/01/2099"),m.ben_fchdoc)
	m.ben_codben	= IIF(ISNULL(m.ben_Codben),0,m.ben_codben)
	m.ben_codcli	= IIF(ISNULL(m.ben_codcli),0,m.ben_codcli)
	m.ben_ordtri	= IIF(ISNULL(m.ben_ordtri),0,m.ben_ordtri)
	m.ben_catcos	= IIF(ISNULL(m.ben_catcos),0,m.ben_catcos)
	m.ben_cattpo 	= IIF(ISNULL(m.ben_cattpo),0,m.ben_cattpo)
	
	m.ben_cattst	= IIF(ISNULL(m.ben_cattst),0,m.ben_cattst)
	m.ben_cattaz	= IIF(ISNULL(m.ben_cattaz),0,m.ben_cattaz)
	
	m.ben_catoro	= IIF(ISNULL(m.ben_catoro),0,m.ben_catoro)
	m.ben_tposec	= IIF(ISNULL(m.ben_tposec),0,m.ben_tposec)
	
	m.ben_catado	= IIF(ISNULL(m.ben_catado),0,m.ben_catado)
	m.ben_oliver	= IIF(ISNULL(m.ben_oliver),0,m.ben_oliver)
	m.ben_escoge	= IIF(ISNULL(m.ben_escoge),0,m.ben_escoge)
	
	m.ben_totrpe	= IIF(ISNULL(m.ben_totrpe),0.00,m.ben_totrpe)
	m.ben_totror	= IIF(ISNULL(m.ben_totror),0.00,m.ben_totror)
	m.ben_rboper	= IIF(ISNULL(m.ben_rboper),0.00,m.ben_rboper)
	
	m.ben_rbooro	= IIF(ISNULL(m.ben_rbooro),0.00,m.ben_rbooro)
	m.ben_rnoper	= IIF(ISNULL(m.ben_rnoper),0.00,m.ben_rnoper)
	m.ben_rnooro	= IIF(ISNULL(m.ben_rnooro),0.00,m.ben_rnooro)
	
	m.ben_clscaf	= IIF(ISNULL(m.ben_clscaf),0,m.ben_clscaf)
	m.ben_tpocaf	= IIF(ISNULL(m.ben_tpocaf),0,m.ben_tpocaf)
	
	m.ben_stsben	= IIF(ISNULL(m.ben_stsben),"",m.ben_stsben)
	m.ben_fchsis	= IIF(ISNULL(m.ben_fchsis),CTOD("01/01/2099"),m.ben_fchsis)
	m.ben_hrasis	= IIF(ISNULL(m.ben_hrasis),"",m.ben_hrasis)
	m.ben_firma		= IIF(ISNULL(m.ben_firma),"",m.ben_firma)
	
	m.ben_coment	= IIF(ISNULL(m.ben_coment),"",m.ben_coment)
	m.ben_flgupd	= IIF(ISNULL(m.ben_flgupd),"",m.ben_flgupd)
	m.ben_usradd	= IIF(ISNULL(m.ben_usradd),"",m.ben_usradd)
	m.ben_fchadd 	= IIF(ISNULL(m.ben_fchadd),CTOD("01/01/2099"),m.ben_fchadd)

	m.ben_hraadd 	= IIF(ISNULL(m.ben_hraadd),"",m.ben_hraadd)
	m.ben_usrupd	= IIF(ISNULL(m.ben_usrupd),"",m.ben_usrupd)
	
	m.ben_fchupd	= IIF(ISNULL(m.ben_fchupd),CTOD("01/01/2099"),m.ben_fchupd)
	m.ben_hraupd  	= IIF(ISNULL(m.ben_hraadd),"",m.ben_hraadd)	
	m.ben_update	= IIF(ISNULL(m.ben_update),.f.,.t.)
	
	INSERT INTO encatrillas FROM memvar

ENDSCAN

If TableUpdate(2, .t., "EncaTrillas")
		Wait Window "Encabezados de trillas actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
EndIf
	
&& Detalle de documentos para trillas

SELECT 0
USE detalletrillas

SELECT * from c:\cafe2002\ccf19 WHERE !DELETED() INTO CURSOR xdoctos

SELECT xdoctos
SCAN all
	SCATTER memvar
	
	m.ddb_numben = IIF(ISNULL(m.ddb_numben),0,m.ddb_numben)
	m.ddb_tpodoc = IIF(ISNULL(m.ddb_tpodoc),9,m.ddb_tpodoc)
	
	m.ddb_docref = IIF(ISNULL(m.ddb_docref),0,m.ddb_docref)
	m.ddb_clscaf = IIF(ISNULL(m.ddb_clscaf),0,m.ddb_clscaf)
	
	m.ddb_tpocaf = IIF(ISNULL(m.ddb_tpocaf),0,m.ddb_tpocaf)
	m.ddb_catoro = IIF(ISNULL(m.ddb_catoro),0,m.ddb_catoro)
	
	m.ddb_netreq = IIF(ISNULL(m.ddb_netreq),0.00,m.ddb_netreq)
	
	m.ddb_fchsis	= IIF(ISNULL(m.ddb_fchsis),CTOD("01/01/2099"),m.ddb_fchsis)
	m.ddb_hrasis	= IIF(ISNULL(m.ddb_hrasis),"",m.ddb_hrasis)
	m.ddb_firma		= IIF(ISNULL(m.ddb_firma),"",m.ddb_firma)	


	m.ddb_usradd	= IIF(ISNULL(m.ddb_usradd),"",m.ddb_usradd)
	m.ddb_fchadd 	= IIF(ISNULL(m.ddb_fchadd),CTOD("01/01/2099"),m.ddb_fchadd)

	m.ddb_hraadd 	= IIF(ISNULL(m.ddb_hraadd),"",m.ddb_hraadd)
	m.ddb_usrupd	= IIF(ISNULL(m.ddb_usrupd),"",m.ddb_usrupd)
	
	m.ddb_fchupd	= IIF(ISNULL(m.ddb_fchupd),CTOD("01/01/2099"),m.ddb_fchupd)
	m.ddb_hraupd  	= IIF(ISNULL(m.ddb_hraadd),"",m.ddb_hraadd)	
	m.ddb_update	= IIF(ISNULL(m.ddb_update),.f.,.t.)
	
	INSERT INTO detalletrillas FROM memvar
	
ENDSCAN

If TableUpdate(2, .t., "DetalleTrillas")
		Wait Window "Encabezados de trillas actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF

&& Migra las marcas de las trillas
SELECT 0
USE MarcasTrillas

SELECT * from c:\cafe2002\ccf18 WHERE !DELETED() INTO CURSOR xmarcas

SELECT xmarcas
SCAN all
	SCATTER memvar
	
	m.mar_numben		= IIF(ISNULL(m.mar_numben),0,m.mar_numben)
	m.mar_marca			= IIF(ISNULL(m.mar_marca),"",m.mar_marca)
	
	m.mar_tpocaf		= IIF(ISNULL(m.mar_tpocaf),0,m.mar_tpocaf)
	m.mar_cntsac		= IIF(ISNULL(m.mar_cntsac),0.00,m.mar_cntsac)
	
	m.mar_fchsis	= IIF(ISNULL(m.mar_fchsis),CTOD("01/01/2099"),m.mar_fchsis)
	m.mar_hrasis	= IIF(ISNULL(m.mar_hrasis),"",m.mar_hrasis)
	m.mar_firma		= IIF(ISNULL(m.mar_firma),"",m.mar_firma)	


	m.mar_usradd	= IIF(ISNULL(m.mar_usradd),"",m.mar_usradd)
	m.mar_fchadd 	= IIF(ISNULL(m.mar_fchadd),CTOD("01/01/2099"),m.mar_fchadd)

	m.mar_hraadd 	= IIF(ISNULL(m.mar_hraadd),"",m.mar_hraadd)
	m.mar_usrupd	= IIF(ISNULL(m.mar_usrupd),"",m.mar_usrupd)
	
	m.mar_fchupd	= IIF(ISNULL(m.mar_fchupd),CTOD("01/01/2099"),m.mar_fchupd)
	m.mar_hraupd  	= IIF(ISNULL(m.mar_hraadd),"",m.mar_hraadd)	
	m.mar_update	= IIF(ISNULL(m.mar_update),.f.,.t.)
	
	INSERT INTO MarcasTrillas FROM memvar
	
ENDSCAN

If TableUpdate(2, .t., "MarcasTrillas")
		Wait Window "Marcas de trillas actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
	
&& Resultados de trillas


SELECT 0
USE trillasresultados


SELECT * from c:\cafe2002\ccf20 WHERE !DELETED() INTO CURSOR xresultados

SELECT xresultados
SCAN all
	SCATTER memvar
	
	m.rdb_numben 	= IIF(ISNULL(m.rdb_numben),0,m.rdb_numben)
	m.rdb_codcon	= iif(ISNULL(m.rdb_codcon),"",m.rdb_codcon)
	m.rdb_clscaf	= IIF(ISNULL(m.rdb_clscaf),0,m.rdb_clscaf)
	m.rdb_tpocaf	= IIF(ISNULL(m.rdb_tpocaf),0,m.rdb_tpocaf)
	m.rdb_cntqui	= IIF(ISNULL(m.rdb_cntqui),0.00,m.rdb_cntqui)
	m.rdb_salqui	= IIF(ISNULL(m.rdb_salqui),0.00,m.rdb_salqui)
	m.rdb_codsal	= IIF(ISNULL(m.rdb_codsal),"",m.rdb_codsal)
	m.rdb_codtar	= IIF(ISNULL(m.rdb_codtar),0,m.rdb_codtar)
	m.rdb_camini	= IIF(ISNULL(m.rdb_camini),0,m.rdb_camini)
	m.rdb_camfin 	= IIF(ISNULL(m.rdb_camfin),0,m.rdb_camfin)
	
	m.rdb_fchsis	= IIF(ISNULL(m.rdb_fchsis),CTOD("01/01/2099"),m.rdb_fchsis)
	m.rdb_hrasis	= IIF(ISNULL(m.rdb_hrasis),"",m.rdb_hrasis)
	m.rdb_firma		= IIF(ISNULL(m.rdb_firma),"",m.rdb_firma)	


	m.rdb_usradd	= IIF(ISNULL(m.rdb_usradd),"",m.rdb_usradd)
	m.rdb_fchadd 	= IIF(ISNULL(m.rdb_fchadd),CTOD("01/01/2099"),m.rdb_fchadd)

	m.rdb_hraadd 	= IIF(ISNULL(m.rdb_hraadd),"",m.rdb_hraadd)
	m.rdb_usrupd	= IIF(ISNULL(m.rdb_usrupd),"",m.rdb_usrupd)
	
	m.rdb_fchupd	= IIF(ISNULL(m.rdb_fchupd),CTOD("01/01/2099"),m.rdb_fchupd)
	m.rdb_hraupd  	= IIF(ISNULL(m.rdb_hraadd),"",m.rdb_hraadd)	
	m.rdb_update	= IIF(ISNULL(m.rdb_update),.f.,.t.)
	
	
	INSERT INTO trillasresultados FROM memvar

ENDSCAN

If TableUpdate(2, .t., "TrillasResultados")
		Wait Window "Resultados de trillas actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
	
*!*---------------------------------------------------------------------------------------------------------
*!* MIGRA UBICACIONES DE RECIBOS Y TRILLAS
*!*---------------------------------------------------------------------------------------------------------

SELECT 0
USE UBICACIONES


SET DATE TO DMY
SET CENTURY ON


SELECT * from c:\cafe2002\ccf24;
where !DELETED() AND !EMPTY(ubi_tpodoc);
into CURSOR xubicaciones

i = 1

SELECT xubicaciones
SCAN all
	SCATTER Memvar
	
	
	
	m.ubi_linea		= i
	
	m.ubi_tpodoc	= IIF(ISNULL(m.ubi_tpodoc),0,m.ubi_tpodoc)
	m.ubi_numdoc	= IIF(ISNULL(m.ubi_numdoc),0,m.ubi_numdoc)
	m.ubi_clscaf	= IIF(ISNULL(m.ubi_clscaf),0,m.ubi_clscaf)
	m.ubi_tpocaf	= IIF(ISNULL(m.ubi_tpocaf),0,m.ubi_tpocaf)
	m.ubi_fchubi	= IIF(ISNULL(m.ubi_fchubi),0,m.ubi_fchubi)
	m.ubi_codsal	= IIF(ISNULL(m.ubi_codsal),"",m.ubi_codsal)
	m.ubi_codtar	= IIF(ISNULL(m.ubi_codtar),0,m.ubi_codtar)
	m.ubi_camini	= IIF(ISNULL(m.ubi_camini),0,m.ubi_camini)
	m.ubi_camfin	= IIF(ISNULL(m.ubi_camfin),0,m.ubi_camfin)
	m.ubi_pesont	= IIF(ISNULL(m.ubi_pesont),0.00,m.ubi_pesont)
	m.ubi_fchsis	= IIF(ISNULL(m.ubi_fchsis),CTOD("  /  /  "),m.ubi_fchsis)
	m.ubi_hrasis	= IIF(ISNULL(m.ubi_hrasis),"",m.ubi_hrasis)
	m.ubi_firma		= IIF(ISNULL(m.ubi_firma),"",m.ubi_firma)
	m.ubi_flgupd	= IIF(ISNULL(m.ubi_flgupd),"",m.ubi_flgupd)
	m.ubi_usradd	= IIF(ISNULL(m.ubi_usradd),"",m.ubi_usradd)
	m.ubi_fchadd	= IIF(ISNULL(m.ubi_fchadd),CTOD("  /  /  "),m.ubi_fchadd)
	m.ubi_hraadd	= IIF(ISNULL(m.ubi_hraadd),"",m.ubi_hraadd)
	m.ubi_usrupd	= IIF(ISNULL(m.ubi_usrupd),"",m.ubi_usrupd)
	m.ubi_fchupd	= IIF(ISNULL(m.ubi_fchupd),CTOD("  /  /  "),m.ubi_fchupd)
	m.ubi_hraupd	= IIF(ISNULL(m.ubi_hraupd),"",m.ubi_hraupd)
	m.ubi_update	= IIF(ISNULL(m.ubi_update),.f.,.t.)
	
	INSERT INTO ubicaciones FROM memvar
	
	i = i + 1
	
	WAIT WINDOW "Actualizando : "+STR(m.ubi_numdoc,6) nowait
	
	
ENDSCAN

If TableUpdate(2, .t., "Ubicaciones")
		Wait Window "Ubicaciones actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF


*!*---------------------------------------------------------------------------------------------------------
*!* Cataciones
*!*---------------------------------------------------------------------------------------------------------

SET DATE TO DMY
SET CENTURY ON
SET DELETED ON


SELECT 0
USE catacionesrecibos
*CursorSetProp("Buffering", 5, "catacionesrecibos")

SELECT * from c:\cafe2002\ccf37 WHERE !DELETED() INTO CURSOR xcataciones

i = 1

SELECT xcataciones
SCAN all
	SCATTER MEMO memvar
	
	WAIT WINDOW "Catacion: "+STR(m.cat_numdoc,6) nowait
	

	m.cat_linea		= i	
	m.cat_tpodoc	= IIF(ISNULL(m.cat_tpodoc),"",m.cat_tpodoc)
	m.cat_numdoc	= IIF(ISNULL(m.cat_numdoc),0,m.cat_numdoc)	
	m.cat_codprd	= IIF(ISNULL(m.cat_codprd),0,m.cat_codprd)
	m.cat_regfca	= IIF(ISNULL(m.cat_regfca),0,m.cat_regfca)
	m.cat_tpoloc	= IIF(ISNULL(m.cat_tpoloc),0,m.cat_tpoloc)
	m.cat_cntqui	= IIF(ISNULL(m.cat_cntqui),0.00,m.cat_cntqui)
	m.cat_clscaf	= IIF(ISNULL(m.cat_clscaf),0,m.cat_clscaf)
	m.cat_tpocaf	= IIF(ISNULL(m.cat_tpocaf),0,m.cat_tpocaf)
	m.cat_codcos	= IIF(ISNULL(m.cat_codcos),0,m.cat_codcos)
	m.cat_cattst	= IIF(ISNULL(m.cat_cattst),0,m.cat_cattst)
	m.cat_cattaz	= IIF(ISNULL(m.cat_cattaz),0,m.cat_cattaz)
	m.cat_catoro	= IIF(ISNULL(m.cat_catoro),0,m.cat_catoro)
	m.cat_tposec	= IIF(ISNULL(m.cat_tposec),0,m.cat_tposec)
	m.cat_catado	= IIF(ISNULL(m.cat_catado),"",m.cat_catado)
	m.cat_oliver	= IIF(ISNULL(m.cat_oliver),"",m.cat_oliver)
	m.cat_escoge	= IIF(ISNULL(m.cat_escoge),"",m.cat_escoge)
	m.cat_descri	= IIF(ISNULL(m.cat_descri),"",m.cat_descri)
	m.cat_coment	= IIF(ISNULL(m.cat_coment),"",m.cat_coment)
	m.cat_fchsis	= IIF(ISNULL(m.cat_fchsis),CTOD(" / /   "),m.cat_fchsis)
	m.cat_hrasis	= IIF(ISNULL(m.cat_hrasis),"",m.cat_hrasis)
	m.cat_fimra		= IIF(ISNULL(m.cat_firma),"",m.cat_firma)
	m.cat_flgupd	= IIF(ISNULL(m.cat_flgupd),"",m.cat_flgupd)
	m.cat_fchadd	= IIF(ISNULL(m.cat_fchadd),CTOD(" / /   "),m.cat_fchadd)
	m.cat_hraadd	= IIF(ISNULL(m.cat_hraadd),"",m.cat_hraadd)
	m.cat_usrupd	= IIF(ISNULL(m.cat_usrupd),"",m.cat_usrupd)
	m.cat_fchupd	= IIF(ISNULL(m.cat_fchupd),CTOD(" / /   "),m.cat_fchupd)
	m.cat_hraupd	= IIF(ISNULL(m.cat_hraupd),"",m.cat_hraupd)
	m.cat_update	= IIF(ISNULL(m.cat_update),.f.,.t.)

	INSERT INTO catacionesrecibos FROM memvar
		
	i = i + 1
		
ENDSCAN
	
If TableUpdate(2, .t., "catacionesrecibos")
		Wait Window "Cataciones actualizadas...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
*!* ----------------------------------------------------------------------------------------------------------	
*!* MIGRA LOS RECIBOS

SET DATE TO dmy
SET CENTURY on

SELECT 0
USE recmigra

CursorSetProp("Buffering", 5, "recmigra")

SELECT * FROM c:\CAFE2002\CCF07 WHERE !DELETED() AND !EMPTY(rec_numrec) INTO CURSOR XRECIBOS ORDER BY rec_numrec,rec_fchrec

SELECT XRECIBOS
SCAN ALL
	SCATTER MEMO memvar
	
	WAIT WINDOW ("Recibo: ")+STR(m.rec_numrec,6) nowait
		
	m.rec_numrec = IIF(ISNULL(m.rec_numrec),0,m.rec_numrec)
	m.rec_tporec = IIF(ISNULL(m.rec_tporec),0,m.rec_tporec)
	m.rec_fchrec = IIF(ISNULL(m.rec_fchrec),CTOD("01/01/1900"),m.rec_fchrec)
	m.rec_codage = IIF(ISNULL(m.rec_codage),0,m.rec_codage)
	m.rec_codcli = IIF(ISNULL(m.rec_codcli),0,m.rec_codcli)
	m.rec_codprd = IIF(ISNULL(m.rec_codprd),0,m.rec_codprd)
	m.rec_regfca = IIF(ISNULL(m.rec_regfca),0,m.rec_regfca)
	m.rec_ageenv = IIF(ISNULL(m.rec_ageenv),0,m.rec_ageenv)
	m.rec_transp = IIF(ISNULL(m.rec_transp),"",m.rec_transp)
	m.rec_hraent = IIF(ISNULL(m.rec_hraent),"",m.rec_hraent)
	m.rec_clscaf = IIF(ISNULL(m.rec_clscaf),0,m.rec_clscaf)
	m.rec_tpocaf = IIF(ISNULL(m.rec_tpocaf),0,m.rec_tpocaf)
	m.rec_codsal = IIF(ISNULL(m.rec_codsal),"",m.rec_codsal)
	m.rec_codtar = IIF(ISNULL(m.rec_codtar),0,m.rec_codtar)
	m.rec_camini = IIF(ISNULL(m.rec_camini),0,m.rec_camini)
	m.rec_camfin = IIF(ISNULL(m.rec_camfin),0,m.rec_camfin)
	m.rec_pesobr = IIF(ISNULL(m.rec_pesobr),0.00,m.rec_pesobr)
	m.rec_pesont = IIF(ISNULL(m.rec_pesont),0.00,m.rec_pesont)
	m.rec_cntsac = IIF(ISNULL(m.rec_cntsac),0,m.rec_cntsac)
	m.rec_ctcosi = IIF(ISNULL(m.rec_ctcosi),0,m.rec_ctcosi)
	m.rec_cttpoi = IIF(ISNULL(m.rec_cttpoi),0,m.rec_cttpoi)
	m.rec_cttsti = IIF(ISNULL(m.rec_cttsti),0,m.rec_cttsti)
	m.rec_cttazi = IIF(ISNULL(m.rec_cttazi),0,m.rec_cttazi)
	m.rec_ctoroi = IIF(ISNULL(m.rec_ctoroi),0,m.rec_ctoroi)
	m.rec_tposei = IIF(ISNULL(m.rec_tposei),0,m.rec_tposei)
	m.rec_catadi = IIF(ISNULL(m.rec_catadi),"",m.rec_catadi)
	m.rec_olivei = IIF(ISNULL(m.rec_olivei),"",m.rec_olivei)
	m.rec_escogi = IIF(ISNULL(m.rec_escogi),"",m.rec_escogi)	
	m.rec_ctcosf = IIF(ISNULL(m.rec_ctcosf),0,m.rec_ctcosf)
	m.rec_cttpof = IIF(ISNULL(m.rec_cttpof),0,m.rec_cttpof)
	m.rec_cttstf = IIF(ISNULL(m.rec_cttstf),0,m.rec_cttstf)
	m.rec_cttazf = IIF(ISNULL(m.rec_cttazf),0,m.rec_cttazf)
	m.rec_ctorof = IIF(ISNULL(m.rec_ctorof),0,m.rec_ctorof)
	m.rec_tposef = IIF(ISNULL(m.rec_tposef),0,m.rec_tposef)
	m.rec_catadf = IIF(ISNULL(m.rec_catadf),"",m.rec_catadf)
	m.rec_olivef = IIF(ISNULL(m.rec_olivef),"",m.rec_olivef)
	m.rec_escogf = IIF(ISNULL(m.rec_escogf),"",m.rec_escogf)
	m.rec_salpes = IIF(ISNULL(m.rec_salpes),0.00,m.rec_salpes)
	m.rec_salliq = IIF(ISNULL(m.rec_salliq),0.00,m.rec_salliq)
	m.rec_tarsac = IIF(ISNULL(m.rec_tarsac),0.00,m.rec_tarsac)
	m.rec_salsac = IIF(ISNULL(m.rec_salsac),0.00,m.rec_salsac)
	m.rec_stsrec = IIF(ISNULL(m.rec_stsrec),"",m.rec_stsrec)
	m.rec_fchsis = IIF(ISNULL(m.rec_fchsis),CTOD("01/01/1900"),m.rec_fchsis)
	m.rec_hrasis = IIF(ISNULL(m.rec_hrasis),"",m.rec_hrasis)
	m.rec_firma  = IIF(ISNULL(m.rec_firma),"",m.rec_firma)
	m.rec_codant = IIF(ISNULL(m.rec_codant),0,m.rec_codant)
	m.rec_salint = IIF(ISNULL(m.rec_salint),0.00,m.rec_salint)
	m.rec_coment = IIF(ISNULL(m.rec_coment),"",ALLTRIM(m.rec_coment))
	m.rec_flgupd = IIF(ISNULL(m.rec_flgupd),"",m.rec_flgupd)
	m.rec_flgbas = IIF(ISNULL(m.rec_flgbas),.f.,.t.)
	m.rec_pesini = IIF(ISNULL(m.rec_pesini),0.00,m.rec_pesini)
	m.rec_pesfin = IIF(ISNULL(m.rec_pesfin),0.00,m.rec_pesfin)
	m.rec_salsol = IIF(ISNULL(m.rec_salsol),0.00,m.rec_salsol)
	m.rec_pagado = IIF(ISNULL(m.rec_pagado),"",m.rec_pagado)
	m.rec_usradd = iif(ISNULL(m.rec_usradd),"",m.rec_usradd)
	m.rec_fchadd = IIF(ISNULL(m.rec_fchadd),CTOD("01/01/1900"),m.rec_fchadd)
	m.rec_hraadd = IIF(ISNULL(m.rec_hraadd),"",m.rec_hraadd)
	m.rec_usrupd = IIF(ISNULL(m.rec_usrupd),"",m.rec_usrupd)
	m.rec_fchupd = IIF(ISNULL(m.rec_fchupd),CTOD("01/01/1900"),m.rec_fchupd)
	m.rec_hraupd = IIF(ISNULL(m.rec_hraupd),"",m.rec_hraupd)
	m.rec_update = IIF(ISNULL(m.rec_update),.f.,.t.)
	m.rec_requerido = 0.00
	m.rec_impreso = .f.
	
	INSERT INTO recmigra FROM memvar

	select xrecibos
	
ENDSCAN

If TableUpdate(2, .t., "recmigra")
		Wait Window "Recibos actualizadas...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF

	
*!* ----------------------------------------------------------------------------------------------------------
*!* MIGRA LOS ENVIOS
*!* ----------------------------------------------------------------------------------------------------------

SET DATE TO dmy
SET CENTURY on

SELECT 0
USE ENVmigrea

CursorSetProp("Buffering", 5, "ENVmigrea")


SELECT * FROM C:\CAFE2002\CCF11 WHERE !DELETED() AND !EMPTY(ENV_NUMENV) INTO CURSOR XENVIOS ORDER BY ENV_NUMENV,ENV_FCHENV

SELECT xenvios
SCAN all
	SCATTER MEMO memvar
	
	WAIT WINDOW "Envio : "+STR(m.env_numenv,6) nowait
	
	m.env_numenv = IIF(ISNULL(m.env_numenv),0,m.env_numenv)
	m.env_tpoenv = IIF(ISNULL(m.env_tpoenv),0,m.env_tpoenv)
	m.env_fhcenv = IIF(ISNULL(m.env_fchenv),ctod("01/01/1900"),m.env_fchenv)
	m.env_ageenv = IIF(ISNULL(m.env_ageenv),0,m.env_ageenv)
	m.env_agerec = IIF(ISNULL(m.env_agerec),0,m.env_agerec)
	m.env_codprd = IIF(ISNULL(m.env_codprd),0,m.env_codprd)
	m.env_cliexp = IIF(ISNULL(m.env_cliexp),0,m.env_cliexp)
	m.env_clifin = IIF(ISNULL(m.env_clifin),0,m.env_cliexp)
	m.env_transp = IIF(ISNULL(m.env_transp),"",m.env_transp)
	m.env_hrasal = IIF(ISNULL(m.env_hrasal),"",m.env_hrasal)
	m.env_pesobr = IIF(ISNULL(m.env_pesobr),0.00,m.env_pesobr)
	m.env_pesont = IIF(ISNULL(m.env_pesont),0.00,m.env_pesont)
	m.env_cntsac = IIF(ISNULL(m.env_cntsac),0,m.env_cntsac)
	m.env_stsenv = IIF(ISNULL(m.env_stsenv),"",m.env_stsenv)
	
	m.env_hrasis = IIF(ISNULL(m.env_hrasis),"",m.env_hrasis)
	m.env_fchsis = IIF(ISNULL(m.env_fchsis),ctod("01/01/1900"),m.env_fchsis)
	m.env_firma  = IIF(ISNULL(m.env_firma),"",m.env_firma)
	m.env_clscaf = IIF(ISNULL(m.env_clscaf),0,m.env_clscaf)
	m.env_tpocaf = IIF(ISNULL(m.env_tpocaf),0,m.env_tpocaf)
	m.env_marca  = IIF(ISNULL(m.env_marca),"",m.env_marca)
	m.env_produc = IIF(ISNULL(m.env_produc),0,m.env_produc)
	m.env_coment = IIF(ISNULL(m.env_coment),"",ALLTRIM(m.env_coment))
	m.env_hora   = IIF(ISNULL(m.env_hora),"",m.env_hora)
	m.env_flgupd = IIF(ISNULL(m.env_flgupd),"",m.env_flgupd)
	m.env_usradd = IIF(ISNULL(m.env_usradd),"",m.env_usradd)
	m.env_fchadd = IIF(ISNULL(m.env_fchadd),ctod("01/01/1900"),m.env_fchadd)
	m.env_usrupd = IIF(ISNULL(m.env_usrupd),"",m.env_usrupd)
	m.env_fchupd = IIF(ISNULL(m.env_fchupd),ctod("01/01/1900"),m.env_fchupd)
	m.env_hraupd = IIF(ISNULL(m.env_hraupd),"",m.env_hraupd)
	m.env_update = IIF(ISNULL(m.env_update),.F.,.T.)
	
	INSERT INTO ENVmigrea FROM MEMVAR
	SELECT XENVIOS
	

ENDSCAN

If TableUpdate(2, .t., "ENVmigrea")
		Wait Window "Envios actualizados...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
	
*!* ----------------------------------------------------------------------------------------------------------
*!* MIGRA LAS REFERENCIAS
*!* ----------------------------------------------------------------------------------------------------------
SELECT 0
USE refmigra
CursorSetProp("Buffering", 5, "RefMigra")

SELECT * from c:\cafe2002\ccf08 WHERE !DELETED() INTO CURSOR xref


I = 0

SELECT xref
SCAN all
	SCATTER memvar
	
	m.linea = i
	
	i = i + 1
	
	WAIT WINDOW "Linea : " + STR(i) nowait
	
	m.rxe_tporf1 = IIF(ISNULL(m.rxe_tporf1),0,m.rxe_tporf1)
	m.rxe_numrf1 = IIF(ISNULL(m.rxe_numrf1),0,m.rxe_numrf1)
	m.rxe_numrf2 = IIF(ISNULL(m.rxe_numrf2),0,m.rxe_numrf2)
	
	m.rxe_clscaf = IIF(ISNULL(m.rxe_clscaf),0,m.rxe_clscaf)
	m.rxe_tpocaf = IIF(ISNULL(m.rxe_tpocaf),0,m.rxe_tpocaf)
	m.rxe_cntsac = IIF(ISNULL(m.rxe_cntsac),0,m.rxe_cntsac)
	
	m.rxe_pesobr = IIF(ISNULL(m.rxe_pesobr),0.00,m.rxe_pesobr)
	m.rxe_pesont = IIF(ISNULL(m.rxe_pesont),0.00,m.rxe_pesont)
	m.rxe_produc = IIF(ISNULL(m.rxe_produc),0,m.rxe_produc)
	
	m.rxe_fhcsis = IIF(ISNULL(m.rxe_fchsis),CTOD("01/01/1900"),m.rxe_fchsis)
	m.rxe_hrasis = IIF(ISNULL(m.rxe_hrasis),"",m.rxe_hrasis)
	m.rxe_firma  = IIF(ISNULL(m.rxe_firma),"",m.rxe_firma)
	
	m.rxe_usradd = IIF(ISNULL(m.rxe_usradd),"",m.rxe_usradd)
	m.rxe_fchadd = IIF(ISNULL(m.rxe_fchadd),CTOD("01/01/1900"),m.rxe_fchadd)
	m.rxe_hraadd = IIF(ISNULL(m.rxe_hraadd),"",m.rxe_hraadd)
	
	m.rxe_usrupd = IIF(ISNULL(m.rxe_usrupd),"",m.rxe_usrupd)
	m.rxe_fchupd = IIF(ISNULL(m.rxe_fchupd),CTOD("01/01/1900"),m.rxe_fchupd)
	m.rxe_hraupd = IIF(ISNULL(m.rxe_hraupd),"",m.rxe_hraupd)
	m.rxe_update = IIF(ISNULL(m.rxe_update),.f.,.t.)
	
	INSERT INTO RefMigra FROM memvar
	
	SELECT xref
ENDSCAN

If TableUpdate(2, .t., "RefMigra")
		Wait Window "Referencias actualizadas...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
*!* ----------------------------------------------------------------------------------------------------------
*!*  DETALLE DE SACOS
*!* ----------------------------------------------------------------------------------------------------------

SELECT 0
USE SACMIGRA
*!* CursorSetProp("Buffering", 5, "SACMigra")


SELECT * FROM C:\CAFE2002\CCF09 WHERE !DELETED() INTO CURSOR XSAC

i = 0

SELECT XSAC
SCAN ALL
	SCATTER MEMVAR
	
	m.sac_linea = i
	i = i +1
	WAIT WINDOW "Linea: " + STR(i) nowait
	
	
	m.sac_tpodoc = IIF(ISNULL(m.sac_tpodoc),0,m.sac_tpodoc)
	m.sac_numdoc = IIF(ISNULL(m.sac_numdoc),0,m.sac_numdoc)
	m.sac_codsac = IIF(ISNULL(m.sac_codsac),0,m.sac_codsac)
	m.sac_cntsac = IIF(ISNULL(m.sac_cntsac),0,m.sac_cntsac)
	m.sac_tara	 = IIF(ISNULL(m.sac_tara),0,m.sac_tara)
	m.sac_psosac = IIF(ISNULL(m.sac_psosac),0.00,m.sac_psosac)
	m.sac_sacdev = IIF(ISNULL(m.sac_sacdev),"",ALLTRIM(m.sac_sacdev))
	
	M.SAC_fhcsis = IIF(ISNULL(M.SAC_fchsis),CTOD("01/01/1900"),M.SAC_fchsis)
	M.SAC_hrasis = IIF(ISNULL(M.SAC_hrasis),"",M.SAC_hrasis)
	M.SAC_firma  = IIF(ISNULL(M.SAC_firma),"",M.SAC_firma)
	
	M.SAC_usradd = IIF(ISNULL(M.SAC_usradd),"",M.SAC_usradd)
	M.SAC_fchadd = IIF(ISNULL(M.SAC_fchadd),CTOD("01/01/1900"),M.SAC_fchadd)
	M.SAC_hraadd = IIF(ISNULL(M.SAC_hraadd),"",M.SAC_hraadd)
	
	M.SAC_usrupd = IIF(ISNULL(M.SAC_usrupd),"",M.SAC_usrupd)
	M.SAC_fchupd = IIF(ISNULL(M.SAC_fchupd),CTOD("01/01/1900"),M.SAC_fchupd)
	M.SAC_hraupd = IIF(ISNULL(M.SAC_hraupd),"",M.SAC_hraupd)
	M.SAC_update = IIF(ISNULL(M.SAC_update),.f.,.t.)
	
	
	INSERT INTO SACMIGRA FROM MEMVAR
	
	SELECT XSAC
		
	
ENDSCAN

	
If TableUpdate(2, .t., "SACMIGRA")
		Wait Window "DETALLE DE SACOS ACTUALIZADOS...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
	
*!* ----------------------------------------------------------------------------------------------------------
*!* MIGRA LA INFORMACION DE CCF25 DETALLE DE ENVIOS QUE REBAJAN INVENTAIOS
*!* ----------------------------------------------------------------------------------------------------------

SELECT 0
USE RebMigra
*!* CursorSetProp("Buffering", 5, "RebMigra")


SELECT A.*,B.ENV_TPOENV  FROM c:\cafe2002\ccf25 A,C:\CAFE2002\CCF11 B WHERE A.DDE_NUMENV = B.ENV_NUMENV AND !DELETED();
INTO CURSOR xreb 

i = 1


SELECT xreb
SCAN all
	
	SCATTER memvar
	WAIT WINDOW "Documento: "+STR(m.dde_numenv) nowait	

	m.dde_linea  = i	
	m.dde_numenv = IIF(ISNULL(m.dde_numenv),0,m.dde_numenv)
	m.dde_tpodoc = IIF(ISNULL(m.dde_tpodoc),0,m.dde_tpodoc)
	m.dde_docref = IIF(ISNULL(m.dde_docref),0,m.dde_docref)
	m.dde_clscaf = IIF(ISNULL(m.dde_clscaf),0,m.dde_clscaf)
	m.dde_tpocaf = IIF(ISNULL(m.dde_tpocaf),0,m.dde_tpocaf)
	m.dde_pesont = IIF(ISNULL(m.dde_pesont),0.00,m.dde_pesont)
	
	m.dde_fhcsis = IIF(ISNULL(m.dde_fchsis),CTOD("01/01/1900"),m.dde_fchsis)
	m.dde_hrasis = IIF(ISNULL(m.dde_hrasis),"",m.dde_hrasis)
	m.dde_firma  = IIF(ISNULL(m.dde_firma),"",m.dde_firma)
	
	m.dde_usradd = IIF(ISNULL(m.dde_usradd),"",m.dde_usradd)
	m.dde_fchadd = IIF(ISNULL(m.dde_fchadd),CTOD("01/01/1900"),m.dde_fchadd)
	m.dde_hraadd = IIF(ISNULL(m.dde_hraadd),"",m.dde_hraadd)
	
	m.dde_usrupd = IIF(ISNULL(m.dde_usrupd),"",m.dde_usrupd)
	m.dde_fchupd = IIF(ISNULL(m.dde_fchupd),CTOD("01/01/1900"),m.dde_fchupd)
	m.dde_hraupd = IIF(ISNULL(m.dde_hraupd),"",m.dde_hraupd)
	m.dde_update = IIF(ISNULL(m.dde_update),.f.,.t.)
	m.dde_tpoenv = m.env_tpoenv
	I = I + 1	
	INSERT INTO RebMigra FROM memvar	
	SELECT xreb

ENDSCAN

If TableUpdate(2, .t., "REBMIGRA")
		Wait Window "REFERENCIAS MIGRADAS...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
ENDIF
*!* ----------------------------------------------------------------------------------------------------------
	

