# aitoubao
爱投宝P2P网贷系统基础架构，前后台网站框架已搭建
项目来源于大学时期的P2P投资需求以及当年的毕业设计
在当年毕业设计答辩时候答应的开源于继续推进本项目2.0版本的开发，
于是从OSgit私库迁移到github，并去除毕设时期的P2P各大业务模块，仅留下日常测试使用的一个报销单模块
###二期展望：高并发秒杀、dubbo、reactjs、es6、nodejs、爬虫获取投标、监听赚客吧羊毛于消息提醒业务模快增删查改集成自动生成工具

##开发工具：idea2014
##项目运行环境
###方式一：
tomcat下运行，
项目启动后输入
后台管理（easyui）
http://localhost:8080/admin/index.do 进入后台管理首页
网站（bootstrap）
http://localhost:8080/aitouwang/index.do进入爱投宝投标网站
###方式二：
1、安装nodejs
2、进入项目所在文件夹aitoubao\src\main下
3、在cmd中输入node http.js启动脚本
4、浏览器直接运行网站首页
http://localhost:3000/aitouwang/index.html

Excample：
用于普通的测试：参考项目仅存的报销单模块
1、测试js的promise的用法
http://localhost:8080/claim/promiseIndex.do
