package com.example.run;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetModeratorDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer l'ID du modérateur à partir des paramètres de la requête
        String moderateurIdString = request.getParameter("moderateurId");

        try {
            int moderateurId = Integer.parseInt(moderateurIdString);
            Moderateur moderateur = new DataBaseController().getModeratorById(moderateurId);

            String droitsJson = convertDroitsToJson(moderateur);
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(droitsJson);
            out.flush();
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Gérer l'erreur si l'ID du modérateur n'est pas un nombre valide
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de modérateur invalide");
        }
    }

    private String convertDroitsToJson(Moderateur moderateur) {
        return String.format("{\"ajouterProduit\": " + moderateur.isAjouterProduit() + ", \"supprimerProduit\": " + moderateur.isSupprimerProduit() + ", \"modifierProduit\": " + moderateur.isModifierProduit() + "}");
    }
}
