package com.multi.jsp04.controller;

import com.multi.jsp04.dao.ProductDAO;
import com.multi.jsp04.vo.ProductVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProductController {
    private ProductDAO productDAO = new ProductDAO();

    public void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductVO product = new ProductVO();
        product.setId(req.getParameter("id"));
        product.setName(req.getParameter("name"));
        product.setPrice(Integer.parseInt(req.getParameter("price")));
        productDAO.addProduct(product);

        System.out.println(product.toString());
        req.setAttribute("product", product);
        RequestDispatcher rd = req.getRequestDispatcher("views/product_result.jsp");
        rd.forward(req, resp);
    }

    public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(productDAO.toString());
        String id = req.getParameter("id");
        productDAO.deleteProduct(id);
        req.setAttribute("product_id", id);
        RequestDispatcher rd = req.getRequestDispatcher("views/product_result.jsp");
        rd.forward(req, resp);
        System.out.println();
        System.out.println(productDAO.toString());
    }
}
