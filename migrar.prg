*!* Migra la informacion de la ccf40 para crea el encabezado de ordenes de trillas
*!*	Select 0
*!*	Use EncabezadosTrillas


*!*	select * from c:\cafe2002\ccf40;
*!*	where !delete() and ord_numdoc = 0;
*!*	group by 1,2,3 into cursor detalle


*!*	Select Detalle
*!*	Scan all
*!*		Scatter memo Memvar
*!*		
*!*		m.ord_codcli 	= IIF(IsNull(m.ord_codcli),0,m.ord_codcli)
*!*		m.ord_codben 	= IIF(IsNull(m.ord_codben),0,m.ord_codben)
*!*		m.ord_ordtri 	= IIF(IsNull(m.ord_ordtri),0,m.ord_ordtri)
*!*		m.ord_coment    = IIF(IsNull(m.ord_coment),"",m.ord_coment)
*!*		m.ord_firma		= IIF(IsNull(m.ord_firma),"",m.ord_firma)
*!*		m.ord_fchsis	= IIF(IsNull(m.ord_fchsis),ctod(" /  /  "),m.ord_fchsis)
*!*		m.ord_hrasis	= IIF(IsNull(m.ord_hrasis),"00:00:00",m.ord_hrasis)
*!*		m.ord_usradd	= IIF(IsNull(m.ord_usradd),"",m.ord_usradd)
*!*		m.ord_fchadd	= IIF(IsNull(m.ord_fchadd),ctod(" /  /  "),m.ord_fchadd)
*!*		m.ord_hraadd	= IIF(IsNull(m.ord_hraadd),"00:00:00",m.ord_hraadd)
*!*		m.ord_usrupd	= IIF(IsNull(m.ord_usrupd),"",m.ord_usrupd)
*!*		m.ord_fchupd	= IIF(IsNull(m.ord_fchupd),ctod(" /  /  "),m.ord_fchupd)
*!*		m.ord_update	= IIF(IsNull(m.ord_update),.f.,.t.)

*!*		m.ord_fecha		= date()
*!*		
*!*		
*!*		Insert into EncabezadosTrillas from memvar
*!*	EndScan


*!*	If TableUpdate(2, .t., "EncabezadosTrillas")
*!*			Wait Window "Detalle de sacos Actualizado...." nowait
*!*	Else
*!*		MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
*!*	EndIf

Select 0
Use OrdenesdeTrilla

Select * From c:\cafe2002\ccf40;
	Where !Deleted() AND ord_numdoc > 0;
	order by 1,2,3;
	Into Cursor xtrillas
	

Select xtrillas
Scan all
	Scatter Memo Memvar
	
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
	
	Insert Into OrdenesdeTrilla
	
EndScan
	
If TableUpdate(2, .t., "OrdenesdeTrilla")
		Wait Window "Ordenes de trilla Actualizado...." nowait
Else
	MessageBox( "Se encontró un error al actualizar información, intente de nuevo.", 0+48+0, "Advertencia" )
EndIf



