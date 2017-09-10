<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Bin
  Date: 2017/9/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="person" class="com.wb.po.Person"></jsp:useBean>
<html>
<head>
    <title>jsp常用标签使用</title>
</head>
<body>


<!-- 使用out标签输出常量 -->
<c:out value="this is our first JSTL demo"></c:out>
<!-- 使用out标签输出变量  当变量不存在时，使用default输出默认值  escapeXml为false：转义-->
<% session.setAttribute("user","Mary"); %>
<c:out value="${user}" default="LiLi" escapeXml="false"></c:out>
<br>

<!-- 使用set标签-->
<!-- 通过set标签赋值 -->
<c:set value="today" var="day" scope="page" ></c:set>
<c:out value="${day}"></c:out>
<br>

<!-- 通过set标签想JavaBean赋值 -->
<c:set target="${person}" property="name" value="Ben"></c:set>
<c:out value="${person.name}"></c:out>
<br>

<%--remove标签--%>
<c:set value="男" var="sex"  ></c:set>
<c:remove var="sex"></c:remove>
<c:out value="${sex}" default="女"></c:out>
<br>

<%--catch标签--%>
<c:catch var="error">
    <c:set target="false" property="false">false</c:set>
</c:catch>
<c:out value="${error}"></c:out>
<br>

<%--if标签的用法--%>
<form action="firstDemo.jsp" method="post">
    <input type="text" name="score" value="${param.score}"/>
    <button type="submit">提交</button>
</form>
<c:if test="${param.score>=90}" var="result">
    <c:out value="优秀" ></c:out>
</c:if>
<c:out value="${result}"></c:out>
<br>


<%--choose,when,otherwise--%>
<c:choose>
    <c:when test="${param.score>=90}">
        <c:out value="很优秀"></c:out>
    </c:when>
    <c:when test="${param.score>=60}">
        <c:out value="良好"></c:out>
    </c:when>
    <c:otherwise>
        <c:out value="不及格"></c:out>
    </c:otherwise>
</c:choose>
<br>

<%--forEach--%>
<%
    List fruits=new ArrayList();
    fruits.add("apple");
    fruits.add("orange");
    fruits.add("lemon");
    request.setAttribute("fruits",fruits);
%>
<%--var:存储当前遍历元素--%>
<%--items:存储遍历的集合--%>
<%--begin:开始遍历的位置--%>
<%--end:结束遍历的位置--%>
<%--step:步长，每次遍历间隔元素个数 default：1--%>
<%--varStatus:指定一个变量用来存储当前元素的状态值--%>
<c:forEach var="fruit" items="${fruits}" begin="0" end="3" step="1" varStatus="f">
    <c:out value="${fruit}"></c:out><br>
    <c:out value="index属性:${f.index}"></c:out>
    <c:out value="count属性:${f.count}"></c:out>
    <c:out value="first属性:${f.first}"></c:out>
    <c:out value="last属性:${f.last}"></c:out><br>
    <c:out value="============================="></c:out><br>
</c:forEach>
<br>

<%--forTokens--%>
<c:forTokens items="194-3435-34545" delims="-" var="s">
    <c:out value="${s}"></c:out>
</c:forTokens>
<br>
<c:out value="============================="></c:out>
<br>

<%--import:把其他静态或动态文件包含到本jsp页面--%>
<%--区别：--%>
<%--include：只能包含同一个web应用中的文件--%>
<%--import：可以包含其他web应用，甚至是网络上的资源--%>

<%--导入网络上的绝对路径--%>
<%--<c:catch var="error09">--%>
    <%--<c:import url="http://www.imooc.com" ></c:import>--%>
<%--</c:catch>--%>
<%--<c:out value="${error09}"></c:out>--%>

<%--导入相对路径--%>
<c:catch var="error08">
    <c:import url="tt.txt" charEncoding="utf-8" var="tt" scope="session"></c:import>
</c:catch>
<c:out value="${error08}"></c:out>
<c:out value="var输出:${sessionScope.tt}"></c:out>
<br>

<%--redirect--%>
<%--<c:redirect url="http://www.imooc.com">--%>
    <%--<c:param name="11" value="11"></c:param>--%>
    <%--<c:param name="22" value="22"></c:param>--%>
<%--</c:redirect>--%>

<%--url--%>
<c:if test="${1<3}">
    <c:set value="aaa" var="lj" scope="page"></c:set>
</c:if>
<c:url value="https://www.baidu.com/${lj}" var="ljname" scope="page"></c:url>
<a href="${ljname}">url链接</a>
<c:out value="${ljname}" ></c:out>
</body>
</html>
