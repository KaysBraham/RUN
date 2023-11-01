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
<nav class="bg-white  fixed w-full z-20 top-0 left-0 border-b border-gray-200 ">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="#" class="flex items-center">
            <img src="https://i.ibb.co/JtpTTFt/run-black.png" class="h-8 mr-3" alt="Run Logo">
        </a>
        <div class="flex md:order-2">
            <button type="button" class="text-white bg-gray-900 hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center mr-3 md:mr-0 ">Se Connecter</button>

        </div>
        <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
            <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white">
                <li>
                    <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0" aria-current="page">Sneakers</a>
                </li>
                <li>
                    <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 ">Bottes</a>
                </li>
                <li>
                    <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 ">Accessoires</a>
                </li>
                <li>
                    <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 ">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="min-h-screen bg-gray-100 flex flex-col py-20 px-20">

    <h1 class="mb-8  text-4xl font-extrabold leading-none tracking-normal text-gray-900 md:text-6xl md:tracking-tight p-3 justify-center mx-auto">
        <span></span> <span class="block w-full py-2 text-transparent bg-clip-text leading-12 bg-gray-900 lg:inline">Sneakers</span>
    </h1>

    <div class="relative m-3 flex flex-wrap mx-auto justify-center">


        <%
            List<Produit> produits = (List<Produit>) request.getAttribute("produits");
            for (Produit produit : produits) {
        %>


        <div class="relative max-w-sm min-w-[340px] bg-white shadow-md rounded-3xl p-2 mx-1 my-3 cursor-pointer">
            <div class="overflow-x-hidden rounded-2xl relative">
                <img class="h-40 rounded-2xl w-full object-cover" src="<%= produit.getUrlPicture() %>">
                <p class="absolute right-2 top-2 bg-white rounded-full p-2 cursor-pointer group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 group-hover:opacity-50 opacity-70" fill="none" viewBox="0 0 24 24" stroke="black">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                    </svg>
                </p>
            </div>
            <div class="mt-4 pl-2 mb-2 flex justify-between ">
                <div>
                    <p class="text-lg font-semibold text-gray-900 mb-0"><%= produit.getNom() %></p>
                    <p class="text-md text-gray-800 mt-0"><%= produit.getPrix() %>€</p>
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



</body>
</html>