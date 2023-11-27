<%@ Page Title="Edit Patient" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="patientManagement.aspx.cs" Inherits="ClinicManagementSystem.patientManagement" %>
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
            <div class="col-md-6">

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
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name"></asp:TextBox> 
                                    </div>
                                </div>
                                
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">
                            <div class="col-md-5">
                                    <label>Patient ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label>DOB</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date of Birth"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contant Number" TextMode="Number"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="State"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Zip Code</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox9" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%--Fourth Row--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Full Postal Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Postal Address" TextMode="MultiLine"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>

                            <%--Fifth Row--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Treatment Record</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Treatment Record" TextMode="MultiLine"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>

                            <%--Button Row--%>
                                <div class="row">
                                <div class="col-4">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Text="Update" OnClick="Button3_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Back" OnClick="Button2_Click1" />
                                </div>
                            </div>

                    </div>
                </div>

                <a href="Dashboard.aspx"><< Back to DashBoard</a><br /><br />
            </div>

            <div class="col-md-6">

                <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Patient List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [patient_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ic_number" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                            <asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                            <asp:BoundField DataField="ic_number" HeaderText="IC Number" ReadOnly="True" SortExpression="ic_number" />
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
