<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anonymous+Pro:ital,wght@0,400;0,700;1,400;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

    <link href="/pub/css/global.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: "Helvetica";
            color: black;
            margin: 0;
            padding: 20px 20px 20px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .header {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 10px 20px;
            margin: -10px;
        }
        .nav-links {
            display: flex;
            gap: 20px;
            font-family: "Anonymous Pro";
            letter-spacing: 0.1em;
        }
        .nav-links a {
            text-decoration: none;
            color: black;
            font-size: 1rem;
        }

        .dropdown-item{
            font-family: "Anonymous Pro";
            letter-spacing: 0.1em;
        }

        .pageTitle {
            font-size: 11.5vw;
            font-weight: 500;
            text-align: center;
            margin: -20px;
        }

        .divider {
            width: 100%;
            height: 2px;
            background-color: black;
            margin: 10px 0;
        }

        .titleContainer {
            width: 112%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .icon-button {
            border: none;
            background: none;
            padding: 0;
            margin-left: 20px;
        }
        .icon-button img {
            width: 50px;
            height: 50px;
        }
    </style>

</head>
<body>
<header class="header">
        <div class="nav-links">
            <a href="/boulder/search">SEARCH</a>
            <sec:authorize access="isAuthenticated()">
                <a href="/account/logout">LOGOUT</a>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <a href="/account/login">LOGIN</a>
                <a href="/account/register">REGISTER</a>
            </sec:authorize>
            <sec:authorize access="hasAnyAuthority('ADMIN')">
                <a href="/admin/dashboard">ADMIN</a>
            </sec:authorize>
        </div>
        <div class="dropdown">
            <button class="icon-button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="/pub/media/Midnight-Lightening.jpeg" alt="Icon">
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                <li>
                    <a class="dropdown-item" href="/boulder/browse">BROWSE DB</a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <li>
                        <a class="dropdown-item" href="/account/profile">MY PROFILE</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/boulder/boulder-input">ADD A BOULDER</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</header>

<div class="divider"></div>
<div class="titleContainer">
    <a href="/" class="title-link">
        <h1 class="pageTitle">BOULDERING DB</h1>
    </a>
</div>
<div class="divider"></div>