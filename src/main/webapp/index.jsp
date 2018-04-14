<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<%--获取身份标识  主身份--%>
欢迎<shiro:principal></shiro:principal>，使用本系统！！<br><br>
您拥有<shiro:hasRole name="test">test</shiro:hasRole><br><br>
<shiro:hasRole name="system">system</shiro:hasRole><br><br>
<shiro:hasRole name="log">log</shiro:hasRole><br><br>

</body>
</html>
