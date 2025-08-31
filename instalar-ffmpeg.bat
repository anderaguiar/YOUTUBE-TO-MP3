@echo off
echo ==========================================
echo Instalando FFmpeg no Windows via winget...
echo ==========================================
echo.

REM Verifica se winget está disponível
winget --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ERRO: winget nao encontrado. Atualize seu Windows ou instale o winget manualmente.
    pause
    exit /b
)

REM Instala o FFmpeg
winget install ffmpeg -e --id=Gyan.FFmpeg
IF ERRORLEVEL 1 (
    echo ERRO: Nao foi possivel instalar o FFmpeg.
    pause
    exit /b
)

echo.
echo Configurando o PATH temporario para este CMD...
echo.

REM Caminho padrao do FFmpeg instalado pelo winget
SET FFmpegPath=%ProgramFiles%\FFmpeg\bin

REM Verifica se o caminho existe
IF NOT EXIST "%FFmpegPath%" (
    echo ERRO: Nao foi possivel localizar o FFmpeg instalado.
    pause
    exit /b
)

REM Adiciona ao PATH temporariamente para este CMD
SET PATH=%PATH%;%FFmpegPath%

echo.
echo FFmpeg instalado e pronto para uso neste CMD!
echo Digite 'ffmpeg -version' para verificar a instalacao.
echo.
pause

REM Mantem o CMD aberto para o usuario usar o FFmpeg
cmd
