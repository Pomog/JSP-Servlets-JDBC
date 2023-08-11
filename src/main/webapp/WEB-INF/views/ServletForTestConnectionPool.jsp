<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
        }

        /* Apply styles to table header cells */
        th {
            background-color: #f2f2f2;
            text-align: left;
            padding: 5px;
        }

        /* Apply styles to table data cells */
        td {
            vertical-align: center;
            border: 1px solid #ddd;
            padding: 8px;
        }

        /* Apply alternate background color to rows */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {background-color: coral;}
    </style>

    <title>Your Entity Data</title>
</head>
<body>
<h2>SQL DB - Entity Data</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Family Name</th>
        <th>Email</th>
    </tr>
    <c:forEach items="${students}" var="entity">
        <tr>
            <td>${entity.getId()}</td>
            <td>${entity.getFirstName()}</td>
            <td>${entity.getLastName()}</td>
            <td>${entity.getEmail()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
