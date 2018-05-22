<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/22
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--core--%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%--formate--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%--sql--%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
    <title>jstl</title>
</head>
    <%
        Integer[] arr = {1, 2, 3 ,4, 5, 435, 4365, 46, 456, 54, 23};
    %>
<body>
    <%!
        int a = 3;
    %>
    <div>都是</div>
        <c:out value="${null}" default="123"/><br/>
        <c:set var="name" value="${5000}" scope="page" />
        <div>a:"<%= a%></div>

    <c:catch var="catchException">
        <%
            int x = 25 / 0;
        %>
    </c:catch>
    <c:if test="${catchException != null}">
        <p>
            The exception is : ${catchException} <br /> There is an exception:
                ${catchException.message}
        </p>
    </c:if>
    <c:set var="salary" value="1"></c:set>
    <c:choose>
        <c:when test="salary <= 200">
            <p>工资${200}</p>
        </c:when>
        <c:otherwise>
            <p>工资${salary}</p>
        </c:otherwise>
    </c:choose>
    <div>
        import : <c:import var="header" url="../components/header.jsp" scope="application" />
        <c:out value="${header}" />
    </div>
    <c:forTokens delims="|" items="google|runoob|taobao" var="name">
        当前值： <c:out value="${name}" />
        <br />
    </c:forTokens>
    <a href="<c:url value = "/jstl/index.jsp">
                <c:param name="id" value="995"></c:param>
            </c:url>">
        Index Page
    </a>
    <c:set var="balance" value="120000.2309" />
    <fmt:formatNumber value="${balance}" type="number"  />
    <sql:setDataSource
            var="mydb"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/db1?serverTimezone=GMT"
            user="root" password="123456"
    />
    <sql:query dataSource="${mydb}"
               sql="SELECT * FROM `user`"
               var="result" />
    <c:forEach var="row" items="${result.rows}">
        <div>
            <c:out value="${row.id}" /> -
            <c:out value="${row.username}"/> -
            <c:out value="${row.phone}" />
        </div>
    </c:forEach>
    <sql:update dataSource="${mydb}" var="update">
        UPDATE user SET phone="15665438551" WHERE id=1;
    </sql:update>
</body>

