<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: 赵杰
  Date: 2018/5/21
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>session</title>
</head>
<body>
    <div>
        SESSION
    </div>
    <A href="./form/input.jsp">实打实的</A>
    <%
        session.setAttribute("userId", 1234);
    %>
</body>
</html>
<%--
	public Object getAttribute(String name)	此方法返回在此会话中用指定名称绑定的对象，如果在名称下没有绑定对象，则返回null。
	public Enumeration getAttributeNames()	此方法返回一个包含绑定到此会话的所有对象的名称的String对象枚举。
	public long getCreationTime()	此方法返回创建此会话的时间，以1970年1月1日GMT格林尼治时间以来的毫秒为单位。
	public String getId()	此方法返回一个包含分配给此会话的唯一标识符的字符串。
	public long getLastAccessedTime()	此方法返回客户端上次发送与此会话相关联的请求的时间，为1970年1月1日GMT以来的毫秒数。
	public int getMaxInactiveInterval()	此方法返回servlet容器在客户端访问之间保持此会话的最长时间间隔(以秒为单位)。
	public void invalidate()	此方法使该会话无效，并取消绑定绑定到该对象的任何对象。
	public boolean isNew()	如果客户端还不知道会话或者客户端选择不加入会话，则此方法返回true。
	public void removeAttribute(String name)	此方法从此会话中删除与指定名称绑定的对象。
	public void setAttribute(String name, Object value)	此方法使用指定的名称将对象绑定到此会话。
	public void setMaxInactiveInterval(int interval)	此方法指定在servlet容器将使此会话无效之前，客户端请求之间的时间(以秒为单位)。
--%>