<%@ Page Title="Queue" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="queuePatient.aspx.cs" Inherits="ClinicManagementSystem.queuePatient" %>
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
            <div class="col-md-4">

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
                            <div class="col-md-6">
                                    <label>Patient ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contant Number" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>

                            <%--Fourth Row--%>
                            
                            <%--Fifth Row--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Visit On</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Time" TextMode="Time"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                            </div>

                            <%--Button Row--%>
                                <div class="row">
                                <div class="col-6">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Text="Add To Queue" OnClick="Button3_Click" />
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Check In" OnClick="Button2_Click" />
                                </div>
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to DashBoard</a><br /><br />
            </div>

            <div class="col-md-8">

                <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Queue List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [queue_patient_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="patient_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="patient_id" HeaderText="Patient ID" SortExpression="patient_id" ReadOnly="True" />
                                            <asp:BoundField DataField="patient_name" HeaderText="Patient Name" SortExpression="patient_name" />
                                            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" />
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
