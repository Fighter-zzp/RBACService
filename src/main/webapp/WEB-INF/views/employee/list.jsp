<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/10/31
  Time: 22:17
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
            <li><a href="#HomeDropdown" aria-expanded="false" data-toggle="collapse"><i
                    class="icon-home"></i>系统管理</a>
                <ul id="HomeDropdown" class="collapse list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/dep/page">部门管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/permission/page">权限管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/role/page">角色管理</a></li>
                </ul>
            </li>
            <li><a href="#userDropdown" aria-expanded="true" data-toggle="collapse"> <i class="icon-grid"></i>用户管理</a>
                <ul id="userDropdown" class="collapse list-unstyled show">
                    <li class="active"><a href="${pageContext.request.contextPath}/employee/page">员工管理</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <!-- Page Header-->
        <div class="page-header no-margin-bottom">
            <div class="container-fluid">
                <h2 class="h5 no-margin-bottom">员工管理</h2>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user/home">Home</a></li>
                    <li class="breadcrumb-item active">员工管理</li>
                </ul>
            </div>
            <section class="no-padding-top">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <%--查询+分页--%>
                            <form class="form-inline" id="searchForm"
                                  action="${pageContext.request.contextPath}/employee/page" method="get">
                                <input type="hidden" id="currentPage" name="currentPage" value="1">
                                <div class="form-group">
                                    <%--                                    查询--%>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <%--                                            <button data-toggle="dropdown" type="button" class="btn btn-outline-secondary dropdown-toggle">部门 <span class="caret"></span></button>--%>
                                            <select class="form-control" name="deptId">
                                                <option value="-1">全部</option>
                                                <c:forEach var="dept" items="${depts}">
                                                    <option value="${dept.id}">${dept.name}</option>
                                                </c:forEach>
                                            </select>
                                                <script>
                                                    //回显查询的部门:设置部门ID是 qo.deptId 为选中状态
                                                    $('#searchForm select[name="deptId"]').val(${qo.deptId});
                                                </script>
                                        </div>
                                        <input type="text" name="keyword" value="${qo.keyword}" class="form-control" placeholder="输入姓名或者邮箱">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary"><i
                                                    class="icon-magnifying-glass-browser"></i></button>
                                        </div>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/employee/edit" class="btn btn-success">添加</a>
                                </div>
                            </form>
                            <div class="title"><strong>员工 Table</strong></div>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>姓名</th>
                                        <th>邮箱</th>
                                        <th>年龄</th>
                                        <th>部门</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="data" items="${page.list}" varStatus="vs">
                                        <tr>
                                            <th scope="row">${vs.count}</th>
                                            <td>${data.name}</td>
                                            <td>${data.email}</td>
                                            <td>${data.age}</td>
                                            <td>${data.dept.name}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/employee/edit?id=${data.id}"
                                                   class="btn btn-outline-info btn-xs">
                                                    <i class="icon-paper-and-pencil"></i>编辑</a>
                                                <a href="${pageContext.request.contextPath}/employee/delete?id=${data.id}"
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