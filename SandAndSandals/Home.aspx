<%@ Page Title="Home - Sand & Sandals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SandAndSandals.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <link rel="stylesheet" type="text/css" href="css/Home.css">
      <div class="jumbotron text-center" style="background-image: linear-gradient(to bottom, rgba(255,255,255,0.6) 100%,rgba(255,255,255,0.9) 100%), url(Images/banner2.png);">
        <div class="container">
            <div class="row">
                <div class="col-ld-4">
                      <h1 class="jumbotron-heading">Sand & Sandals</h1>
                      <p class="lead">A specialist label creating beach essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                      <p><a href="ProductPage.aspx" class="btn btn-primary my-2">Shop Now</a></p>
                </div>
               
            </div>
        </div>
      </div>
</asp:Content>
