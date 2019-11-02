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
                    <li class="breadcrumb-item "><a href="${pageContext.request.contextPath}/employee/page">员工管理</a></li>
                    <li class="breadcrumb-item active">编辑</li>
                </ul>
            </div>
            <section class="no-padding-top">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <div class="title"><strong>编辑</strong></div>
                            <div class="block-body">
                                <form class="form-validate mb-4" method="get" action="${pageContext.request.contextPath}/employee/saveOrUpdate">
                                    <input type="hidden" value="${emp.id}" name="id">
                                    <div class="form-group">
                                        <label class="form-control-label">员工名</label>
                                        <input type="text" name="name" value="${emp.name}" required data-msg="请输入员工名"
                                               placeholder="Employee Name"
                                               class="form-control col-md-7">
                                    </div>
                                    <%--新增时才显示密码框--%>
                                    <c:if test="${empty emp}">
                                        <div class="form-group">
                                            <label class="form-control-label">密码</label>
                                            <input type="password" name="password" required data-msg="请输入密码"
                                                   placeholder="Password" class="form-control col-md-7">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">再次输入密码</label>
                                            <input type="password" name="repwd" required data-msg="请输入密码"
                                                   placeholder="Password again" class="form-control col-md-7">
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label class="form-control-label">邮件</label>
                                        <input type="email" name="email" value="${emp.email}" required
                                               data-msg="请输入Email"
                                               placeholder="Email" class="form-control col-md-7">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">年龄</label>
                                        <input type="number" placeholder="age" name="age" value="${emp.age}"
                                               required data-msg="请输入年龄" class="form-control col-md-7">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">部门</label>
                                        <select class="form-control col-md-7" name="dept.id">
                                            <c:forEach var="dept" items="${depts}">
                                                <option value="${dept.id}">${dept.name}</option>
                                            </c:forEach>
                                        </select>
                                        <script>
                                            //部门回显:设置当前编辑的员工id为选中状态
                                            $('.form-group select[name="dept.id"]').val(${emp.dept.id});
                                        </script>
                                    </div>
                                    <div class="form-group">
                                        <div class="i-checks">
                                            <label for="superAdmin">超级管理员</label>
                                            <input id="superAdmin" type="checkbox" name="admin" value="${emp.admin}"
                                                   class="checkbox-template">
                                        </div>
                                        <script>
                                            var admin = $('.form-group #superAdmin');
                                           if(admin!=null&&admin!==""){
                                               admin.prop("checked","checked")
                                           }
                                        </script>
                                    </div>
                                    <div class="form-group">
                                        <div class="title"><strong>角色</strong></div>
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <tbody>
                                                <tr id="role">
                                                    <c:forEach var="role" varStatus="vs" items="${roles}">
                                                        <td class="i-checks">
                                                            <input id="checkbox${role.id}" name="ids" type="checkbox" value="${role.id}"
                                                                   class="checkbox-template">
                                                            <label for="checkbox${role.id}">${role.name}</label>
                                                        </td>
                                                    </c:forEach>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Save" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<%--显示当前用户拥有的角色--%>
<c:forEach var="role" items="${emp.roles}">
    <input type="hidden" class="ins" value="${role.id}">
</c:forEach>

</body>
<%@ include file="../commons/footer.jsp" %>
<script>
    //设置所有角色状态
    $(function () {
        var role = $("input[name$='ids']");
        var userRole = $(".ins");
        role.each(function (i,item) {
            userRole.each(function () {
                if ($(this).val()===$(item).val()){
                    $(item).prop('checked', "checked");
                }
            });
        });
    })
</script>
</html>