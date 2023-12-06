package com.example.run;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GetProductDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdString = request.getParameter("produitId");

        try {
            int productId = Integer.parseInt(productIdString);
            Produit product = new DataBaseController().getProductById(productId);

            // Convertir le produit en JSON
            String productJson = convertToJson(product);

            // Envoyer la réponse JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(productJson);
            out.flush();
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Gérer l'erreur si l'ID du produit n'est pas un nombre valide
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("ID de produit invalide");
        }
    }

    private String convertToJson(Produit product) {
        Gson gson = new GsonBuilder().create();
        String productJson = gson.toJson(product);

        return productJson;
    }
}
