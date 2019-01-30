@echo off
rem 获取当前文件所在路径
cd /d %~dp0
echo %cd%
set file_dir=%cd%

rem 获取myeclipse工作空间
pushd ..\..\
echo %cd%
set workspaces-path=%cd%

rem 从配置文件fy-tp-service.ini中获取打包后的路径
for /f "tokens=1,2 delims==" %%i in (%file_dir%\publish-path.ini) do (
  if "%%i"=="publish-path" set publish-path=%%j
  if "%%i"=="publish-ini" set publish-ini=%%j
 )
echo %workspaces-path%
echo %publish-path%
echo %file_dir%\%publish-ini%

rem 获取需要发版的jar包，并循环打包
for /f "tokens=1,2 delims==" %%i in (%file_dir%\%publish-ini%) do (
  if "%%i"=="" (
  	echo META-INF有数据为空
  ) else  (
   	if "%%j"=="" (
  		echo jarname有数据为空
   	) else (
        echo now run the %%i %%j
        pause
  		rem start "%jarname%" cmd /k call %file_dir%\each-jar.bat %workspaces-path% %publish-path% %%i %%j
  		call %file_dir%\each-jar.bat %workspaces-path% %publish-path% %%i %%j
    )
  )  
  pause
)

