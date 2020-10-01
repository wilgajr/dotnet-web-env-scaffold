@echo off
cls

set currentDir=%cd%
set name=%1

mkdir %name%
mkdir %name%\src
mkdir %name%\src\%name%.Web
mkdir %name%\tests
mkdir %name%\tests\%name%.Tests

cd %name%\src\%name%.Web

dotnet new Web

cd ..\..\tests\%name%.Tests

dotnet new xunit

dotnet add reference ..\..\src\%name%.Web\%name%.Web.csproj

cd ..\..\

dotnet new sln

dotnet sln add src\%name%.Web\%name%.Web.csproj
dotnet sln add tests\%name%.Tests\%name%.Tests.csproj

dotnet build