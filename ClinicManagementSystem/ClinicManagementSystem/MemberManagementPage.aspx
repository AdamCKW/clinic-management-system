<%@ Page Title="Member Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberManagementPage.aspx.cs" Inherits="ClinicManagementSystem.MemberManagementPage" %>
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
                                        <h4>User Details</h4>
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
                                <div class="col-md-3">
                                    <label>User ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label>Account Status</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox7" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                            <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                                            <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                        
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>IC Number</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="IC Number" ReadOnly="True"></asp:TextBox>                                 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Occupation</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox11" runat="server" placeholder="Occupation" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%--Third Row--%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>DOB</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date of Birth" ReadOnly="True"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contant Number" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <label>Email ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox8" runat="server" placeholder="Email" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <%--Fourth Row--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Zip Code</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox9" runat="server" placeholder="Zip Code" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                
                            </div>


                            <%--Fifth Row--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Full Postal Address</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Postal Address" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>

                            <%--Button Row--%>
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="Button4_Click" />
                                </div>
                            </div>

                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br /><br />
            </div>

            <div class="col-md-6">

                <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>User List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                            <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                            <asp:BoundField DataField="ic_number" HeaderText="IC Number" SortExpression="ic_number" />
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
