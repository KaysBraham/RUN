<nav class="bg-white  fixed w-full z-20 top-0 left-0 border-b border-gray-200 ">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
        <a href="#" class="flex items-center">
            <img src="https://i.ibb.co/JtpTTFt/run-black.png" class="h-8 mr-3" alt="Run Logo">
        </a>
        <div class="flex md:order-2">
            <a href="login.jsp">
                <button type="button" class="text-white bg-gray-900 hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center mr-3 md:mr-0 ">Se Connecter</button>
            </a>
        </div>
        <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
            <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white">
                <li>
                    <a href="accueil.jsp" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0" aria-current="page">Accueil</a>
                </li>
                <li>
                    <a href="catalogue" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0" aria-current="page">Sneakers</a>
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

        <div class="md:order-3 md:w-auto w-full md:pl-0 md:ml-4 mt-4 md:mt-0">
            <form action="recherche.jsp" method="get" class="relative">
                <input type="text" name="recherche" class="w-full bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-300 border border-gray-300 rounded-md py-2 pl-10 pr-4" placeholder="Rechercher...">
                <button type="submit" class="absolute top-0 left-0 mt-2 ml-2">
                    <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M21 21l-5.2-5.2M15 10.5a4.5 4.5 0 11-9 0 4.5 4.5 0 019 0z"></path>
                    </svg>
                </button>
            </form>
        </div>

    </div>
</nav>