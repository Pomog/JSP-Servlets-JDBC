package JSP.training.demo;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

@WebServlet("/hello")
public class HelloWorldServlet extends HttpServlet{
    @Serial
    private static final long serialVersionUID = 1L;

    public HelloWorldServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Hello World</h1>");
        out.println("<hr>");
        out.println("Time on server is: " + new java.util.Date());
        out.println("</body></html>");
    }
}
