luci-app-batmanconf
===========

batmanconf的luci管理界面，基于openwert的可编译package

编译sdk环境中要有batmanconf选项：
1.将该包放到 package目录，可以在根目录或任意子目录中
2.执行make menuconfig，在LuCI -》3. Applications-》luci-app-batmanconf 找到该包，勾选上
3.编译整个skd，或者 make package/luci-app-batmanconf/install 单独编译

