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
    <link rel="stylesheet"  href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

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
                    <a href="accueil.jsp" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0" aria-current="page">Accueil</a>
                </li>
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

<div class="swiper mySwiper relative flex items-center justify-center" >
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <a href="produits.jsp">
            <img
                    class="w-full h-full object-center object-cover"
                    src="https://media.gqmagazine.fr/photos/637507a363f0b8424cf4c1d6/16:9/w_1920,c_limit/Montage_Sneakers_V2_2.jpg"
                    alt="image"
            />
            </a>
        </div>

        <div class="swiper-slide">
            <a href="produit.jsp?id=15">
            <img
                    class="w-full h-full object-center object-cover"
                    src="https://img.hardloop.com/image/upload/v1606748997/articles/id-699-8-bonnes-raisons-de-porter-des-chaussettes-en-laine-merinos/les%20chaussettes%20en%20laine%20mérinos%20icebreaker.jpg"
                    alt="image"
            />
            </a>
        </div>
        <div class="swiper-slide">
            <a href="produit.jsp?id=12">
            <img
                    class="w-full h-full object-center object-cover"
                    src="https://kikikickz.com/cdn/shop/articles/10-sneakers-a-saisir-pendant-nos-soldes-518234_800x.progressive.webp.jpg?v=1696270866"
                    alt="image"
            />
            </a>
        </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper(".mySwiper", {
        cssMode: true,
        loop : true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        autoplay: {
            delay: 2500, // Délai entre les diapositives en millisecondes (ajustez selon vos préférences)
        },
        pagination: {
            el: ".swiper-pagination",
        },
        mousewheel: true,
        keyboard: true,
    });
</script>

</body>
</html>