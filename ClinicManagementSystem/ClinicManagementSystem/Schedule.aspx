<%@ Page Title="Schedule" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="ClinicManagementSystem.Scheduel" %>
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
                                        <h4>Staff Details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/writer.png" />
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
                                <div class="col-md-4">
                                    <label>Staff ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click1" />                            
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Staff Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Staff's Name" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <label>Attendance</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Work" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Date</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox> 
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <label>Time</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Time" TextMode="Time"></asp:TextBox> 
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Status</label>
                                    <div class="form-group">
                                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem Text="Select" Value="Select" />
                                            <asp:ListItem Text="Check_In" Value="Check_In" />
                                            <asp:ListItem Text="Check_Out" Value="Check_Out" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                             </div>

                            <%--Third Row--%>
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <label>Schedule</label>
                                    <div class="form-group">
                                        <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple">
                                            
                                            <asp:ListItem Text="Monday" Value="Monday" />
                                            <asp:ListItem Text="Tuesday" Value="Tuesday" />
                                            <asp:ListItem Text="Wednesday" Value="Wednesday" />
                                            <asp:ListItem Text="Thursday" Value="Thursday" />
                                            <asp:ListItem Text="Friday" Value="Friday" />
                                            <asp:ListItem Text="Saturday" Value="Saturday" />
                                            <asp:ListItem Text="Sunday" Value="Sunday" />
                                           
                                        </asp:ListBox>
                                    </div>
                                </div>
                             </div>
                            

                            <%--Button--%>
                            <div class="row">
                                
                                <div class="col-12">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" runat="server" Text="Update" OnClick="Button3_Click" />
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
                                        <h4>Staff List</h4>
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
                                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                            <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id" ReadOnly="True" />
                                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                            <asp:BoundField DataField="day" HeaderText="Schedule" SortExpression="day" />
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
