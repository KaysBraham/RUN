package com.example.run;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteModeratorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String moderatorIdString = request.getParameter("moderateurASupprimer");

        try {
            int moderatorId = Integer.parseInt(moderatorIdString);

            // Supprimer le modérateur de la base de données
            if (new DataBaseController().deleteModerator(moderatorId)) {
                response.sendRedirect("resultat.jsp?status=success&message=Moderateur supprime avec succes");
            } else {
                response.sendRedirect("resultat.jsp?status=error&message=Erreur lors de la suppression du moderateur");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("resultat.jsp?status=error&message=ID de moderateur invalide");
        }
    }
}
