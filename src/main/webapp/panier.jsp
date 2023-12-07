<%@ page import="com.example.run.Panier" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.run.DataBaseController" %>
<%@ page import="com.example.run.Produit" %>
<%@ page import="com.example.run.Client" %>
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
  Panier panier = (Panier) session.getAttribute("panier");
  DataBaseController controller2 = new DataBaseController();
  boolean isEmpty = false;
  boolean isConnected = false;
  Client client = null;

  if (panier == null) {
    panier = new Panier();
    session.setAttribute("panier", panier);
  }



  if (panier.getTailleDuPanier() == 0){
    isEmpty = true;
  };


  Integer userID = (Integer) session.getAttribute("userID");
  if (userID != null && userID != -1) {
    isConnected = true;
    client = controller2.getClientById(userID);
  }

%>


<div class=" justify-center items-center pt-24 bg-white px-2 pt-48">

  <h1 class="mb-9 flex justify-center items-center text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl text-white">Votre panier</h1>

  <div
          class="flex justify-center items-center pt-20 pr-11 mx-auto grid max-w-6xl grid-cols-1 gap-4 p-6 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-2">

    <div
            class=" w-full max-w-md p-4  border  rounded-lg shadow sm:p-8 bg-gray-800 border-gray-700 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300">
      <div class="flex items-center justify-between mb-4">
        <h5 class="text-xl font-bold leading-none  text-white">Produits</h5>

      </div>


      <div>

        <% if(!isEmpty){%>
        <div class="flow-root">
          <ul role="list" class="divide-y divide-gray-700">
            <%
              int total = 0;

              for (Map.Entry<Integer, Integer> entry : panier.getContenu().entrySet()) {
                int idVariante = entry.getKey();
                int quantite = entry.getValue();


                int idProduit = controller2.getProductIdFromVarianteId(idVariante);
                int pointure = controller2.getPointureFromVarianteId(idVariante);
                String urlPicture = controller2.getImageUrlFromProductId(idProduit);

                //int taille = controller
                Produit produit2 = controller2.getProductById(idProduit);

                if (produit2 != null) {

                  int prix = quantite * Integer.parseInt(produit2.getPrix());
                  total += prix; %>


            <li class="py-3 sm:py-4">
              <div class="flex items-center space-x-4">
                <div class="flex-shrink-0">
                  <img class="w-8 h-8 rounded-xl" src="<%= produit2.getUrlPicture() %>" alt="S9 " />
                </div>
                <div class="flex-1 min-w-0">
                  <p class="text-sm font-semibold  truncate text-white">
                    <%= produit2.getNom() %>
                  </p>
                  <p class="text-sm truncate text-gray-400">
                    Pointure : <%= pointure %>, QTE : <%= quantite %>
                  </p>
                </div>
                <div class="inline-flex items-center text-base font-semibold text-white">
                  <%= prix %> Euros
                </div>
              </div>
            </li>




            <% }} %>
            <li class="py-3 sm:py-4">
              <div class="flex items-center space-x-4">
                <div class="flex-shrink-0">
                </div>
                <div class="flex-1 min-w-0">
                  <p class="text-sm font-semibold  truncate text-white">
                    Total du panier
                  </p>
                </div>
                <div class="inline-flex items-center text-base font-semibold text-white">
                  <%= total %> Euros
                </div>
              </div>
            </li>
          </ul>
        </div>





        <div class="flex justify-center items-center ">
          <button
                  <% if (isConnected) { %>
                  onClick="validerPanier()"
                  <% } else { %>
                  onClick="goToConnexion()"
                  <% } %>
                  class="m-2 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center "
          >
            Commander
          </button>
          <button onClick="viderPanier()"
                  class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">Supprimer
            le panier</button>
        </div>

      </div>



      <% } %>




      <% if(isEmpty){ %>
      <div>
        <div class="flow-root">

          <h1 class="text-white ">Votre panier est vide!</h1>
        </div>




        <div class="flex justify-center items-center ">
          <a href="catalogue">
            <button
                    class="mt-6 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">Decouvrir
              le catalogue</button>
          </a>
        </div>
      </div>
    </div>

    <% } %>


  </div>






  <% if(isConnected){ %>
  <div
          class=" w-full max-w-md p-4  border  rounded-lg shadow sm:p-8 bg-gray-800 border-gray-700 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300">
    <div class="flex items-center justify-between mb-4">
      <h5 class="text-xl font-bold leading-none text-white">Informations personnelles</h5>

    </div>
    <div class="flow-root text-white">
      <div class="flex-1 min-w-0">
        <p class="text-sm font-medium  truncate text-white">
          <%= client.getNom() %> <%= client.getPrenom() %>
        </p>
        <p class="text-sm truncate text-gray-400">
          E-mail : <%= client.getEmail() %>
        </p>
        <p class="text-sm truncate text-gray-400">
          ID : <%= client.getId() %>
        </p>
        <p class="text-sm truncate text-gray-400">
          Solde fidelite : <%= client.getSoldeFidelite() %>
        </p>
      </div>
    </div>
  </div>

  <% } %>

  <% if(!isConnected){ %>
  <div
          class=" w-full max-w-md p-4  border  rounded-lg shadow sm:p-8 bg-gray-800 border-gray-700 shadow-lg hover:shadow-xl hover:transform hover:scale-105 duration-300">
    <div class="flex items-center justify-between mb-4">


    </div>
    <div class="flow-root">

      <h1 class="text-white ">Informations indisponibles. Veuillez vous connecter</h1>
    </div>




    <div class="flex justify-center items-center ">
      <a href="login.jsp">
        <button
                class="mt-6 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">Se connecter</button>
      </a>
    </div>
  </div>

  <% } %>




</div>
</div>




</div>


<script>

  function goToConnexion(){
    window.location.href = 'login.jsp';
  }

  function validerPanier(){

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'CreerCommandeServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        location.reload();
      } else {
        console.error('Erreur lors de la suppression du panier');
      }

    };
    xhr.send();

    viderPanierApresCommande();

  }

  function viderPanier(){

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'ViderPanierServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        location.reload();
      } else {
        console.error('Erreur lors de la suppression du panier');
      }

    };
    xhr.send();

  }


  function viderPanierApresCommande() {

    // On vide le panier une fois qu'on a validé la commande

    var xhr2 = new XMLHttpRequest();
    xhr2.open('POST', 'ViderPanierServlet', true);
    xhr2.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr2.onreadystatechange = function() {
      if (xhr2.readyState === 4 && xhr2.status === 200) {
        window.location.href = 'profil.jsp';
      } else {
        console.error('Erreur lors de la suppression du panier');
      }

    };
    xhr2.send();


  }



</script>


</body>
</html>