package com.multi.jsp04.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class DispatcherServlet extends HttpServlet {
    private CustomerController customerController = new CustomerController();
    private ProductController productController = new ProductController();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if(url.equals("/product_add")){
            productController.add(req, resp);
        }else if(url.equals("/product_delete")){
            productController.delete(req, resp);
        }else if(url.equals("/customer_add")){
            customerController.add(req, resp);
        }else if(url.equals("/customer_delete")){
            customerController.delete(req, resp);
        }
    }
}
