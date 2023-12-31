<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.run.DataBaseController" %>
<%@ page import="com.example.run.Produit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.run.Moderateur" %>

<%
    Object obj = session.getAttribute("modLoggedIn");
    // Récupérer les droits du modérateur connecté depuis la session
    boolean ajouterProduit = true;
    boolean supprimerProduit = true;
    boolean modifierProduit = true;
    if (obj != null && obj instanceof Moderateur) {
        Moderateur modConnecte = (Moderateur) obj;
        ajouterProduit = modConnecte.isAjouterProduit();
        supprimerProduit = modConnecte.isSupprimerProduit();
        modifierProduit = modConnecte.isModifierProduit();
    }

    DataBaseController controller = new DataBaseController();
    // Récupérer le catalogue directement depuis le contrôleur
    List<Produit> catalogue = controller.getCatalogue();
    // Récupérer les modérateurs directement depuis le contrôleur
    List<Moderateur> moderateurs = controller.getModerateurs();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RUN</title>
        <link href="https://unpkg.com/tailwindcss@^2.0/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="flex items-center justify-center">
        <div class="min-h-screen fixed left-0 top-0 bottom-0 p-4 w-60 z-50 shadow-xl shadow-blue-gray-900/5 flex flex-col bg-clip-border rounded-r-xl bg-white text-gray-700 h-[calc(100vh-2rem)] ">
            <a href="admin-interface.jsp" class="flex items-center mt-4">
                <img src="https://i.ibb.co/JtpTTFt/run-black.png" class="h-8 mr-3" alt="Run Logo">
            </a>
            <nav class="flex flex-col gap-1 min-w-[240px] p-2 font-sans text-base font-normal text-gray-700 mt-4">
                <div onclick="toggleDropdown()" role="button" tabindex="0" class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                    <div class="grid place-items-center mr-4">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="h-5 w-5">
                            <path fill-rule="evenodd" d="M7.5 6v.75H5.513c-.96 0-1.764.724-1.865 1.679l-1.263 12A1.875 1.875 0 004.25 22.5h15.5a1.875 1.875 0 001.865-2.071l-1.263-12a1.875 1.875 0 00-1.865-1.679H16.5V6a4.5 4.5 0 10-9 0zM12 3a3 3 0 00-3 3v.75h6V6a3 3 0 00-3-3zm-3 8.25a3 3 0 106 0v-.75a.75.75 0 011.5 0v.75a4.5 4.5 0 11-9 0v-.75a.75.75 0 011.5 0v.75z" clip-rule="evenodd"></path>
                        </svg>
                    </div>
                    Produits
                    <svg id="dropdownArrow" class="w-3 h-3 text-gray-700 ml-auto m-1 dark:text-white transition-transform ease-in-out duration-300 transform" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 8">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7 7.674 1.3a.91.91 0 0 0-1.348 0L1 7"/>
                    </svg>
                </div>
                <div id="dropdownContent" class="hidden">
                    <% if(ajouterProduit){ %>
                    <a onclick="showDiv('div2')" class="flex items-center w-full text-start leading-tight transition-all rounded-lg p-3 text-gray-800 hover:bg-gray-200">
                        <div class="grid place-items-center mr-4">
                            <svg class="w-4 h-4 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.546.5a9.5 9.5 0 1 0 9.5 9.5 9.51 9.51 0 0 0-9.5-9.5ZM13.788 11h-3.242v3.242a1 1 0 1 1-2 0V11H5.304a1 1 0 0 1 0-2h3.242V5.758a1 1 0 0 1 2 0V9h3.242a1 1 0 1 1 0 2Z"/>
                            </svg>
                        </div>
                        Ajouter
                    </a>
                    <% }
                    if(supprimerProduit){%>
                    <a onclick="showDiv('div3')" class="flex items-center w-full text-start leading-tight transition-all rounded-lg p-3 text-gray-800 hover:bg-gray-200">
                        <div class="grid place-items-center mr-4">
                            <svg class="w-4 h-4 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
                            </svg>
                        </div>
                        Supprimer
                    </a>
                    <% }
                    if(modifierProduit){%>
                    <a onclick="showDiv('div4')" class="flex items-center w-full text-start leading-tight transition-all rounded-lg p-3 text-gray-800 hover:bg-gray-200">
                        <div class="grid place-items-center mr-4">
                            <svg class="w-4 h-4 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="m13.835 7.578-.005.007-7.137 7.137 2.139 2.138 7.143-7.142-2.14-2.14Zm-10.696 3.59 2.139 2.14 7.138-7.137.007-.005-2.141-2.141-7.143 7.143Zm1.433 4.261L2 12.852.051 18.684a1 1 0 0 0 1.265 1.264L7.147 18l-2.575-2.571Zm14.249-14.25a4.03 4.03 0 0 0-5.693 0L11.7 2.611 17.389 8.3l1.432-1.432a4.029 4.029 0 0 0 0-5.689Z"/>
                            </svg>
                        </div>
                       Modifier
                    </a>
                    <%}%>
                </div>
                <% if(session.getAttribute("adminLoggedIn")!= null){

                %>
                <div onclick="toggleDropdown2()" role="button" tabindex="0" class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-gray-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                    <div class="grid place-items-center mr-4">
                        <svg class="w-5 h-5 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 20">
                            <path d="M16 0H4a2 2 0 0 0-2 2v1H1a1 1 0 0 0 0 2h1v2H1a1 1 0 0 0 0 2h1v2H1a1 1 0 0 0 0 2h1v2H1a1 1 0 0 0 0 2h1v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2Zm-5.5 4.5a3 3 0 1 1 0 6 3 3 0 0 1 0-6ZM13.929 17H7.071a.5.5 0 0 1-.5-.5 3.935 3.935 0 1 1 7.858 0 .5.5 0 0 1-.5.5Z"/>
                        </svg>
                    </div>
                    Modérateurs
                    <svg id="dropdownArrow2" class="w-3 h-3 text-gray-700 ml-auto m-1 dark:text-white transition-transform ease-in-out duration-300 transform" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 8">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7 7.674 1.3a.91.91 0 0 0-1.348 0L1 7"/>
                    </svg>
                </div>
                <%}%>
                <div id="dropdownContent2" class="hidden" >
                    <a onclick="showDiv('div5')" class="flex items-center w-full text-start leading-tight transition-all rounded-lg p-3 text-gray-800 hover:bg-gray-200">
                        <div class="grid place-items-center mr-4">
                            <svg class="w-4 h-4 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.546.5a9.5 9.5 0 1 0 9.5 9.5 9.51 9.51 0 0 0-9.5-9.5ZM13.788 11h-3.242v3.242a1 1 0 1 1-2 0V11H5.304a1 1 0 0 1 0-2h3.242V5.758a1 1 0 0 1 2 0V9h3.242a1 1 0 1 1 0 2Z"/>
                            </svg>
                        </div>
                        Ajouter
                    </a>
                    <a onclick="showDiv('div6')" class="flex items-center w-full text-start leading-tight transition-all rounded-lg p-3 text-gray-800 hover:bg-gray-200">
                        <div class="grid place-items-center mr-4">
                            <svg class="w-4 h-4 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
                            </svg>
                        </div>
                        Supprimer
                    </a>
                    <a onclick="showDiv('div7')" class="flex items-center w-full text-start leading-tight transition-all rounded-lg p-3 text-gray-800 hover:bg-gray-200">
                        <div class="grid place-items-center mr-4">
                            <svg class="w-4 h-4 text-gray-700 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <g stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                    <path d="M19 11V9a1 1 0 0 0-1-1h-.757l-.707-1.707.535-.536a1 1 0 0 0 0-1.414l-1.414-1.414a1 1 0 0 0-1.414 0l-.536.535L12 2.757V2a1 1 0 0 0-1-1H9a1 1 0 0 0-1 1v.757l-1.707.707-.536-.535a1 1 0 0 0-1.414 0L2.929 4.343a1 1 0 0 0 0 1.414l.536.536L2.757 8H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h.757l.707 1.707-.535.536a1 1 0 0 0 0 1.414l1.414 1.414a1 1 0 0 0 1.414 0l.536-.535L8 17.243V18a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-.757l1.707-.708.536.536a1 1 0 0 0 1.414 0l1.414-1.414a1 1 0 0 0 0-1.414l-.535-.536.707-1.707H18a1 1 0 0 0 1-1Z"/>
                                    <path d="M10 13a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
                                </g>
                            </svg>
                        </div>
                        Permissions
                    </a>
                </div>
                <div id="Logout" role="button" tabindex="0" class="flex items-center w-full p-3 rounded-lg text-start leading-tight transition-all hover:bg-blue-50 hover:bg-opacity-80 focus:bg-blue-50 focus:bg-opacity-80 active:bg-blue-50 active:bg-opacity-80 hover:text-blue-900 focus:text-blue-900 active:text-blue-900 outline-none">
                    <div class="grid place-items-center mr-4">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="h-5 w-5">
                            <path fill-rule="evenodd" d="M12 2.25a.75.75 0 01.75.75v9a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM6.166 5.106a.75.75 0 010 1.06 8.25 8.25 0 1011.668 0 .75.75 0 111.06-1.06c3.808 3.807 3.808 9.98 0 13.788-3.807 3.808-9.98 3.808-13.788 0-3.808-3.807-3.808-9.98 0-13.788a.75.75 0 011.06 0z" clip-rule="evenodd"></path>
                        </svg>
                    </div>
                    Déconnexion
                </div>
            </nav>
        </div>
        <div class="flex items-center justify-center h-screen w-screen bg-gray-500 relative overflow-hidden">
            <div class="absolute w-60 h-60 rounded-xl bg-gray-900 -top-5 left-44 z-0 transform rotate-45 hidden md:block"></div>
            <div class="absolute w-48 h-48 rounded-xl bg-gray-900 -bottom-6 -right-10 z-0 transform rotate-12 hidden md:block"></div>
            <div id="div1" class="content text-center ml-24 z-10 opacity-0 transition-opacity duration-500">
                <img src="https://i.ibb.co/JtpTTFt/run-black.png" class="h-42 mr-3" alt="Run Logo">
            </div>
            <div id="div2" class="content hidden opacity-0 z-10 transition-opacity duration-500 max-w-xl w-full mt-18 ml-32" >
                <form action="AddProductServlet" method="post" class="rounded-md mx-auto bg-white p-8 shadow-md grid grid-cols-2 gap-4">
                    <div class="col-span-2 mb-6">
                        <h2 class="text-2xl font-bold mb-4">Ajouter un Produit</h2>
                    </div>
                    <div class="mb-6">
                        <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom du Produit</label>
                        <input type="text" id="nom" name="nom" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6">
                        <label for="prix" class="block text-gray-700 text-sm font-bold mb-2">Prix du Produit</label>
                        <input type="number" id="prix" name="prix" min="0" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6">
                        <label for="marque" class="block text-gray-700 text-sm font-bold mb-2">Marque du Produit</label>
                        <input type="text" id="marque" name="marque" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6 col-span-1">
                        <label for="urlPicture" class="block text-gray-700 text-sm font-bold mb-2">Lien de l'Image du Produit</label>
                        <input type="url" id="urlPicture" name="urlPicture" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6">
                        <label for="description" class="block text-gray-700 text-sm font-bold mb-2">Description</label>
                        <textarea id="description" name="description" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required></textarea>
                    </div>
                    <div class="mb-6 col-span-1">
                        <label for="motsCles" class="block text-gray-700 text-sm font-bold mb-2">Mots Clés</label>
                        <input type="text" id="motsCles" name="motsCles" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="col-span-2">
                        <button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md">Ajouter le Produit</button>
                    </div>
                </form>
            </div>
            <div id="div3" class="content hidden opacity-0 z-10 transition-opacity duration-500 max-w-xl w-full mt-6 ml-24">
                <form action="DeleteProductServlet" method="post" class="rounded-md mx-auto bg-white p-8 shadow-md">
                    <h2 class="text-2xl font-bold mb-6">Supprimer un Produit</h2>
                    <div class="mb-6">
                        <label for="produitASupprimer" class="block text-gray-700 text-sm font-bold mb-2">Produit à Supprimer</label>
                        <select id="produitASupprimer" name="produitASupprimer" class="w-full h-1/4 px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                            <option value="" selected disabled>Sélectionnez un produit</option>
                            <% for (Produit product : catalogue) { %>
                            <option value="<%= product.getId() %>"><%= product.getNom() %></option>
                            <% } %>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-red-500 text-white p-3 rounded-md">Supprimer le Produit</button>
                </form>
            </div>
            <div id="div4" class="content hidden opacity-0 z-10 transition-opacity duration-500 my-8 max-w-xl w-full mt-8 ml-24">
                <form action="EditProductServlet" method="post" id="editProductForm" class="rounded-md mx-auto bg-white p-8 shadow-md">
                    <h2 class="text-2xl font-bold mb-6">Modifier un Produit</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="mb-6">
                            <label for="produitAModifier" class="block text-gray-700 text-sm font-bold mb-2">Produit à Modifier</label>
                            <select onchange="chargerProduit()" id="produitAModifier" name="produitAModifier" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                                <option value="" selected disabled>Sélectionnez un produit</option>
                                <% for (Produit product : catalogue) { %>
                                <option value="<%= product.getId() %>"><%= product.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label for="nomModif" class="block text-gray-700 text-sm font-bold mb-2">Nom du Produit</label>
                            <input type="text" id="nomModif" name="nomModif" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                        </div>
                        <div class="mb-6">
                            <label for="prixModif" class="block text-gray-700 text-sm font-bold mb-2">Prix du Produit</label>
                            <input type="number" id="prixModif" name="prixModif" min="0" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                        </div>
                        <div class="mb-6">
                            <label for="marqueModif" class="block text-gray-700 text-sm font-bold mb-2">Marque du Produit</label>
                            <input type="text" id="marqueModif" name="marqueModif" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                        </div>
                        <div class="mb-6">
                            <label for="descriptionModif" class="block text-gray-700 text-sm font-bold mb-2">Description</label>
                            <textarea id="descriptionModif" name="descriptionModif" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required></textarea>
                        </div>
                        <div class="mb-6">
                            <label for="urlPictureModif" class="block text-gray-700 text-sm font-bold mb-2">URL de l'Image</label>
                            <input type="url" id="urlPictureModif" name="urlPictureModif" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                        </div>
                        <div class="mb-6">
                            <label for="motsClesModif" class="block text-gray-700 text-sm font-bold mb-2">Mots Clés</label>
                            <input type="text" id="motsClesModif" name="motsCles" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                        </div>
                    </div>

                    <button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md">Modifier le Produit</button>
                </form>
            </div>
            <div id="div5" class="content hidden opacity-0 z-10 transition-opacity duration-500 max-w-xl w-full mt-18 ml-32" >
                <form action="AddModeratorServlet" method="post" class="rounded-md mx-auto bg-white p-8 shadow-md grid grid-cols-2 gap-4">
                    <div class="col-span-2 mb-6">
                        <h2 class="text-2xl font-bold mb-4">Ajouter un Modérateur</h2>
                    </div>
                    <div class="mb-6">
                        <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom</label>
                        <input type="text" id="nomMod" name="nomMod" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6">
                        <label for="prix" class="block text-gray-700 text-sm font-bold mb-2">Prénom</label>
                        <input type="text" id="prenom" name="prenom" min="0" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6">
                        <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email</label>
                        <input type="email" id="email" name="email" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="mb-6 col-span-1">
                        <label for="motDePasse" class="block text-gray-700 text-sm font-bold mb-2">Mot de Passe</label>
                        <input type="password" id="motDePasse" name="motDePasse" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                    </div>
                    <div class="col-span-2 mb-6">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Droits du Modérateur</label>
                        <div class="flex space-x-4">
                            <div>
                                <input type="checkbox" id="ajoutProduit" name="ajoutProduit" class="form-checkbox" />
                                <label for="ajoutProduit" class="ml-2">Ajouter produit</label>
                            </div>
                            <div>
                                <input type="checkbox" id="suppressionProduit" name="suppressionProduit" class="form-checkbox" />
                                <label for="suppressionProduit" class="ml-2">Supprimer produit</label>
                            </div>
                            <div>
                                <input type="checkbox" id="modificationProduit" name="modificationProduit" class="form-checkbox" />
                                <label for="modificationProduit" class="ml-2">Modifier produit</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-2">
                        <button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md">Ajouter le Modérateur</button>
                    </div>
                </form>
            </div>
            <div id="div6" class="content hidden opacity-0 z-10 transition-opacity duration-500 max-w-xl w-full mt-6 ml-24">
                <form action="DeleteModeratorServlet" method="post" class="rounded-md mx-auto bg-white p-8 shadow-md">
                    <h2 class="text-2xl font-bold mb-6">Supprimer un Modérateur</h2>
                    <div class="mb-6">
                        <label for="moderateurASupprimer" class="block text-gray-700 text-sm font-bold mb-2">Modérateur à Supprimer</label>
                        <select id="moderateurASupprimer" name="moderateurASupprimer" class="w-full h-1/4 px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                            <option value="" selected disabled>Sélectionnez un modérateur</option>
                            <% for (Moderateur moderateur : moderateurs) { %>
                            <option value="<%= moderateur.getId() %>"><p><%= moderateur.getPrenom()%> <%= moderateur.getNom() %></p></option>
                            <% } %>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-red-500 text-white p-3 rounded-md">Supprimer le Modérateur</button>
                </form>
            </div>
            <div id="div7" class="content hidden opacity-0 z-10 transition-opacity duration-500 my-8 max-w-xl w-full mt-8 ml-24">
                <form action="EditModeratorServlet" method="post" id="editModeratorRightsForm" class="rounded-md mx-auto bg-white p-8 shadow-md">
                    <h2 class="text-2xl font-bold mb-6">Modifier les Permissions d'un Modérateur</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="mb-6">
                            <label for="modAModifier" class="block text-gray-700 text-sm font-bold mb-2">Modérateur à Modifier</label>
                            <select onchange="chargerModerateur()" id="modAModifier" name="modAModifier" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500" required>
                                <option value="" selected disabled>Sélectionnez un modérateur</option>
                                <% for (Moderateur moderateur : moderateurs) { %>
                                <option value="<%= moderateur.getId() %>"><%= moderateur.getNom() %> <%= moderateur.getPrenom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Droits du Modérateur</label>
                            <div class="flex items-center space-x-4">
                                <div>
                                    <input type="checkbox" id="ajoutProduitModif" name="droits[]" class="form-checkbox h-5 w-5 text-blue-500">
                                    <label for="ajoutProduitModif" class="text-gray-700">Ajouter Produit</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="suppressionProduitModif" name="droits[]" class="form-checkbox h-5 w-5 text-blue-500">
                                    <label for="suppressionProduitModif" class="text-gray-700">Supprimer Produit</label>
                                </div>
                                <div>
                                    <input type="checkbox" id="modificationProduitModif" name="droits[]" class="form-checkbox h-5 w-5 text-blue-500">
                                    <label for="modificationProduitModif" class="text-gray-700">Modifier Produit</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-2">
                        <button type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md">Modifier les Droits</button>
                    </div>
                </form>
            </div>


            <div class="w-40 h-40 absolute bg-gray-900 rounded-full top-0 right-12 hidden md:block"></div>
            <div class="w-20 h-40 absolute bg-gray-900 rounded-full bottom-20 left-56 transform rotate-45 hidden md:block"></div>
        </div>

    <script>
        function toggleDropdown() {
            var dropdown = document.getElementById("dropdownContent");
            dropdown.classList.toggle("hidden");

            var dropdownArrow = document.getElementById("dropdownArrow");
            dropdownArrow.classList.toggle("rotate-180");
        }
        function toggleDropdown2() {
            var dropdown = document.getElementById("dropdownContent2");
            dropdown.classList.toggle("hidden");

            var dropdownArrow = document.getElementById("dropdownArrow2");
            dropdownArrow.classList.toggle("rotate-180");
        }
        document.getElementById('Logout').addEventListener('click', function() {
            window.location.href = 'AdminLogoutServlet';
        })

        showDiv('div1');

        function showDiv(divId) {
            var allDivs = document.querySelectorAll('.content');

            allDivs.forEach(function(div) {
                div.classList.add('hidden');
                div.style.opacity = 0;
            });

            var selectedDiv = document.getElementById(divId);
            selectedDiv.classList.remove('hidden');

            setTimeout(function() {
                selectedDiv.style.opacity = 1;
            }, 1);
        }

        function chargerProduit() {
            var produitId = document.getElementById("produitAModifier").value;

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var produit = JSON.parse(xhr.responseText);

                        document.getElementById("nomModif").value = produit.nom;
                        document.getElementById("prixModif").value = produit.prix;
                        document.getElementById("marqueModif").value = produit.marque;
                        document.getElementById("descriptionModif").value = produit.description;
                        document.getElementById("urlPictureModif").value = produit.urlPicture;
                        document.getElementById("motsClesModif").value = produit.motsCles;
                    } else {
                        console.error("Erreur lors de la recuperation des détails du produit");
                    }
                }
            };

            xhr.open("GET", "GetProductDetailsServlet?produitId=" + produitId, true);
            xhr.send();
        }

        function chargerModerateur() {
            var moderateurId = document.getElementById("modAModifier").value;

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var moderateur = JSON.parse(xhr.responseText);

                        document.getElementById("ajoutProduitModif").checked = moderateur.ajouterProduit;
                        document.getElementById("suppressionProduitModif").checked = moderateur.supprimerProduit;
                        document.getElementById("modificationProduitModif").checked = moderateur.modifierProduit;
                    } else {
                        console.error("Erreur lors de la récupération des détails du modérateur");
                    }
                }
            };

            xhr.open("GET", "GetModeratorDetailsServlet?moderateurId=" + moderateurId, true);
            xhr.send();
        }

        document.addEventListener("DOMContentLoaded", function () {
            // Récupérer les cases à cocher
            var checkboxAjoutProduit = document.getElementById("ajoutProduit");
            var checkboxSuppressionProduit = document.getElementById("suppressionProduit");
            var checkboxModificationProduit = document.getElementById("modificationProduit");

            checkboxAjoutProduit.addEventListener("change", function () {
                checkboxAjoutProduit.value = checkboxAjoutProduit.checked;
            });

            checkboxSuppressionProduit.addEventListener("change", function () {
                checkboxSuppressionProduit.value = checkboxSuppressionProduit.checked;
            });

            checkboxModificationProduit.addEventListener("change", function () {
                checkboxModificationProduit.value = checkboxModificationProduit.checked;
            });
        });

        document.addEventListener("DOMContentLoaded", function () {
            // Récupérer les cases à cocher
            var checkboxAjoutProduitModif = document.getElementById("ajoutProduitModif");
            var checkboxSuppressionProduitModif = document.getElementById("suppressionProduitModif");
            var checkboxModificationProduitModif = document.getElementById("modificationProduitModif");

            checkboxAjoutProduitModif.addEventListener("change", function () {
                checkboxAjoutProduitModif.value = checkboxAjoutProduitModif.checked;
            });

            checkboxSuppressionProduitModif.addEventListener("change", function () {
                checkboxSuppressionProduitModif.value = checkboxSuppressionProduitModif.checked;
            });

            checkboxModificationProduitModif.addEventListener("change", function () {
                checkboxModificationProduitModif.value = checkboxModificationProduitModif.checked;
            });
        });
    </script>
    </body>
</html>