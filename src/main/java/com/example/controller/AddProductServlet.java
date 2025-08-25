package com.example.controller;

import com.example.dao.ProductDAO;
import com.example.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // 2. Lấy dữ liệu từ form JSP
        String name = req.getParameter("productName");
        // Chuyển đổi giá từ String sang double
        double price = Double.parseDouble(req.getParameter("productPrice"));
        Product newProduct = new Product(0, name, price); // ID là 0 vì DB sẽ tự tăng

        // 4. Gọi DAO để thêm sản phẩm vào database
        productDAO.addProduct(newProduct);
        resp.sendRedirect("products");
    }
}
