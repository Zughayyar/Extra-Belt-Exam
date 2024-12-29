<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Read Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h1 class="fst-italic">${book.title}</h1>
            </div>
            <div class="col-md-4">
                <div class="my-nav-container">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/books">back to the shelves</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <p class="fw-bold">
                <span class="text-primary">
                    <c:if test="${book.user.id == sessionScope.loggedUser.id}" >
                        You
                    </c:if>
                    <c:if test="${book.user.id != sessionScope.loggedUser.id}">
                        ${book.user.name}
                    </c:if>
                </span>
                 read
                <span class="text-primary">
                    ${book.title}
                </span>
                 by
                <span class="text-primary">
                    ${book.author}
                </span>
            </p>
            <p>Here are
                <span class="text-primary">
                    <c:if test="${book.user.id == sessionScope.loggedUser.id}" >
                        Your
                    </c:if>
                    <c:if test="${book.user.id != sessionScope.loggedUser.id}">
                        ${book.user.name}'s
                    </c:if>
                </span>
                 thoughts
            </p>
        </div>
        <hr>
        <div class="row">
            <p>${book.thought}</p>
        </div>
        <hr>
        <c:if test="${book.user.id == sessionScope.loggedUser.id}" >
            <div class="row justify-content-center align-items-center align-items-center">
                <div class="col-md-3">
                    <a href="/books/${book.id}/edit" class="btn btn-primary">Edit</a>
                </div>
                <div class="col-md-3">
                        <form:form action="/books/deleteBook" method="post" modelAttribute="book" >
                            <form:input path="id" type="hidden" name="id" value="${book.id}" />
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form:form>
                </div>
            </div>
            <hr>
        </c:if>
    </div>



    <script src="/webjars/bootstrap/js/bootstrap.bundle.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
</body>
</html>
