package com.example.controller;

import com.example.dao.ProductDAO;
import com.example.model.Product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductList extends HttpServlet {
    private ProductDAO productDAO;
    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        // 1. Yêu cầu "Thủ kho" lấy dữ liệu
        List<Product> productList = productDAO.getProducts();

        // 2. Gửi dữ liệu cho bộ phận hiển thị (JSP)
        request.setAttribute("products", productList);

        // 3. Ủy quyền hiển thị
        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
        dispatcher.forward(request, response);
    }
}
