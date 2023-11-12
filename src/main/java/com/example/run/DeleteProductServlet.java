package com.example.run;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdString = request.getParameter("produitASupprimer");

        try {
            int productId = Integer.parseInt(productIdString);

            // Supprimer le produit de la base de données
            if (new DataBaseController().deleteProduit(productId)) {
                response.sendRedirect("resultat.jsp?status=success&message=Produit supprime avec succes");
            } else {
                response.sendRedirect("resultat.jsp?status=error&message=Erreur lors de la suppression du produit");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("resultat.jsp?status=error&message=ID de produit invalide");
        }
    }
}
