package com.example.run;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddModeratorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nomMod");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        boolean ajoutProduit = Boolean.parseBoolean(request.getParameter("ajoutProduit"));
        boolean suppressionProduit = Boolean.parseBoolean(request.getParameter("suppressionProduit"));
        boolean modificationProduit = Boolean.parseBoolean(request.getParameter("modificationProduit"));

        DataBaseController controller = new DataBaseController();
        boolean insertionReussie = controller.insertModerator(nom, prenom, email, motDePasse, ajoutProduit, suppressionProduit, modificationProduit);

        if (insertionReussie) {
            response.sendRedirect("resultat.jsp?status=success&message=Moderateur+ajoute+avec+succes");
        } else {
            response.sendRedirect("resultat.jsp?status=error&message=Erreur+lors+de+l'ajout+du+moderateur");
        }
    }
}

