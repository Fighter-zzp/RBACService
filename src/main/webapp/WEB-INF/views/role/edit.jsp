<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/11/2
  Time: 17:28
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
                    <li class="breadcrumb-item "><a href="${pageContext.request.contextPath}/role/page">角色管理</a></li>
                    <li class="breadcrumb-item active">编辑</li>
                </ul>
            </div>
            <section class="no-padding-top">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <div class="title"><strong>编辑</strong></div>
                            <div class="block-body">
                                <form class="form-validate mb-4" method="get"
                                      action="${pageContext.request.contextPath}/role/save">
                                    <input type="hidden" value="${role.id}" name="id">
                                    <div class="form-group">
                                        <label class="form-control-label">角色名</label>
                                        <input type="text" name="name" required data-msg="请输入角色名称"
                                               value="${role.name}" placeholder="Role Name"
                                               class="form-control col-md-7">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">角色编码</label>
                                        <input type="text" name="sn" value="${role.sn}" required
                                               data-msg="请输入角色编码"
                                               placeholder="Role Num" class="form-control col-md-7">
                                    </div>
                                    <div class="form-group" id="role">
                                        <div>
                                            <label class="form-control-label">权限</label>
                                        </div>
                                        <div class="row" style="margin-top: 10px">
                                            <div class="col-sm-4 col-sm-offset-1">
                                                <select multiple class="form-control allPermissions" size="15">
                                                    <%--系统中拥有的所有权限--%>
                                                    <c:forEach var="perm" items="${permissions}">
                                                        <option value="${perm.id}">${perm.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-sm-2" style="margin-top: 60px;" align="center">
                                                <div>
                                                    <input type="button" class="btn btn-primary" style="margin-top: 15px"
                                                           onclick="moveSelected('allPermissions', 'selfPermissions')" value="→">
                                                    <br>
                                                    <input type="button" class="btn btn-primary" style="margin-top: 15px"
                                                           onclick="moveSelected('selfPermissions', 'allPermissions')" value="←">
                                                    <br>
                                                    <input type="button" class="btn btn-primary" style="margin-top: 15px"
                                                           onclick="moveSelected('allPermissions', 'selfPermissions')" value="all→">
                                                    <br>
                                                    <input type="button" class="btn btn-primary " style="margin-top: 15px"
                                                       onclick="moveAll('selfPermissions', 'allPermissions')" value="all←">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <select multiple class="form-control selfPermissions" size="15"
                                                        name="ids">
                                                    <%--回显当前角色拥有的权限--%>
                                                    <c:forEach var="permission" items="${role.pers}">
                                                        <option value="${permission.id}">${permission.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
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

</body>
<%@ include file="../commons/footer.jsp" %>
<script>
    /**
     * 权限赋值操作
     */
    $(function () {
        $('#btn_submit').click(function () {
            //1:先选中右边select的所有选项
            $('.selfPermissions option').prop('selected', true);
            //2:提交表单
            $('#editForm').submit();
        });

        //将右边已存在的权限,从左边select中移除
        $.each($('.selfPermissions option'), function (index, ele) {
            $('.allPermissions option[value="' + ele.value + '"]').remove();
        });

    });

    //移动全部选项
    function moveAll(rolesClass1, rolesClass2) {
        $('.' + rolesClass1 + ' option').appendTo($('.' + rolesClass2));
    }

    //移动选中的选项
    function moveSelected(rolesClass1, rolesClass2) {
        $('.' + rolesClass1 + ' option:selected').appendTo($('.' + rolesClass2));
    }
</script>
</html>
