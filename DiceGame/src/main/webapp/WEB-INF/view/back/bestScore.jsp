<%@ page import="ali.com.dicegame.models.GameState" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="ali.com.dicegame.models.User" %>
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
    <title>Best Scores</title>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/back/bestScore">Best Scores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
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
                    User userLogin = (User) request.getSession().getAttribute("user");
                    request.setAttribute("userLogin", userLogin);
                %>
                <%=userLogin.getName()%>
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
<div class="container my-5">
<table class="table align-middle mb-0 bg-white">
    <thead class="bg-light">
    <tr>
        <th>Name</th>
        <th>Score</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.users}" var="user">
        <c:set var="color" value=""/>
        <c:if test="${userLogin.email eq user.email}">
            <c:set var="color" value="azure"/>
        </c:if>

        <tr >
            <td style="background-color: ${color}">
                <div class="d-flex align-items-center">
                    <img src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                         alt=""
                         style="width: 45px; height: 45px"
                         class="rounded-circle"/>
                    <div class="ms-3">
                        <p class="fw-bold mb-1">${user.name}</p>
                        <p class="text-muted mb-0">${user.email}</p>
                    </div>
                </div>
            </td>

            <td style="background-color: ${color}">
                <span class="badge badge-success rounded-pill d-inline">${user.bestScore}</span>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

</div>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
></script>
</body>
</html>
