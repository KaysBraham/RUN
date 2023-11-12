<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RUN</title>
    <link href="https://unpkg.com/tailwindcss@^2.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <div class="min-h-screen bg-gray-500 flex justify-center items-center relative overflow-hidden">
        <div class="absolute w-60 h-60 rounded-xl bg-gray-900 -top-5 -left-16 z-0 transform rotate-45 hidden md:block"></div>
        <div class="absolute w-48 h-48 rounded-xl bg-gray-900 -bottom-6 -right-10 transform rotate-12 hidden md:block"></div>
        <div class="py-8 px-8 bg-white rounded-2xl shadow-xl z-20">
            <% String status = request.getParameter("status");
                String message = request.getParameter("message");
                if ("success".equals(status)) { %>
            <p class="text-green-500 mb-4 text-center font-medium"><%= message %></p>
            <% } else { %>
            <p class="text-red-600 mb-4 text-center font-medium"><%= message %></p>
            <% } %>
            <a href="admin-interface.jsp" class="text-center mt-6">
                <button class="py-3 w-64 text-xl text-white bg-gray-900 font-semibold rounded-2xl">RETOUR</button>
            </a>
        </div>
        <div class="w-40 h-40 absolute bg-gray-900 rounded-full top-0 right-12 hidden md:block"></div>
        <div class="w-20 h-40 absolute bg-gray-900 rounded-full bottom-20 left-10 transform rotate-45 hidden md:block"></div>
    </div>
</body>
</html>
