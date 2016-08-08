<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>luosan test promise</title>
<div>

</div>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="openapi"/>
    <script type="text/javascript" src="../test/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../test/js/promise.js"></script>
    <!--修改浏览器的地址栏地址-->
    <script type="text/javascript" src="../test/js/jsreplaceUrl.js"></script>

</head>
<p>测试javascript的promise</p>
<%--<p>测试jquery获取复选框的值成功</p>--%>
<%--<input type="radio" id="checkButton" name="chec" value="male">测试复选框_male</input>--%>
<%--<input type="radio" id="checkButton" name="chec" value="female">测试复选框_female</input>--%>
<%--<script type="text/javascript">--%>
    <%--var logValue=$("input[name='chec']:checked").val();--%>
    <%--console.log("logValue");--%>
<%--</script>--%>
<%--
<p>test</p>
<form>
    <input type="radio" id="radio1" />
    <input type="button" onclick="check()" value="Check" />
    <input type="button" onclick="uncheck()" value="Uncheck" />
</form>
<script type="text/javascript">
    function check()
    {
        document.getElementById("radio1").checked=true
    }
    function uncheck()
    {
        document.getElementById("radio1").checked=false
    }
</script>--%>
<script language="javascript">
    var strWindowFeatures = "menubar=no,location=no,resizable=no,scrollbars=no,status=no,width=200,height=200";
    var nome='nameofme';
    function vamos(url1){
        win = window.open(url1,nome,strWindowFeatures);
        win.focus();
        // If the window opened successfully (e.g: not blocked)
        if (win) {
            win.onload = function() {//onload can be blocked by the brower
                win.location.href='http://www.bing.com';
            };
        }
        setTimeout("win.location.href='http://www.bing.com'",4000);//change the href after 4 second
        win.focus();
        window.history.replaceState('Object', 'Title', '?http://www.bing.com');
        setTimeout("window.history.replaceState('Object', 'Title', '?http://www.fava.com')",4000);//after 4 sec
    }
</script>
<button id="dd" onClick="vamos('http://www.google.com')">but</button>