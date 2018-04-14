<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'cmfz_listen.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/icon.css">
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>


</head>
<body>
<form id="importUserForm" method="post" enctype="multipart/form-data" action="importUser.do">
    <input id="fileName" name="fileName" type="file"/>
    <a href="javascript:void(0)" onclick="importUser()" class="easyui-linkbutton">开始导入</a>
</form>
<!-- form表单不能放置，table内部，会导致表单无效 -->
<form id="queryUserForm" method="post" enctype="multipart/form-data" action="exportMessage.do">
    <input id="select" name="ids" type="hidden">

    <table id="showAllcmfz_user">
        <div id="lele">
            <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-print'"
               onClick="exportUser();">导出</a>


        </div>
    </table>
</form>

<div id="addUser" style="display:none">
    <form id="addUserInformation" method="post" style="margin-left: 50px">
        <br>
        用户电话：&nbsp;<input name="username"><br>
        用户密码：&nbsp;<input name="password"><br>
        角色分配：&nbsp;<input name="password"><br>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="easyui-linkbutton" data-options="plain:true,width:60,iconCls:'icon-add'">确定</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="easyui-linkbutton" data-options="plain:true,width:60,iconCls:'icon-remove'">取消</a>
    </form>
</div>
<div id="updateUser" style="display: none">
    <form id="updateUserInformation" enctype="multipart/form-data" method="post">
        <br>
        用户电话：&nbsp;<input name="username"><br>
        用户密码：&nbsp;<input name="password"><br>
        角色分配：&nbsp;<input name="password"><br>
    </form>
</div>
<div>

</div>
<script type="text/javascript">
    function importUser() {
        var f=$("#fileName").val();
        if (f==null||f==''){
            $.messager.alert("消息", "请选择文件", 'warning');
        }
        else{
            var formData = new FormData($("#importUserForm")[0]);
            $.ajax({
                type: 'post',
                data: formData,
                contentType: false,
                processData: false,
                url: '${pageContext.request.contextPath}/importUser.do',
                success: function (dada) {
                        $.messager.alert("消息", "导入成功", 'warning');
                        $("#showAllcmfz_user").datagrid('reload');

                }
            })
        }

    }
    function exportUser() {
        var cates = $("#showAllcmfz_user").datagrid('getChecked');
        if (cates.length < 1) {
            $.messager.alert("消息", "请选择一条导出", 'warning');
        } else {
            $.messager.confirm("消息", "您确定要导出吗？", function (x) {
                if (x) {
                    var ids = [];
                    var cateIds = $("#showAllcmfz_user").datagrid('getChecked');
                    $.each(cateIds, function (index, ii) {
                        ids.push(ii.userId);
                    })
                    $("#select").val(ids);
                    $("#queryUserForm").submit()

                }
            })

        }

    }

    $("#showAllcmfz_user")
        .datagrid(
            {
                url: '${pageContext.request.contextPath}/getAllUsers.do',

                columns: [[{
                    /*  field: '',*/
                    checkbox: true
                }, {
                    "field": 'userId',
                    "title": 'ID',
                    "width": 200,
                    "align": 'center',

                }, {
                    field: 'telphone',
                    align: 'center',
                    title: '手机',
                    width: 200,
                }, {
                    "field": 'password',
                    "title": '密码',
                    "width": 200,
                    "align": 'center'
                }, {
                    "field": 'userImage',
                    "title": '头像',
                    "width": 200,
                    "align": 'center'

                }, {
                    "field": 'nickname',
                    "title": '昵称',
                    "width": 200,
                    "align": 'center',
                }, {
                    "field": 'name',
                    "title": '名字',
                    "width": 200,
                    "align": 'center',
                }, {
                    "field": 'sex',
                    "title": '性别',
                    "width": 200,
                    "align": 'center',
                }, {
                    "field": 'autograph',
                    "title": '签名',
                    "width": 200,
                    "align": 'center',
                }, {
                    "field": 'userSheng',
                    "title": '省份',
                    "width": 200,
                    "align": 'center',
                }, {
                    "field": 'userShi',
                    "title": '地市',
                    "width": 200,
                    "align": 'center',
                }, {
                    "field": 'siId',
                    "title": '所属上师id',
                    "width": 200,
                    "align": 'center',
                }
                ]],
                striped: true,
                pagination: true,
                pageSize:10,
                toolbar: [
                    {
                        iconCls: 'icon-add',
                        handler: function () {
                            $("#addUser").dialog({
                                title: '添加管理员',
                                width: 400,
                                modal: true,
                                closed: false
                            })

                        }
                    },
                    '-',
                    {
                        iconCls: 'icon-edit',
                        handler: function () {
                            var cates = $("#showAllcmfz_user")
                                .datagrid('getChecked');
                            if (cates.length > 1
                                || cates.length < 1) {
                                $.messager.alert("消息",
                                    "请选择一条数据修改", 'warning');
                            } else {
                                $("#updateUser").dialog(
                                    {
                                        title: '修改用户',
                                        width: 400,
                                        modal: true,
                                        closed: false,

                                    })
                                var id;
                                var username;
                                var password;
                                var salt;
                                var user = $("#showAllcmfz_user").datagrid('getChecked');
                                $.each(user, function (index,
                                                       cate) {
                                    /*console.log(cate)*/


                                    id = cate.id;
                                    username = cate.username;
                                    password = cate.password;
                                    salt = cate.salt;

                                })

                                $("#upId")
                                    .val(id);
                                $("#upUserName")
                                    .val(username);
                                $("#upPasswordSalt")
                                    .val(salt);
                                $("#upPassWord")
                                    .val(password);
                            }
                        }
                    },
                    '-',
                    {
                        iconCls: 'icon-remove',
                        handler: function () {
                            var cates = $("#showAllcmfz_user").datagrid('getChecked');
                            if (cates.length < 1) {
                                $.messager.alert("消息", "请选择一条数据修改", 'warning');
                            } else {
                                $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                    if (x) {
                                        var ids = [];
                                        var cateIds = $("#showAllcmfz_user").datagrid('getChecked');
                                        $.each(cateIds, function (index, ii) {
                                            ids.push(ii.bannerId);
                                        })
                                        $.ajax({
                                            type: 'post',
                                            url: '${pageContext.request.contextPath}/deleteBanner.do',
                                            data: 'ids=' + ids,
                                            success: function (dada) {
                                                if (dada != 0) {
                                                    $.messager.alert("消息", "删除成功", 'info');
                                                    $("#showAllcmfz_user").datagrid('reload');
                                                } else {
                                                    $.messager.alert("消息", "删除失败", 'error');
                                                    $("#showAllcmfz_user").datagrid('reload');
                                                }
                                            }
                                        })
                                    } else {
                                        $("#showAllcmfz_user").datagrid('reload');
                                    }
                                })

                            }
                        }
                    }]

            })

    $("#addUserInformation").submit(function () {
        var formData = new FormData($("#addUserInformation")[0]);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/admin/addAdmin.do',
            data: formData,
            contentType: false,
            processData: false,
            success: function (dada) {
                if (dada == 1) {
                    $.messager.alert("消息", "添加成功", 'info');
                    $("#addUser").dialog('close');
                    $("#showAllcmfz_user").datagrid('reload');

                } else if (dada == 0) {
                    $.messager.alert("消息", "添加失败", 'error');
                    $("#addUser").dialog('close');
                    $("#showAllcmfz_user").datagrid('reload');

                }
            }
        })
        return false;
    })
    $("#updateUserInformation").submit(function () {
        var formData = new FormData($("#updateUserInformation")[0]);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/updateShiroRole.do',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (dada) {
                if (dada == 1) {
                    $.messager.alert("消息", "修改成功", 'info');
                    $("#updateUser").dialog('close');
                    $("#showAllcmfz_user").datagrid('reload');
                } else {
                    $.messager.alert("消息", "修改失败", 'error');
                    $("#updateUser").dialog('close');
                    $("#showAllcmfz_user").datagrid('reload');
                }
            }
        })
        return false;
    })
    function exit() {
        $("#updateUser").dialog('close');
        $("#showAllcmfz_user").datagrid('reload');
    }

    function pro2() {
        var ttt = $('#roleSelect').combotree('tree');	// 获取树对象
        var sss = ttt.tree('getChecked');	// 获取选择的节点
        var ids=[];
        console.log(sss+"--------------------------")
        $.each(sss, function (index, ii) {
            ids.push(ii.id);
        })

        $("#roleSelect").val(ids);

        $("#updateUserInformation").submit();
    }

    function pro1() {
        $("#addUserInformation").submit();
    }

</script>
</body>
</html>
