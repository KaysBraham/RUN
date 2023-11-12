package com.example.run;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class AdminLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAdminConnected(request)) {
            response.sendRedirect("admin-interface.jsp");
        } else {
            if(isModConnected(request)){
                response.sendRedirect("admin-interface.jsp");
            }else{
                request.getRequestDispatcher("admin-login.jsp").forward(request, response);
            }
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        DataBaseController controller = new DataBaseController();

        if (controller.checkAdminCredentials(email, motDePasse)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminLoggedIn", true);
            response.sendRedirect("admin-interface.jsp");
        } else {
            if(controller.checkModeratorCredentials(email, motDePasse)){
                HttpSession session = request.getSession();
                Moderateur modConnecte = controller.getModeratorByEmail(email);
                session.setAttribute("modLoggedIn", modConnecte);
                response.sendRedirect("admin-interface.jsp");
            }else {
                //On renvoie un message d'erreur si les identifiants sont incorrects
                request.setAttribute("erreur", "L'authentification a échoué");
                request.getRequestDispatcher("admin-login.jsp").forward(request, response);
            }
        }
    }

    //Méthode pour vérifier si l'admin est connecté
    private boolean isAdminConnected(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("adminLoggedIn") != null;
    }

    //Méthode pour vérifier si un modérateur est connecté
    private boolean isModConnected(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("modLoggedIn") != null;
    }
}
