<%--
  Created by IntelliJ IDEA.
  User: HAMZA
  Date: 2024/03/21
  Time: 00:21
  To change this template use File | Settings | File Templates.
--%>
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

    <title>Best Score Page</title>
</head>
<body>





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
<div class="container my-5 d-flex d-flex flex-row mb-3 flex-wrap ">
    <!--
<table class="table align-middle mb-0 bg-white">
    <thead class="bg-light">
    <tr>
        <th>Name</th>
        <th>Score</th>

    </tr>
    </thead>
    <tbody>
    -->
<c:forEach items="${requestScope.users}" var="user">
<!--
    <tr>
        <td>
            <div class="d-flex align-items-center">
                <img
                        src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                        alt=""
                        style="width: 45px; height: 45px"
                        class="rounded-circle"
                />
                <div class="ms-3">
                    <p class="fw-bold mb-1">${user.name}</p>
                    <p class="text-muted mb-0">${user.email}</p>
                </div>
            </div>
        </td>

        <td>
            <span class="badge badge-success rounded-pill d-inline">${user.bestScore}</span>
        </td>


-->



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
                                <span class="number1">38</span>

                            </div>
<!--
                            <div class="d-flex flex-column">

                                <span class="followers">Followers</span>
                                <span class="number2">980</span>

                            </div>
-->

                            <div class="d-flex flex-column">

                                <span class="rating">Rating</span>
                                <span class="number3">${user.bestScore}</span>

                            </div>

                        </div>

<!--
                        <div class="button mt-2 d-flex flex-row align-items-center">

                            <button class="btn btn-sm btn-outline-primary w-100">Chat</button>
                            <button class="btn btn-sm btn-primary w-100 ml-2">Follow</button>


                        </div>
-->

                    </div>


                </div>

            </div>

        </div>
</c:forEach>
<!--
    </tbody>
</table>
-->
</div>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
></script>
</body>
</html>
