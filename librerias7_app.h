* S:\CAFE\INVENTARIOR\LIBRERIAS7_APP.H

* This file is a generated, framework-enabling component
* created by APPBUILDER 
* (c) Microsoft Corporation


* header file holding framework-generated project data for
* S:\CAFE\INVENTARIOR\LIBRERIAS7 Project

* the following is for your reference/identification --
* the application object and splash receive this information into
* their cCaption property, and this #DEFINE does not provide it:
* #DEFINE APP_NAME                "librerias7"


#DEFINE APP_SUPERCLASS         "_application"

* developer can change this one
* to use a different global reference
* if desired -- a BUILD ALL/RECOMPILE
* is required afterwards to synch up
* references in generated menus and PRGs.
#DEFINE APP_GLOBAL              goApp

* This one indicates the member name of the object
* placed on "framework-enabled" forms:
#DEFINE APP_MEDIATOR_NAME       "app_mediator"

* developer can change these to a different subclass
* of APP_SUPERCLASS if desired:
#DEFINE APP_CLASSLIB            "LIBRERIAS7_APP.VCX"
#DEFINE APP_CLASSNAME           "app_application"

* the splash class can be anything you want:
#DEFINE APP_SPLASHCLASS         "app_splash"
#DEFINE APP_SPLASHCLASSLIB      "LIBRERIAS7_APP.VCX"
* how long should the splash screen stay up if
* no key is pressed and if the app object initializes
* too quickly? (this figure is in seconds)
#DEFINE APP_SPLASHDELAY         3

* the following are localization strings for the wrapper program:
#DEFINE APP_CANNOT_RUN_LOC           "No se puede ejecutar la aplicación."
#DEFINE APP_ALREADY_RUNNING_LOC      "La aplicación ya está en ejecución."
#DEFINE APP_WRONG_SUPERCLASS_LOC     "Esta aplicación debe crear una instancia "+ CHR(13)+"de un objeto que desciende de "+APP_SUPERCLASS+"."


* this is a localization string for the menus:                                     
#DEFINE APP_FEATURE_NOT_AVAILABLE_LOC "Característica no disponible."

* this one is a hook in the startup program, not
* needed by the framework:
* #DEFINE APP_INITIALIZE          *<Initialize>*

* strictly speaking the 6.0 framework does not
* need the following, but the 5.0 template apps may,
* if they are adapted for the new framework:
* #DEFINE APP_CD                  *<CD>*
* #DEFINE APP_PATH                *<PATH>*


