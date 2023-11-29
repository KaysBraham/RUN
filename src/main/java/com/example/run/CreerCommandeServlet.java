package com.example.run;
import java.io.IOException;

import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "CreerCommandeServlet", value = "/CreerCommandeServlet")
public class CreerCommandeServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Integer idClient = (Integer) request.getSession().getAttribute("userID");

        DataBaseController databaseController = new DataBaseController();



        Panier panier = (Panier) request.getSession().getAttribute("panier");


        if (panier != null && panier.getTailleDuPanier() != 0) {

            int idCommande = databaseController.creerCommande(idClient);

            for (Map.Entry<Integer, Integer> entry : panier.getContenu().entrySet()) {
                int idVariante = entry.getKey();
                int quantite = entry.getValue();


                int idProduit = databaseController.getProductIdFromVarianteId(idVariante);

                databaseController.creerDetailCommande(idCommande, idProduit, idVariante, quantite);
            }
        }


        request.getSession().removeAttribute("panier");

        response.sendRedirect("/confirmationCommande.jsp"); // Remplacez par la page que vous souhaitez rediriger
    }
}