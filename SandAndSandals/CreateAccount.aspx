<%@ Page Title="Create Your Own Account - Sand & Sandals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="SandAndSandals.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link rel="stylesheet" type="text/css" href="css/signup.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerSignUp">
        <h1>Sign Up</h1>
        <p>Please fill in this form to create your own Sand&Sandals account.</p>
        <hr>
        <label for="email"><b>Username</b></label>
        <input runat="server" id="usernameinput" type="text" placeholder="Enter Username"  required>

        <label for="email"><b>Email</b></label>
        <input runat="server" id="emailinput" type="email" placeholder="Enter Email"  required>

        <label for="psw"><b>Password</b></label>
        <input runat="server" id="passinput" type="password" placeholder="Enter Password"  required>

        <div class="clearfix">
            <asp:button runat="server" ID="Signupbtn" CssClass="auto-style2" Text="Sign Up" OnClick="Signupbtn_Click" Width="219px"/>

            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </div>
    </div>
</asp:Content>
