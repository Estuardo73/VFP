PUBLIC CODLOC,CODCLI
	CODLOC = 19
	CODCLI = 1

SELECT a.*,b.* from RecibosTrillas a,RefRecTrillas b WHERE a.rec_numrec = b.recibof AND rec_tporec = 2 OR rec_tporec = 4;
	INTO CURSOR REC2Y4