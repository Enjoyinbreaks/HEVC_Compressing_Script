@echo off
setlocal EnableDelayedExpansion

for /R %%A in (*.avi, *.mov, *.wmv, *.ts, *.m2ts, *.mkv, *.mts) do (
    echo Processing %%A
    ffmpeg -hwaccel qsv -i "%%A" -map 0:v -map 0:a -map_metadata 0 -c:v hevc -crf 30 -c:a copy -b:a 160k -movflags +faststart -movflags use_metadata_tags "%%~dnpA_CRF30_HEVC.mp4"

    echo Processed %%A
)

pause
