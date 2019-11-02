<%--
  Created by IntelliJ IDEA.
  User: 佐斯特勒
  Date: 2019/10/31
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar-header d-flex align-items-center">
    <div class="avatar"><img src="${pageContext.request.contextPath}/assert/img/touxiang.jpg" alt="..."
                             class="img-fluid rounded-circle"></div>
    <div class="title">
        <h1 class="h5">${employee.name}</h1><!--需要改成名字-->
        <c:choose>
            <c:when test="${employee.admin}">
                <p>超级管理员</p>
            </c:when>
            <c:otherwise>
                <p>后台用户</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<span class="heading">Main</span>