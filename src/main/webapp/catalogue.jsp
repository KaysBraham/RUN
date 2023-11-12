<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.run.Produit" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Run</title>
    <link href="https://unpkg.com/tailwindcss@^2.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>

<div class="min-h-screen bg-gray-100 flex flex-col py-20 px-20">

    <h1 class="mb-8  text-4xl font-extrabold leading-none tracking-normal text-gray-900 md:text-6xl md:tracking-tight p-3 justify-center mx-auto">
        <span></span> <span class="block w-full py-2 text-transparent bg-clip-text leading-12 bg-gray-900 lg:inline">Sneakers</span>
    </h1>

    <div class="relative m-3 grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 mx-auto justify-center ">
        <%
            List<Produit> catalogue = (List<Produit>) request.getAttribute("catalogue");
            for (Produit produit : catalogue) {
        %>
        <div class="relative w-44 h-99 bg-white shadow-md rounded-3xl p-2">
            <div class="overflow-x-hidden rounded-2xl relative">
                <a href="produit.jsp?id=<%= produit.getId() %>">
                <img class="h-40 w-40 rounded-2xl object-cover m-0" src="<%= produit.getUrlPicture() %>"></a>

            </div>
            <div class="mt-4 pl-2 mb-2 flex justify-between ">
                <div>
                    <a href="produit.jsp?id=<%= produit.getId() %>">
                    <p class="text-lg font-semibold text-gray-900 mb-0 overflow-hidden max-h-16"><%= produit.getNom() %></p>
                    </a>
                    <p class="text-md text-gray-800 mt-0 overflow-hidden max-h-10"><%= produit.getPrix() %>€</p>
                </div>
                <div class="flex flex-col-reverse mb-1 mr-4 group cursor-pointer">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 group-hover:opacity-70" fill="none" viewBox="0 0 24 24" stroke="gray">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                    </svg>
                </div>
            </div>
        </div>

        <%
            }
        %>




    </div>
</div>


<%@include file="cart.jsp" %>


</body>
</html>