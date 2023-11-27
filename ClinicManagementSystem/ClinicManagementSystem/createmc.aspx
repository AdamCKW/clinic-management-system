<%@ Page Title="Create MC" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="createmc.aspx.cs" Inherits="ClinicManagementSystem.createmc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function printDiv() {
            var divContents = document.getElementById("detailPrint").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html> <h1>Clinic Management System MC<br>');
            a.document.write('<body >');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        } 
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Patient Details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/generaluser.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div id ="detailPrint">
                            <%-- First Row --%>
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                                
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">
                            <div class="col-md-12">
                                    <label>Patient ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>
                            <div class="row">
                                <div class="col-md-8">
                                    <label>Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Day</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Days" TextMode="Number">0</asp:TextBox> 
                                    </div>
                                </div>
                            </div>

                            <%--Fourth Row--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Reason</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Reason" TextMode="MultiLine"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>
                            </div>
                            <%--Button Row--%>
                            <div class ="row">
                                <div class="col-4 mx-auto">
                                    <input class="btn btn-lg btn-block btn-primary" type="button" value="Print MC" onclick="printDiv()">
                                </div>
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to DashBoard</a><br /><br />
            </div>

        </div>

    </div>

</asp:Content>
