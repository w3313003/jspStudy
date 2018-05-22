<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/22
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重定向</title>
</head>
<body>
    <%
        <%--response.setRedirect(href)--%>
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "http://www.baidu.com");
    %>
    <div>
        123
    </div>
</body>
</html>
