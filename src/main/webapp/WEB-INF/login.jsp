<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Manager</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">

</head>
<body>
    <div class="container">
        <div class="header">
            <h1 class="main-title">Project Manager</h1>
            <p>A place for legends to manage projects.</p>
        </div>
        <div class="row">
            <!-- Registration Form -->
            <div class="col-md-6">
                <h3>Register</h3>
                <form:form action="/register" method="post" modelAttribute="newUser">
                    <div class="mb-3">
                        <form:label path="firstName" cssClass="form-label" for="firstName">First Name</form:label>
                        <form:input path="firstName" id="name" class="form-control" placeholder="Enter your First Name" />
                        <form:errors path="firstName" cssClass="error-message" />
                    </div>
                    <div class="mb-3">
                        <form:label path="lastName" cssClass="form-label" for="lastName">Last Name</form:label>
                        <form:input path="lastName" id="name" class="form-control" placeholder="Enter your Last Name" />
                        <form:errors path="lastName" cssClass="error-message" />
                    </div>
                    <div class="mb-3">
                        <form:label path="email" cssClass="form-label" for="registerEmail">Email</form:label>
                        <form:input path="email" id="registerEmail" class="form-control" placeholder="Enter your Email" />
                        <form:errors path="email" cssClass="error-message" />
                    </div>
                    <div class="mb-3">
                        <form:label path="password" cssClass="form-label" for="registerPassword">Password</form:label>
                        <form:input path="password" id="registerPassword" type="password" class="form-control" placeholder="Enter your Password" />
                        <form:errors path="password" cssClass="error-message" />
                    </div>
                    <div class="mb-3">
                        <form:label path="confirmPassword" cssClass="form-label" for="confirmPassword">Confirm Password</form:label>
                        <form:input path="confirmPassword" id="confirmPassword" type="password" class="form-control" placeholder="Confirm your Password" />
                        <form:errors path="confirmPassword" cssClass="error-message" />
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form:form>
            </div>
            <!-- Login Form -->
            <div class="col-md-6">
                <h3>Log in</h3>
                <form:form action="/login" method="post" modelAttribute="newLogin">
                    <div class="mb-3">
                        <form:label path="email" cssClass="form-label" for="loginEmail">Email:</form:label>
                        <form:input path="email" id="loginEmail" class="form-control" placeholder="Enter your Email" />
                        <form:errors path="email" cssClass="error-message" />
                    </div>
                    <div class="mb-3">
                        <form:label path="password" cssClass="form-label" for="loginPassword">Password:</form:label>
                        <form:input path="password" id="loginPassword" type="password" class="form-control" placeholder="Enter your Password" />
                        <form:errors path="password" cssClass="error-message" />
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>



    <script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
</body>
</html>

