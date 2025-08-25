package com.example.dao;

import com.example.connection.DBConnection;
import com.example.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    //get all products from database
    public List<Product> getProducts() {
        List<Product> products = new ArrayList<Product>();

        String sql = "SELECT * FROM Products";
        try {
            Connection conn = DBConnection.getConnection();
            // Execute query and populate products list
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            // variable for holding the result of the query
            ResultSet resultSet = preparedStatement.executeQuery();
            // handle result set like loop and  iterator
            while (resultSet.next()) {
                int id = resultSet.getInt("ProductID");
                String name = resultSet.getString("ProductName");
                double price = resultSet.getDouble("Price");
                products.add(new Product(id, name, price));
            }
        } catch (Exception e) {

        }

        return products; // Placeholder for actual implementation
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Products (ProductName, Price) VALUES (?, ?)";

        System.out.println(product.getName());
        System.out.println(product.getPrice());
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            // Assuming Description is optional
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM Products WHERE ProductID = ?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
