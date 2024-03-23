<%@ page import="ali.com.dicegame.models.GameState" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="ali.com.dicegame.models.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="ali.com.dicegame.models.Message" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./node_modules/nes.css/css/nes.min.css">
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <!-- minify -->
    <link href="https://unpkg.com/nes.css@2.3.0/css/nes.min.css" rel="stylesheet" />
    <!-- latest -->
    <link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
    <!-- core style only -->
    <link href="https://unpkg.com/nes.css/css/nes-core.min.css" rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.min.css"
            rel="stylesheet"
    />
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
 <title>Home</title>
</head>
<body>


<!-- Navbar -->
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
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <!-- Navbar brand -->
            <a class="navbar-brand mt-2 mt-lg-0  " href="${pageContext.request.contextPath}/login">
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
                    <a class="nav-link links" href="${pageContext.request.contextPath}/back/bestScore">Best Scores</a>
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
                <a data-mdb-dropdown-init class="dropdown-toggle d-flex align-items-center hidden-arrow " href="#" id="navbarDropdownMenuAvatar" role="button" aria-expanded="false">
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
    <a href="${pageContext.request.contextPath}/restart" class="nes-btn is-primary" disabled>Restart Game <i class="fas fa-arrow-rotate-right"></i></a>
    <form class="col-md-6 offset-md-3 " method="post" action="${pageContext.request.contextPath}/play">
        <!-- Email input -->
        <div class="d-flex justify-content-center">
            <img
                    src="${pageContext.request.contextPath}/images/diceLogo.png"
                    height="105"
                    loading="lazy"
            />
        </div>

        <div class="nes-field m-4">
            <label for="name_field">Dice Number</label>
            <input type="number" id="name_field" class="nes-input" name="diceNumber">
        </div>
        <button data-mdb-ripple-init type="submit"  class="nes-btn is-primary btn-block">roll the dice</button>
        <!-- Submit button -->
    </form>
    <%
        int res_dice1=0;
        int res_dice2=0;
        int res_dice3=0;
        if (request.getSession().getAttribute("old_dice")!=null){
            HashMap<Integer,Integer> sessionMap = (HashMap<Integer, Integer>) request.getSession().getAttribute("old_dice");
            for (Map.Entry<Integer,Integer> entry : sessionMap.entrySet()){
                if (entry.getKey()==1){
                    res_dice1 = entry.getValue();
                    request.setAttribute("res_dice1", res_dice1);

                }else if (entry.getKey()==2){
                    res_dice2 = entry.getValue();
                    request.setAttribute("res_dice2", res_dice2);
                }else if(entry.getKey()==3){
                    res_dice3=entry.getValue();
                    request.setAttribute("res_dice3", res_dice3);
                }
            }


        }
    %>
    <div class="d-flex justify-content-center">
        <div class="img m-5">
            <% if (res_dice1==0){
            %>
                <img src="${pageContext.request.contextPath}/images/marck.png">
            <% }else{%>
                <img src="${pageContext.request.contextPath}/images/dice/${res_dice1}.png" height="96px" width="96px">

            <%}%>
        </div>
        <div class="img m-5">
            <% if (res_dice2==0){
            %>
            <img src="${pageContext.request.contextPath}/images/marck.png">
            <% }else{%>
            <img src="${pageContext.request.contextPath}/images/dice/${res_dice2}.png " height="96px" width="96px">

            <%}%>
        </div>
        <div class="img m-5">
            <% if (res_dice3==0){
            %>
            <img src="${pageContext.request.contextPath}/images/marck.png">
            <% }else{%>
            <img src="${pageContext.request.contextPath}/images/dice/${res_dice3}.png" height="96px" width="96px">

            <%}%>
        </div>
    </div>
    <%
        if(gameState.getUser().getScore()>0){
    %>
    <div class="d-flex justify-content-center">
        <a href="#" class="nes-badge ">
            <span class="is-success"> great your score is : <%=gameState.getUser().getScore()%></span>
        </a>
    </div>
    <%}else if(!gameState.getMessages().isEmpty()){
            List<Message> messages = gameState.getMessages();
            for (Message message:messages){
                if (message.getType()==2){

                %>
    <div class="container nes-badge ">
        <a href="${pageContext.request.contextPath}/login" class="">
            <span class="is-error"> <%=message.getText()%>  Try Again</span>
        </a>
    </div>
    <%
        }}}%>

</div>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
></script>
</body>
</html>