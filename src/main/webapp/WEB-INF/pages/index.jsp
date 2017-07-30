<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
    <h1>进来了的页面</h1><br/>
    <table style="border: 1px solid lavender;width: 100%;text-align: center;">
        <thead>
            <tr>
                <th>序号</th>
                <th>编号</th>
                <th>姓名</th>
                <th>昵称</th>
                <th>邮箱</th>
                <th>密码</th>
                <th>Q号码</th>
                <th>创建时间</th>
                <th>登录登录时间</th>
                <th>状态</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.nickname}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                    <td>${user.number}</td>
                    <td><fmt:formatDate value="${user.createTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
                    <td><fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy/MM/dd  HH:mm:ss" /></td>
                    <td>${user.status == 1 ? "正常" :"锁定"}</td>
                </tr>
            </c:forEach>
    </table>
</body>
</html>
