@echo off

echo Removing current build...

del .\out\TototekMenu.sfc

echo Building...

..\..\Tools\bass\bass.exe -create -benchmark -o .\out\TototekMenu.sfc TototekMenu.asm

echo Done.