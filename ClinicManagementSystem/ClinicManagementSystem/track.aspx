<%@ Page Title="GPS Tracking" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="track.aspx.cs" Inherits="ClinicManagementSystem.track" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h2>GPS</h2>
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
                                
                                <div class="col-md-12">
                                    <center>
                                    <img width="50%" height="50%" src="imgs/randommap.jpg" />
                                    </center>
                                </div>
                                
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to DashBoard</a><br /><br />
            </div>

           
        </div>

    </div>

</asp:Content>
