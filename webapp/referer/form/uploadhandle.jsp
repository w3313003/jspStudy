<%--
  Created by IntelliJ IDEA.
  User: 赵杰
  Date: 2018/5/22
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.rmi.ServerException" %>
<%@ page import="javax.xml.crypto.Data" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int MAX_SIZE = 102400 * 102400;
//        创建根路径的保存变量
        String rootPath;
//        声明文件读入类
        DataInputStream in;
        FileOutputStream fileOut  = null;
//        取得互联网程序的绝对地址
        String realPath = request.getSession().getServletContext().getRealPath("/");
//        out.print(realPath);
//        创建文件保存路径
        rootPath = realPath + "src\\main\\webapp\\assets\\file";
//        取得客户端上传的数据类型
        String contentType = request.getContentType();
        try {
            if (contentType.indexOf("multipart/form-data") != -1) {
//            读取上传数据
                in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();
                if (formDataLength > MAX_SIZE) {
                    out.print("上传的文件大小不得超过" + MAX_SIZE);
                    return;
                }
//                保存上传文件数据
                byte[] dataBytes = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
//                根据byte数组创建字符串
                String file = new String(dataBytes, "utf-8");
//                取得上传文件的名字
//                String saveFile = file.substring(file.indexOf("filename=\\\"") + 10);
//                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
//                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
//                int lastIndex = contentType.lastIndexOf("=");
                //取得数据的分隔字符串
                String boundary = "4";
                //创建保存路径的文件名
                String fileName = rootPath + 3;
                int pos;
                pos = file.indexOf("filename = \"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                //取得文件数据的开始的位置
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                File checkFile = new File(fileName);
                if (checkFile.exists()) {
                    out.println("<p>" + 123123 + "文件已经存在.</p>");
                    return;
                }
                //检查上传文件的目录是否存在
                File fileDir = new File(rootPath);
                if (!fileDir.exists()) {
                    fileDir.mkdirs();
                }
                //创建文件的输出类
                fileOut = new FileOutputStream(fileName);
                //保存文件的数据
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.close();
                out.print("<b>文件上传成功</b>");
                out.print(rootPath);
            } else {
                String content = request.getContentType();
                out.print("上传的文件类型是" + content + "类型的，请上传目录mutipart/form-data类型的文件");

            }
        } catch (Exception ex) {
        	out.print(ex);
//            throw new ServerException(ex.getMessage());

        }
    %>
</body>
</html>
