@echo off

echo Removing current build...

del .\out\TototekMenu.sfc

echo Copying original (Base) ROM...

copy ".\base\sfbotx.gs" .\out\TototekMenu.sfc

echo Building...

..\..\Tools\xkas\xkas.exe TototekMenu.asm .\out\TototekMenu.sfc

echo Done.