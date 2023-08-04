<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
    <title>Student List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        /* Apply styles to table header cells */
        th {
            background-color: #f2f2f2;
            text-align: left;
            padding: 8px;
        }

        /* Apply styles to table data cells */
        td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        /* Apply alternate background color to rows */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        </style>
</head>

<body>

<h1> MVC Controller </h1>

<table>
    <thead>
    <tr>
        <th>first name</th>
        <th>last name</th>
        <th>email</th>
    </tr>
    </thead>
   <c:forEach var="student" items="${students}">
       <tr>
           <td><c:out value="${student.firstName}"/></td>
           <td><c:out value="${student.lastName}"/></td>
           <td><c:out value="${student.email}"/></td>
       </tr>
    </c:forEach>

</table>

</body>

</html>