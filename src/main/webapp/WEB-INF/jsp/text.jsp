<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML>
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
  <header class="header">
  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #8592de;">
      <a class="navbar-brand" href="#">Blog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="/text">Text<span class="sr-only">(current)</span></a>
          </li>
          <sec:authorize access="hasRole('ADMIN')">
          <li class="nav-item">
            <a class="nav-link" href="/admin/set-text">Shedule(for admin)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/statistics">Statistic(for admin)</a>
          </li>
          </sec:authorize>
          <li class="nav-item">
             <a class="nav-link" href="/logout">Logout</a>
          </li>
          <li class="nav-item">
            <h5 style="margin-top: 8px; margin-left: 8px;"> ${pageContext.request.userPrincipal.name}</h5>
          </li>
        </ul>
      </div>
    </nav>
    </header>
    <section>
      <div class="container">
        <div class="col-7" style="margin-top: 50px">
          <form>
            <div class="form-group">
              <label class="title"><b><h4>Notes:</h4></b></label>
              <label class="title"><h5>${title}</h5></label><br>
              <label class="body">${body}</label>
            </div>
          </form>
          <div class="row">
            <div class="col">
            <form action="/text" method="get">
              <input type="hidden" name="id" value="${id}"/>
              <input type="hidden" name="direction" value="prev"/>
              <button type="submit" class="btn btn-success">Prev</button>
            </form>
            </div>
            <div class="col">
            <form action="/text" method="get">
              <input type="hidden" name="id" value="${id}"/>
              <input type="hidden" name="direction" value="next"/>
              <button type="submit" class="btn btn-success">Next</button>
            </form>
            </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
  </html>

