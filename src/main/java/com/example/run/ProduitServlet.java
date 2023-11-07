package com.example.run;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProduitServlet", value = "/produit")
public class ProduitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        DataBaseController controller = new DataBaseController();
        Produit produit = controller.getProductById(Integer.parseInt(productId));

        request.setAttribute("produit", produit);
        request.getRequestDispatcher("/produit.jsp").forward(request, response);

        List<VarianteProduit> variantes = controller.getVariantesByProductId(Integer.parseInt(productId));
        request.setAttribute("variantes", variantes);
    }
}