<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
  <style>
    *{
      margin:0;
      padding: 0;
      box-sizing: border-box;
      -webkit-touch-callout: none;
      -webkit-user-select: none;
      -khtml-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }
    .outer{
      position: relative;
      margin:20px auto;
      width: 200px;
      height: 30px;
      line-height: 28px;
      border:1px solid #ccc;
      background: #ccc9c9;
    }
    .outer span,.filter-box,.inner{
      position: absolute;
      top: 0;
      left: 0;
    }
    .outer span{
      display: block;
      padding:0  0 0 36px;
      width: 100%;
      height: 100%;
      color: #fff;
      text-align: center;
    }
    .filter-box{
      width: 0;
      height: 100%;
      background: green;
      z-index: 9;
    }
    .outer.act span{
      padding:0 36px 0 0;
    }
    .inner{
      width: 36px;
      height: 28px;
      text-align: center;
      background: #fff;
      cursor: pointer;
      font-family: "宋体";
      z-index: 10;
      font-weight: bold;
      color: #929292;
    }
    .outer.act .inner{
      color: green;
    }
    .outer.act span{
      z-index: 99;
    }
  </style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/global/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/easyui.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
if(window.frames.length != window.parent.frames.length){
	parent.location.reload();
}
			var cookie="${cookie.cmfzCookie}"; 
			if(cookie){
				 window.location.href="jsp/main.jsp";
			}
			
	$(function(){
		 $("#imgVcode").attr("src","${pageContext.request.contextPath}/validateCode/code?random="
				+Math.random());
	
	});
	

	
	
</script>
</head>

<body>
<div id="top"> </div>
<form id="login" name="login" method="post">
  <div id="center">
    <div id="center_left"></div>
    <div id="center_middle">
      <div class="admin">
        <label>用户名：
        <input type="text" name="username" id="email" />
        </label>
      </div>
      <div class="admin">
        <label>密　码：
        <input type="password" name="password" id="pwd"   />
        </label>
      </div>
     <%-- <div class="chknumber">
        <label>验证码：
        <input name="code" type="text" id="chknumber" maxlength="4" class="chknumber_input" />
        </label><img width="50" height="30" src="#" id="imgVcode" onclick="document.getElementById('imgVcode').src='${pageContext.request.contextPath}/validateCode/code?time='+(new Date()).getTime();"  />
      </div>--%>
      <div class="outer">
        <div class="filter-box"></div>
        <span id="check">
            滑动登陆
        </span>
        <div class="inner">&gt;&gt;</div>
      </div>
    </div>
    <div id="center_middle_right"></div>
    <%--<div id="center_submit">
      <div class="button"> <img src="admin/imgs/global/dl.gif" width="57" height="20" onclick="form_submit()" > </div>
      <div class="button"> <img src="admin/imgs/global/cz.gif" width="57" height="20" onclick="form_reset()"> </div>
    </div>--%>
    </div>
    <div style="position:absolute;left:550px;bottom:100px;">
	<%--<input name="rememberMe" type="checkbox">请记住我</div>--%>
      <a href="${pageContext.request.contextPath}/logout.do">退出登陆!!!!</a>
</form>
</body>
<script type="text/javascript">

function form_submit() {
    alert("进入提交")
	$("#login").form("submit", {    
	    url:"${pageContext.request.contextPath}/admin/login2.do",
	    onSubmit: function(){    
	        return true;    
	    },    
	   success:function(data){
	        alert(data)

	       if(data=='ok'){
	    	   window.location.href="jsp/main.jsp"
	       }else{
	    	   alert("密码或用户名不正确");
               window.location.href="login.jsp"
	       }
	    }
	});  
	
	
}
	function form_reset(){
		$("#login").form("reset");
	}
    function check(){

   }
$(function(){
    $(".inner").mousedown(function(e){
        var el = $(".inner"),os = el.offset(),dx,$span=$(".outer>span"),$filter=$(".filter-box"),_differ=$(".outer").width()-el.width();
        $(document).mousemove(function(e){
            dx = e.pageX - os.left;
            if(dx<0){
                dx=0;
            }else if(dx>_differ){
                dx=_differ;
            }
            $filter.css('width',dx);
            el.css("left",dx);
        });
        $(document).mouseup(function(e){
            $(document).off('mousemove');
            $(document).off('mouseup');
            dx = e.pageX - os.left;
            if(dx<_differ){
                dx=0;
                $("#check").html("滑动登陆");
            }else if(dx>=_differ){
                dx=_differ;
                $(".outer").addClass("act");
                $("#check").html("验证通过！");
                form_submit()

                el.html('&radic;');
            }
            $filter.css('width',dx);
            el.css("left",dx);

        })
    })
})
</script>
</html>
