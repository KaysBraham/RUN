package com.example.run;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    private DataBaseController databaseController; // Injectez votre DatabaseController ici

    public RegisterServlet() {
        // Initialisez databaseController dans le constructeur
        this.databaseController = new DataBaseController();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String motDePasseConfirmation = request.getParameter("motDePasseConfirmation");

        if (motDePasse.equals(motDePasseConfirmation)) {
            // Les mots de passe correspondent, procédez à l'inscription
            boolean enregistrementReussi = databaseController.register(prenom, nom, email, motDePasse);

            if (enregistrementReussi) {
                // Redirigez l'utilisateur vers une page de confirmation d'inscription
                response.sendRedirect("login.jsp");
            } else {
                // L'enregistrement a échoué, renvoyez un message d'erreur
                request.setAttribute("erreur", "L'enregistrement a échoué.");
                // Redirigez l'utilisateur vers la page d'inscription avec un message d'erreur
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            // Les mots de passe ne correspondent pas, renvoyez un message d'erreur
            request.setAttribute("erreur", "Les mots de passe ne correspondent pas.");
            // Redirigez l'utilisateur vers la page d'inscription avec un message d'erreur
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}