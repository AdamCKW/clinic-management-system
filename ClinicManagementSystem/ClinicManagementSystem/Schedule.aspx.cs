using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementSystem
{
    public partial class Scheduel : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Add Button Click
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        //Update Button Click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkStaffExist())
            {
                updateStaff();
            }
            else
            {
                Response.Write("<script>alert('Staff Does Not Exist');</script>");
            }
        }

        //Delete Buttonclick
        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        //GO Button Click
        protected void Button1_Click1(object sender, EventArgs e)
        {
            getStaffByID();
        }

        //user defined funtion

        void getStaffByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][0].ToString();
                    TextBox5.Text = dt.Rows[0][15].ToString();

                    DropDownList1.SelectedValue = dt.Rows[0]["status"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] day = dt.Rows[0]["day"].ToString().Trim().Split(',');
                    for (int i = 0; i < day.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == day[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Staff ID.');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }


        

        void updateStaff()
        {
            int value = 1;
            double temp;

            try
            {
                string day = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                day = day + ListBox1.Items[i] + ",";
                }
                day = day.Remove(day.Length - 1);

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET date=@date, time=@time, status=@status, work=@work, day=@day WHERE member_id='"+TextBox1.Text.Trim()+"'", con);

                cmd.Parameters.AddWithValue("@date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@time", TextBox3.Text.Trim());
                temp = double.Parse(TextBox5.Text);
                
                if (DropDownList1.SelectedItem.Text=="Check_In") 
                {
                    temp += value;
                }
                cmd.Parameters.AddWithValue("@work", temp);
                cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@day", day);



                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Schedule Updated Succussfully.');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }




        bool checkStaffExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
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

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            DropDownList1.ClearSelection();
            ListBox1.ClearSelection();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}