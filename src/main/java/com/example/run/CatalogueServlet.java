package com.example.run;
import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CatalogueServlet", value = "/catalogue")
public class CatalogueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataBaseController controller = new DataBaseController();
        List<Produit> catalogue = controller.getCatalogue();

        request.setAttribute("catalogue", catalogue);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/catalogue.jsp");
        dispatcher.forward(request, response);
    }
}