<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>request-客户端请求</title>
    <style>
        tr {
            text-align: center;
        }
    </style>
</head>

<body>
<h2>request-客户端请求</h2>
<table border="1">
    <tr bgcolor="#949494">
        <th>property</th>
        <th>values</th>
    </tr>
    <%!
        int a = 32;
    %>
    <div>
        <%=
            request.getServerPort()
        %>
    </div>
    <%
        Enumeration head = request.getHeaderNames();
        while (head.hasMoreElements()){
            String property = (String) head.nextElement();
            out.print("<tr><td>" + property + "</td>");
            String values = request.getHeader(property);
            out.print("<td>" + values + "</td></tr>");
        }
    %>

</table>

</body>
</html>
<%--request方法--%>
<%--  	Cookie[] getCookies()	返回一个数组，其中包含客户端使用此请求发送的所有Cookie对象。
    	Enumeration getAttributeNames()	返回枚举，其中包含此请求可用属性的名称。
    	Enumeration getHeaderNames()	返回此请求包含的所有头名称的枚举。
    	Enumeration getParameterNames()	返回此请求中包含的参数名称的String对象的枚举。
    	HttpSession getSession()	返回与此请求相关联的当前会话，或者如果请求没有会话，则自动创建一个会话。
    	HttpSession getSession(boolean create)	返回与此请求相关联的当前HttpSession，或者如果没有当前会话，并且create为true，则返回创建一个新会话。
    	Locale getLocale()	根据Accept-Language标头返回客户端将接受内容的首选区域设置。
    	Object getAttribute(String name)	作为Object返回命名属性的值，如果不存在给定名称的属性，则返回null。
    	ServletInputStream getInputStream()	使用ServletInputStream将请求的正文作为二进制数据检索。
    	String getAuthType()	返回用于保护servlet的认证方案的名称，例如“BASIC”或“SSL”，如果JSP未受保护，则返回null。
    	String getCharacterEncoding()	返回此请求正文中使用的字符编码的名称。
    	String getContentType()	返回请求主体的MIME类型，如果类型不知道，则返回null。
    	String getContextPath()	返回指示请求上下文的请求URI的部分。
    	String getHeader(String name)	以String形式返回指定的请求头的值。
    	String getMethod()	返回发出此请求的HTTP方法的名称，例如：GET，POST或PUT。
    	String getParameter(String name)	以String形式返回请求参数的值，如果该参数不存在，则返回null。
    	String getPathInfo()	返回与客户端发出此请求时发送的URL相关联的任何额外的路径信息。
    	String getProtocol()	返回请求使用的协议的名称和版本。
    	String getQueryString()	返回路径后请求URL中包含的查询字符串。
    	String getRemoteAddr()	返回发送请求的客户端的Internet协议(IP)地址。
    	String getRemoteHost()	返回发送请求的客户端的完全限定名称。
    	String getRemoteUser()	如果用户已通过身份验证，则返回进行此请求的用户的登录名，如果用户未通过身份验证，则返回null。
    	String getRequestURI()	将该请求URL的一部分从协议名称返回到HTTP请求的第一行中的查询字符串。
    	String getRequestedSessionId()	返回客户端指定的会话ID。
    	String getServletPath()	返回调用JSP的请求的URL部分。
    	String[] getParameterValues(String name)	返回包含给定请求参数的所有值的String对象数组，如果该参数不存在，则返回null。
    	boolean isSecure()	返回一个布尔值，指示此请求是否使用安全通道(如HTTPS)进行通信。
    	int getContentLength()	返回请求主体的长度(以字节为单位)，并由输入流提供;如果长度未知，返回-1。
    	int getIntHeader(String name)	将指定的请求头的值作为int类型返回。
    	int getServerPort()	返回接收到此请求的端口号。
    --%>