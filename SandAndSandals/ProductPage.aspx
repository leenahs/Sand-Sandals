<%@ Page Title="Browse Sand & Sandals Products - Sand & Sandals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="SandAndSandals.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/productpage.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="container">
             
    </div>
    <div class="container">
        <div class="row">
            <asp:Listview runat="server" ID="Repeater1">
                <ItemTemplate>
                    <div class="col-md-3">
        	            <figure class="card card-product">
        		            <div class="img-wrap">
                                <a style="text-decoration: none;" href="Details.aspx?IdP=<%#Eval("IdP") %>">
                                    <div>
                                        <img src="<%#Eval("photoPath") %>" class="ImageCard"/>
                                    </div>
                                </a>
                            </div>
        		            <figcaption class="info-wrap">
        				            <h4 class="title" runat="server"><%#Eval("DesP") %></h4>
        				            <div class="rating-wrap">
        					            <div class="label-stock">In stock</div>
        				            </div>
        		            </figcaption>
        		            <div class="bottom-wrap">
        			            <a href="Details.aspx?IdP=<%#Eval("IdP") %>" class="btn  btn-primary float-right">View</a>	
        			            <div class="price-wrap h5">
        				            <span class="price-new"><span class="currency">SAR </span><span class="num" runat="server"><%#Eval("PriceP") %></span></span>
        			            </div>
        		            </div>
        	            </figure>
                        </div>
                </ItemTemplate>
            </asp:Listview>
            </div>
    </div> 
</asp:Content>
