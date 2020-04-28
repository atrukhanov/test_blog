<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
    <title>Blog</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #8592de;">
        <a class="navbar-brand" href="#">Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
        </div>
      </nav>

        <sec:authorize access="isAuthenticated()">
          <% response.sendRedirect("/text"); %>
        </sec:authorize>
        <div class="container">
        <div class="col-8 d-flex justify-content-center">
          <form method="POST" action="/login">
            <div class="card" style="width: 18rem;">
              <div class="card-header">
                <h4>Log in</h4>
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">
                  <input name="username" type="text" placeholder="Username"
                     autofocus="true"/>
                </li>
                <li class="list-group-item">
                  <input name="password" type="password" placeholder="Password"/>
                </li>
                </ul>
              <button class="btn btn-success" type="submit">Log In</button>
            </div>
            <h5 style="margin-top: 10px"><a href="/registration">Registration</a></h4>
          </form>
        </div>
        </div>
</body>
</html>