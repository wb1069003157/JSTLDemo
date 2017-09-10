<%--
  Created by IntelliJ IDEA.
  User: Bin
  Date: 2017/9/10
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL函数的使用</title>
</head>
<body>
<c:out value="'Hello,i am wb'是否包含'am'： ${fn:contains('Hello,i am wb','am')}"></c:out><br>
<c:out value="'Hello,i am wb'是否包含'AM'： ${fn:containsIgnoreCase('Hello,i am wb','am')}"></c:out><br>
</body>
</html>
