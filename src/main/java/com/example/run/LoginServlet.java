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

public class LoginServlet extends HttpServlet {
    private DataBaseController databaseController; // Injectez votre DatabaseController ici

    public LoginServlet() {
        // Initialisez databaseController dans le constructeur
        this.databaseController = new DataBaseController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        try {
            if (databaseController.checkLogin(email, motDePasse)) {
                // L'authentification a réussi, récupérez l'ID de l'utilisateur depuis la base de données
                int userID = databaseController.getUserIdFromDatabase(email);

                if (userID != -1) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userID", userID);
                    List<Produit> catalogue = databaseController.getCatalogue();

                    // Ajoutez la liste des produits à la requête pour les afficher dans catalogue.jsp
                    request.setAttribute("catalogue", catalogue);

                    // Redirigez vers la page catalogue.jsp
                    RequestDispatcher dispatcher = request.getRequestDispatcher("catalogue.jsp");
                    dispatcher.forward(request, response);
                } else {

                    request.setAttribute("erreur", "L'authentification a échoué.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // L'authentification a échoué, renvoyez un message d'erreur
                request.setAttribute("erreur", "L'authentification a échoué.");
                // Redirigez vers la page de connexion avec un message d'erreur
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            // Gérer les erreurs de base de données
            e.printStackTrace();
            // Redirigez vers la page de connexion avec un message d'erreur de base de données
            request.setAttribute("erreur", "Erreur de base de données.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }


}