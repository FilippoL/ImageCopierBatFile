@echo off

:while
set /P _source_folder=Please enter source folder:
if exist %_source_folder% (
  echo OK..
) else (
  echo NO..
  goto :while
)
:while2
set /P _destination_folder=Please enter destination folder:
if exist %_destination_folder% (
  echo OK..
) else (
  echo NO..
  goto :while2
)

for /f "tokens=*" %%a in (input.txt) do call :processline %%a

pause
goto :eof

:processline
set _image_name="%*"

set _fullpath=%_source_folder%\*%_image_name%
xcopy /f /j /s /z %_fullpath% %_destination_folder%\

goto :eof

:eof

set /P _ans=Do you want to close the window?(y/n)

pause
