@echo off
%SystemRoot%\explorer.exe %~dp0
start cmd
code "%cd%"