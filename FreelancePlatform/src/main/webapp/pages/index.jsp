<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Spring Security</title>

  <link href="<c:url value="/pages/css/bootstrap.css" />" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<c:url value="/pages/css/jumbotron-narrow.css" />" rel="stylesheet">

  <!-- Custom styles for this template
  <link href="cover.css" rel="stylesheet"> -->

  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

</head>

<body>

<div class="container">

  <div class="jumbotron" style="margin-top: 20px;">
    <h1>Devcolibri.com</h1>
    <p class="lead">
      Devcolibri - это сервис предоставляющий всем желающим возможность обучаться программированию.
    </p>
    <sec:authorize access="!isAuthenticated()">
      <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <p>Ваш логин: <sec:authentication property="principal.username" /></p>
      <p><a class="btn btn-lg btn-danger" href="<c:url value="/logout" />" role="button">Выйти</a></p>

    </sec:authorize>
  </div>

  <div class="footer">
    <p>© Devcolibri 2014</p>
  </div>

</div>
</body>
</html>