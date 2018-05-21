<%--
  Created by IntelliJ IDEA.
  User: 赵杰
  Date: 2018/5/22
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="../.././components/header.jsp"></jsp:include>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form
        method="post"
        enctype="multipart/form-data"
        action="uploadhandle.jsp">
        <div class="form-control">
            <input type="file" name="file" size="50" />

        </div>
        <button class="btn btn-primary">点击上传</button>
    </form>
</body>
</html>
