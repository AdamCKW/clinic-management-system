<%@ Page Title="Appointment" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="ClinicManagementSystem.appointment" %>
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
                                
                                <div class="col-md-6">
                                    <label>Patient Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Patient Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Doctor Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Doctor Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                                
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Patient ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Doctor ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contant Number" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>                                 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Time</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Time" TextMode="Time"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>

                            <%--Fourth Row--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Remarks</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Remarks" TextMode="MultiLine"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>

                            <%--Button Row--%>
                            <div class="row">
                                <div class="col-6">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Text="Create Appoint..." OnClick="Button3_Click" />
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="Button5" class="btn btn-lg btn-block btn-primary" runat="server" Text="Check In" OnClick="Button5_Click" />
                                </div>
                            </div>
                            <br />
                            <div class ="row">
                                <div class="col-6">
                                    <asp:Button ID="Button6" class="btn btn-lg btn-block btn-info" runat="server" Text="SMS Patient" OnClick="Button6_Click" />
                                </div>
                                <div class="col-6">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Cancel Appoint..." OnClick="Button2_Click" />
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
                                        <h4>Appointment List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [appointment_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="patient_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="patient_name" HeaderText="Patient Name" SortExpression="patient_name" />
                                            <asp:BoundField DataField="patient_id" HeaderText="Patient ID" ReadOnly="True" SortExpression="patient_id" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" />
                                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                                            <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
                                            <asp:BoundField DataField="member_id" HeaderText="Doctor ID" SortExpression="member_id" />
                                            <asp:BoundField DataField="member_name" HeaderText="Doctor Name" SortExpression="member_name" />
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
