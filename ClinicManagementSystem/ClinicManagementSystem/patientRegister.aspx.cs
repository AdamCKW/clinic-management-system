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
    public partial class patientRegister : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Register button click event
        protected void Button2_Click(object sender, EventArgs e)
        {

            if (checkPatientExists())
            {
                Response.Write("<script>alert('Patient Already Exist');</script>");
            }
            else if (checkPatientText())
            {

            }
            else
            {
                registerNewPatient();
            }

        }


        // user defined method

        bool checkPatientText()
        {
            try
            {
                if (TextBox1.Text == "") //Full name
                {
                    Response.Write("<script>alert('Please Enter Your Full Name');</script>");
                    return true;
                }
                else if (TextBox2.Text == "")
                {
                    Response.Write("<script>alert('Please Enter Your Date of Birth');</script>");
                    return true;
                }
                else if (TextBox3.Text == "")
                {
                    Response.Write("<script>alert('Please Enter Your Contact Number');</script>");
                    return true;
                }
                else if (TextBox4.Text == "")
                {
                    Response.Write("<script>alert('Please Enter IC Number/Passport');</script>");
                    return true;
                }
                else if (TextBox5.Text == "")
                {
                    Response.Write("<script>alert('Please Enter City');</script>");
                    return true;
                }
                else if (TextBox6.Text == "")
                {
                    Response.Write("<script>alert('Please Enter Zipcode');</script>");
                    return true;
                }
                else if (TextBox7.Text == "")
                {
                    Response.Write("<script>alert('Please Enter Full Address');</script>");
                    return true;
                }
                else if (DropDownList1.SelectedItem.Value == "Select")
                {
                    Response.Write("<script>alert('Please Select A State');</script>");
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool checkPatientExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from patient_master_tbl WHERE ic_number='" + TextBox4.Text.Trim() + "';", con);
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


        void registerNewPatient()
        {
            //Response.Write("<script>alert('Testing');</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO patient_master_tbl(full_name,dob,contact_no,ic_number,state,city,zipcode,full_address,treatment_record,remarks) values (@full_name,@dob,@contact_no,@ic_number,@state,@city,@zipcode,@full_address,@treatment_record,@remarks)", con);

                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@ic_number", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@treatment_record", "No Record");
                cmd.Parameters.AddWithValue("@remarks", "");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Patient Successfully Registered. View In Patient List');</script>");
                Response.Redirect("patient.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}