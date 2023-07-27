<%@ page import="java.io.BufferedReader, java.io.FileReader" %>
<%@ page import="JSP.training.demo.testUtils" %>
<%@ page import="java.util.Enumeration" %>

<html>

<body>

<jsp:include page="header.jsp" />

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

</body>
</html>