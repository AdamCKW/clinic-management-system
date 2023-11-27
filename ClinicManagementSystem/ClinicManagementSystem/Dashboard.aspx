<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ClinicManagementSystem.Dashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('#myTable').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/banner_top.png" class="img-fluid"/>
    </section>

    <section>
        <div class ="container-fluid">
            <div class="row">
                <div class="col-md-7 mx-auto">

                <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                       <h3><b>Queue List</b></h3>
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
    </section>

</asp:Content>
