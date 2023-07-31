<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="theLocale"
       value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
       scope="session" />

<fmt:setLocale value="${theLocale}"/>

<fmt:setBundle basename="labelsTest"/>
<html>

<body>
Current pageContext locale is : "${pageContext.request.locale}"/> <br/><br/>
Current theLocale is : "${theLocale}"/> <br/><br/>

<a href="i18n?theLocale=en_US">English (US)</a> |
<a href="i18n?theLocale=uk_UA">Українська (UA)</a> |
<a href="i18n?theLocale=en2_US">English V2 (US)</a>
<hr>
<br/><br/>
        <fmt:message key="label.greeting" /> <i>ЫЫЫ</i><br/><br/>
        <fmt:message key="label.goodbye" /> <br/>
</body>
</html>