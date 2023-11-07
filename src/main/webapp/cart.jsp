<%@ page import="com.example.run.Panier" %>
<%@ page import="java.util.Map" %>
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

<%
  Panier panier = (Panier) session.getAttribute("panier");

  if (panier == null) {
    panier = new Panier();
    session.setAttribute("panier", panier);
  }
%>



<div data-dial-init class="fixed right-6 bottom-6 group">

  <button type="button" onClick="afficherPanier()" data-dial-toggle="speed-dial-menu-dropdown-alternative-square" aria-controls="speed-dial-menu-dropdown-alternative-square" aria-expanded="false" class="flex items-center justify-center ml-auto text-white bg-gray-900 rounded-lg w-14 h-14 hover:bg-gray-700 focus:ring-4 focus:ring-gray-500 focus:outline-none border border-white">
    <img src="https://i.postimg.cc/BZHf7V07/pngegg-blanc.png" class=' w-8/12' />

    <div class="absolute inline-flex items-center justify-center w-6 h-6 text-xs font-bold text-white bg-red-500 border-2 border-white rounded-full -top-2 -right-2 "><%= panier.getContenu().size() %></div>
  </button>
</div>



<div class="fixed top-0 left-0 w-full h-full
flex items-center justify-center z-20" style="display: none;" id="resume">
  <section class="fixed  justify-center  px-4 text-gray-600 antialiased " x-data="app">
    <div class="flex h-full flex-col justify-center">
      <!-- Table -->
      <div class="mx-auto w-full max-w-2xl rounded-2xl border bg-white shadow-lg">
        <header class="border-b border-gray-100 px-5 py-4  flex justify-between items-center">
          <div class="flex font-semibold text-gray-800">Panier</div>
          <button onClick="masquerPanier()" class="ml-auto middle none center rounded-sm bg-red-500 py-2 px-2 font-sans text-xs font-bold uppercase text-white shadow-md shadow-pink-500/20 transition-all hover:shadow-lg hover:shadow-pink-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">X</button>
        </header>


        <div class="overflow-x-auto p-3">
          <table class="w-full table-auto">
            <thead class="bg-gray-50 text-xs font-semibold uppercase text-gray-400">
            <tr>
              <th></th>
              <th class="p-2">
                <div class="text-left font-semibold">Produit</div>
              </th>
              <th class="p-2">
                <div class="text-left font-semibold">Quantite</div>
              </th>
              <th class="p-2">
                <div class="text-left font-semibold">Total</div>
              </th>
              <th class="p-2">
                <div class="text-center font-semibold"></div>
              </th>
            </tr>
            </thead>

            <tbody class="divide-y divide-gray-100 text-sm">
            <!-- record 1 -->
            <%
              for (Map.Entry<Integer, Integer> entry : panier.getContenu().entrySet()) {
                int idVariante = entry.getKey();
                int quantite = entry.getValue();
            %>
            <tr>

              <td class="p-2">
                <input type="checkbox" class="h-5 w-5" value="id-1" @click="toggleCheckbox($el, 2890.66)" />
              </td>
              <td class="p-2">
                <div class="font-medium text-gray-800"><%= idVariante %></div>
              </td>
              <td class="p-2">
                <div class="text-left"><%= quantite %></div>
              </td>
              <td class="p-2">
                <div class="text-left font-medium text-gray-900 font-bold">200 </div>
              </td>
              <td class="p-2">
                <div class="flex justify-center">
                  <button>
                    <svg class="h-8 w-8 rounded-full p-1 hover:bg-gray-100 hover:text-blue-600" fill="none"
                         stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                      </path>
                    </svg>
                  </button>
                </div>
              </td>

            </tr>
            <%
              }
            %>


            </tbody>
          </table>
        </div>

        <div class="flex justify-end space-x-4 border-t border-gray-100 px-5 py-4 text-2xl font-bold">

          <div class="text-gray-900">120 Euros <span x-text="total.toFixed(2)"></span></div>

        </div>

        <div class="flex justify-end space-x-4  border-gray-100 px-5 py-4 text-2xl font-bold">

          <div class="text-blue-600"><button
                  class="group relative h-12 w-48 overflow-hidden rounded-2xl bg-gray-900 text-lg font-bold text-white">
            Commander
            <div
                    class="absolute inset-0 h-full w-full scale-0 rounded-2xl transition-all duration-300 group-hover:scale-100 group-hover:bg-white/30">
            </div>
          </button></div>

        </div>


      </div>
    </div>
  </section>
</div>

<script>




  function afficherPanier() {
    document.getElementById("resume").style.display = "flex";
  }


  function masquerPanier() {
    document.getElementById("resume").style.display = "none";
  }



</script>



