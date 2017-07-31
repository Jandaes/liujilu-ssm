<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Freemarker Index</title>
</head>
<body>
<p>
<h1>这里是Freemark 页面</h1>
</p>
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
    <#list userList as user>
    <tr>
        <td>${user_index + 1}</td>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.nickname}</td>
        <td>${user.email}</td>
        <td>${user.password}</td>
        <td>${user.number}</td>
        <td>
            ${user.createTime?string("yyyy-MM-dd HH:mm:ss zzzz")}
        </td>
        <td>
            ${user.lastLoginTime?string("yyyy-MM-dd HH:mm:ss zzzz")}
        </td>
        <td>
            <#if user.status == 1>
                正常
            <#elseif user.status = 0>
                锁定
            </#if>
        </td>
    </tr>
    </#list>
</table>
</body>
</html>