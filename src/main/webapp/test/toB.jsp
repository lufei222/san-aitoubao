<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="../test/js/index.js"></script><!--可行。为什么指向webapp那一级就可以呢？说名师有地方可以的-->
<script type="text/javascript" src="js/index.js"></script><!--不可行。路径会变成http://localhost:8080/claim/js/index.js-->
<%--http://localhost:8080/test/js/index.js这个路径是可行的--%>
<div class="ele-seller-orders">
 ${id}
</div>

