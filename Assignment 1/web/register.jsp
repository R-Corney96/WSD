<%-- 
    Document   : register
    Created on : 17/09/2018, 4:32:58 PM
    Author     : robert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
        <form action='welcome.jsp' method='post' name='register'>
        <table style='border:none'>
            <tr>
                <td>Email</td>
                <td><input type='email' name='email'></td>
            </tr>
            <tr>
                <td>Full name</td>
                <td><input type='text' name='name'></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type='password' name='password'></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td><input type="text" name="phone_number"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" ></td>
            </tr>
            <tr>
                <td>Agree to TOS</td>
                <td><input type='checkbox' name='tos' value="true"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type='submit' value='Register'></td>
            </tr>
        </table>
        </form>
    </body>
</html>
