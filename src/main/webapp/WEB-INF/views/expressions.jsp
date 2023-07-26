<%@ page import="java.io.BufferedReader, java.io.FileReader" %>

<html>

<body>

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
<br/>
Scriplets
<br/>
<%
for (int i=1; i<10; i++ ){
    out.print("<br/>For loop counting : <br/>" + i);
}
%>

<br/>
Declarations
<br/>
<%!
String printToLowerCase (String str){
    return str.toLowerCase();
}
%>
Using declared function printToLowerCase : <%= printToLowerCase("Testig TOLowerCase")%>
</body>
</html>