<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/10/31
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../commons/header.jsp" %>
</head>
<body>
<%@ include file="../commons/head.jsp" %>
<div class="d-flex align-items-stretch">
    <!-- Sidebar Navigation-->
    <nav id="sidebar">
        <%@ include file="../commons/user.jsp" %>
        <!-- Sidebar Header-->
        <ul class="list-unstyled">
            <li><a href="#HomeDropdown" aria-expanded="true" data-toggle="collapse"><i
                    class="icon-home"></i>系统管理</a>
                <ul id="HomeDropdown" class="collapse list-unstyled show">
                    <li><a href="${pageContext.request.contextPath}/dep/page">部门管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/permission/page">权限管理</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/role/page">角色管理</a></li>
                </ul>
            </li>
            <li><a href="#userDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-grid"></i>用户管理</a>
                <ul id="userDropdown" class="collapse list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/employee/page">员工管理</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <!-- Page Header-->
        <div class="page-header no-margin-bottom">
            <div class="container-fluid">
                <h2 class="h5 no-margin-bottom">角色管理</h2>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user/home">Home</a></li>
                    <li class="breadcrumb-item active">角色管理</li>
                </ul>
            </div>
            <section class="no-padding-top">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <div class="title"><strong>Role Table</strong></div>
                            <form class="form-inline" id="searchForm"
                                  action="${pageContext.request.contextPath}/role/page" method="post">
                                <input type="hidden" id="currentPage" name="currentPage" value="1">
                            </form>
                            <a href="${pageContext.request.contextPath}/role/edit" class="btn btn-warning">添加</a>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>角色名</th>
                                        <th>角色编号</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="data" items="${page.list}" varStatus="vs">
                                        <tr>
                                            <th scope="row">${vs.count}</th>
                                            <td>${data.name}</td>
                                            <td>${data.sn}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/role/edit?id=${data.id}"
                                                   class="btn btn-success">编辑</a>
                                                <a href="${pageContext.request.contextPath}/role/delete?id=${data.id}"
                                                   class="btn btn-danger btn-xs">
                                                    <span class="icon-close"></span> 删除
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <%@ include file="../commons/page.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
<%@ include file="../commons/footer.jsp" %>
</html>
