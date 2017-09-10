# 在imooc上学习的一个学习jstl表达式的demo
**项目前:** 以前用eclipse来进行web项目的开发，这次用idea来进行开发，在网上找了如何创建web工程[创建](http://www.cnblogs.com/jvpBlog/p/6519702.html)

## jsp常用标签
在文件开头引入常用标签库
```
%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```

- out
```
<!-- 使用out标签输出常量 -->
<c:out value="this is our first JSTL demo"></c:out>
<!-- 使用out标签输出变量  当变量不存在时，使用default输出默认值  escapeXml为false：转义-->
<% session.setAttribute("user","Mary"); %>
<c:out value="${user}" default="LiLi" escapeXml="false"></c:out>
<br>
```

- set

```
<!-- 使用set标签-->
<!-- 通过set标签赋值 -->
<c:set value="today" var="day" scope="page" ></c:set>
<c:out value="${day}"></c:out>
<br>

<!-- 通过set标签想JavaBean赋值 -->
<c:set target="${person}" property="name" value="Ben"></c:set>
<c:out value="${person.name}"></c:out>
<br>
```
- remove
```
<%-- remove标签 --%>
<c:set value="男" var="sex"  ></c:set>
<c:remove var="sex"></c:remove>
<c:out value="${sex}" default="女"></c:out>
<br>
```

- catch
```
<%-- catch标签 当可能发生错误时，用catch捕获，并看情况处理--%>
<c:catch var="error">
    <c:set target="false" property="false">false</c:set>
</c:catch>
<c:out value="${error}"></c:out>
<br>
```

- if
```
<%-- if标签的用法 用来进行条件判断 --%>
<form action="firstDemo.jsp" method="post">
    <input type="text" name="score" value="${param.score}"/>
    <button type="submit">提交</button>
</form>
<c:if test="${param.score>=90}" var="result">
    <c:out value="优秀" ></c:out>
</c:if>
<c:out value="${result}"></c:out>
<br>
```

- choose,when,otherwise
```
<%-- choose,when,otherwise 效果如switch(){case n:...}--%>
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
```

- forEach
```
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
```

- forTokens
```
<%-- forTokens 用来分割字符串 --%>
<c:forTokens items="194-3435-34545" delims="-" var="s">
    <c:out value="${s}"></c:out>
</c:forTokens>
<br>
<c:out value="============================="></c:out>
<br>
```

- import
```
<%--import:把其他静态或动态文件包含到本jsp页面--%>
<%--区别：--%>
<%--include：只能包含同一个web应用中的文件--%>
<%--import：可以包含其他web应用，甚至是网络上的资源--%>

<%--导入网络上的绝对路径--%>
<c:catch var="error09">
    <c:import url="http://www.imooc.com" ></c:import>
</c:catch>
<c:out value="${error09}"></c:out>

<%--导入相对路径--%>
<c:catch var="error08">
    <c:import url="tt.txt" charEncoding="utf-8" var="tt" scope="session"></c:import>
</c:catch>
<c:out value="${error08}"></c:out>
<c:out value="var输出:${sessionScope.tt}"></c:out>
<br>
```

- redirect
```
<%--redirect 重定向，当用户在此网页会跳到重定向的网页--%>
<c:redirect url="http://www.imooc.com">
    <c:param name="11" value="11"></c:param>
    <c:param name="22" value="22"></c:param>
</c:redirect>
```

- url
```
<%--url 实现url路径的动态拼接--%>
<c:if test="${1<3}">
    <c:set value="aaa" var="lj" scope="page"></c:set>
</c:if>
<c:url value="https://www.baidu.com/${lj}" var="ljname" scope="page"></c:url>
<a href="${ljname}">url链接</a>
<c:out value="${ljname}" ></c:out>
```

## JSTL常用函数
在文件开头引入常用函数库和标签库
```
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```
example:
```
<c:out value="'Hello,i am wb'是否包含'am'： ${fn:contains('Hello,i am wb','am')}"></c:out><br>
<c:out value="'Hello,i am wb'是否包含'AM'： ${fn:containsIgnoreCase('Hello,i am wb','am')}"></c:out><br>
```




