<%@ Page Title="Login - Sand & Sandals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SandAndSandals.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/login.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerLogin">
        <h1>Login</h1>
        <p>Please fill in this form to login your Sand&Sandals account.</p>
        <hr>
        <label for="email"><b>Username</b></label>
        <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
        <input runat="server" id="usernameinput" class="form-control" type="text" placeholder="Enter Username" name="email" required>
        <label for="psw"><b>Password</b></label>
        <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
        <input runat="server" id="passinput" class="form-control" type="password" placeholder="Enter Password" name="psw" required>
        <div class="clearfix">
            <asp:button runat="server" ID="loginbtn" CssClass="auto-style2" Text="Login" OnClick="loginbtn_Click" Width="222px"/>
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </div>
    </div>
</asp:Content>
