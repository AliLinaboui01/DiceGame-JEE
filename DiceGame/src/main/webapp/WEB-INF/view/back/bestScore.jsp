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
    <title>Best Score Page</title>
</head>
<body>

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
