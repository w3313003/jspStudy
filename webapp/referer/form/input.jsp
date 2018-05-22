<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>表单</title>
<jsp:include page="../.././components/header.jsp" />
<body>
    <div>
        <%=
            session.getAttribute("userId")

        %>
    </div>
    <div>
        <%=
            session.getId()
        %>
    </div>
    <form class="form-horizontal" style="width: 30%;margin: 30px auto"
          method="get"
          action="receive.jsp">
        <div class="form-group">
            <label class="col-sm-3 control-label" for="user-name-label">
                姓名
            </label>
            <div class="col-sm-9">
                <input type="text" name="username" class="form-control" id="user-name-label">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="user-name-label1">
                手机号码
            </label>
            <div class="col-sm-9">
                <input type="text" name="phone" class="form-control" id="user-name-label1">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-10">
                <button class="btn btn-default">Sign in</button>
            </div>
        </div>
    </form>
</body>
</html>
