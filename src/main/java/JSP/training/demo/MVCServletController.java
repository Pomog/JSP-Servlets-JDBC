package JSP.training.demo;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/MVCServletController")
public class MVCServletController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String [] names = {"Tom", "Jerry", "Donald"};
    request.setAttribute("names", names);
    request.getRequestDispatcher("/WEB-INF/views/MVCView.jsp").forward(request, response);
    response.getWriter().println("</br> Hello from MVCServletController");
//        Any code executed after the forward call will not have an effect on the final response
//        because the JSP will take over the response rendering.
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
