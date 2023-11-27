<%@ Page Title="Inventory Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MedicineManagement.aspx.cs" Inherits="ClinicManagementSystem.Medicine_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
 
               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };
 
               reader.readAsDataURL(input.files[0]);
           }
       }
 
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
                                        <h4>Item Details</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img id="imgview" Height="100px" width="100px" src="inventory/medicine.png" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <%-- FIle Upload Row --%>
                            <div class="row">
                                <div class="col">
                                    <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                                </div>
                            </div>
                            <br />
                            <%-- First Row --%>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Medicine ID</label>
                                    <div class="form-group">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />                                    
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-9">
                                    <label>Medicine Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Medicine Name"></asp:TextBox> 
                                    </div>
                                </div>
                                
                            </div>
                            
                            <%--Second Row--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Medicine Description</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Medicine Description" ReadOnly="False" TextMode="MultiLine"></asp:TextBox>                                 
                                    </div>
                                </div>
                            </div>
                            
                            <%--Third Row--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Medicine Cost(per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Medicine Cost" TextMode="Number"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Current Stock" ReadOnly="True"></asp:TextBox> 
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox9" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <%--Fourth Row--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Issues</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Issued" ReadOnly="True"></asp:TextBox>                                 
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Current Item Location</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Current Item Location" ReadOnly="True"></asp:TextBox>                                 
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <label>Update Item Location</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Update Location"></asp:TextBox> 
                                    </div>
                                </div>

                            </div>

                            <%--Button Row--%>
                            <div class="row">
                                <div class="col-4">
                                    <asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button4_Click" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="Button2" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button2_Click" />
                                </div>
                                <div class="col-4" style="height: 40px">
                                    <asp:Button ID="Button3" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button3_Click" />
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
                                        <h4>Inventory List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicDBConnectionString %>" SelectCommand="SELECT * FROM [medicine_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="medicine_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="medicine_id" HeaderText="ID" ReadOnly="True" SortExpression="medicine_id" >
                                            
                                            <ControlStyle Font-Bold="True" />
                                            <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">

                                                        <div class="row">
                                                            <div class="col-lg-10">

                                                                <%--Name Row--%>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("medicine_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <%--Cost/Stock Row--%>
                                                                <div class="row">
                                                                    <div class="col-12">

                                                                        Cost - <asp:Label ID="Label7" runat="server" Text="RM" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("medicine_cost") %>'></asp:Label>
                                                                        &nbsp;| Actual Stock -
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                        &nbsp;| Available -
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                    </div>
                                                                </div>
                                                                <%--Location Row--%>
                                                                <div class="row">
                                                                    <div class="col-12">

                                                                        Location -
                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("current_location") %>'></asp:Label>

                                                                    </div>
                                                                </div>
                                                                <%--Description Row--%>
                                                                <div class="row">
                                                                    <div class="col-12">

                                                                        Description -
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("medicine_detail") %>' Font-Size="Smaller"></asp:Label>

                                                                    </div>
                                                                </div>


                                                            </div>

                                                            <div class="col-lg-2">
                                                                <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("medicine_img_link") %>' />
                                                            </div>
                                                        </div>

                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
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
