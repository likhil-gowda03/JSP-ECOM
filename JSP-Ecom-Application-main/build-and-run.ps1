$ErrorActionPreference = "Stop"
$ProgressPreference = 'SilentlyContinue'

$MavenVersion = "3.9.6"
$TomcatVersion = "9.0.87"

$MavenUrl = "https://archive.apache.org/dist/maven/maven-3/$MavenVersion/binaries/apache-maven-$MavenVersion-bin.zip"
$TomcatUrl = "https://archive.apache.org/dist/tomcat/tomcat-9/v$TomcatVersion/bin/apache-tomcat-$TomcatVersion-windows-x64.zip"

$MavenDir = "$PSScriptRoot\.maven"
$TomcatDir = "$PSScriptRoot\.tomcat"

Write-Host "=== 1. Checking/Installing Maven ===" -ForegroundColor Cyan
if (-Not (Test-Path "$MavenDir\apache-maven-$MavenVersion\bin\mvn.cmd")) {
    Write-Host "Downloading Maven $MavenVersion..."
    New-Item -ItemType Directory -Force -Path $MavenDir | Out-Null
    Invoke-WebRequest -Uri $MavenUrl -OutFile "$MavenDir\maven.zip"
    Write-Host "Extracting Maven..."
    Expand-Archive -Path "$MavenDir\maven.zip" -DestinationPath $MavenDir -Force
    Remove-Item "$MavenDir\maven.zip"
} else {
    Write-Host "Maven is already installed."
}

Write-Host "`n=== 2. Building Project ===" -ForegroundColor Cyan
$MvnCmd = "$MavenDir\apache-maven-$MavenVersion\bin\mvn.cmd"
& $MvnCmd clean package -DskipTests
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed!" -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "`n=== 3. Checking/Installing Tomcat ===" -ForegroundColor Cyan
if (-Not (Test-Path "$TomcatDir\apache-tomcat-$TomcatVersion\bin\catalina.bat")) {
    Write-Host "Downloading Tomcat $TomcatVersion..."
    New-Item -ItemType Directory -Force -Path $TomcatDir | Out-Null
    Invoke-WebRequest -Uri $TomcatUrl -OutFile "$TomcatDir\tomcat.zip"
    Write-Host "Extracting Tomcat..."
    Expand-Archive -Path "$TomcatDir\tomcat.zip" -DestinationPath $TomcatDir -Force
    Remove-Item "$TomcatDir\tomcat.zip"
} else {
    Write-Host "Tomcat is already installed."
}

Write-Host "`n=== 4. Deploying WAR to Tomcat ===" -ForegroundColor Cyan
$TomcatWebapps = "$TomcatDir\apache-tomcat-$TomcatVersion\webapps"
$WarPath = "$PSScriptRoot\target\test-1.0-SNAPSHOT.war"

# Clear existing deployment
if (Test-Path "$TomcatWebapps\jsp-servlet-ecommerce-website") {
    Remove-Item -Recurse -Force "$TomcatWebapps\jsp-servlet-ecommerce-website"
}
if (Test-Path "$TomcatWebapps\jsp-servlet-ecommerce-website.war") {
    Remove-Item -Force "$TomcatWebapps\jsp-servlet-ecommerce-website.war"
}

Write-Host "Copying WAR file..."
Copy-Item -Path $WarPath -Destination "$TomcatWebapps\jsp-servlet-ecommerce-website.war" -Force

Write-Host "`n=== 5. Starting Tomcat ===" -ForegroundColor Cyan
$CatalinaBat = "$TomcatDir\apache-tomcat-$TomcatVersion\bin\catalina.bat"

Write-Host "Tomcat is starting..."
Write-Host "Once started, the application will be available at:" -ForegroundColor Green
Write-Host "http://localhost:8080/jsp-servlet-ecommerce-website/" -ForegroundColor Green
Write-Host "Press Ctrl+C in this window to stop the server.`n" -ForegroundColor Yellow

$env:CATALINA_HOME = "$TomcatDir\apache-tomcat-$TomcatVersion"
$env:CATALINA_BASE = "$TomcatDir\apache-tomcat-$TomcatVersion"
$env:JAVA_HOME = "C:\Program Files\Java\jdk-25"

& $CatalinaBat run
