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
    <%@ include file="commons/header.jsp"%>
</head>
<body>
<c:if test="${employee==null }">
    <c:redirect url="${pageContext.request.contextPath}/login.jsp"></c:redirect>
</c:if>
<%@ include file="commons/head.jsp"%>
<div class="d-flex align-items-stretch">
    <!-- Sidebar Navigation-->
    <nav id="sidebar">
        <%@ include file="commons/user.jsp"%>
        <!-- Sidebar Header-->

        <ul class="list-unstyled">
            <li class="active"><a href="#HomeDropdown" aria-expanded="false" data-toggle="collapse"><i
                    class="icon-home"></i>系统管理</a>
                <ul id="HomeDropdown" class="collapse list-unstyled ">
                    <li><a href="${pageContext.request.contextPath}/dep/page">部门管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/permission/page">权限管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/role/page">角色管理</a></li>
                </ul>
            </li>
            <li><a href="#userDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-grid"></i>用户管理</a>
                <ul id="userDropdown" class="collapse list-unstyled ">
                    <li><a href="${pageContext.request.contextPath}/employee/page">员工管理</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- Sidebar Navigation end-->
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
                        <img src="${pageContext.request.contextPath}/assert/img/logo.png" style="width: 100%" alt="无图" class="img-rounded">
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
<%@ include file="commons/footer.jsp"%>
</html>
