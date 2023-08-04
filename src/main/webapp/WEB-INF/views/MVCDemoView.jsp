<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>

<body>

<h1> MVC Controller </h1>

   <c:forEach var="student" items="${students}">
        <c:out value="${student}"/><br/>
    </c:forEach>

</body>

</html>