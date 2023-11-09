package com.example.run;
import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/recherche")
public class RechercheServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String motRecherche = request.getParameter("recherche");

        if (motRecherche != null && !motRecherche.isEmpty()) {
            DataBaseController controller = new DataBaseController();
            List<Produit> resultats = controller.getProductBySearch(motRecherche);

            request.setAttribute("resultats", resultats);
        }

        request.getRequestDispatcher("/recherche.jsp").forward(request, response);
    }
}
