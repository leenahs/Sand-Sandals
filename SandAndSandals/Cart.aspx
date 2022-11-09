<%@ Page Title="Your Cart - Sand & Sandals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SandAndSandals.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/cart.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" ">
        <div style="margin-left: 42%">
            
        </div>
    </div>
    
    <div class="container">
		<div class="card">
		<h2 class="text-center">Your cart</h2>
		<table class="table shopping-cart-wrap">
			<br />
			<thead class="text-muted">
				<tr>
				  <th scope="col">Product</th>
				  <th scope="col" width="120">Quantity</th>
				  <th scope="col" width="120">Price</th>
				</tr>
			</thead>
			<tbody>
                <asp:ListView runat="server" ID="ListView1">
                    <ItemTemplate>
				        <tr>
					        <td>
						        <figure class="media">
							        <div class="img-wrap"><asp:Image class="img-sm" runat="server" ImageUrl='<%#Eval("PhotoPath") %>'/></div>
							        <figcaption class="media-body">
								        <h6 class="title" runat="server"><%#Eval("DesP")%> </h6>
							        </figcaption>
						        </figure> 
					        </td>
					        <td>
						        <p runat="server"><%#Eval("QtyP") %></p>
					        </td>
					        <td> 
						        <div class="price-wrap"> 
							        <span>SAR </span><span class="num" runat="server"><%#Eval("PriceP") %></span> 
						        </div>
					        </td>
				        </tr>
                    </ItemTemplate>
                </asp:ListView>
				<tr>
					<td></td>
					<td></td>
					<td>
						<a style="width: 261px" href="Checkout.aspx" class="btn btn-success">Confirm order</a>	
					</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
</asp:Content>
