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
    public partial class patient : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Edit Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("patientManagement.aspx");
        }

        //GO button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPatientByID();
        }

        //Register Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("patientRegister.aspx");
        }


        //User Defined Function

        void getPatientByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM patient_master_tbl WHERE ic_number='" + TextBox1.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString(); //full name
                        TextBox3.Text = dr.GetValue(1).ToString(); //date of birth
                        TextBox4.Text = dr.GetValue(2).ToString(); //contact no
                        TextBox5.Text = dr.GetValue(4).ToString(); //state
                        TextBox6.Text = dr.GetValue(5).ToString(); //city
                        TextBox9.Text = dr.GetValue(6).ToString(); //zipcode
                        TextBox10.Text = dr.GetValue(7).ToString(); //full address
                        TextBox7.Text = dr.GetValue(8).ToString(); //Treatment record
                    }
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("createmc.aspx");
        }
    }
}