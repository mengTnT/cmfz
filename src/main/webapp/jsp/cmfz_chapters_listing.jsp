<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cmfz_chapters_listing.jsp' starting page</title>
    
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
    <tablen id="showAllcmfz_chapters_listing"></table>
    <div id="addchapters_listing" style="display: none">
    	<form id="addchapters_listingInformation" enctype="multipart/form-data" method="post">
    		<br>
    		章节名：&nbsp;<input name="chapter_name"><br>
    		章节音频：<input name="uploadFile" class="easyui-filebox" data-options="
    			buttonText:'选择文件'
    		"><br>
    		所属专辑：<input name="listen_id" class="easyui-combobox" data-options="
    			valueField:'listen_id',
    			textField:'listen_name',
    			url:'<%=path%>/listen/showAllListen.do'
    			" /><br>  
    		章节大小：<input name="chapter_size" class="easyui-numberbox" data-options="min:0">M<br>
    		章节下载次数：<input name="chapter_download_count" class="easyui-numberbox" data-options="min:0"><br>
    		章节排序：<input name="chapter_rank" class="easyui-numberbox" data-options="min:0"><br>
    		章节时长：<input name="chapter_duration" class="easyui-numberbox" data-options="min:0,precision:2"><br>
    		
    		
    	</form>
    </div>
    <div id="updatechapters_listing" style="display: none">
    	<form id="updatechapters_listingInformation" enctype="multipart/form-data" method="post">
    		<br>
    				<input id="chapter_id" name="chapter_id" style="display: none">
    		章节名：&nbsp;<input id="chapter_name" name="chapter_name"><br>
    		章节音频：<input name="uploadFile" class="easyui-filebox" data-options="
    			buttonText:'选择文件'
    		"><br>
    		所属专辑：<input id="listen_id" name="listen_id" class="easyui-combobox" data-options="
    			valueField:'listen_id',
    			textField:'listen_name',
    			url:'<%=path%>/listen/showAllListen.do'
    			" /><br>  
    		章节大小：<input id="chapter_size" name="chapter_size" class="easyui-numberbox" data-options="min:0">M<br>
    		章节下载次数：<input id="chapter_download_count" name="chapter_download_count" class="easyui-numberbox" data-options="min:0"><br>
    		章节排序：<input id="chapter_rank" name="chapter_rank" class="easyui-numberbox" data-options="min:0"><br>
    		章节时长：<input id="chapter_duration" name="chapter_duration" class="easyui-numberbox" data-options="min:0,precision:2"><br>
    		
    	</form>
    		<p id="listen_picture"></p>
    </div>
  </body>
</html>
