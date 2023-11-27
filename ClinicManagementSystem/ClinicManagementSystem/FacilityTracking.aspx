<%@ Page Title="Facility Tracking" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FacilityTracking.aspx.cs" Inherits="ClinicManagementSystem.FacilityTracking" %>
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
                                        <h4>Facility Issuing</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/wheelchair.png" />
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
                                    <label>Patient/Staff/Doctor ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Patient/Staff/Doctor ID"></asp:TextBox> 
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Facility ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Facility ID"></asp:TextBox>
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
                                    <label>Facility Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Facility Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>
                            <div class="row">

                                <div class="col-md-6">
                                    <label>Start Date & Time</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="DateTimeLocal"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>End Date & Time</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="DateTimeLocal"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>

                            <%--Button Row--%>
                            <div class="row">
                                <div class="col-4">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Issue" OnClick="Button2_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-primary" runat="server" Text="Return" OnClick="Button3_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-warning" runat="server" Text="Track" OnClick="Button4_Click" />
                                </div>
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to DashBoard</a><br /><br />
            </div>

            <div class="col-md-7">

                <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Issued Facility List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [facility_tracking_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                            <asp:BoundField DataField="facility_id" HeaderText="Facility ID" SortExpression="facility_id" />
                                            <asp:BoundField DataField="facility_name" HeaderText="Facility Name" SortExpression="facility_name" />
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date + Time" SortExpression="issue_date" />
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date + Time" SortExpression="due_date" />
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
