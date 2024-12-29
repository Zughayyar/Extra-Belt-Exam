<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Manager Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container my-5">
    <!-- Welcome Section -->
    <div class="row align-items-center mb-5">
        <div class="col-md-8">
            <h1 class="text-primary fw-bold">Welcome, ${sessionScope.loggedUser.firstName}!</h1>
            <p class="text-muted">Manage your projects and collaborate with your team effectively.</p>
        </div>
        <div class="col-md-4 text-md-end text-center">
            <a href="/logout" class="btn btn-danger btn-lg mb-2">Logout</a>
            <a href="/projects/new" class="btn btn-success btn-lg">+ New Project</a>
        </div>
    </div>

    <hr class="my-4">

    <!-- All Projects Section -->
    <div class="row mb-5">
        <div class="col-12">
            <div class="card shadow-lg">
                <div class="card-header bg-info text-white text-center">
                    <h2>All Projects</h2>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Team Lead</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="project" items="${otherProjects}">
                            <tr>
                                <td>
                                    <a href="/projects/${project.id}" class="text-decoration-none text-dark fw-bold">${project.title}</a>
                                </td>
                                <td>${project.users.get(0).firstName}</td>
                                <td>
                                    <fmt:formatDate value="${project.dueDate}" pattern="yyyy-MM-dd" />
                                </td>
                                <td>
                                    <form action="/joinTeam" method="POST" class="d-inline">
                                        <input type="hidden" name="projectId" value="${project.id}">
                                        <button type="submit" class="btn btn-outline-success btn-sm">Join Team</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <hr class="my-4">

    <!-- Your Projects Section -->
    <div class="row">
        <div class="col-12">
            <div class="card shadow-lg">
                <div class="card-header bg-success text-white text-center">
                    <h2>Your Projects</h2>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-bordered table-striped text-center">
                        <thead class="table-primary">
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Team Lead</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="project" items="${userProjects}">
                            <tr>
                                <td>
                                    <a href="/projects/${project.id}" class="text-decoration-none text-dark fw-bold">${project.title}</a>
                                </td>
                                <td>${project.users.get(0).firstName}</td>
                                <td>
                                    <fmt:formatDate value="${project.dueDate}" pattern="yyyy-MM-dd" />
                                </td>
                                <td>
                                    <c:if test="${project.users.get(0).id == sessionScope.loggedUser.id}">
                                        <a href="#" class="btn btn-outline-primary btn-sm">Edit</a>
                                    </c:if>
                                    <c:if test="${project.users.get(0).id != sessionScope.loggedUser.id}">
                                        <form action="/leaveTeam" method="POST" class="d-inline">
                                            <input type="hidden" name="projectId" value="${project.id}">
                                            <button type="submit" class="btn btn-outline-danger btn-sm">Leave Team</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>




<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
</body>
</html>

