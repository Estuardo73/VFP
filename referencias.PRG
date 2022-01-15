Function fGetRefRec
	Para precibo,ptipo

	Private walias
	
	
	r = ""
	walias = ALIAS()
	If !used("SQLREFREC")
		dbRefRec = fGetDirCafe()+"ccf08"
		Select rxe_numrf1 as recibo, rxe_numrf2 as envio from (dbRefRec) where !deleted() and rxe_tporf1=3 into cursor sqlrefrec;
		order by 1,2
		
		Sele ccf08
		Use
	Endi
	If !used("SQLREFENV")
		if ptipo = 2 
			dbRefEnv = fGetDirCafe()+"ccf08"
		
			Select rxe_numrf1 as envio, rxe_numrf2 as recibo from (dbRefEnv) where !deleted() and rxe_tporf1=1 into cursor sqlrefenv;
			order by 1,2
			
			Sele ccf08
			Use
			
		Else
			
			dbRefEnv = fGetDirCafe()+"ccf25"
			Select Dde_numenv as envio, Dde_docref as recibo from (dbRefEnv) where !deleted() and Dde_tpodoc=3 into cursor sqlrefenv;
			order by 1,2

			Sele ccf25
			Use
		Endif	
	Endi
	
	SELECT envio FROM sqlrefrec WHERE recibo = precibo  INTO CURSOR x1
	
	If _Tally > 0
		wenvio = x1.envio
			
		Select recibo FROM sqlrefenv WHERE envio = wenvio into cursor x
	
	 If _TALLY > 0
		r = x.recibo
		
		Select rec_codprd from recibos where rec_numrec = r into cursor xrecibos
		
		wprd = xrecibos.rec_codprd
		
		Select alltrim(prd_nombre) + "(" + alltrim(str(prd_codigo,5)) + ")" as wproduc from productor where prd_codigo = wprd;
		into cursor xnombres
		
		Select xnombres
		r = xnombres.wproduc
		
		
	Else
		r = ""
	Endi
 Endif	
	If not empty(walias)
		Sele (walias)
	Endi
 	
	
Return r
