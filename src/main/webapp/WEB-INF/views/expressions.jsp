<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.BufferedReader, java.io.FileReader" %>
<%@ page import="JSP.training.demo.testUtils" %>
<%@ page import="java.util.*" %>
<%@ page import="JSP.training.demo.Person" %>

<html>

<head>
    <title>My JSP Page</title>
    <script src="scripts.js"></script>
</head>

<body>

<jsp:include page="header.jsp" />


<h2> including HTML Form </h2>
<jsp:include page="formJS.jsp" />

<br/><br/>
Confirmed : ${param.firstName} ${param.lastName} ${param.country}
<br/>
Language : ${param.language}
<br/><br/>
Pets :
<br/>
<%
    String[] pets = request.getParameterValues("pet");
    if (pets != null) {
        for (String pet : pets) {
            out.print(pet + "<br/>");
        }
    }
%>
<br/><br/>
<h2>Try Sessions</h2><br/>
<form action="exp1">
    Add new Item <input type="text" name="theItem" />
    <input type="submit" value="Submit" />
</form>
<br/><br/>
Item input : <%= request.getParameter("theItem")%>

<%
    List<String> items = (List<String>) session.getAttribute("myItemList");
    if (items == null){
        items = new ArrayList<String>();
        session.setAttribute("myItemList", items);
    }

    String theItem = request.getParameter("theItem");
    if (theItem != null){
        boolean b = !theItem.trim().equals("") && !items.contains(theItem.trim());
        if (b) {
            items.add(theItem);
        }
    }
%>
<hr>
<b> List of Items</b><br/>
<ol>
    <%
        for (String item : items){
            out.print("<li>" + item + "</li>");
        }
    %>
</ol>
<hr>
                                                                        <h2> Testing Cookies </h2>

<%
    String strCookie = request.getParameter("cookieName");
    Cookie tcookie = new Cookie("first.cookieCreated", strCookie);
    tcookie.setMaxAge(60*60*24);
    response.addCookie(tcookie);
%>
Your name taken for cookie is : ${param.cookieName}

<%
    String readCookie = "no Name";
    Cookie[] tCookies = request.getCookies();
    if (tCookies != null){
        for (Cookie cookie : tCookies){
            if ("first.cookieCreated".equals(cookie.getName())){
                readCookie = cookie.getValue();
                break;
            }
        }
    }
%>
<br/><br/>
<h4>Your name read form cookies is <%= readCookie%></h4>




<br/><br/>
<h2> Testing JSP Scriptlets </h2>
<%
    String filePath = "E:\\JSP\\demo\\src\\main\\webapp\\WEB-INF\\views\\textExample.txt";
    try (BufferedReader br = new BufferedReader(new FileReader(filePath))){
        out.println(filePath + "<br>");
        String line;
        while ((line = br.readLine()) != null) {
            out.println(line);
            out.println("<br>");
        }
    } catch (Exception e) {
        out.println("Error reading the file: " + e.getMessage());
    }
%>

<br/>
Expressions
<br/>
Converting to UPPERCASE: <%= new String("hello again").toUpperCase()%>
<br/>
is -1 less that 0 <%= -1 < 0 %>
<br/><br/>
Scriplets
<%
for (int i=1; i<10; i++ ){
    out.print("<br/>For loop counting : <br/>" + i);
}
%>

<br/><br/>
Declarations
<br/>
<%!
String printToLowerCase (String str){
    return str.toLowerCase();
}
%>
Using declared function printToLowerCase : <%= printToLowerCase("Testing TO LowerCase")%>
<br/><br/>
Using Java Class
<br/>
Using testUtils.class : <%= testUtils.toLower("Make It lower With Method")%>
<br/><br/>

<h3> JSP Built-in Obj</h3>
Request user agent : <br/><%= request.getHeaders("User-Agent")%>
<br/>
Request user agent get Enumeration object  : <br/>
<%
    Enumeration<String> userAgents = request.getHeaders("User-Agent");
    int userAgentCount = 0;
    while (userAgents.hasMoreElements()) {
        userAgentCount++;
        String userAgent = userAgents.nextElement();
%>
Total User-Agent Count: <%= userAgentCount %><br/>
<%= userAgent %><br/>
<% } %>

Request language(local) : <%= request.getLocale()%>

<br/><br/>
<h2> Testing JSTL </h2>

<%--set variable "stuff" value new java.util.Date() using JSTL--%>
<c:set var="stuff" value="<%= new java.util.Date()%>" />
Current Time on Server is ${stuff}
<br/><br/>
<%
    String[] countries = {"India", "USA", "UK", "Canada", "Australia"};
    pageContext.setAttribute("countries", countries);
%>
<c:forEach var="country" items="${countries}">
    ${country}<br/>
</c:forEach>

<br/><br/>
<h2> HTML table JSTL </h2>
<%
    List<Person> persons = new ArrayList<Person>();
    persons.add(new Person("John", "Doe", false));
    persons.add(new Person("Jane", "Doe", true));
    persons.add(new Person("John", "Smith", false));
    persons.add(new Person("Jane", "Smith", true));

    pageContext.setAttribute("persons", persons);
%>

<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        padding: 8px;
        border: 4px solid #ddd;
    }

    th {
        background-color: yellow;
        text-align: left;
    }

    tr {
        background-color: green;
    }
</style>

<table>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Is Adult</th>
    </tr>
<c:forEach var="person" items="${persons}">
    <tr>
            <td>${person.firstName}</td>
            <td>${person.lastName}</td>
            <td>${person.isAdult}</td>
    </tr>
</c:forEach>
</table>



<br/><br/>
<jsp:include page="footer.jsp" />

</body>
</html>