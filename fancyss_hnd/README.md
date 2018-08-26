### merlin科学上网插件 for hnd platform router with 4.1.27内核
***
##### 此插件适用于ARM架构，hnd平台路由器，内核为4.1.27的梅林固件（RT-AC86U），和GT-AC5300的官改固件</b><br/>
- **shadowsocks/ss**：该文件夹用于存放shadowsocks相关脚本和规则文件：
- **shadowsocks/webs**：该文件夹用于存放shadowsocks的网页。
- **shadowsocks/res**：该文件夹用于存放科学上网插件相关的网页元素，如js，css等。
- **shadowsocks/bin**：该文件夹用于存放shadowsocks的二进制文件。
- **shadowsocks/scripts**：该文件夹用于存放web调用的脚本文件。
- **shadowsocks/GT-AC5300**：该文件夹用于存放ROG皮肤的网页或css文件，用于GT-AC5300机器上。
- **history**：存放插件历史安装包，需要回滚历史版本的，可以下载对应版本，然后手动安装。
- **version**：在线版本号和shadowsocks.tar.gz的md5校验值，用于判断更新。
- **shadowsocks.tar.gz**：shadowsocks文件夹的打包，插件最新版本的包，插件内置的在线更新访问此文件的[链接 ](https://raw.githubusercontent.com/koolshare/koolshare.github.io/master/shadowsocks/shadowsocks.tar.gz) 获取安装包更新。

---
#### 科学上网插件安装方法
由于因为政策原因，该插件不能在软件中心上架，所以需要手动安装，提供以下方法：

##### 1. 离线安装
1. [下载最新安装包](https://raw.githubusercontent.com/koolshare/koolshare.github.io/master/shadowsocks/shadowsocks.tar.gz)
2. 确保安装包的名字为shadowsocks.tar.gz
3. 在软件中心顶部找到离线安装标签页，点击进入离线安装页面
4. 上传并完成离线安装

##### 2. ssh安装科学上网插件最新版
用ssh客户端登陆路由器后输入以下命令：
```bash
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/koolshare/rogsoft/master/shadowsocks/shadowsocks.tar.gz
tar -zxvf /tmp/shadowsocks.tar.gz
sh /tmp/shadowsocks/install.sh
```

##### 3. ssh安装科学上网插件历史版本（1.2.4为例）： 
用ssh客户端登陆路由器后输入以下命令：
```bash
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/koolshare/rogsoft/master/shadowsocks/history/shadowsocks_1.2.4.tar.gz
tar -zxvf /tmp/shadowsocks.tar.gz
sh /tmp/shadowsocks/install.sh
```
---
#### 如果你有发现bug，并希望提交你的更改，需要做以下几点：<br/>
1. 发现bug，修改需要修改的文件；<br/>
2. 更新shadowsocks/ss/version，更新版本号；<br/>
3. 修改Changelog.txt文件，添加更新日志；<br/>
4. 运行build.sh文件，这样会自动打包shadowsocks文件夹，并且更新version内的版本号和md5值，同时会把就版本丢进history中；<br/>
5. 运行git status，查看被修改的文件，然后添加，评论，提交；<br/>
