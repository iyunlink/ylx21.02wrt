ubuntu：Ubuntu 9.10

开发板: JZ2440(方法通用,不局限于JZ2440)



目的：
JZ2440开机logo默认是一只可爱的小企鹅。我们把它替换成我们自己喜爱的图片

准备工作：
准备好BMP或者PNG 图片，若是别的格式的图片，可以使用
Windows自带的画图软件打开，然后另存为BMP或者PNG格式
Logo图片分辨率不小于JZ2440分辨率480*272，否则显示不了。

步骤：
1. 安装资料光盘Ubuntu 9.10没有的图片转换工具netpbm
$ sudo apt-get install netpbm 然后输入y //前提是ubuntu能上网

制作linux logo图片
假设图片为 jz2440.png(png格式图片)
$ pngtopnm jz2440.png > jz2440.pnm
$ pnmquant 224 jz2440.pnm > logo224.pnm

$ pnmtoplainpnm logo224.pnm > logo_linux_clut224.ppm

假设图片为 jz2440.bmp(BMP格式图片)
$ bmptopnm jz2440.bmp > jz2440.pnm

$ pnmquant 224 logo.pnm > logo224.pnm

$ pnmtoplainpnm logo224.pnm > logo_linux_clut224.ppm
注意：转换后的文件名有规定，必须是logo_linux_clut224.ppm

3.生成的logo_linux_clut224.ppm就是我们需要的logo文件，把它拷贝到内核目录
覆盖原来的logo文件
$ cd /work/system/linux-2.6.22.6/drivers/video/logo/

$ cp /work/logo_linux_clut224.ppm . //笔者制作的logo文件在/work/目录

查看logo目录是否存在logo_linux_clut224.o的文件，如果有一定要删除！
$ rm logo_linux_clut224.o
配置内核支持logo显示(如果内核用的是linux-2.6.22.6_jz2440.patch补丁，默认已经支持logo显示)
$ make menuconfig
Device Drivers —>
Graphics support —>
Console display driver support—>
<*>Framebuffer console support
Bootup logo —>
<*> Standart 224-color linux logo
6.重新编译内核，烧写
$make uImage
把uImage上传到window tftp软件所在目录