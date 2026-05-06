@echo off
:: Trinitycore fork: The Cataclysm Preservation Project maps, vmaps, mmaps extractor
:: ---------------------------------------------
echo ...............................................
echo Trinitycore fork: The Cataclysm Preservation Project maps, vmaps, mmaps extractor
echo ...............................................
echo PRESS 1, 2, 3 OR 4 to select your task, or 5 to EXIT.
echo ...............................................
echo.
echo WARNING! when extracting the vmaps extractor will
echo output the text below, it's intended and not an error:
echo ..........................................
echo Extracting World\Wmo\Band\Final_Stage.wmo
echo No such file.
echo Couldn't open RootWmo!!!
echo Done!
echo ..........................................
echo.
echo Press 1, 2, 3 or 4 to start extracting or 5 to exit.
echo 1 - Extract base files ^(NEEDED^) and cameras.
echo 2 - Extract vmaps ^(needs maps to be extracted before you run this^) ^(OPTIONAL, highly recommended^)
echo 3 - Extract mmaps ^(needs vmaps to be extracted before you run this, may take hours^) ^(OPTIONAL, highly recommended^)
echo 4 - Extract all ^(may take hours^)
echo 5 - EXIT
echo.
set /p choice="Type 1, 2, 3, 4 or 5 then press ENTER: "

if "%choice%"=="1" goto extract_base
if "%choice%"=="2" goto extract_vmaps
if "%choice%"=="3" goto extract_mmaps
if "%choice%"=="4" goto extract_all
if "%choice%"=="5" goto end
echo Invalid choice. Exiting.
goto end

:extract_base
if exist mapextractor.exe (
    echo Extracting maps and cameras...
    mapextractor.exe
) else (
    echo mapextractor.exe not found!
)
goto end

:extract_vmaps
if exist vmap4extractor.exe (
    echo Extracting vmaps...
    vmap4extractor.exe
) else (
    echo vmap4extractor.exe not found!
)
if exist vmap4assembler.exe (
    echo Assembling vmaps...
    vmap4assembler.exe
) else (
    echo vmap4assembler.exe not found!
)
goto end

:extract_mmaps
if exist mmaps_generator.exe (
    echo Extracting mmaps...
    mmaps_generator.exe
) else (
    echo mmaps_generator.exe not found!
)
goto end

:extract_all
if exist mapextractor.exe (
    echo Extracting maps and cameras...
    mapextractor.exe
) else (
    echo mapextractor.exe not found!
)
if exist vmap4extractor.exe (
    echo Extracting vmaps...
    vmap4extractor.exe
) else (
    echo vmap4extractor.exe not found!
)
if exist vmap4assembler.exe (
    echo Assembling vmaps...
    vmap4assembler.exe
) else (
    echo vmap4assembler.exe not found!
)
if exist mmaps_generator.exe (
    echo Extracting mmaps...
    mmaps_generator.exe
) else (
    echo mmaps_generator.exe not found!
)
goto end

:end
echo.
echo Extraction process complete. Press any key to exit.
pause
