<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/10/31
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <title></title>
</head>
<body>

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
                        <%--调节style="width: 50%"可改变进度条--%>
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
</html>
