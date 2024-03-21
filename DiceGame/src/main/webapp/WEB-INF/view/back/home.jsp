<%@ page import="ali.com.dicegame.models.GameState" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
 <title>Home</title>
</head>
<body>



<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
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
            <a class="navbar-brand mt-2 mt-lg-0" href="#">
                <img
                        src="${pageContext.request.contextPath}/images/dice_icon.png"
                        height="35"
                        loading="lazy"
                />
            </a>
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/login">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">My Best Score</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Best Scores</a>
                </li>
            </ul>
            <!-- Left links -->
        </div>
        <!-- Collapsible wrapper -->

        <!-- Right elements -->
        <div class="d-flex align-items-center">
            <!-- Avatar -->
            <div class="dropdown">
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
<!-- Navbar -->

<div class="container my-5 w-75">
    <%
        GameState gameState = (GameState) request.getSession().getAttribute("gameState");
    %>
    <a href="${pageContext.request.contextPath}/restart" class="btn btn-outline-primary" disabled>Restart Game <i class="fas fa-arrow-rotate-right"></i></a>
    <div class="alert alert-primary my-2" role="alert">
        you have 3 dices with numbers 1,2 and 3 you can choose one and goo
    </div>
<form class="col-md-6 offset-md-3" method="post" action="${pageContext.request.contextPath}/play">
    <!-- Email input -->
    <div data-mdb-input-init class="form-outline mb-4">
        <input type="number" id="form1Example1" class="form-control" style="background-color:gainsboro" name="diceNumber"/>
        <label class="form-label" for="form1Example1">Dice Number</label>
    </div>



        <button data-mdb-ripple-init type="submit" class="btn btn-primary btn-block">roll</button>

    <!-- Submit button -->

</form>
    <%
        if(gameState.sizeMessages() >0){
    %>
    <div class="alert alert-info my-5" role="alert">
        <%=gameState%>
    </div>

    <%
        }
    %>


</div>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
></script>
</body>
</html>