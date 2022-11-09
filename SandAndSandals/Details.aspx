<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="SandAndSandals.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/details.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
		<div class="card">
			<div class="row">
				<div class="col-sm-5">
					<div class="gallery-wrap"> 
						<div class="img-wrap">
						  <asp:Image class="img-fluid" runat="server" ID="PhotoP" Width="680px" Height="480px"/> 
						</div>
					</div> 
				</div>
				<div class="col-sm-7">
					<div class="card-body p-5">
						<h3 class="title mb-3" runat="server" id="proDes"></h3>

					<p class="price-detail-wrap"> 
						<span class="price h3"> 
							<span class="currency">SAR </span><span class="num" runat="server" id="Proprice"></span>
						</span> 
					</p>
					<dl class="item-property">
					  <dt>Description</dt>
						<dd><p>
							Shop for sustainable summer products that would protect you and the environment. 
							Sand&Sandls products are designed with natural and sustainable materials to help improve our environment. 
							Shop your favorite and exclusive products with Sand&Sandals.
						</p></dd>
					</dl>
						<div class="row">
							<div class="col-sm-5">
								<dl class="param param-inline">
								  <strong>Quantity: </strong>
									<span runat="server" id="proquantity"></span>
									<input class="" runat="server" type="number" max="5" min="1" id="userSelected" style="height: 28px; width: 64px" value="1" />
								</dl>
							</div>
							<div class="col-sm-7">
				
							</div>
						</div>
						<hr>
						<asp:Button class="btn btn-lg btn-primary" runat="server" ID="Button1" Text="Add to Cart" OnClick="AddToCartbtn_Click" />
						<label runat="server" id="Label1"></label>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
