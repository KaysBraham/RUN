<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.run.Produit" %>
<%@ page import="com.example.run.VarianteProduit" %>
<%@ page import="com.example.run.DataBaseController" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Run - Détails du Produit</title>
    <link href="https://unpkg.com/tailwindcss@^2.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>


        <%
            String productId = request.getParameter("id");

            if (productId != null) {
                DataBaseController controller = new DataBaseController();
                Produit produit = controller.getProductById(Integer.parseInt(productId));
                List<VarianteProduit> varianteProduit = controller.getVariantesByProductId(Integer.parseInt(productId));
                request.setAttribute("produit", produit);
                request.setAttribute("varianteProduit", varianteProduit);

                if (produit != null) {
        %>




        <div class="bg-gray-500 lg:h-screen">
        <section class="text-gray-700 overflow-hidden bg-gray-100 lg:h-screen">
            <div class="container px-5 py-24 mx-auto">
                <div class="lg:w-4/5 mx-auto flex flex-wrap">
                    <img alt="ecommerce" class="lg:w-1/2 w-full object-cover object-center rounded-2xl border border-gray-200" src="<%= produit.getUrlPicture() %>">
                    <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
                        <h2 class="text-sm title-font text-gray-500 tracking-widest"><%= produit.getMarque() %></h2>
                        <h1 class="py-2 text-transparent bg-clip-text leading-12 bg-gray-900 lg:inline text-3xl"><%= produit.getNom() %></h1>
                        <div class="flex mb-4">
              <span class="flex items-center">
                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-gray-900" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                </svg>
                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-gray-900" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                </svg>
                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-gray-900" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                </svg>
                <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-gray-900" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                </svg>
                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 text-gray-900" viewBox="0 0 24 24">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                </svg>
                <span class="text-gray-600 ml-3">4 Avis</span>
              </span>

                        </div>
                        <p class="leading-relaxed"><%= produit.getDescription() %></p>
                        <div class="flex mt-6 items-center pb-5 border-b-2 border-gray-200 mb-5">


                            <div class="flex items-center">
                                <% if (varianteProduit == null) {%>
                                <span class="mr-3">Aucune pointure disponible | Article en rupture de stock </span>
                                <%} else { %>
                                <span class="mr-3">Pointures disponibles : </span>
                                <div class="relative">
                                    <select class="rounded border appearance-none border-gray-400 py-2 focus:outline-none focus:border-gray-900 text-base pl-3 pr-10">
                                        <% for (int i = 0; i < varianteProduit.size(); i++) { %>
                                            <option> <%= varianteProduit.get(i).getPointure() %>  (Stock : <%= varianteProduit.get(i).getStock() %><</option>
                                        <%}%>
                                    </select>
                                    <span class="absolute right-0 top-0 h-full w-10 text-center text-gray-600 pointer-events-none flex items-center justify-center">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4" viewBox="0 0 24 24">
                <path d="M6 9l6 6 6-6"></path>
            </svg>
        </span>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <div class="flex">
                            <span class="title-font font-medium text-2xl text-gray-900"><%= produit.getPrix() %>€</span>
                            <button class="flex ml-auto text-white bg-gray-900 border-0 py-2 px-6 focus:outline-none hover:bg-gray-700 rounded">Ajouter au panier</button>
                            <button class="rounded-full w-10 h-10 bg-gray-200 p-0 border-0 inline-flex items-center justify-center text-gray-500 ml-4">
                                <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                                    <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

            <%@include file="cart.jsp" %>


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


</body>
</html>