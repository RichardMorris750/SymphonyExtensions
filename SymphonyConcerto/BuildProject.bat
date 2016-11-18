@SETLOCAL

@REM Define the Workbench project root
set SYNPROJECTROOT=C:\Development\SymphonyFramework\SymphonyExtensions\SymphonyConcerto\
set SYNBITSIZE=32

@REM Project open syn_set commands:
SET EXE=C:\Development\SymphonyFramework\SymphonyExtensions\Exe
SET SYNEXPDIR=C:\Development\SymphonyFramework\SymphonyExtensions\Proto


@echo del C:\Development\SymphonyFramework\SymphonyExtensions\Proto\SymphonyConcerto.dbp
IF EXIST C:\Development\SymphonyFramework\SymphonyExtensions\Proto\SymphonyConcerto.dbp (
	del C:\Development\SymphonyFramework\SymphonyExtensions\Proto\SymphonyConcerto.dbp
)
@echo Prototyping...
dblproto -T < C:\Development\SymphonyFramework\SymphonyExtensions\SymphonyConcerto\BuildProject_dblproto.in
IF ERRORLEVEL 1 (exit /B ERRORLEVEL)
@echo Prototype complete

@echo Compiling...
dbl -T < C:\Development\SymphonyFramework\SymphonyExtensions\SymphonyConcerto\BuildProject_dbl.in
IF ERRORLEVEL 1 (exit /B ERRORLEVEL)
@echo Compile complete

@echo Linking...
dblink -T < C:\Development\SymphonyFramework\SymphonyExtensions\SymphonyConcerto\BuildProject_dblink.in
IF ERRORLEVEL 1 (exit /B ERRORLEVEL)
@echo Link complete

@echo Build complete


@ENDLOCAL