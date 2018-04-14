
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<body>
<h2>Hello World!</h2>

<%--未认证，访问标签提内容--%>
<shiro:notAuthenticated>xxxxxxxxxxxxxx</shiro:notAuthenticated><br>
<%--获取身份标识  主身份--%>
欢迎<shiro:principal></shiro:principal>，使用本系统！！<br><br>
<%--认证后 拥有其中任意角色 即可访问  --%>
<shiro:hasAnyRoles name="system,log,test">我拥有 其中的一个角色</shiro:hasAnyRoles><br><br>
<%--拥有当前角色即可访问--%>
<shiro:hasRole name="test">xxxxxxxxxxxxxx</shiro:hasRole><br><br>

<shiro:hasPermission name="user:create"></shiro:hasPermission><br><br>

<%--没有当前角色，访问标签体内容--%>
<shiro:lacksRole name="role99999">我没有role99999角色</shiro:lacksRole><br><br>
<shiro:lacksPermission name="user:create">我没有user:create角色</shiro:lacksPermission><br><br>
<a href="user/logOut.do">exeit!!!!</a>
</body>
</html>

