echo OFF

REM  Batch file to start a Calibre2Opds that has just been built
REM  in batch mode.
REM  (avoids having to build installer or deploy calibre2odps)

SETLOCAL
pushd Install\target\dependency

echo Starting Calibre2Opds
call ..\..\..\script\run.cmd --enableassertions %*
popd
echo [INFO]] Current Directory is reset to %cd%
ENDLOCAL