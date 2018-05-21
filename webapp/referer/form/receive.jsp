<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <div>
            <%
                String username = request.getParameter("username");
                String password = request.getParameter("password");
            %>
            <span>用户名:<%= username%></span>
            <br/>
            <span>密码:<%= password%></span>
        </div>
    </body>
</html>
