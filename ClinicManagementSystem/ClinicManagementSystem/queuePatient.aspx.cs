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
    public partial class queuePatient : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //GO button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPatientByID();
        }

        //Add to queue
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkPatientInQueue())
            {
                Response.Write("<script>alert('Patient Already In Queue');</script>");
            }
            else
            {
                addToQueue();
            }
                  
        }

        //Check In
        protected void Button2_Click(object sender, EventArgs e)
        {
            removeFromQueue();
        }

        //User Defined Function

        bool checkPatientInQueue()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from queue_patient_tbl WHERE patient_id='" + TextBox1.Text.Trim() + "';", con);
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

        void removeFromQueue()
        {
            if (checkPatientExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM queue_patient_tbl WHERE patient_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Patient Checked In Successfully');</script>");
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
                Response.Write("<script>alert('Invalid User ID');</script>");
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

                SqlCommand cmd = new SqlCommand("SELECT * from patient_master_tbl WHERE ic_number='" + TextBox1.Text.Trim() + "';", con);
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

        void addToQueue()
        {
            if (checkPatientExists())
            {
                Button1_Click(new object(), new EventArgs());

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO queue_patient_tbl (patient_id,patient_name,time,contact_no) values (@patient_id,@patient_name,@time,@contact_no)", con);

                    cmd.Parameters.AddWithValue("@patient_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@patient_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@time", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox4.Text.Trim());
                    

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Patient Successfully Added To Queue. View In Queue List');</script>");
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
                        TextBox4.Text = dr.GetValue(2).ToString(); //contact no
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
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox7.Text = "";
        }

    }

}