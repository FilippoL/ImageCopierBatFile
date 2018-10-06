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
set /P _image_format=Please enter image format you'd like to copy (leave empty for all common formats -.jpeg, .png, .jpg- ):
if [%_image_format] == [] set _image_format=".*"
set /P _image_name=Please enter a single file name (leave empty for all images):
if [%_image_name] == [] set _image_name="*"
set _fullpath=%_source_folder%\*%_image_name%%_image_format%
xcopy /f /j /s /w /z %_fullpath% %_destination_folder%\
set /P _ans=Do you want to complete another operation?(y/n)
if %_ans% == Y (
  cls
  goto :while
) else (
  if %_ans% == y (
  cls
  goto :while
) else (
  echo All done...
)
)
pause
