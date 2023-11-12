package com.example.run;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditModeratorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String moderatorIdString = request.getParameter("modAModifier");
        System.out.println(moderatorIdString);
        String[] droits = request.getParameterValues("droits[]");
        boolean ajoutProduitModif = false;
        boolean suppressionProduitModif = false;
        boolean modificationProduitModif = false;
        if(droits != null) {
            List<String> droitsList = Arrays.asList(droits);
            System.out.println("Liste des droits" + droitsList);
            if(droitsList.size() == 0){
                String message = "Permissions mises a jour avec succes";
                response.sendRedirect("resultat.jsp?status=success&message=" + message);
            }

            if (droitsList.size() > 0) {
                ajoutProduitModif = "true".equals(droitsList.get(0)) || "on".equals(droitsList.get(0));
            }

            if (droitsList.size() > 1) {
                suppressionProduitModif = "true".equals(droitsList.get(1)) || "on".equals(droitsList.get(1));
            }

            if (droitsList.size() > 2) {
                modificationProduitModif = "true".equals(droitsList.get(2)) || "on".equals(droitsList.get(2));
            }

        }

        try {
            String message;
            int moderatorId = Integer.parseInt(moderatorIdString);
            DataBaseController controller = new DataBaseController();
            Moderateur moderateur = controller.getModeratorById(moderatorId);

            if (moderateur != null) {
                moderateur.setAjouterProduit(ajoutProduitModif);
                moderateur.setSupprimerProduit(suppressionProduitModif);
                moderateur.setModifierProduit(modificationProduitModif);

                if (controller.updateModerator(moderateur)) {
                    message = "Permissions mises a jour avec succes";
                    response.sendRedirect("resultat.jsp?status=success&message=" + message);
                } else {
                    message = "Echec de la mise a jour des permissions";
                    response.sendRedirect("resultat.jsp?status=error&message=" + message);
                }
            } else {
                message = "Moderateur non trouve";
                response.sendRedirect("resultat.jsp?status=error&message=" + message);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("resultat.jsp?status=error&message=Donnees de formulaire invalides");
        }
    }
}
