<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head id="Head1">
	<meta charset="UTF-8">
	<title >爱投宝后台运营系统</title>
	<link rel="stylesheet" type="text/css" href="/jquery-easyui-1.4.4/themes/black/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/jquery-easyui-1.4.4/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="/welcome/common/css/index.css" />
	<%--下面这三个不能更改成jquery1.6和easyui.js--%>
	<script type="text/javascript" src="/welcome/common/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="/welcome/common/js/jQuery.easyui.js"></script>
	<%--index.js放在outlook2.js前面加载才不会出现样式乱--%>
	<script type="text/javascript" src="/welcome/common/js/index.js"></script>
	<script type="text/javascript" src='/welcome/common/js/outlook2.js'> </script>



</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
	<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
		<img src="common/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
	</div></noscript>
<div region="north" split="true" border="false" style="overflow: hidden; height: 40px!important;
        background:#1f1f1f;
        line-height: 30px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
	<span style="float:right; padding-right:20px;" class="head">欢迎 ${seesion_member2} <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
	<span style="padding-left:10px; font-size: 45px; "><img src="../common/images/jenkins.png" width="40" height="40" align="absmiddle" />aitoubao</span>
</div>
<div region="south" split="true" style="height: 35px; background: #3D3D3D;color: #a3a3a3 ">
	<div class="footer"style="color:#a3a3a3">By 罗三 Email:113264744@qq.com</div>
</div>
<div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
	<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
	</div>
</div>
<div id="mainPanle" region="center" style="background: #fff; overflow-y:hidden">
	<div id="tabs" class="easyui-tabs"  fit="true" border="false" >
		<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">

				<h1  style="color: #000;font-size:30px">爱投宝后台管理</h1>

		</div>
	</div>
</div>


<!--修改密码窗口-->
<div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
	 maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
	<div class="easyui-layout" fit="true">
		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
			<table cellpadding=3>
				<tr>
					<td>新密码：</td>
					<td><input id="txtNewPass" type="Password" class="txt01" /></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input id="txtRePass" type="Password" class="txt01" /></td>
				</tr>
			</table>
		</div>
		<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
			<a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
				确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
						  onclick="closeLogin()">取消</a>
		</div>
	</div>
</div>

<div id="mm" class="easyui-menu" style="width:150px;">
	<div id="mm-tabclose">关闭</div>
	<div id="mm-tabcloseall">全部关闭</div>
	<div id="mm-tabcloseother">除此之外全部关闭</div>
	<div class="menu-sep"></div>
	<div id="mm-tabcloseright">当前页右侧全部关闭</div>
	<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
	<div class="menu-sep"></div>
	<div id="mm-exit">退出</div>
</div>

</body>
</html>