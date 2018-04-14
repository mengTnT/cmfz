<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

    <table id="showAllcmfz_role"></table>
    
    <div id="addRole" class="easyui-dialog" data-options="closed:true">
    	<form id="addRoleform" method="post">

    		角色名字：<input name="rolename" type="text" class="easyui-validatebox" data-options="required:true">
    		<br/>
    		<br/>
			选择资源：<input name="ids"  id="resourseSelect"/>
			<br/>
			<br/>
			<br/>
    		<div align="center">
    		<input onClick="insert()" class="easyui-linkbutton" value="确定" data-options="width:50"/>
    		<input class="easyui-linkbutton" onClick="addQuit();" value="取消" data-options="width:50"/>
    		</div>
    	</form>
    </div>
        <div id="updateRole" class="easyui-dialog" data-options="closed:true">
    	<form id="updateRoleform" method="post">
    		<ul id="t2" class="easyui-tree"></ul>
    		<input name="idss" id="idss" hidden="hidden">
    		<input name="oldrolename" id="oldRoleName" hidden="hidden"/>
    		角色名字：<input id="roleName" name="rolename" type="text" class="easyui-validatebox" data-options="required:true">
    		<div align="center">
    		<input onClick="pro2();" class="easyui-linkbutton" value="确定" data-options="width:50"/>
    		<input onClick="quitRole();" class="easyui-linkbutton" value="取消" data-options="width:50"/>
    		</div>
    	</form>
    </div>
	<script type="text/javascript">

            $('#resourseSelect').combotree({
                multiple:true,
                url: '${pageContext.request.contextPath}/selectAllResourse.do',
                required: true
            });
            // 加载修改  tree
            $("#t2").tree({
                url: "${pageContext.request.contextPath}/selectAllResourse.do",
                checkbox:true,
                loadFilter: function(data){
                    return data;
                }
            });

            $("#showAllcmfz_role")
                .datagrid(
                    {
                        url: '${pageContext.request.contextPath}/showRoleResourse.do',
                        fitColumns: true,
                        columns: [[{
                            /*  field: '',*/
                            checkbox: true
                        }, {
                            "field": 'roleid',
                            "title": 'ID',
                            "width": 200,
                            "align": 'center',

                        }, {
                            field: 'rolename',
                            align: 'center',
                            title: '角色名',
                            width: 200,
                        },  {
                            "field": 'list',
                            "title": '角色资源',
                            "width": 200,
                            "align": 'center',
                            formatter:function (value,row,index) {
                                console.log(value)
                                var content="<select>"
                                // alert("------------"+value.length);
                                for(var i=0;i<value.length;i++){
                                    content+="<option>"+value[i].resname+"</option>";
                                }
                                return content+"</select>";

                            }


                        }
                        ]],
                        striped: true,
                        pagination: true,
                        pageSize:50,
                        toolbar: [
                            {
                                iconCls: 'icon-add',
                                handler: function () {
                                    $("#addRole").dialog({
                                        title: '添加角色',
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
                                    var role = $("#showAllcmfz_role").datagrid("getChecked");
                                    if(role.length<1){
                                        $.messager.alert("提示","请选择要修改的数据");
                                    }else{
                                        $("#updateRole").dialog({
                                            title: '修改角色',
                                            width: 400,
                                            modal: true,
                                            closed: false
                                        });
                                        var rn=role[0].rolename;
                                       console.log(rn)

                                        $("#roleid").val(role[0].id);
                                        $("#roleName").val(rn);
                                        $("#oldRoleName").val(rn);
                                        /* 修改的tree节点回显 */
                                        $.each(role,function(index,value){
                                            $.ajax({
                                                url:"${pageContext.request.contextPath}/selectByRoleName.do?rolename="+rn,
                                                dataType:"JSON",
                                                async:false,
                                                success:function(data){
                                                    console.log(data)
                                                    $.each(data,function(index,val1){
                                                        $.each(val1.children,function(inx,val2){
                                                            var node = $("#t2").tree("find",val2.id);
                                                            $("#t2").tree("check",node.target);
                                                            if(val2.children){
                                                                // 当有字节点时 取消父节点选中
                                                                var nodeP = $("#t2").tree("find",val2.id);
                                                                $("#t2").tree("uncheck",nodeP.target);
                                                                $.each(val2.children,function(ii,vv){
                                                                    var node = $("#t2").tree("find",vv.id);
                                                                    $("#t2").tree("check",node.target);
                                                                })
                                                            }
                                                        })
                                                    })


                                                }
                                            })

                                        })
                                    }
                                }
                            },
                            '-',
                            {
                                iconCls: 'icon-remove',
                                handler: function () {
                                    var cates = $("#showAllcmfz_role").datagrid('getChecked');
                                    if (cates.length < 1) {
                                        $.messager.alert("消息", "请选择一条数据修改", 'warning');
                                    } else {
                                        $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                            if (x) {
                                                var rolename = [];
                                                var cateIds = $("#showAllcmfz_role").datagrid('getChecked');
                                                $.each(cateIds, function (index, ii) {
                                                    rolename.push(ii.rolename);
                                                })
												alert(rolename)
                                                $.ajax({
                                                    type: 'post',
                                                    url: '${pageContext.request.contextPath}/deleteRole.do',
                                                    data: 'rolename=' + rolename,
                                                    success: function (dada) {
                                                        if (dada != 0) {
                                                            $.messager.alert("消息", "删除成功", 'info');
                                                            $("#showAllcmfz_role").datagrid('reload');
                                                        } else {
                                                            $.messager.alert("消息", "删除失败", 'error');
                                                            $("#showAllcmfz_role").datagrid('reload');
                                                        }
                                                    }
                                                })
                                            } else {
                                                $("#showAllcmfz_role").datagrid('reload');
                                            }
                                        })

                                    }
                                }
                            }]

                    })

            $("#addRoleform").submit(function () {
                var formData = new FormData($("#addRoleform")[0]);
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/insertRoleResourse.do',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (dada) {
                        if (dada == 1) {
                            $.messager.alert("消息", "添加成功", 'info');
                            $("#addRole").dialog('close');
                            $("#showAllcmfz_role").datagrid('reload');

                        } else if (dada == 0) {
                            $.messager.alert("消息", "添加失败", 'error');
                            $("#addRole").dialog('close');
                            $("#showAllcmfz_role").datagrid('reload');

                        }
                    }
                })
                return false;
            })
            $("#updateRoleform").submit(function () {
                var sss =  $('#t2').tree('getChecked');	// 获取选择的节点
                var ids=[];
                $.each(sss, function (index, ii) {
                    ids.push(ii.id);
                })
				$("#idss").val(ids)
                var formData = new FormData($("#updateRoleform")[0]);
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/updateRoleResourse.do',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (dada) {
                        if (dada == 1) {
                            $.messager.alert("消息", "修改成功", 'info');
                            $("#updateRole").dialog('close');
                            $("#showAllcmfz_role").datagrid('reload');
                        } else {
                            $.messager.alert("消息", "修改失败", 'error');
                            $("#updateRole").dialog('close');
                            $("#showAllcmfz_role").datagrid('reload');
                        }
                    }
                })
                return false;
            })
            function exit() {
                $("#updateRole").dialog('close');
                $("#showAllcmfz_role").datagrid('reload');
            }


            function pro2() {
                $("#updateRoleform").submit();
            }

            function insert() {
                var ttt = $('#resourseSelect').combotree('tree');	// 获取树对象
                var sss = ttt.tree('getChecked');	// 获取选择的节点
                var ids=[];
                console.log(sss+"--------------------------")
                $.each(sss, function (index, ii) {
                    ids.push(ii.id);
                })

                $("#resourseSelect").val(ids);
                $("#addRoleform").submit();
            }



	</script>
	 </body>
</html>
