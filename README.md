# docker-vs2019-vcpkg


### docker desktop開不起來
["Docker Desktop is starting..." forever](https://github.com/docker/for-win/issues/5261):  
在這部分，我是把`%ProgramFiles%\Docker\Docker\resources`下的`com.docker.proxy.exe`,`vpnkit.exe`等等都納入防火牆的例外，  
接著一切都解決了，再也不會開2,3分鐘，然後開好就自動stop。(測試環境:家裡桌機)。  
(工作筆電尚未測試)


### 如何選擇base image(windows)
[Container Base Images](https://docs.microsoft.com/zh-tw/virtualization/windowscontainers/manage-containers/container-base-images)  

### 基本設定  
[Get started: Prep Windows for containers](https://docs.microsoft.com/zh-tw/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server)  
新手教學，感覺有蠻重要的概念，先留著之後再看

[Docker Engine on Windows](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon):  
這部分很重要，我就是沒有仔細的看完，才有了後面的踩雷(和無意義的查資料時間)。  

### vs_buildtools的package id table
[Visual Studio Build Tools component directory](https://docs.microsoft.com/zh-tw/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2019#c-build-tools)

### vs_buildtools下了--wait卻根本不會wait就回shell了
[https://developercommunity.visualstudio.com/t/setup-does-not-wait-for-installation-to-complete-w/26668](Setup does not wait for installation to complete when "--wait" parameter is used)
請用與call相關概念的function呼叫vs_buildtools.exe，像是powershell中Start-Process，或是cmd中的start。(debug半天的我: ......)  



### 拉base image怎麼拉都拉失敗 
1. [Docker: “no matching manifest for windows/amd64 in the manifest list entries”](https://stackoverflow.com/questions/48066994/docker-no-matching-manifest-for-windows-amd64-in-the-manifest-list-entries)
2. [Error response from daemon: open \\.\pipe\docker_engine_linux: The system cannot find the file specified.](https://github.com/docker/for-win/issues/4495)
3. ['docker build' error: "failed to solve with frontend dockerfile.v0"](https://github.com/docker/buildx/issues/415)
4. [failed to load LLB: runtime execution on platform linux/arm64 not supported](https://github.com/docker/buildx/issues/138)
有比較常見的幾種狀況，一種是Dockerfile的大小寫，如果是linux container似乎是case sensitive，所以file name要注意(我也不知道大寫還小寫哪個是對的就是)。  
另外一種是用linux container抓windows的image，我的部分就是這種狀況(1.)，不知為啥我一開始是用linux container在跑(可能我一開始沒開hyperV)，這時候在工作列上的docker圖示點右鍵，switch windows container就好。.......-.-...哭阿!!  
2.和3.4.基本上是相關的問題大補帖，狀況因人而異...看起來是個大坑  




### 錯誤碼 5003，以及網路相關問題
[Out of the box docker creation is not working](https://github.com/microsoft/vs-dockerfiles/issues/5):  
簡單說就是dns要設，configuration json加上`"dns": ["8.8.8.8"]` 。就是這個害我灌了2天都灌不起來，哭阿  
> 正常來說，使用vs_buildtools.exe是看不到錯誤碼的，
> 要看到錯誤碼請搭配使用collector.exe，
> 請參考[Using MSVC in a Docker Container for Your C++ Projects](https://devblogs.microsoft.com/cppblog/using-msvc-in-a-docker-container-for-your-c-projects/)以及這篇的[github sample](https://github.com/Microsoft/vs-Dockerfiles)。

延伸閱讀 :  
- [Windows container networking](https://docs.microsoft.com/en-gb/virtualization/windowscontainers/container-networking/architecture)
- [docker network](https://docs.docker.com/engine/reference/commandline/network/)
- [如何修復 Docker Desktop for Windows 各種奇怪的網路問題 by Will保哥](https://blog.miniasp.com/post/2019/06/09/How-to-troubleshoot-docker-networking-problem-in-Windows-Container1)


### 硬碟空間不夠，想換image預設存放的path
[dockerd daemon](https://docs.docker.com/engine/reference/commandline/dockerd/):  
configuration json加上`"data-root":"D:\\docker"`  
[\[Docker\] 修改 Docker image 預設存放位置](https://marcus116.blogspot.com/2019/03/change-download-docker-image-path.html)
比較特別的是，這篇是在configuration json加上`"graph":"D:\\docker"`，不知道"data-root"和"graph"差在哪(待查證)。  



