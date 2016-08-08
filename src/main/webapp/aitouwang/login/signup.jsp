<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>爱投宝会员注册</title>
	<%
		String errorCode=request.getAttribute("errorCode")+"";
		String errorMsg="";
		if("1".equals(errorCode)){
			errorMsg="请输入您的登录账号！";
		}else  if("2".equals(errorCode)){
			errorMsg="您输入的账号不存在！";
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
<h1 class="h1">爱投宝会员注册</h1>
<div class="">
	<div class="form-signin" id="loginForm1"  name="loginForm"  role="form" method="post"  >
		<input type="text" id="loginName"  class="form-control" placeholder="用户名" required autofocus  />
		<input type="text" id="password"  class="form-control" placeholder="密码" required autofocus  />
		<input type="text" id="confirmPassword"  class="form-control" placeholder="确认密码" required autofocus  />
		<input type="text" id="payPassword"  class="form-control" placeholder="支付密码密码" required autofocus  />
		<input type="text" id="confirmPayPassword"  class="form-control" placeholder="确认支付密码密码" required autofocus  />
		<input type="text" id="phone"  class="form-control" placeholder="电话" required autofocus  />
		<input type="text" id="idNo"  class="form-control" placeholder="身份证" required autofocus  />
		<input type="text" id="bankNo"  class="form-control" placeholder="银行卡" required autofocus  />
		<input type="text" id="name"  class="form-control" placeholder="姓名" required autofocus  />
		<input type="text" id="gender"  class="form-control" placeholder="性别" required autofocus  />
		<input type="text" id="qq"  class="form-control" placeholder="qq"  autofocus  />
		<input type="text" id="wechat"  class="form-control" placeholder="wechat"  autofocus />

		<button class="btn btn-lg btn-success btn-block" id="submitSignUp">注册</button>

	</div>
</div>

<div style="text-align:center;">
</div>
<script type="text/javascript" src="${basePath}aitouwang/login/js/jquery-2.2.3.min.js"></script>
<script src="${basePath}aitouwang/js/layer.js"></script>
<script type="text/javascript" src="${basePath}aitouwang/login/js/signup.js"></script>
</body>
</html>
