<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.BufferedReader, java.io.FileReader" %>
<%@ page import="JSP.training.demo.testUtils" %>
<%@ page import="java.util.Enumeration" %>

<html>

<head>
    <title>My JSP Page</title>
</head>

<body>

<jsp:include page="header.jsp" />
<div id="headerContent"></div>
<br/><br/>
<h2> including HTML Form </h2>
<div id="formContainer"></div>
<br/><br/>
Confirmed : ${param.firstName} ${param.lastName}

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
<jsp:include page="footer.jsp" />


<script>
    function includeHTML(url, targetId) {
        fetch(url)
            .then(response => response.text())
            .then(html => {
                document.getElementById(targetId).innerHTML = html;
            })
            .catch(error => console.error('Error fetching HTML:', error));
    }
    // Call
    includeHTML('/headerInHTML.html', 'headerContent');
    includeHTML('/formTest.html', 'formContainer');
</script>

</body>
</html>