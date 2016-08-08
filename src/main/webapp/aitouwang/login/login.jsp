<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>爱投宝网站登录</title>
	<%
		String errorCode=request.getAttribute("errorCode")+"";
		String errorMsg="";
		if("1".equals(errorCode)){
			errorMsg="您的登录账号不存在！";
		}else  if("2".equals(errorCode)){
			errorMsg="您输入的账号或密码不正确！";
		}else  if("3".equals(errorCode)){
			errorMsg="您的账号被禁用，请联系管理员！";
		}else  if("4".equals(errorCode)){
			errorMsg="未知错误，请联系管理员！";
		}else  if("5".equals(errorCode)){
			errorMsg="您输入的密码不正确！";
		}
		String path = request.getContextPath();// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
		String basePath = request.getScheme()+"://"+request.getServerName() +":"+request.getServerPort()+path+"/";
		pageContext.setAttribute("basePath",basePath);// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
		 request.setAttribute("errorMsg", errorMsg); ;

	%>
</head>
<link href="${basePath}aitouwang/login/css/bootstrap.min.css" rel="stylesheet">
<link href="${basePath}aitouwang/login/css/signin.css" rel="stylesheet">

</head>

<body>
<h1 class="h1">爱投宝网站登录</h1>
<div class="signin">
	<div class="signin-head"><img src="${basePath}aitouwang/login/images/test/head_120.png" alt="" class="img-circle"></div>
	<input type="text" id="errorTip" name="errorTip" class="form-control" value="${errorMsg}" />
	<form class="form-signin" id="loginForm1"  name="loginForm"  role="form" method="post" action="/login/submit.do" >
		<input type="text" id="username" name="username" class="form-control" placeholder="用户名" required autofocus  value="${username}"/>
		<input type="password" id="password" name="password" class="form-control" placeholder="密码" required  value="${password}"/>
		<input type="hidden" id="userType" name="userType" class="form-control"  required value="1"/>
		<button class="btn btn-lg btn-warning btn-block" id="submitLogin">登录</button>
		<label class="checkbox">
			<input type="checkbox" value="remember-me"> 记住我
			<a style="margin-left:200px"  id="signUp">注册</a>
		</label>
	</form>
</div>

<div style="text-align:center;">
</div>
<script type="text/javascript" src="${basePath}aitouwang/login/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="${basePath}aitouwang/login/js/login.js"></script>
</body>
</html>
