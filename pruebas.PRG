SELECT xrecibos
SET ORDER TO 1

SELECT "A" as docto,linea,fecha,fechac,documentoc,SPACE(11) AS CONTRATOC,localidad,tipoloc,;
	catacion,;
	SPACE(63) as calidadcaf,;
	quintales,;
	SPACE(15) as precio,;
	SPACE(15) as preciont,;
	procede,;
	SPACE(49) as productor,;
	comentario;
	FROM xrecibos;
	ORDER BY 8;
	UNION ALL;
	SELECT  "C" as docto,linea,fecha,fechac,SPACE(06) as documentoc,contratoc,localidad,;
	SPACE(02) as tipoloc,;
	SPACE(190) as catacion,;
	calidadcaf,;
	quintales,;
	precio,;
	preciont,;
	SPACE(100) as procede,;
	productor,;	
	comentario;
	FROM xcontratos;
	INTO CURSOR xdoctosCR
	
SELECT DOCTO,LINEA,FECHA,FECHAC,DOCUMENTOC,;
	tipoloc,;
	contratoc,;
	localidad,;
	catacion,;
	calidadcaf as calidad,;
	SPACE(34) as calidadenvio,;
	quintales,;
	precio,;
	preciont,;
	procede,;
	PRODUCTOR,;
	SPACE(70) as destino,;
	comentario;
	FROM XDOCTOSCR;
	UNION ALL;
	SELECT "B" as docto,linea,fecha,fechac,documentoc,;
	tipoloc,;
	SPACE(11) as contratoc,;	
	enviado as localidad,;
	SPACE(188) as catacion,;
	SPACE(63) as calidad,;
	calidadcaf as calidadenvio,;	
	quintales,;
	SPACE(15) as precio,;
	SPACE(15) as preciont,;
	SPACE(100) as procede,;
	SPACE(49) as productor,;
	destino,;
	comentario;
	FROM xenvios;
	INTO TABLE C:\TEMP\XDOCUMENTOS
	
	
	
	
	



