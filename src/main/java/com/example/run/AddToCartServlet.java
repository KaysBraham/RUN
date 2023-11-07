package com.example.run;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérez l'ID de la variante à ajouter au panier depuis la requête AJAX
        String idVarianteStr = request.getParameter("idVariante");
        if (idVarianteStr != null) {
            int idVariante = Integer.parseInt(idVarianteStr);

            // Récupérez le panier de session
            HttpSession session = request.getSession();
            Panier panier = (Panier) session.getAttribute("panier");

            if (panier == null) {
                panier = new Panier();
                session.setAttribute("panier", panier);
            }

            // Ajoutez l'ID de la variante au panier
            panier.ajouterVariante(idVariante);

            // Répondez avec un statut de succès (200 OK) ou un message JSON si nécessaire
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            // Répondez avec un statut d'erreur (400 Bad Request) ou un message JSON d'erreur si l'ID de la variante est manquant
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
