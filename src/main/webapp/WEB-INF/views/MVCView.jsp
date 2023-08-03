<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>

<body>

<h1> MVC Servlet Controller </h1>

   <c:forEach var="name" items="${names}">
        <c:out value="${name}"/><br/>
    </c:forEach>

</body>

</html>