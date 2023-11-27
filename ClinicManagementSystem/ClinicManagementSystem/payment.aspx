<%@ Page Title="Payment" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="ClinicManagementSystem.payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('#myTable').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Payment</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/payment.png" />
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
                                    <label>Patient ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Patient ID"></asp:TextBox> 
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Facility ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Medicine ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">

                                <div class="col-md-6">
                                    <label>Patient Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Patient Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Medicine Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Medicine Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>
                            <div class="row">

                                <div class="col-md-3">
                                    <label>Cost</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Cost" TextMode="SingleLine" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label>Total</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Total" TextMode="SingleLine" ReadOnly="True">0</asp:TextBox> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>

                            <%--Button Row--%>
                            <div class="row">
                                <div class="col-4">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Clear" OnClick="Button3_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-primary" runat="server" Text="Pay" OnClick="Button4_Click" />
                                </div>
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to DashBoard</a><br /><br />
                <asp:TextBox ID="TextBox8" runat="server" Visible="False" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="col-md-7">

                <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Payment Details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [payment_details]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="patient_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="patient_id" HeaderText="Patient ID" ReadOnly="True" SortExpression="patient_id" />
                                            <asp:BoundField DataField="patient_name" HeaderText="Patient Name" SortExpression="patient_name" />
                                            <asp:BoundField DataField="medicine_name" HeaderText="Medicine Name" SortExpression="medicine_name" />
                                            <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" />
                                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                    </div>
                </div>

            </div>
        </div>

    </div>

</asp:Content>
