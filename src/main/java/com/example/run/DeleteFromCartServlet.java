package com.example.run;
import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteFromCartServlet", value = "/DeleteFromCartServlet")
public class DeleteFromCartServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérez l'ID de la variante à supprimer du panier depuis la requête AJAX
        String idVarianteStr = request.getParameter("idVariante");
        if (idVarianteStr != null) {
            int idVariante = Integer.parseInt(idVarianteStr);

            // Récupérez le panier de session
            HttpSession session = request.getSession();
            Panier panier = (Panier) session.getAttribute("panier");

            if (panier == null) {
                // Si le panier n'existe pas, créez un panier vide
                panier = new Panier();
                session.setAttribute("panier", panier);
            }

            // Supprimez l'ID de la variante du panier (ou ignorez si le panier est vide)
            panier.retirerVariante(idVariante);

            // Répondez avec un statut de succès (200 OK) ou un message JSON si nécessaire
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            // Répondez avec un statut d'erreur (400 Bad Request) ou un message JSON d'erreur si l'ID de la variante est manquant
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
