<%@ page import="java.util.Enumeration"
         isELIgnored="false" %>
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
