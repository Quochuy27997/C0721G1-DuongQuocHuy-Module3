import jdk.nashorn.internal.objects.Global;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet",  urlPatterns = {"/discount"})
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_description = request.getParameter("product_description");
        float list_price = Float.parseFloat(request.getParameter("list_price"));
        float discount_percent = Float.parseFloat(request.getParameter("discount_percent"));
        float discount_amount = (float) (list_price * discount_percent * 0.01);
        float discount_price =(float)(list_price-discount_amount);
        request.setAttribute("discount_amount",discount_amount);
        request.setAttribute("discount_price",discount_price);
        request.setAttribute("product_description",product_description);
        request.setAttribute("list_price",list_price);
        request.setAttribute("discount_percent",discount_percent);

        request.getRequestDispatcher("display-discount.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//response.sendRedirect("discount.jsp");

    }
}
