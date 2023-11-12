package com.example.run;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        double prix = Double.parseDouble(request.getParameter("prix"));
        String marque = request.getParameter("marque");
        String description = request.getParameter("description");
        String urlPicture = request.getParameter("urlPicture");
        String motsCles = request.getParameter("motsCles");

        DataBaseController controller = new DataBaseController();
        boolean insertionReussie = controller.insertProduit(nom, prix, marque, description, urlPicture, motsCles);

        if (insertionReussie) {
            response.sendRedirect("resultat.jsp?status=success&message=Produit+ajoute+avec+succes");
        } else {
            response.sendRedirect("resultat.jsp?status=error&message=Erreur+lors+de+l'ajout+du+produit");
        }
    }
}

