ON ERROR DO MESSERROR

procedure messerror

	SET STEP ON
	If error() = 41
	    on shutdown
		messagebox ("Archivo usado por otro usuario en modo exclusivo" +chr(13)+"intente mas tarde",16,"Acceso a información")
		Quit
	ELSE
		messagebox ("Archivo usado por otro usuario en modo exclusivo" +chr(13)+"intente mas tarde",16,"Acceso a información")
		quit
	endif	
	
Endproc