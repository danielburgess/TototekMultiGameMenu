@echo off

echo Removing current build...

del .\out\TototekMenu.sfc

echo Building...

..\..\Tools\xkas\xkas.exe TototekMenu.asm .\out\TototekMenu.sfc

echo Done.