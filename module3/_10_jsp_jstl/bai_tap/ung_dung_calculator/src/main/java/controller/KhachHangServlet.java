package controller;

import model.KhachHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "KhachHangServlet", value = "")
public class KhachHangServlet extends HttpServlet {

    private static List<KhachHang> khachHangList;

    static {
        khachHangList = new ArrayList<>();
        khachHangList.add(new KhachHang("nguyen van a", "22/07/1980", "Da Nang", ""));
        khachHangList.add(new KhachHang("nguyen van b", "22/07/1980", "Da Nang", ""));
        khachHangList.add(new KhachHang("nguyen van c", "22/07/1980", "Da Nang", ""));
        khachHangList.add(new KhachHang("nguyen van d", "22/07/1980", "Da Nang", ""));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("khachHangList", khachHangList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
