*!* MIGRACION DE RECIBOS
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
