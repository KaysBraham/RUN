<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.run.Produit" %>
<%@ page import="com.example.run.DataBaseController" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Run - Détails du Produit</title>
    <link href="https://unpkg.com/tailwindcss@^2.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<nav class="bg-white fixed w-full z-20 top-0 left-0 border-b border-gray-200">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="#" class="flex items-center">
            <img src="https://i.ibb.co/JtpTTFt/run-black.png" class="h-8 mr-3" alt="Run Logo">
        </a>
    </div>
</nav>

<div class="min-h-screen bg-gray-100 flex flex-col py-20 px-20">

    <div class="relative m-3 flex flex-wrap mx-auto justify-center">
        <%
            String productId = request.getParameter("id");

            if (productId != null) {
                DataBaseController controller = new DataBaseController();
                Produit produit = controller.getProductById(Integer.parseInt(productId));
                request.setAttribute("produit", produit);

                if (produit != null) {
        %>

        <div class="relative max-w-sm min-w-[340px] bg-white shadow-md rounded-3xl p-2 mx-1 my-3 cursor-pointer">
            <div class="overflow-x-hidden rounded-2xl relative">
                <img class="h-40 rounded-2xl w-full object-cover" src="<%= produit.getUrlPicture() %>">
            </div>
            <div class="mt-4 pl-2 mb-2">
                <p class="text-lg font-semibold text-gray-900 mb-0"><%= produit.getNom() %></p>
                <p class="text-md text-gray-800 mt-0"><%= produit.getMarque() %></p>
                <p class="text-md text-gray-800 mt-0"><%= produit.getDescription() %></p>
                <p class="text-md text-gray-800 mt-0"><%= produit.getPrix() %>€</p>
            </div>
        </div>

        <%
        } else {
        %>

        <p>Le produit demandé n'existe pas.</p>

        <%
            }
        } else {
        %>

        <p>Aucun ID de produit fourni.</p>

        <%
            }
        %>
    </div>
</div>

</body>
</html>