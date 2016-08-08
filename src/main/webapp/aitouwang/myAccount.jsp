<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%
        String path = request.getContextPath();// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        pageContext.setAttribute("basePath", basePath);// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- core CSS -->
    <link href="${basePath}aitouwang/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}aitouwang/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}aitouwang/css/prettyPhoto.css" rel="stylesheet">
    <link href="${basePath}aitouwang/css/animate.min.css" rel="stylesheet">
    <link href="${basePath}aitouwang/css/main.css" rel="stylesheet">
    <link href="${basePath}aitouwang/css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${basePath}aitouwang/js/html5shiv.js"></script>
    <script src="${basePath}aitouwang/js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="${basePath}aitouwang/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${basePath}aitouwang/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${basePath}aitouwang/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="${basePath}aitouwang/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${basePath}aitouwang/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>

<header id="header">
    <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-4">
                    <div class="top-number"><p><i class="fa fa-phone-square"></i> +86 15088132403</p></div>
                </div>
                <div class="col-sm-6 col-xs-8">
                    <div class="social">
                        <ul class="social-share">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-skype"></i></a></li>
                        </ul>
                        <div class="search">
                            <form role="form">
                                <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                <i class="fa fa-search"></i>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.container-->
    </div>
    <!--/.top-bar-->

    <nav class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.do"><img src="${basePath}aitouwang/images/logo.png"
                                                               alt="logo"></a>
            </div>

            <div class="collapse navbar-collapse navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="${basePath}aitouwang/index.do">主页</a></li>
                    <li><a href="${basePath}aitouwang/about-us.html">关于我们</a></li>
                    <li><a href="${basePath}aitouwang/project.html">项目</a></li>
                    <li><a href="${basePath}aitouwang/portfolio.html">实时交易</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <i
                                class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="${basePath}aitouwang/blog-item.html">Blog Single</a></li>
                            <li><a href="${basePath}aitouwang/pricing.html">Pricing</a></li>
                            <li><a href="${basePath}aitouwang/404.html">404</a></li>
                            <li><a href="${basePath}aitouwang/shortcodes.html">Shortcodes</a></li>
                        </ul>
                    </li>
                    <li><a href="${basePath}aitouwang/blog.html">业界咨询</a></li>
                    <li><a href="${basePath}aitouwang/myAccount.jsp">我的賬戶</a></li>
                </ul>
            </div>
        </div>
        <!--/.container-->
    </nav>
    <!--/nav-->
</header>
<!--/header-->

<section id="contact-info">
    <div class="center">
        <h2>你好_<span class="name"></span></h2>

        <p class="lead">在個人中心，你可以看到你的全部賬戶信息和投資詳情，還可以查看資金流水哦</p>
        <ul class="portfolio-filter text-center">
            <li><a class="btn btn-default active" href="#" data-filter="*" value="1" onclick="changeMyContent(this)">账户信息</a>
            </li>
            <li><a class="btn btn-default" href="#" data-filter="*" value="2" onclick="changeMyContent(this)">所有投资</a></li>
            <li><a class="btn btn-default" href="#" data-filter=".bootstrap" value="3" onclick="changeMyContent(this)">资金流水</a></li>
            <li><a class="btn btn-default" href="#" data-filter=".html" value="4" onclick="changeMyContent(this)">充值/提现</a></li>
            <li><a class="btn btn-default" href="#" data-filter=".wordpress" value="5" onclick="changeMyContent(this)">活动奖励</a></li>
        </ul>
        <!--/#portfolio-filter-->
    </div>
    <div class="gmap-area" id="myAccountInfo">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 map-content">
                    <ul class="row">
                        <li class="col-sm-6">
                            <address>
                                <h5>個人信息</h5>
                                <font>用戶名：</font><font>${seesion_member}</font><br/>
                                <font>姓名：</font><font class="name"></font><br/>
                                <font>身份證：</font><font id="idNo"></font><br/>
                                <font>銀行卡：</font><font id="bankNo"></font><br/>
                            </address>
                            <address>
                                <h5>聯繫方式</h5>
                                <font>微信：</font><font id="wechat"></font><br/>
                                <font>qq：</font><font id="qq"></font><br/>
                                <font>手機：</font><font id="phone"></font><br/>
                                <font>郵箱：</font><font id="email"></font><br/>
                            </address>
                        </li>
                        <li class="col-sm-6">
                            <address>
                                <h5>資金信息</h5>
                                <font>总金额：</font><font id="totalAmount"></font>元<br/>
                                <font>冻结金额：</font><font id="frozenAmount"></font>元<br/>
                                <font>可用余额：</font><font id="availableAmount"></font>元<br/>
                                <font>回款中金额：</font><font id="receivingAmount"></font>元<br/>
                                <font>历史投资金额：</font><font id="historialAmount"></font>元<br/>
                            </address>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="gmap-area" id="myProjectInfo">
    </div>
    <div class="gmap-area" id="myJournalInfo">
    </div>
</section>
<!--/gmap_area -->

<%--<section id="contact-page">--%>
<%--<div class="container">--%>
<%--<div class="center">        --%>
<%--<h2>Drop Your Message</h2>--%>
<%--<p class="lead">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>--%>
<%--</div> --%>
<%--<div class="row contact-wrap"> --%>
<%--<div class="status alert alert-success" style="display: none"></div>--%>
<%--<form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">--%>
<%--<div class="col-sm-5 col-sm-offset-1">--%>
<%--<div class="form-group">--%>
<%--<label>Name *</label>--%>
<%--<input type="text" name="name" class="form-control" required="required">--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label>Email *</label>--%>
<%--<input type="email" name="email" class="form-control" required="required">--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label>Phone</label>--%>
<%--<input type="number" class="form-control">--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label>Company Name</label>--%>
<%--<input type="text" class="form-control">--%>
<%--</div>                        --%>
<%--</div>--%>
<%--<div class="col-sm-5">--%>
<%--<div class="form-group">--%>
<%--<label>Subject *</label>--%>
<%--<input type="text" name="subject" class="form-control" required="required">--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label>Message *</label>--%>
<%--<textarea name="message" id="message" required class="form-control" rows="8"></textarea>--%>
<%--</div>                        --%>
<%--<div class="form-group">--%>
<%--<button type="submit" name="submit" class="btn btn-primary btn-lg" required="required">Submit Message</button>--%>
<%--</div>--%>
<%--</div>--%>
<%--</form> --%>
<%--</div><!--/.row-->--%>
<%--</div><!--/.container-->--%>
<%--</section><!--/#contact-page-->--%>

<section id="bottom">
    <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>Company</h3>
                    <ul>
                        <li><a href="#">About us</a></li>
                        <li><a href="#">We are hiring</a></li>
                        <li><a href="#">Meet the team</a></li>
                        <li><a href="#">Copyright</a></li>
                        <li><a href="#">Terms of use</a></li>
                        <li><a href="#">Privacy policy</a></li>
                        <li><a href="#">Contact us</a></li>
                    </ul>
                </div>
            </div>
            <!--/.col-md-3-->

            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Forum</a></li>
                        <li><a href="#">Documentation</a></li>
                        <li><a href="#">Refund policy</a></li>
                        <li><a href="#">Ticket system</a></li>
                        <li><a href="#">Billing system</a></li>
                    </ul>
                </div>
            </div>
            <!--/.col-md-3-->

            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>Developers</h3>
                    <ul>
                        <li><a href="#">Web Development</a></li>
                        <li><a href="#">SEO Marketing</a></li>
                        <li><a href="#">Theme</a></li>
                        <li><a href="#">Development</a></li>
                        <li><a href="#">Email Marketing</a></li>
                        <li><a href="#">Plugin Development</a></li>
                        <li><a href="#">Article Writing</a></li>
                    </ul>
                </div>
            </div>
            <!--/.col-md-3-->

            <div class="col-md-3 col-sm-6">
                <div class="widget">
                    <h3>Our Partners</h3>
                    <ul>
                        <li><a href="#">Adipisicing Elit</a></li>
                        <li><a href="#">Eiusmod</a></li>
                        <li><a href="#">Tempor</a></li>
                        <li><a href="#">Veniam</a></li>
                        <li><a href="#">Exercitation</a></li>
                        <li><a href="#">Ullamco</a></li>
                        <li><a href="#">Laboris</a></li>
                    </ul>
                </div>
            </div>
            <!--/.col-md-3-->
        </div>
    </div>
</section>
<!--/#bottom-->

<footer id="footer" class="midnight-blue">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                Copyright &copy; 2015.Company name All rights reserved.
            </div>
            <div class="col-sm-6">
                <ul class="pull-right">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Faq</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<!--/#footer-->
<script>
    var basePath = window.basePath = window.webRoot = "${basePath}";
    window.serverName = '<%=request.getContextPath()%>';
    window.webRoot = window.rootPath = '<%=request.getContextPath()%>';
</script>
<script src="${basePath}aitouwang/js/jquery1.10.2.min.js"></script>
<script src="${basePath}aitouwang/js/bootstrap.min.js"></script>
<script src="${basePath}aitouwang/js/jquery.prettyPhoto.js"></script>
<script src="${basePath}aitouwang/js/jquery.isotope.min.js"></script>
<script src="${basePath}aitouwang/js/main.js"></script>
<script src="${basePath}aitouwang/js/wow.min.js"></script>
<script src="${basePath}aitouwang/js/myAccount.js"></script>
</body>
</html>