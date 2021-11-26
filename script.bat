@echo off
setlocal EnableDelayedExpansion

for /R %%A in (*.avi, *.mov, *.wmv, *.ts, *.m2ts, *.mkv, *.mts) do (
    echo Processing %%A
    ffmpeg -strict 2 -hwaccel auto -i "%%A" -c:v hevc -rc constqp -qp 24 -b:v 0k -c:a aac -map 0 "%%~dnpA_CRF24_HEVC.mp4"

    echo Processed %%A
)

pause
