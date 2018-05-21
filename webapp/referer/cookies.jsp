<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page=".././components/header.jsp"></jsp:include>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Cookie cokkie = new Cookie("username", "我靠");
        cokkie.setMaxAge(1000 * 60 * 60 * 24);
        response.addCookie(cokkie);
    %>
    <a href="./form/input.jsp">to</a>
</body>
</html>
<%--
    public void setDomain(String pattern)	此方法设置适用Cookie的域; 例如，yiibai.com。
    public String getDomain()	此方法获取适用Cookie的域; 例如，yiibai.com。
    public void setMaxAge(int expiry)	此方法设置在cookie过期之前经过多少时间(以秒为单位)。如果没有设置此项，cookie将仅持续到当前会话结束。
    public int getMaxAge()	此方法返回cookie的最大时间，以秒为单位指定。默认情况下，-1表示cookie将持续到浏览器关闭。
    public String getName()	此方法返回cookie的名称。创建后不能更改名称。
    public void setValue(String newValue)	此方法设置与Cookie关联的值。
    public String getValue()	该方法获取与cookie相关联的值。
    public void setPath(String uri)	此方法设置此cookie适用的路径。如果不指定路径，则将返回与当前页面以及所有子目录位于同一目录中的所有URL的Cookie。
    public String getPath()	此方法获取此cookie应用的路径。
    public void setSecure(boolean flag)	此方法设置布尔值，指示Cookie是否应仅通过加密(即SSL)连接发送。
    public void setComment(String purpose)	此方法指定描述Cookie目的的注释。 如果浏览器向用户显示cookie，则该注释很有用。
    public String getComment()	此方法返回描述此cookie目的的注释，如果cookie没有注释，则返回null。
--%>