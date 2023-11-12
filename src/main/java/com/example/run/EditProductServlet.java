package com.example.run;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String productIdString = request.getParameter("produitAModifier");
        String nom = request.getParameter("nomModif");
        String prix = request.getParameter("prixModif");
        String marque = request.getParameter("marqueModif");
        String description = request.getParameter("descriptionModif");
        String urlPicture = request.getParameter("urlPictureModif");
        // String motsCles = request.getParameter("motsCles");

        try {
            String message;
            int productId = Integer.parseInt(productIdString);
            DataBaseController controller = new DataBaseController();
            Produit produit = controller.getProductById(productId);

            if (produit != null) {
                produit.setNom(nom);
                produit.setPrix(prix);
                produit.setMarque(marque);
                produit.setDescription(description);
                produit.setUrlPicture(urlPicture);
                // produit.setMotCles(motsCles);

                if (controller.updateProduit(produit)) {
                    message = "Produit mis a jour avec succes";
                    response.sendRedirect("resultat.jsp?status=success&message=" + message);
                } else {
                    message = "Echec de la mise a jour du produit";
                    response.sendRedirect("resultat.jsp?status=error&message=" + message);
                }
            } else {
                message = "Produit non trouve";
                response.sendRedirect("resultat.jsp?status=error&message=" + message);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("resultat.jsp?status=error&message=Donnees de formulaire invalides");
        }
    }
}
