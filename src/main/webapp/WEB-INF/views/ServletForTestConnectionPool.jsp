((<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Entity Data</title>
</head>
<body>
<h2>Your Entity Data</h2>
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
