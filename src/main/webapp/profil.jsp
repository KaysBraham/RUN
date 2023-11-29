<%@ page import="com.example.run.Panier" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.run.DataBaseController" %>
<%@ page import="com.example.run.Produit" %>
<%@ page import="com.example.run.Client" %>
<%@ page import="com.example.run.Commande" %>
<%@ page import="com.example.run.DetailsCommande" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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

<%
    DataBaseController controller2 = new DataBaseController();
    boolean isConnected = false;
    Client client = new Client();
    List<Commande> commandes = new ArrayList<Commande>();

    Integer userID = (Integer) session.getAttribute("userID");
    if (userID != null && userID != -1) {
        isConnected = true;
        client = controller2.getClientById(userID);
    }


    if (isConnected) {

        commandes = controller2.getCommandesByClientId(userID);
    }




%>




<div class=" justify-center items-center pt-48 bg-white px-2">

    <h1 class="mb-9 flex justify-center items-center text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl text-black">Votre profil</h1>

    <section class="py-10 bg-white">
        <div class="mx-auto grid max-w-6xl  grid-cols-1 gap-6 p-6 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-2 ">


            <div>
                <div class=" w-full max-w-md p-4  border  rounded-lg shadow sm:p-8 bg-gray-800 border-gray-700 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300">
                    <div class="flex items-center justify-between mb-4">
                        <h5 class="text-xl font-bold leading-none text-white">Vos informations personnelles</h5>

                    </div>
                    <div class="flow-root text-white">
                        <div class="flex-1 min-w-0">
                            <p class="text-sm font-medium  truncate text-white">
                                <%= client.getNom()%> <%= client.getPrenom() %>
                            </p>
                            <p class="text-sm truncate text-gray-400">
                                E-mail : <%= client.getEmail() %>
                            </p>
                            <p class="text-sm truncate text-gray-400">
                                ID client : <%= client.getId() %>
                            </p>
                            <p class="text-sm truncate text-gray-400">
                                Solde fidelite : <%= client.getSoldeFidelite() %>
                            </p>


                        </div>
                    </div>
                </div>
            </div>




            <div class=" w-full max-w-md p-4  border  rounded-lg shadow sm:p-8 bg-gray-800 border-gray-700 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300">
                <div class="flex items-center justify-between mb-4">
                    <h5 class="text-xl font-bold leading-none text-white">Vos derniers achats</h5>

                </div>

                <div class="flow-root">
                    <ul role="list" class="divide-y divide-gray-700">

                        <% for(Commande commande : commandes){

                            int idCommande = commande.getIdCommande();
                            List<DetailsCommande> detailsCommandes;
                            detailsCommandes = controller2.getDetailsCommandeByCommandeId(idCommande);

                            for(DetailsCommande detailsCommande : detailsCommandes){

                                Produit produit = controller2.getProductById(detailsCommande.getIdProduit());
                                int price = Integer.parseInt(produit.getPrix()) * detailsCommande.getQuantite();
                                int pointure = controller2.getPointureFromVarianteId(detailsCommande.getIdVariante());
                                String statut = commande.getStatut();



                        %>


                        <li class="py-3 sm:py-4">
                            <div class="flex items-center space-x-4">
                                <div class="flex-shrink-0">
                                    <img class="w-8 h-8 rounded-xl" src="<%= produit.getUrlPicture() %>" alt="S9 " />
                                </div>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-medium  truncate text-white">
                                        <%= produit.getNom() %>
                                    </p>
                                    <p class="text-sm truncate text-gray-400">
                                        Pointure: <%= pointure %>, QTE: <%= detailsCommande.getQuantite() %>
                                    </p>
                                    <p class="text-sm truncate text-gray-400">
                                        Statut: <%= statut %>
                                    </p>
                                    <p class="text-sm truncate text-gray-400">
                                        Numero de commande: <%= idCommande %>
                                    </p>
                                </div>
                                <div class="inline-flex items-center text-base font-semibold text-red-600">
                                    -<%= price %> Euros
                                </div>
                            </div>

                            <% }} %>
                        </li>


                    </ul>
                </div>
            </div>




        </div>
    </section>
</div>




<script>




</script>


</body>
</html>