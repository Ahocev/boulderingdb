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

    <link href="/pub/css/global.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: "Helvetica";
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
        }
        .nav-links {
            display: flex;
            gap: 20px;
        }
        .nav-links a {
            text-decoration: none;
            color: black;
            font-size: 1rem;
        }
        .pageTitle {
            font-size: 11vw;
            font-weight: 500;
            text-align: center;
            margin: 0;
        }
        .divider {
            width: 90%;
            height: 2px;
            background-color: black;
            margin: 10px 0;
        }
        .titleContainer {
            width: 100%;
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
        <a href="#search">SEARCH</a>
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
                    <a class="dropdown-item" href="#profile">MY PROFILE</a>
                </li>
                <li>
                    <a class="dropdown-item" href="#boulder-input">ADD A BOULDER</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</header>
<div class="titleContainer">
    <div class="divider"></div>
    <a href="/" class="title-link">
        <h1 class="pageTitle">BOULDERING DB</h1>
    </a>
    <div class="divider"></div>