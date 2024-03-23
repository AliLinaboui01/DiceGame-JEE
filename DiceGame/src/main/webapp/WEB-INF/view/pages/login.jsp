<%@ page import="ali.com.dicegame.models.Message" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/style/loginStyle.css" rel="stylesheet"/>
    <title>login</title>

</head>
<body>

<div id="main-wrapper" class="container">

    <div class="row justify-content-center">
        <div class="col-xl-10">
            <div class="card border-0">
                <div class="card-body p-0">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="d-flex justify-content-center m-5">
                                <img
                                        src="${pageContext.request.contextPath}/images/diceLogo.png"
                                        height="105"
                                        loading="lazy"
                                />
                            </div>
                            <div class="p-5">
                                <div class="mb-5">
                                    <h3 class="h4 font-weight-bold text-theme text-center">Login</h3>
                                </div>

<%--                                <h6 class="h5 mb-0">Welcome back!</h6>--%>
<%--                                <p class="text-muted mt-2 mb-5">Enter your email address and password .</p>--%>

                                <form method="post" action="${pageContext.request.contextPath}/login">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Login</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" name="login" required>
                                    </div>
                                    <div class="form-group mb-5">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
                                    </div>
                                    <button type="submit" class="btn btn-theme">Login</button>
                                </form>
                            </div>
                        </div>

                        <div class="col-lg-6 d-none d-lg-inline-block">
                            <div class="account-block rounded-right">
                                <div class="overlay rounded-right"><img style="height: 100%;width: 100%" src="${pageContext.request.contextPath}/images/login_img.jpg"></div>
<%--                                <div class="account-testimonial">--%>
<%--                                    <h4 class="text-white mb-4">This  beautiful theme yours!</h4>--%>
<%--                                    <p class="lead text-white">"Best investment i made for a long time. Can only recommend it for other users."</p>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- end card-body -->
            </div>
            <!-- end card -->
            <p class="text-muted text-center mt-3 mb-0">Don't have an account? <a href="${pageContext.request.contextPath}/register" class="text-primary ml-1">register</a></p>
            <!-- end row -->

        </div>
        <!-- end col -->
    </div>
    <!-- Row -->
</div>
<div class="container my-5">
    <c:forEach items="${requestScope.messages}" var="msg">
        <c:choose>
            <c:when test="${msg.getType() == Message.WARN}">
                <div class="alert alert-warning" role="alert">${msg.text}</div>
            </c:when>
            <c:when test="${msg.getType() == Message.INFO}">
                <div class="alert alert-success" role="alert">${msg.text}</div>
            </c:when>
            <c:when test="${msg.getType() == Message.ERROR}">
                <div class="alert alert-danger" role="alert">${msg.text}</div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-primary" role="alert">${msg.text}</div>
            </c:otherwise>
        </c:choose>

    </c:forEach>
</div>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
></script>
</body>

</html>