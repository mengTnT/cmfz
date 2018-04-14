<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cmfz_user_category.jsp' starting page</title>
    
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
    <tablen id="showAllcmfz_user_category"></table>
    <div id="addCategory" style="display: none">
    	<form id="addCategoryInformation" method="post">
    		<br>
    			<input id="user_id" name="user_id" style="display: none">
    			功课名：&nbsp;<input name="category_name"><br>
    	</form>
    </div>
    <div id="updateCategory" style="display: none">
    	<form id="updateCategoryInformation" method="post">
    		<br>
    				<input id="category_id" name="category_id" style="display: none">
    			功课名：&nbsp;<input id="category_name" name="category_name"><br>
			</form>
    </div>
  </body>
</html>
