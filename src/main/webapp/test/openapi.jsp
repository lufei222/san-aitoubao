<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta name="keywords" content="openapi"/>
   <script type="text/javascript" src="/platform/jquery/jquery-1.8.1.js"></script>
</head>

<div class="ele-seller-orders" align="center">
<h1>openApi的post請求的調用測試</h1>
   <h2>测试ajax提交数据post请求到controller层时候，添加参数printWriter导致返回错误信息只能是html</h2>
<button id="submit">submit</button>
</div>
<!--為什麼要把js的click事件寫在外面才可以起效-->
<script type="text/javascript" src="../test/js/openapi.js"></script>

</html>

