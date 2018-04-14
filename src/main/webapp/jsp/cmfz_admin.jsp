<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	
	<script type="text/javascript">
	
	</script>
  </head>
  <body>
    <table id="showAllcmfz_user">
    		
    </table>
	<%--拥有当前角色即可访问--%>
	<shiro:hasRole name="system">
    <div id="addUser" class="easyui-dialog" data-options="closed:true">
    	<form id="addUserInformation"  method="post" style="margin-left: 50px">
    		<br>
    		用户名：&nbsp;<input name="username"><br>
    		用户密码：&nbsp;<input name="password"><br>
    		<br>
    		<br>
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<center>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro1()">确认</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
			</center>
    	</form>
    </div>
	</shiro:hasRole>
    <div id="updateUser" class="easyui-dialog" data-options="closed:true">
    	<form id="updateUserInformation" enctype="multipart/form-data" method="post">
    		<br>
    		用户名：&nbsp;&nbsp;&nbsp;<input name="username" id="upUserName" readOnly><br>
    		<input name="id" id="upId" hidden="hidden">
    		<input name="salt" id="upPasswordSalt" hidden="hidden">
    		用户密码：&nbsp;<input name="password" id="upPassWord"><br>
    		角色分配：&nbsp;<input name="ids"  id="roleSelect"/>


			<br>
    		<br>
    		<div id="lalala">
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<center>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onClick="pro2()">确认</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
				</center>
    		</div>
    	</form>
    </div>
	<div>

	</div>
  <script type="text/javascript">
      $('#roleSelect').combotree({
          multiple:true,
          url: '${pageContext.request.contextPath}/ShiroRoleSelectAll.do',
          required: true
      });

      $("#showAllcmfz_user")
          .datagrid(
              {
                  url: '${pageContext.request.contextPath}/admin/getAllAdmin.do',
                  fitColumns: true,
                  columns: [[{
                    /*  field: '',*/
                      checkbox: true
                  }, {
                      "field": 'id',
                      "title": 'ID',
                      "width": 200,
                      "align": 'center',

                  }, {
                      field: 'username',
                      align: 'center',
                      title: '用户名',
                      width: 200,
                  }, {
                      "field": 'password',
                      "title": '密码',
                      "width": 200,
                      "align": 'center'
                  }, {
                      "field": 'salt',
                      "title": '盐值',
                      "width": 200,
                      "align": 'center'

                  }, {
                      "field": 'list',
                      "title": '角色',
                      "width": 200,
                      "align": 'center',
                      formatter:function (value,row,index) {
                          console.log(value)
                          var content="<select>"
                          // alert("------------"+value.length);
                          for(var i=0;i<value.length;i++){
                              content+="<option>"+value[i].rolename+"</option>";
                          }
                          return content+"</select>";

                      }


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
                                          var username = [];
                                          var cateIds = $("#showAllcmfz_user").datagrid('getChecked');
                                          $.each(cateIds, function (index, ii) {
                                              username.push(ii.username);
                                          })
                                          $.ajax({
                                              type: 'post',
                                              url: '${pageContext.request.contextPath}/admin/deleteAdmin.do',
                                              data: 'username=' + username,
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
