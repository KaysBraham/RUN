package com.example.run;
import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HelloWorldServlet", value = "/hello")
public class HelloWorldServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataBaseController controller = new DataBaseController();
        List<Produit> produits = controller.getAllProducts();

        request.setAttribute("produits", produits);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/produits.jsp");
        dispatcher.forward(request, response);
    }
}