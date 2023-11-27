<%@ Page Title="User Sign Up" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="ClinicManagementSystem.userSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>User Sign Up</h3>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <%-- First Row --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                
                            </div>
                            <%-- Second Row --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>IC Number</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="IC Number" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Occupation</label>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                            <asp:ListItem Text="Select" Value="Select" />
                                            <asp:ListItem Text="Doctor" Value="Doctor" />
                                            <asp:ListItem Text="Nurse" Value="Nurse" />
                                            <asp:ListItem Text="Clerk" Value="Clerk" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                             <%-- Third Row --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Email</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%-- Fourth Row --%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="Select" Value="Select" />
                                            <asp:ListItem Text="Johor" Value="Johor" />
                                            <asp:ListItem Text="Kedah" Value="Kedah" />
                                            <asp:ListItem Text="Kelantan" Value="Kelantan" />
                                            <asp:ListItem Text="Melaka" Value="Melaka" />
                                            <asp:ListItem Text="Negeri Sembilan" Value="Negeri Sembilan" />
                                            <asp:ListItem Text="Pahang" Value="Pahang" />
                                            <asp:ListItem Text="Penang" Value="Penang" />
                                            <asp:ListItem Text="Perak" Value="Perak" />
                                            <asp:ListItem Text="Perlis" Value="Perlis" />
                                            <asp:ListItem Text="Sabah" Value="Sabah" />
                                            <asp:ListItem Text="Sarawak" Value="Sarawak" />
                                            <asp:ListItem Text="Selangor" Value="Selangor" />
                                            <asp:ListItem Text="Terengganu" Value="Terengganu" />

                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="City"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Zip Code</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                             <%-- Fifth Row --%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <%-- Pill Badge --%>
                            <div class="row">
                                <div class="col">
                                    <center>
                                    <span class="badge badge-pill badge-info">Login Credential</span>
                                    </center>
                                </div>
                            </div> <br />

                            <%-- Fifth Row --%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>User ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--Sign UP Button--%>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                    </div>

                                </div>
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to Home</a><br /><br />
            </div>
        </div>
    </div>

</asp:Content>
