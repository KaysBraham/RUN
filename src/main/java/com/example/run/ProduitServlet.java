package com.example.run;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProduitServlet", value = "/produit")
public class ProduitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérez l'ID du produit depuis la requête (par exemple, à partir de l'URL)
        String productId = request.getParameter("id");

        // Utilisez un contrôleur de base de données pour récupérer les détails du produit spécifié
        DataBaseController controller = new DataBaseController();
        Produit produit = controller.getProductById(Integer.parseInt(productId));

        // Ajoutez le produit à la requête pour qu'il puisse être affiché dans produit.jsp
        request.setAttribute("produit", produit);

        // Dirigez vers la page produit.jsp
        request.getRequestDispatcher("/produit.jsp").forward(request, response);
    }
}