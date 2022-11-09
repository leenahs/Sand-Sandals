<%@ Page Title="Checkout - Sand & Sandals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SandAndSandals.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/Checkout.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="py-5 text-left">
        <h1>Checkout</h1>
    </div>
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <p>your cart</p>
            </h4>
            <ul class="list-group mb-3">
                <asp:ListView runat="server" ID="ListView1">
                    <ItemTemplate>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <span class="cartImg"><asp:Image runat="server" Width="50px" Height="50px" ImageUrl='<%#Eval("PhotoPath") %>'/></span>
                            <div>
                                <h6 class="my-0" runat="server"><%#Eval("DesP") %></h6>
                                <small class="text-muted" runat="server">Quantity: <%#Eval("QtyP") %></small>
                            </div>
                            <p runat="server">$<%#Eval("PriceP") %></p>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" novalidate="">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">First name</label>
                        <input runat="server" id="fnameinput" class="form-control" type="text" placeholder="Enter your first Name" name="fname" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <input runat="server" id="lnameinput" class="form-control" type="text" placeholder="Enter your last Name" name="lname" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                </div>
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="country">Country</label>
                        <select class="custom-select d-block w-100" id="country" required="">
                            <option value="">Choose...</option>
                            <option>Saudi Arabia</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="state">City</label>
                        <select class="custom-select d-block w-100" id="state" required="">
                            <option value="">Choose...</option>
                            <option>Dammam</option>
                            <option>Dhahran</option>
                            <option>Khobar</option>
                        </select>
                    </div>
                </div>
                <hr class="mb-4">
                <h4 class="mb-3">Payment</h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="ccname">Name on card</label>
                        <input type="text" class="form-control" id="ccname" placeholder="" required>
                        <small class="text-muted">Full name as displayed on card</small>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="ccnumber">Credit card number</label>
                        <input type="text" class="form-control" id="ccnumber" placeholder="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="expiration">Expiration</label>
                        <input type="number" class="form-control" id="expiration" placeholder="" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cvv">CVV</label>
                        <input type="number" class="form-control" id="cvv" placeholder="" required>
                    </div>
                </div>
                <hr class="mb-4">
                <asp:Button class="btn btn-primary btn-lg btn-block" runat="server" ID="btnCheckout"  Text="Confirm order" OnClick="btnCheckout_Click" Width="261px" />
            </form>
            <asp:Label class="lead" ID="orderPlacedLabel" runat="server"> </asp:Label>
        </div>
    </div>
</div>
</asp:Content>