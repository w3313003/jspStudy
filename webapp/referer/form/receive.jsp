<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--core--%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%--sql--%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<% request.setCharacterEncoding("UTF-8");%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <div>
            <%
                String username = request.getParameter("username");
                String phone = request.getParameter("phone");
//                Long userId = new Date().getTime();
            %>
            <span>接收到的用户名:<%= username%></span>
            <br/>
            <span>接收到的手机号码:<%= phone%></span>
        </div>
        <sql:setDataSource
            var="mydb"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/db1?serverTimezone=GMT"
            user="root" password="123456"
        />
        <sql:query
                dataSource="${mydb}"
                sql="SELECT * FROM `user`"
                var="result"
        ></sql:query>
        <table>
            <tr>
                <th>id</th>
                <th>姓名</th>
                <th>手机号码</th>
            </tr>
        <c:forEach items="${result.rows}" var="row">
            <tr>
                <td>${row.id}</td>
                <td>${row.username}</td>
                <td>${row.phone}</td>
            </tr>
        </c:forEach>
        </table>
        <sql:update dataSource="${mydb}">
            INSERT INTO user(`username`, `phone`) VALUES ('<%=username%>', '<%=phone%>')
        </sql:update>
    </body
</html>
