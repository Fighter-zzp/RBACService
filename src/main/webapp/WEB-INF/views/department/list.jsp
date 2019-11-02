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
                    <li class="active"><a href="${pageContext.request.contextPath}/dep/page">部门管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/permission/page">权限管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/role/page">角色管理</a></li>
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
                <h2 class="h5 no-margin-bottom">部门管理</h2>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user/home">Home</a></li>
                    <li class="breadcrumb-item active">部门管理</li>
                </ul>
            </div>
            <section class="no-padding-top">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <div class="title"><strong>部门 Table</strong></div>
                            <form class="form-inline" id="searchForm"
                                  action="${pageContext.request.contextPath}/dep/page" method="post">
                                <input type="hidden" id="currentPage" name="page" value="1">
                            </form>
                            <ul class="list-unstyled">
                                <li><a href="#add" aria-expanded="false" data-toggle="collapse"> <i
                                        class="icon-pencil-case"></i>添加</a>

                                    <ul id="add" class="collapse list-unstyled ">
                                        <li>
                                            <form class="form-inline"
                                                  action="${pageContext.request.contextPath}/dep/save" method="get">
                                                <div class="form-group">
                                                    <label for="deptName" class="sr-only">Dept Name</label>
                                                    <input id="deptName" type="text" name="name" placeholder="部门名"
                                                           class="mr-sm-3 form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label for="sn" class="sr-only">Dept Num</label>
                                                    <input id="sn" type="text" name="sn" placeholder="部门编码"
                                                           class="mr-sm-3 form-control form-control">
                                                </div>
                                                <button class="btn btn-primary" type="submit">save</button>
                                            </form>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>部门</th>
                                        <th>部门编号</th>
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
                                                <a href="#add${data.id}" aria-expanded="false" data-toggle="collapse">
                                                    <i
                                                            class="icon-pencil-case"></i>编辑</a>

                                                <ul id="add${data.id}" class="collapse list-unstyled ">
                                                    <li>
                                                        <form class="form-inline"
                                                              action="${pageContext.request.contextPath}/dep/save"
                                                              method="get">
                                                            <input type="hidden" name="id" value="${data.id}"/>
                                                            <div class="form-group">
                                                                <label for="deptName${data.id}" class="sr-only">Dept
                                                                    Name</label>
                                                                <input id="deptName${data.id}" name="name" type="text"
                                                                       placeholder="部门名"
                                                                       value="${data.name}"
                                                                       class="mr-sm-3 form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="sn${data.id}" class="sr-only">Dept
                                                                    Num</label>
                                                                <input id="sn${data.id}" name="sn" type="text"
                                                                       placeholder="部门编码"
                                                                       value="${data.sn}"
                                                                       class="mr-sm-3 form-control form-control">
                                                            </div>
                                                            <button class="btn btn-primary" type="submit">save</button>
                                                        </form>
                                                    </li>
                                                </ul>
                                                <a href="${pageContext.request.contextPath}/dep/delete?id=${data.id}"
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
