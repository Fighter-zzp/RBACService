<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/11/2
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="page-content">
        <section class="no-padding-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-12  text-center">
                        <div style="margin-top: 5%" class="title"><h1><strong>权限不够</strong></h1></div>
                        <img src="${pageContext.request.contextPath}/assert/img/quanxian.jpg" alt="无图"
                             style="width: 30%" class="img-rounded">
                        <p style="margin-top: 5%;font-size: 18px">不好意思，因为您的权限不够，所以无法使用此功能，如果有疑问可以联系 <strong>管理员</strong> </p>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
<%@ include file="../commons/footer.jsp" %>
</html>

