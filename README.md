## 项目介绍
基于yearning进行二开满足业务特殊需求，实现新功能：
- 新增版本记录页面：支持对ddl语句进行转译为中文，比如张三几点修改字段a为字段b
- 工单支持分组，用于统计一段时间的工单，以便上线时快速找到本次功能所涉及的ddl

前端项目：根目录下的[yearning-master.zip](yearning-master.zip)

## 1、启动juno
- juno必须跟yearning使用同一个库
- juno目前只能使用mysql端口为3306的库，没法使用其他的端口
```shell
 sudo docker run -e MYSQL_USER=yearning -e MYSQL_PASSWORD=xxxxxxx -e MYSQL_ADDR=82.156.205.178 -e MYSQL_DB=yearning -p 50001:50001 yeelabs/juno
```
## 2、 编译
```shell
#编译
set GOARCH=amd64       
set GOOS=linux
go build      
```
## 3、服务器目录说明
- conf.toml：配置文件，内容参考conf.toml文件的内容
- run.sh ：运行脚本，内容nohup ./Yearning-go run > output.log 2>&1 &
- Yearning-go：编译后的包

## 4、初始化sql
```shell
./Yearning-go install
```
## 5、启动
```shell
# 源码下的conf.toml需要跟编译后的Yearning-go同级
./Yearning-go run
```
## 6、 部署vue项目
```shell
将编译后的dist目录放到nginx下
```
## 7、配置nginx
因为项目是前端后端分离的，所以需要单独部署
```shell

```