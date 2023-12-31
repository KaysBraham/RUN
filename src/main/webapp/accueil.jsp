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
<%@include file="header.jsp" %>
<div class="swiper mySwiper relative flex items-center justify-center" >
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <a href="catalogue">
                <img
                        class="w-full h-full object-center object-cover"
                        src="https://media.gqmagazine.fr/photos/637507a363f0b8424cf4c1d6/16:9/w_1920,c_limit/Montage_Sneakers_V2_2.jpg"
                        alt="image"
                />
            </a>
        </div>

        <div class="swiper-slide">
            <a href="produit.jsp?id=18">
                <img
                        class="w-full h-full object-center object-cover"
                        src="https://img.hardloop.com/image/upload/v1606748997/articles/id-699-8-bonnes-raisons-de-porter-des-chaussettes-en-laine-merinos/les%20chaussettes%20en%20laine%20mérinos%20icebreaker.jpg"
                        alt="image"
                />
            </a>
        </div>
        <div class="swiper-slide">
            <a href="produit.jsp?id=15">
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
            delay: 3500, // Délai entre les diapositives en millisecondes (ajustez selon vos préférences)
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