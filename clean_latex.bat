@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

:: ===================== 配置区 =====================
:: 要清理的LaTeX残留文件扩展名（可自行增删）
set "delete_ext=.aux .log .out .toc .lof .lot .fls .fdb_latexmk .synctex.gz .bbl .blg .brf .cb .ind .idx .ilg .inx .ps .dvi .abs "
:: 默认清理目录（当前目录），可修改为指定路径，例如：set "target_dir=D:\latex_project"
set "target_dir=%cd%"
:: 是否开启删除确认（1=开启，0=关闭）
set "confirm=1"
:: ==================================================

echo.
echo ==============================================
echo          LaTeX编译残留文件清理工具
echo ==============================================
echo 清理目录：%target_dir%
echo 待清理文件类型：%delete_ext%
echo ==============================================
echo.

:: 检查目标目录是否存在
if not exist "%target_dir%" (
    echo 错误：目录 "%target_dir%" 不存在！
    pause
    exit /b 1
)

:: 收集待删除文件
set "file_count=0"
set "delete_files="
for %%e in (%delete_ext%) do (
    for /f "delims=" %%f in ('dir /b /a-d "%target_dir%\*%%e" 2^>nul') do (
        set "delete_files=!delete_files! "%target_dir%\%%f""
        set /a file_count+=1
    )
)

:: 无文件可清理的情况
if !file_count! equ 0 (
    echo 未找到需要清理的LaTeX残留文件！
    pause
    exit /b 0
)

:: 显示待删除文件列表
echo 找到以下 !file_count! 个待清理文件：
echo ----------------------------------------------
for %%f in (!delete_files!) do echo %%~f
echo ----------------------------------------------
echo.

:: 确认删除（如果开启）
if !confirm! equ 1 (
    set "choice="
    set /p "choice=是否确认删除以上文件？(Y/N，默认N)："
    if /i not "!choice!"=="Y" (
        echo 已取消删除操作。
        pause
        exit /b 0
    )
)

:: 执行删除
echo.
echo 正在删除文件...
for %%f in (!delete_files!) do (
    del /f /q "%%f" >nul 2>&1
    if exist "%%f" (
        echo 失败：无法删除 %%f
    ) else (
        echo 成功：删除 %%f
    )
)

echo.
echo ==============================================
echo 清理完成！共处理 !file_count! 个文件。
echo ==============================================
pause
endlocal