<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Freemarker Index</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-12">
                <h1>这里是Freemark 页面</h1>
            </div>
            <div class="col-md-4">
                <form action="#" class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" value="${name!}" name="name" class="form-control" placeholder="请输入姓名查询">
                    </div>
                    <button type="submit" class="btn btn-default">查询</button>
                    <button type="button" class="btn btn-success" onclick="add();">添加</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>序号</th><th>编号</th><th>姓名</th><th>昵称</th><th>邮箱</th><th>密码</th><th>Q号码</th><th>创建时间</th><th>登录时间</th><th>状态</th><th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#if (userList?size>0) >
                        <#list userList as user>
                        <tr>
                            <td>${user_index + 1}</td>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.nickname}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>
                            <td>${user.number}</td>
                            <td>${(user.createTime?string("yyyy-MM-dd HH:mm:ss"))!"无数据"}</td>
                            <td>${(user.lastLoginTime?string("yyyy-MM-dd HH:mm:ss"))!"无数据"}</td>
                            <td><#if user.status == 1>正常<#elseif user.status = 0>锁定</#if></td>
                            <td>
                                <button class="btn btn-info btn-small" onclick="update(this)"><i class="glyphicon glyphicon-edit" ></i> 修改</button>
                                <button class="btn btn-danger btn-small" onclick="remove('${user.id}')"><i class="glyphicon glyphicon-trash"></i> 删除</button>
                            </td>
                        </tr>
                        </#list>
                    <#else>
                        <tr><td colspan="11" style="text-align: center;">暂无数据</td></tr>
                    </#if>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <#if message??>
                    <div class="alert alert-danger" role="alert">
                        ${message!}
                    </div>
                </#if>
                <form class="form-horizontal" action="save" method="post">
                    <input type="hidden" id="id" name="id"/>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name" id="name" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nickname" id="nickname" placeholder="昵称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="password" id="password" placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Q号</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="number" id="number" placeholder="Q号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="status" id="status">
                                <option value="1">正常</option>
                                <option value="0">锁定</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script>
    //添加
    function add() {
        $("form")[1].reset();
        //设置
        $("form").eq(1).attr("action","save");
    }
    //删除用户
    function remove(id) {
        if(confirm("是否确定删除？")){
            window.location.href = "delete?id="+id;
        }
    }
    /**
     * 修改获取DOM表格数据显示在表单中
     */
    function update(obj) {
        $("form").eq(1).attr("action","update");
        //获取表格中数据
        var tr = $(obj).parent().parent().find("td");
        //隐藏域编号
        $("#id").val($(tr).eq(1).text());
        //填充表单数据
        $("#name").val($(tr).eq(2).text());
        $("#nickname").val($(tr).eq(3).text());
        $("#email").val($(tr).eq(4).text());
        $("#password").val($(tr).eq(5).text());
        $("#number").val($(tr).eq(6).text());

        //状态
        var status = $(tr).eq(9).text();
        //先移除之前的选择、不然会多个selected、不会生效
        $("#status").find("option").removeAttr("selected");
        if(status=="正常"){
            $("#status").find("option[value=1]").attr("selected","selected");
        }else if(status=="锁定"){
            $("#status").find("option[value=0]").attr("selected","selected");
        }
    }

</script>
</body>
</html>