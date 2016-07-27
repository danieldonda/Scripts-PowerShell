Invoke-WebRequest https://aka.ms/tp5/b/dockerd -OutFile $env:SystemRoot\system32\dockerd.exe
Invoke-WebRequest https://aka.ms/tp5/b/docker -OutFile $env:SystemRoot\system32\docker.exe
dockerd.exe --register-service
Start-Service Docker
Docker --help
