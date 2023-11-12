package com.example.run;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/accueil")
public class AccueilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productId = request.getParameter("id");
        DataBaseController controller = new DataBaseController();

        Produit produit = controller.getProductById(Integer.parseInt(productId));
        request.setAttribute("produit", produit);
        request.getRequestDispatcher("/produit.jsp").forward(request, response);

        List<Produit> catalogue = controller.getCatalogue();
        request.setAttribute("catalogue", catalogue);
        request.getRequestDispatcher("/catalogue.jsp").forward(request, response);
    }
}