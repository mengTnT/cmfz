<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
    <tablen id="showAllcmfz_listen"></table>
    <div id="addListen" style="display: none">
    	<form id="addListenInformation" enctype="multipart/form-data" method="post">
    		<br>
    		专辑名：&nbsp;<input name="listen_name"><br>
    		专辑封面：<input name="uploadFile" class="easyui-filebox" data-options="
    			buttonText:'选择文件',
    			width:160,
    			height:20
    		"><br>
    		专辑作者：<input name="listen_author"><br>
    		播音员：&nbsp;<input name="listen_announcer"><br>
    				
    		专辑评分：<input name="listen_star" class="easyui-numberbox" data-options="min:0,width:160,height:20"><br>
    		专辑集数：<input name="listen_amount" class="easyui-numberbox" data-options="min:0,width:160,height:20"><br>
    		
    		出版时间：<input name="listen_pubdate"  class="easyui-datebox" data-options="width:160,height:20"><br>
    		专辑简介：<br>
    				&nbsp;&nbsp;&nbsp;
    				<textarea name="listen_brief_introduction" rows="5px" cols="20px"></textarea>
    	</form>
    </div>
    <div id="updateListen" style="display: none">
    	<form id="updateListenInformation" enctype="multipart/form-data" method="post">
    		<br>
    				<input id="listen_id" name="listen_id" style="display: none">
    		专辑名：&nbsp;<input name="listen_name" id="listen_name"><br>
    		专辑封面：<input name="uploadFile" class="easyui-filebox" data-options="
    			buttonText:'选择文件'
    		"><br>
    		专辑作者：<input name="listen_author" id="listen_author"><br>
    		播音员：&nbsp;<input name="listen_announcer" id="listen_announcer"><br>
    				
    		专辑评分：<input name="listen_star" id="listen_star" class="easyui-numberbox" data-options="min:0"><br>
    		专辑集数：<input name="listen_amount" id="listen_amount" class="easyui-numberbox" data-options="min:0"><br>
    		专辑简介：<br>
    				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				      <textarea name="listen_brief_introduction" id="listen_brief_introduction" rows="5px" cols="20px"></textarea>
    	</form>
    		<p id="listen_picture"></p>
    </div>
  </body>
</html>
