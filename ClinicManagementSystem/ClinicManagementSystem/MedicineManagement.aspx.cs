using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ClinicManagementSystem
{
    public partial class Medicine_Management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_item;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getItemByID();
        }

        //add button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfItemExists())
            {
                Response.Write("<script>alert('Item ID/Name Already Exixt, Try Other IDs/Name');</script>");
            }
            else
            {
                addNewItem();
            }
        }

        //update button
        protected void Button2_Click(object sender, EventArgs e)
        {
            updateItemByID();
        }

        //delete button
        protected void Button3_Click(object sender, EventArgs e)
        {
            deleteItemByID();
        }



        //user defined function

        void updateItemByID()
        {

            if (checkIfItemExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox9.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox6.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_item)
                        {
                            Response.Write("<script>alert('Actual Stock Value Cannot Be less Than The Issued Items');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_item;
                            TextBox5.Text = "" + current_stock;
                        }
                    }

                    //string genres = "";
                    //foreach (int i in ListBox1.GetSelectedIndices())
                    //{
                        //genres = genres + ListBox1.Items[i] + ",";
                    //}
                    //genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/inventory/medicine";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("inventory/" + filename));
                        filepath = "~/inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE medicine_master_tbl set medicine_name=@medicine_name, medicine_detail=@medicine_detail, medicine_cost=@medicine_cost, current_stock=@current_stock, actual_stock=@actual_stock, current_location=@current_location, actual_location=@actual_location, medicine_img_link=@medicine_img_link where medicine_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@medicine_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_detail", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_cost", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_location", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_location", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    clearForm();
                    Response.Write("<script>alert('Item Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }

        void getItemByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from medicine_master_tbl WHERE medicine_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["medicine_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["medicine_detail"].ToString();
                    TextBox5.Text = dt.Rows[0]["medicine_cost"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["actual_location"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["current_location"].ToString().Trim();

                    TextBox8.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    //ListBox1.ClearSelection();
                    //string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    //for (int i = 0; i < genre.Length; i++)
                    //{
                    //for (int j = 0; j < ListBox1.Items.Count; j++)
                    //{
                    //if (ListBox1.Items[j].ToString() == genre[i])
                    //{
                    //ListBox1.Items[j].Selected = true;

                    //}
                    //}
                    //}

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_item = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["medicine_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Item ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        void deleteItemByID()
        {
            if (checkIfItemExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from medicine_master_tbl WHERE medicine_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Item Deleted Successfully');</script>");
                    
                    GridView1.DataBind();
                    clearForm();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }

        bool checkIfItemExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from medicine_master_tbl WHERE medicine_id='" + TextBox1.Text.Trim() + "' OR medicine_name='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }

        void addNewItem()
        {
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('Please Enter A ID');</script>");
            }
            else
            {
                try
                {
                    //string genres = "";
                    //foreach (int i in ListBox1.GetSelectedIndices())
                    //{
                    //    genres = genres + ListBox1.Items[i] + ",";
                    //}
                    // genres = Adventure,Self Help,
                    //genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/inventory/medicine.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("inventory/" + filename));
                    filepath = "~/inventory/" + filename;

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO medicine_master_tbl(medicine_id,medicine_name,medicine_detail,medicine_cost,current_stock,actual_stock,current_location,actual_location,medicine_img_link) values (@medicine_id,@medicine_name,@medicine_detail,@medicine_cost,@current_stock,@actual_stock,@current_location,@actual_location,@medicine_img_link)", con);

                    cmd.Parameters.AddWithValue("@medicine_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_detail", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_cost", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_stock", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_location", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_location", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@medicine_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Item added successfully.');</script>");
                    GridView1.DataBind();
                    clearForm();
                }
                catch
                {

                }
            }
            
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
        }
    }
}