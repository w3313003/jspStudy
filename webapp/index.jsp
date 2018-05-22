<%@ page import="java.util.Enumeration"
         isELIgnored="false"
         contentType="text/html;charset=UTF-8"%>
<html>
<body>

<h2>Hello World!</h2>
<table border="1">
    <tr bgcolor="#949494">
        <th>property</th>
        <th>values</th>
    </tr>
    <%!
        int a = 32;
    %>
    <div>
        <%
            Integer count = (Integer) application.getAttribute("count");
            if(count == null || count == 0) {
                out.print("欢迎进入网站");
                count =  1;
            } else {
                out.print("欢迎再次进入");
                count++;
            }
            application.setAttribute("count", count);
            out.print("<h2>总访问量:" + count + "</h2>");
        %>
    </div>
    <div>

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
