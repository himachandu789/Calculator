<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.example.CalculatorServlet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            margin-top: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        select {
            width: 200px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            padding: 8px 12px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .result {
            margin-top: 20px;
            font-weight: bold;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Calculator</h2>
    <div class="result">
        Result: ${result}
    </div>

    <form action="calculatorApp" method="post">
        <label for="num1">Number 1:</label>
        <input type="text" name="num1" id="num1" placeholder="Number 1" value="${param.num1}" required>

        <br>

        <label for="num2">Number 2:</label>
        <input type="text" name="num2" id="num2" placeholder="Number 2" value="${param.num2}" required>

        <br>

        <label for="operator">Operator:</label>
        <select name="operator" id="operator">
            <option value="add">Addition (+)</option>
            <option value="subtract">Subtraction (-)</option>
            <option value="multiply">Multiplication (*)</option>
            <option value="divide">Division (/)</option>
        </select>

        <br>

        <input type="submit" value="Calculate">
        <input type="text" name="result" value="${not empty errorMessage ? errorMessage : result}" style="color: ${not empty errorMessage ? 'red' : 'green'};" ${not empty errorMessage ? 'disabled' : ''}>

    </form>

    <c:if test="${not empty errorMessage}">
        <div class="error">
            Error: ${errorMessage}
        </div>
    </c:if>

    <c:if test="${empty errorMessage}">
        <div>
            Number 1: <span style="color: green;">${param.num1}</span> <br>
            Number 2: <span style="color: green;">${param.num2}</span> <br>
            Result: <span style="color: green;">${result}</span> <br>
        </div>
    </c:if>
</body>
</html>
