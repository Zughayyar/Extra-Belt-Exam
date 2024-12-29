<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <h1>Edit Book in your Shelf!</h1>
        </div>
        <div class="col-md-4">
            <div class="my-nav-container">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/books">back to shelves</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <form:form action="/books/editBook" method="post" modelAttribute="book">
            <form:input type="hidden" path="user" value = "${sessionScope.loggedUser.id}" />
            <form:input path="id" type="hidden" value="${book.id}" />
            <div class="mb-3">
                <form:label path="title" cssClass="form-label" for="title">Title</form:label>
                <form:input path="title" id="title" class="form-control" placeholder="Enter Title" />
                <form:errors path="title" cssClass="error-message" />
            </div>
            <div class="mb-3">
                <form:label path="author" cssClass="form-label" for="author">Author</form:label>
                <form:input path="author" id="author" class="form-control" placeholder="Enter Author" />
                <form:errors path="author" cssClass="error-message" />
            </div>
            <div class="mb-3">
                <form:label path="thought" cssClass="form-label" for="thought">My Thoughts</form:label>
                <form:textarea path="thought" id="thought" type="text" class="form-control" />
                <form:errors path="thought" cssClass="error-message" />
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form:form>
    </div>
</div>



<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
</body>
</html>

