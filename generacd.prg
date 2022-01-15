*!* Genera la vista  para creditos debtiso x productor

CREATE SQL VIEW DETALLECD REMOTE CONNECTION CAFE SHARE AS;
SELECT  CONVERT (char(12), ANT_FCHANT, 3) AS FECHAC,;    
		CreditosDebitos.ANT_TPOANT,;
		CreditosDebitos.ANT_NUMANT,;
		CreditosDebitos.ANT_FCHANT,;
		CreditosDebitos.ANT_CODPRD,;
        TPOCREDITOSDEBITOS.TAB_NOMBRE AS DESCRIP,;
        CASE WHEN TIPO = 1 THEN ANT_VALOR WHEN TIPO <> 1 THEN 0.00 END AS DEBE,; 
        CASE WHEN TIPO = 2 THEN ANT_VALOR WHEN TIPO <> 2 THEN 0 END AS HABER,;
        AGENCIAS.TAB_NOMBRE + ' Banco - ' + BANCOS.TAB_NOMBRE AS AGENCIA;        
FROM    CreditosDebitos,TPOCREDITOSDEBITOS,AGENCIAS,BANCOS; 
    WHERE TPOCREDITOSDEBITOS.TAB_CORR = ANT_TPOANT AND ANT_CODPRD = ?GnCodPrd AND AGENCIAS.TAB_CORR = CREDITOSDEBITOS.ANT_CODAGE;
    	  AND BANCOS.TAB_CORR = CREDITOSDEBITOS.ANT_CODBCO;                  	
ORDER BY CreditosDebitos.ANT_FCHANT;

