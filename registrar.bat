@echo off
echo =============================================
echo Registro de controles ActiveX para Áncora
echo =============================================
echo.
echo EJECUTAR COMO ADMINISTRADOR
echo.

echo [1/4] Copiando actskin4.ocx...
copy actskin4.ocx c:\windows\system32 /Y
regsvr32 c:\windows\system32\actskin4.ocx

echo.
echo [2/4] Copiando ButtonSkin.ocx...
copy ButtonSkin.ocx c:\windows\system32 /Y
regsvr32 c:\windows\system32\ButtonSkin.ocx

echo.
echo [3/4] Verificando OCX adicionales...
if exist MSCOMCTL.OCX (
    echo    MSCOMCTL.OCX ya existe
) else (
    echo    ADVERTENCIA: MSCOMCTL.OCX no encontrado
)

echo.
echo [4/4] Verificando controles de usuario...
if exist ctl\*.ctl (
    echo    Controles de usuario encontrados en ctl\
) else (
    echo    ADVERTENCIA: No se encontraron controles en ctl\
)

echo.
echo =============================================
echo Registro completado
echo Reinicie Visual Basic 6 para cargar los controles
echo =============================================
pause
