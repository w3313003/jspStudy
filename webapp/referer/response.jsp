<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>response-服务端响应</title>
</head>
<body>
<div style="margin: auto; width: 80%;">
    <h2>自动刷新HTTP标头示例</h2>
    <%
        response.setHeader("Cache-Control", "no-store");
        response.setIntHeader("Refresh", 10000);

        Calendar calendar = new GregorianCalendar();

        String am_pm;
        int hour = calendar.get(Calendar.HOUR);
        int minute = calendar.get(Calendar.MINUTE);
        int second = calendar.get(Calendar.SECOND);

        if (calendar.get(Calendar.AM_PM) == 0)
            am_pm = "AM";
        else
            am_pm = "PM";
        String CT = hour + ":" + minute + ":" + second + " " + am_pm;
        out.println("Current Time is: " + CT + "\n");
    %>
</div>
</body>
</html>
<%--
	String encodeRedirectURL(String url)	对指定的URL进行编码，以在sendRedirect()方法中使用，或者如果不需要编码，则返回URL。
	String encodeURL(String url)	通过在其中包含会话ID来对指定的URL进行编码，或者如果不需要编码，则不会更改URL。
	boolean containsHeader(String name)	返回一个布尔值，表示是否已经设置了命名的响应头。
	boolean isCommitted()	返回一个布尔值，表示响应是否已提交。
	void addCookie(Cookie cookie)	将指定的cookie添加到响应。
	void addDateHeader(String name, long date)	添加具有给定名称和日期值的响应头。
	void addHeader(String name, String value)	添加具有给定名称和值的响应头。
	void addIntHeader(String name, int value)	添加具有给定名称和整数值的响应头。
	void flushBuffer()	强制将缓冲区中的所有内容写入客户端。
	void reset()	清除缓冲区中存在的所有数据以及状态代码和标头。
	void resetBuffer()	在响应中清除底层缓冲区的内容，而不清除标头或状态代码。
	void sendError(int sc)	使用指定的状态代码向客户端发送错误响应并清除缓冲区。
	void sendError(int sc, String msg)	使用指定的状态向客户端发送错误响应。
	void sendRedirect(String location)	使用指定的重定向位置URL向客户端发送临时重定向响应。
	void setBufferSize(int size)	设置响应正文的首选缓冲区大小。
	void setCharacterEncoding(String charset)	设置发送给客户端的响应的字符编码(MIME字符集)，例如：UTF-8，GB2312。
	void setContentLength(int len)	设置响应中内容正文的长度在HTTP servlet中; 此方法还可以设置HTTP Content-Length头。
	void setContentType(String type)	如果尚未提交响应，请设置要发送给客户端的响应的内容类型。
	void setDateHeader(String name, long date)	设置具有给定名称和日期值的响应头。
	void setHeader(String name, String value)	设置具有给定名称和值的响应头。
	void setIntHeader(String name, int value)	设置具有给定名称和整数值的响应头。
	void setLocale(Locale loc)	如果响应尚未提交，则设置响应的区域设置。
	void setStatus(int sc)	设置此响应的状态代码。
--%>