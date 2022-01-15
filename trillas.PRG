xbase = "c:\cafe2002\ccf17"

ybase = "c:\cafe2002\ccf20"

SELECT ben_numben AS numero, ben_fchdoc AS fecha, rdb_clscaf AS clase, rdb_tpocaf AS tipo, rdb_salqui AS saldo;
	,rdb_codsal AS bodega, rdb_codtar AS tarima, rdb_camini AS estiba1, rdb_camfin AS estiba2, ben_catcos AS cosecha1 ;
	,ben_cattpo AS tipo1, ben_cattst AS tueste1, ben_cattaz AS taza1, ben_catoro AS catgrl1, ben_tposec AS seca1 ;
	,a.ben_codcli as clie ;
	,a.ben_codben as local ;
	FROM &xbase A, &ybase B ;
	WHERE NOT DELETED() ;
	AND a.ben_numben = b.rdb_numben ;
	AND b.rdb_codcon = "T" ;
	AND b.rdb_salqui > 0 ;
	INTO CURSOR resultados
