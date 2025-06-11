<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPLAB3_GRUPO4.Inicio.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio de Sesión</title>
    <style>
        body {
             margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            background-image: url('fondo.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-container input[type="text"],
        .login-container input[type="password"],
        .login-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .login-container input[type="submit"],
        .login-container input[type="button"],
        .login-container .asp-button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-container input[type="submit"]:hover,
        .login-container input[type="button"]:hover,
        .login-container .asp-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Inicio de Sesión</h2>
            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
            <asp:TextBox ID="txtContra" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            <asp:Button ID="BtnLogin" runat="server" Text="Ingresar" CssClass="asp-button" />
        </div>
    </form>
</body>
</html>