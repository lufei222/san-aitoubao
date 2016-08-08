<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%
        String path = request.getContextPath();// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
        String basePath = request.getScheme()+"://"+request.getServerName() +":"+request.getServerPort()+path+"/";
        pageContext.setAttribute("basePath",basePath);// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>項目詳情</title>

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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${basePath}aitouwang/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${basePath}aitouwang/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${basePath}aitouwang/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${basePath}aitouwang/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
<input type="hidden" id="projectId" value="${projectId}">
<input type="hidden" id="basePath" value="${basePath}">
<header id="header">
    <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-4">
                    <div class="top-number"><p>你好！<i class="fa" id="customerId">${seesion_member}</i>&nbsp<i class="fa" id="loginOut">退出</i></p></div>
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
        </div><!--/.container-->
    </div><!--/.top-bar-->

    <nav class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="${basePath}aitouwang/images/logo.png" alt="logo"></a>
            </div>

            <div class="collapse navbar-collapse navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="${basePath}aitouwang/index.html">主页</a></li>
                    <li><a href="${basePath}aitouwang/about-us.html">关于我们</a></li>
                    <li><a href="${basePath}aitouwang/project.html">项目</a></li>
                    <li><a href="${basePath}aitouwang/portfolio.html">实时交易</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <i class="fa fa-angle-down"></i></a>
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
        </div><!--/.container-->
    </nav><!--/nav-->

</header><!--/header-->
<section id="portfolio">
    <div class="container">
        <div class="center">
            <div id="projectInfo">
                      </div>
            <div class="invest">
            <span>投资金额：</span><input type="number" name="invest_money" id="invest_money" value="${invest_money}"/>
            </div>
            <div class="invest">
                <span>支付密码：</span><input type="password" name="pay_password" id="pay_password" value="${pay_password}"/>
            </div>
            <div class="invest">
              <span id="err_invest_money" class="errTip"></span>
            </div>
            <div class="invest">
              <span id="err_pay_password"class="errTip"></span>
            </div>
            <div class="invest">
            <strong><a class="invest_green margin20"  id="invest">投资</a></strong>
            </div>
        </div>

        <ul class="portfolio-filter text-center">
            <li><a class="btn btn-default active" href="#" data-filter="*">All Works</a></li>
            <li><a class="btn btn-default" href="#" data-filter=".bootstrap">Creative</a></li>
            <li><a class="btn btn-default" href="#" data-filter=".html">Photography</a></li>
            <li><a class="btn btn-default" href="#" data-filter=".wordpress">Web Development</a></li>
        </ul><!--/#portfolio-filter-->

        <div class="row">
            <div class="portfolio-items">
                <div class="portfolio-item apps col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item1.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item1.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item joomla bootstrap col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item2.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item2.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item bootstrap wordpress col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item3.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item3.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item joomla wordpress apps col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item4.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item4.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item joomla html bootstrap col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item5.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item5.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item wordpress html apps col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item6.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item6.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item wordpress html col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item7.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item7.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->

                <div class="portfolio-item wordpress html bootstrap col-xs-12 col-sm-4 col-md-3">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${basePath}aitouwang/images/portfolio/recent/item8.png" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="#">Business theme</a></h3>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority</p>
                                <a class="preview" href="${basePath}aitouwang/images/portfolio/full/item8.png" rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
                            </div>
                        </div>
                    </div>
                </div><!--/.portfolio-item-->
            </div>
        </div>
    </div>
</section><!--/#portfolio-item-->

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
            </div><!--/.col-md-3-->

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
            </div><!--/.col-md-3-->

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
            </div><!--/.col-md-3-->

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
            </div><!--/.col-md-3-->
        </div>
    </div>
</section><!--/#bottom-->

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
</footer><!--/#footer-->

<%--<script src="${basePath}aitouwang/js/jquery1.10.2.min.js"></script>--%>
<script type="text/javascript" src="/platform/jquery/jquery-1.8.1.js"></script>

<script src="${basePath}aitouwang/js/bootstrap.min.js"></script>
<script src="${basePath}aitouwang/js/jquery.prettyPhoto.js"></script>
<script src="${basePath}aitouwang/js/jquery.isotope.min.js"></script>
<script src="${basePath}aitouwang/js/main.js"></script>
<script src="${basePath}aitouwang/js/layer.js"></script>
<script src="${basePath}aitouwang/js/wow.min.js"></script>
<script src="${basePath}aitouwang/js/projectDetail.js"></script>
</body>
</html>
