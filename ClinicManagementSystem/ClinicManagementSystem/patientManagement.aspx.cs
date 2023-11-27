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
    public partial class patientManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Back
        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("patient.aspx");
        }

        //Delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            deletePatient();
        }

        //Update
        protected void Button3_Click(object sender, EventArgs e)
        {
            updatePatient();
        }

        //GO
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPatientByID();
        }


        //User Defined Function

        void deletePatient()
        {
            if (checkIfPatientExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM patient_master_tbl WHERE ic_number='" + TextBox1.Text.Trim() + "'", con);

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

        bool checkIfPatientExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM patient_master_tbl WHERE ic_number='" + TextBox1.Text.Trim() + "'", con);
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

        void updatePatient()
        {
            if (checkIfPatientExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE patient_master_tbl SET full_name=@full_name, dob=@dob, contact_no=@contact_no, state=@state, city=@city, zipcode=@zipcode, full_address=@full_address, treatment_record=@treatment_record WHERE ic_number='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@full_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@zipcode", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@treatment_record", TextBox7.Text.Trim());



                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Patient Updated Succussfully.');</script>");
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

        void clearForm()
        {
            TextBox2.Text = "";     //full name
            TextBox1.Text = "";    //ic number
            TextBox3.Text = "";     //date of birth
            TextBox4.Text = "";     //contact no
            TextBox5.Text = "";     //state
            TextBox6.Text = "";     //city
            TextBox9.Text = "";     //zipcode
            TextBox10.Text = "";    //full address
            TextBox7.Text = "";     //treatment
        }
    }
}