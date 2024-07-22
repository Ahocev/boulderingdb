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
        <a href="/login">LOGIN</a>
        <a href="/register">REGISTER</a>
        <a href="#profile">MY PROFILE</a>
    </div>
    <div class="dropdown">
        <button class="icon-button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="pub/media/Midnight-Lightening.jpeg" alt="Icon">
        </button>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
            <li><a class="dropdown-item" href="#browse">Browse</a></li>
            <li><a class="dropdown-item" href="#boulder-input">Boulder Input Form</a></li>
        </ul>
    </div>
</header>
<div class="titleContainer">
    <div class="divider"></div>
    <a href="/" class="title-link">
        <h1 class="pageTitle">BOULDERING DB</h1>
    </a>
    <div class="divider"></div>