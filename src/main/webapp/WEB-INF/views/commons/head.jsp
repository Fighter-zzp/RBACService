<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/10/31
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <div class="navbar-header">
                <!-- Navbar Header--><a href="index.html" class="navbar-brand">
                <div class="brand-text brand-big visible text-uppercase"><strong
                        class="text-primary">RBAC</strong><strong>后台</strong></div>
                <div class="brand-text brand-sm"><strong class="text-primary">RB</strong><strong>AC</strong></div>
            </a>
                <!-- Sidebar Toggle Btn-->
                <button class="sidebar-toggle"><i class="fa fa-long-arrow-left"></i></button>
            </div>
            <div class="list-inline-item "><a href="${pageContext.request.contextPath}/user/home" class="nav-link"> <span
                    class="text-primary"><i class="icon-home"></i></span></a>
            </div>
            <!-- Log out               -->
            <div class="list-inline-item logout"><a id="logout" href="${pageContext.request.contextPath}/user/loginOut" class="nav-link"> <span
                    class="d-none d-sm-inline">Logout </span><i class="icon-logout"></i></a>
            </div>
        </div>
    </nav>
</header>
