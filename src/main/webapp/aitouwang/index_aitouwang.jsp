<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <%
        String path = request.getContextPath();// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
        String basePath = request.getScheme()+"://"+request.getServerName() +":"+request.getServerPort()+path+"/";
        pageContext.setAttribute("basePath",basePath);// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
        request.setAttribute("basePath",basePath);
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--<jsp:include page="/platform/resource/p_ksresource.jsp"></jsp:include>--%>
    <title>爱投宝</title>
</head>
<body>
<input type="hidden" id="basePath" value="${basePath}">
<%@ include file="index.html" %>
</body>
<script>

    window.basePath = window.webRoot = "${basePath}";
    window.serverName = '<%=request.getContextPath()%>';
    window.webRoot = window.rootPath = '<%=request.getContextPath()%>';
    window.seesion_member =  '<%=request.getAttribute("seesion_member")%>';

</script>
</html>
