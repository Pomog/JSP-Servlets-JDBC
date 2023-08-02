package JSP.training.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet("/TestParametersServlet")
public class TestParametersServlet extends HttpServlet {

    private String maxCartSize;

    @Override
    public void init() {
        // Load the properties from the application.properties file
        Properties properties = new Properties();
        try (InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("application.properties")) {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        maxCartSize = properties.getProperty("cart");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Set content type
        response.setContentType("text/html");
        // get the PrintWriter
        PrintWriter out = response.getWriter();
        // generate HTML content
        out.println("<html><body>");
        out.println("Read parameter form the application.properties: " + maxCartSize);
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
