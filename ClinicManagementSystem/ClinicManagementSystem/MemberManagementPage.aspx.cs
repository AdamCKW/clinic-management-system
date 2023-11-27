using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementSystem
{
    public partial class MemberManagementPage : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //GO button
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Testing.');</script>");
            getUserByID();
        }

        //Activate Button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateUserStatusByID("Active");
        }

        //Pause Button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateUserStatusByID("Pending");
        }

        //Deactivate Button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateUserStatusByID("Deactivated");
        }

        //Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            deleteUserByID();
        }


        //User defined function

        bool checkIfUserExist()
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

        void deleteUserByID()
        {
            if (checkIfUserExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from member_master_tbl WHERE member_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid User ID');</script>");
            }
        }


        void updateUserStatusByID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id='" + TextBox1.Text.Trim() + "';", con);
                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.DataBind();
                clearForm();
                Response.Write("<script>alert('User Status Updated');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void getUserByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl WHERE member_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString(); //full name
                        TextBox7.Text = dr.GetValue(11).ToString(); //account status
                        TextBox12.Text = dr.GetValue(17).ToString(); //ic number
                        TextBox11.Text = dr.GetValue(2).ToString(); //occupation
                        TextBox3.Text = dr.GetValue(1).ToString(); //date of birth
                        TextBox4.Text = dr.GetValue(3).ToString(); //contact no
                        TextBox8.Text = dr.GetValue(4).ToString(); //email
                        TextBox5.Text = dr.GetValue(5).ToString(); //state
                        TextBox6.Text = dr.GetValue(6).ToString(); //city
                        TextBox9.Text = dr.GetValue(7).ToString(); //zipcode
                        TextBox10.Text = dr.GetValue(8).ToString(); //full address
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }

           
        }

        void clearForm()
        {
            TextBox2.Text = "";     //full name
            TextBox7.Text = "";     //account status
            TextBox12.Text = "";    //ic number
            TextBox11.Text = "";    //occupation
            TextBox3.Text = "";     //date of birth
            TextBox4.Text = "";     //contact no
            TextBox8.Text = "";     //email
            TextBox5.Text = "";     //state
            TextBox6.Text = "";     //city
            TextBox9.Text = "";     //zipcode
            TextBox10.Text = "";    //full address
        }

    }
}