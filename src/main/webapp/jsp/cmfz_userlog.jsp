<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cmfz_userlog.jsp' starting page</title>
    
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
		$(function () {
			
       
        $("#showAllcmfz_userlog")
            .datagrid(
                {
                    url: '${pageContext.request.contextPath}/getAllLog.do',
                    fitColumns: true,

                    columns: [[{
                        field: '',
                        checkbox: true
                    }, {
                        "field": 'id',
                        "title": 'ID',
                        "width": 200,
                        "align": 'center',

                    }, {
                        field: 'methodName',
                        align: 'center',
                        title: '请求方法名',
                        width: 200,

                    },{
                        field: 'adminname',
                        align: 'center',
                        title: '请求用户名',
                        width: 200,

                    },
						{
                        "field": 'createDate',
                        "title": '请求时间',
                        "width": 200,
                        "align": 'center'
                    }, {
                        "field": 'result',
                        "title": '请求结果',
                        "width": 200,
                        "align": 'center'

                    }, {
                        "field": 'methodExcuteDate',
                        "title": '请求耗时',
                        "width": 200,
                        "align": 'center',
                    }
                    ]],
                    striped: true,
                    pagination: true,
                    pageSize:10,
                    /* pageList: [10,20,30,40],*/
                    toolbar: [


                        {
                            iconCls: 'icon-remove',
                            handler: function () {
                                var cates = $("#showAllcmfz_userlog").datagrid('getChecked');
                                if (cates.length < 1) {
                                    $.messager.alert("消息", "请选择一条数据修改", 'warning');
                                } else {
                                    $.messager.confirm("消息", "您确定要删除吗？", function (x) {
                                        if (x) {
                                            var ids = [];
                                            var cateIds = $("#showAllcmfz_userlog").datagrid('getChecked');
                                            $.each(cateIds, function (index, ii) {
                                                ids.push(ii.id);
                                            })
                                            $.ajax({
                                                type: 'post',
                                                url: '${pageContext.request.contextPath}/deleteLog.do',
                                                data: 'ids=' + ids,
                                                success: function (dada) {
                                                    if (dada != 0) {
                                                        $.messager.alert("消息", "删除成功", 'info');
                                                        $("#showAllcmfz_userlog").datagrid('reload');
                                                    } else {
                                                        $.messager.alert("消息", "删除失败", 'error');
                                                        $("#showAllcmfz_userlog").datagrid('reload');
                                                    }
                                                }
                                            })
                                        } else {
                                            $("#showAllcmfz_userlog").datagrid('reload');
                                        }
                                    })

                                }
                            }
                        }]

                })
        })

	</script>
  </head>
  <body>
    <table id="showAllcmfz_userlog"></table>
  
	</body>
</html>
