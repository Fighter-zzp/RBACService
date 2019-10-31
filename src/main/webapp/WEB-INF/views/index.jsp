<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/10/30
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assert/plugins/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/font.css">
    <!-- Google fonts - Muli-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assert/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

</head>
<body>
<c:if test="${employee==null }">
    <c:redirect url="${pageContext.request.contextPath}/login.jsp"></c:redirect>
</c:if>
<%@ include file="head.jsp"%>
<div class="d-flex align-items-stretch">
    <!-- Sidebar Navigation-->
    <nav id="sidebar">
        <!-- Sidebar Header-->
        <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><img src="${pageContext.request.contextPath}/assert/img/touxiang.jpg" alt="..."
                                     class="img-fluid rounded-circle"></div>
            <div class="title">
                <h1 class="h5">${employee.name}</h1><!--需要改成名字-->
                <c:choose>
                    <c:when test="${employee.admin}">
                        <p>后台管理员</p>
                    </c:when>
                    <c:otherwise>
                        <p>普通用户</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <span class="heading">Main</span>
        <ul class="list-unstyled">
            <li class="active"><a href="#HomeDropdown" aria-expanded="false" data-toggle="collapse"><i
                    class="icon-home"></i>系统管理</a>
                <ul id="HomeDropdown" class="collapse list-unstyled ">
                    <li><a href="#">权限管理</a></li>
                    <li><a href="#">角色管理</a></li>
                    <li><a href="#">菜单管理</a></li>
                </ul>
            </li>
            <li><a href="#userDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-grid"></i>用户管理</a>
                <ul id="userDropdown" class="collapse list-unstyled ">
                    <li><a href="#">管理员管理</a></li>
                    <li><a href="#">用户管理</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <script type="text/javascript">
         $(function () {
             $(".dv_content").attr("src","${pageContext.request.contextPath}/employee/main.jsp");
         })
        </script>
    </div>
    <iframe class="dv_content" frameborder="0" scrolling="no"></iframe>
    <%--<!-- Sidebar Navigation end-->
    <div class="page-content">
        <div class="page-header">
            <div class="container-fluid">
                <h2 class="h5 no-margin-bottom">RBAC管理</h2>
            </div>
        </div>
        <section class="no-padding-top no-padding-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-contract"></i></div>
                                    <strong>总人数</strong>
                                </div>
                                <div class="number dashtext-1">${count.allCount}</div>
                            </div>
                            &lt;%&ndash;调节style="width: 50%"可改变进度条&ndash;%&gt;
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: ${count.allCount}%" aria-valuenow="30" aria-valuemin="0"
                                     aria-valuemax="100" class="progress-bar progress-bar-template dashbg-1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-user-1"></i></div>
                                    <strong>管理员</strong>
                                </div>
                                <div class="number dashtext-2">${count.adminCount}</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: ${count.adminCount*10}%" aria-valuenow="70" aria-valuemin="0"
                                     aria-valuemax="100" class="progress-bar progress-bar-template dashbg-2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-user"></i></div>
                                    <strong>普通用户</strong>
                                </div>
                                <div class="number dashtext-3">${count.userCount}</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: ${count.userCount*4}%" aria-valuenow="55" aria-valuemin="0"
                                     aria-valuemax="100" class="progress-bar progress-bar-template dashbg-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="statistic-block block">
                            <div class="progress-details d-flex align-items-end justify-content-between">
                                <div class="title">
                                    <div class="icon"><i class="icon-user-outline"></i></div>
                                    <strong>角色分类</strong>
                                </div>
                                <div class="number dashtext-4">${count.roleCount}</div>
                            </div>
                            <div class="progress progress-template">
                                <div role="progressbar" style="width: ${count.roleCount*5}%" aria-valuenow="35" aria-valuemin="0"
                                     aria-valuemax="100" class="progress-bar progress-bar-template dashbg-4"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-sm-6">
                        <img src="${pageContext.request.contextPath}/assert/img/index.jpg" style="width: 100%" alt="无图" class="img-rounded">
                    </div>
                </div>
            </div>
        </section>
    </div>--%>
</div>
</body>

<!-- JavaScript files-->
<script src="${pageContext.request.contextPath}/assert/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/plugins/popper.js/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/plugins/jquery.cookie/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/assert/plugins/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/charts-home.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/front.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/jquery-3.4.1.min.js"></script>
</html>
