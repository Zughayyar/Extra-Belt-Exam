<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create a New Project</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container my-5">
    <!-- Header Section -->
    <div class="row align-items-center mb-4">
        <div class="col-md-8">
            <h1 class="text-success fw-bold">Create a New Project</h1>
            <p class="text-muted">Fill in the details below to get started with your new project.</p>
        </div>
        <div class="col-md-4 text-md-end text-center">
            <a href="/dashboard" class="btn btn-outline-primary btn-lg">Back to Dashboard</a>
        </div>
    </div>

    <hr class="my-4">

    <!-- Form Section -->
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h2>Project Details</h2>
                </div>
                <div class="card-body">
                    <form:form action="/books/new/addProject" method="post" modelAttribute="newProject">
                        <!-- Project Title -->
                        <div class="mb-3">
                            <form:label path="title" cssClass="form-label fw-bold" for="title">Project Title</form:label>
                            <form:input path="title" id="title" class="form-control" placeholder="Enter Title" />
                            <form:errors path="title" cssClass="text-danger small" />
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <form:label path="description" cssClass="form-label fw-bold" for="description">Description</form:label>
                            <form:input path="description" id="description" class="form-control" placeholder="Enter Description" />
                            <form:errors path="description" cssClass="text-danger small" />
                        </div>

                        <!-- Due Date -->
                        <div class="mb-3">
                            <form:label path="dueDate" cssClass="form-label fw-bold" for="dueDate">Due Date</form:label>
                            <form:input path="dueDate" id="dueDate" type="date" class="form-control" />
                            <form:errors path="dueDate" cssClass="text-danger small" />
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg">Create Project</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
</body>
</html>
