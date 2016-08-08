<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
<%--
    <script type="text/javascript" src="<%=basePath%>common/js/jquery-1.4.2.min.js"></script>
--%>
<%--
    <script type="text/javascript" src='project/common/js/projectList2.js'></script>
--%>
    <div id="projectList"></div>
</head>
<body>
<%@ include file="../project/projectList.html" %>
</body>
