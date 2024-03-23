<%@ page import="ali.com.dicegame.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.min.css"
            rel="stylesheet"
    />
    <link href="${pageContext.request.contextPath}/style/bestScore.css" rel="stylesheet"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');
        .press-start {
            font-family: "Press Start 2P", system-ui;
            font-weight: 400;
            font-style: normal;
        }
        .links {
            font-family: "Press Start 2P", system-ui;
            font-weight: 10;
            font-style: normal;
        }
    </style>
    <title>Best Score Page</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary " style="height: 60px">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Toggle button -->
        <button
                data-mdb-collapse-init
                class="navbar-toggler"
                type="button"
                data-mdb-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Navbar brand -->
            <a class="navbar-brand mt-2 mt-lg-0" href="${pageContext.request.contextPath}/login">
                <img
                        src="${pageContext.request.contextPath}/images/diceLogo.png"
                        height="55"
                        loading="lazy"
                />
                <p class="press-start ">Dice Game</p>
            </a>
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link links" href="${pageContext.request.contextPath}/login">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link links" href="#">Best Scores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link links" href="${pageContext.request.contextPath}/logout">Logout</a>
                </li>
            </ul>
            <!-- Left links -->
        </div>
        <!-- Collapsible wrapper -->

        <!-- Right elements -->
        <div class="d-flex align-items-center">
            <!-- Avatar -->
            <div class="dropdown d-flex justify-content-between">
                <%
                    // Retrieve the user object from the request scope
                    User user = (User) request.getSession().getAttribute("user");
                %>
                <p class="links p-5"><%=user.getName()%></p>
                <a data-mdb-dropdown-init class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/images/profile.jpg" class="rounded-circle" height="25" alt="Black and White Portrait of a Man" loading="lazy"/>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Right elements -->
    </div>
    <!-- Container wrapper -->
</nav>
<div class="container my-5 d-flex d-flex flex-row mb-3 flex-wrap ">
    <c:forEach items="${requestScope.users}" var="user">
        <div class=" mt-5 m-3">

            <div class="card p-3">

                <div class="d-flex align-items-center">

                    <div class="image">
                        <img src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" class="rounded" width="155" >
                    </div>

                    <div class="ml-3 w-100 ms-2">

                        <h4 class="mb-0 mt-0">${user.name}</h4>
                        <span>${user.email}</span>

                        <div class="p-2 mt-2 bg-primary d-flex justify-content-between rounded text-white stats">

                            <div class="d-flex flex-column">

                                <span class="articles">Play</span>
                                <span class="number1">${user.numberOfPlaying}</span>

                            </div>

                            <div class="d-flex flex-column">

                                <span class="rating">Rating</span>
                                <span class="number3">${user.bestScore}</span>

                            </div>

                        </div>

                    </div>


                </div>

            </div>

        </div>
    </c:forEach>

</div>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
></script>
</body>
</html>