<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cmfz_category.jsp' starting page</title>
    
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
    <tablen id="showAllcmfz_category"></table>
    <div id="addCategory" style="display: none">
    	<form id="addCategoryInformation" enctype="multipart/form-data" method="post">
    		<br>
    		功课名：&nbsp;<input name="category_name"><br>
    		是否必修：<input class="easyui-combobox" name="category_isnecessary" data-options="
    			valueField: 'label',
				textField: 'value',
	    		data: [{
					label: 'Y',
					value: '必修'
				},{
					label: 'N',
					value: '自定义'
				}]
			" />  
    	</form>
    </div>
    <div id="updateCategory" style="display: none">
    	<form id="updateCategoryInformation" enctype="multipart/form-data" method="post">
    		<br>
    				<input id="category_id" name="category_id" style="display: none">
    		功课名：&nbsp;<input id="category_name" name=category_name><br>
    		是否必修：<input id="category_isnecessary" class="easyui-combobox" name="category_isnecessary" data-options="
	    		valueField: 'label',
				textField: 'value',
	    		data: [{
					label: 'Y',
					value: '必修'
				},{
					label: 'N',
					value: '自定义'
				}]
			" />  
    	</form>
    </div>
  </body>
</html>
