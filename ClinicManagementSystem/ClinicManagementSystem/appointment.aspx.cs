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
    public partial class appointment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Get patient data
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPatientByID();
        }

        //get user data
        protected void Button4_Click(object sender, EventArgs e)
        {
            getDoctorByID();
        }

        //create appointment
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkAppointment())
            {
                Response.Write("<script>alert('Appointment Already Exist');</script>");
            }
            else if (TextBox7.Text == "")
            {
                Response.Write("<script>alert('Please Select Appointment Date');</script>");
            }
            else if (TextBox8.Text == "")
            {
                Response.Write("<script>alert('Please Select Appointment Time');</script>");
            }
            else if (TextBox11.Text == "")
            {
                Response.Write("<script>alert('Please state any remarks');</script>");
            }
            else
            {
                createAppointment();
            }
        }

        //check in
        protected void Button5_Click(object sender, EventArgs e)
        {
            removeAppointment();
        }

        //delete
        protected void Button2_Click(object sender, EventArgs e)
        {
            removeAppointment();
        }

        //User defined function

        void removeAppointment()
        {
            if (checkAppointment())
            {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM appointment_tbl WHERE patient_id='" + TextBox1.Text.Trim() + "' AND member_id='"+ TextBox5.Text.Trim() +"'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Appointment List is Updated');</script>");
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
                Response.Write("<script>alert('Invalid Patient ID');</script>");
            }
        }

        bool checkUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl Where member_id='" + TextBox5.Text.Trim() + "' OR ic_number='" + TextBox3.Text.Trim() + "';", con);
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

        bool checkAppointment()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from appointment_tbl WHERE patient_id='" + TextBox1.Text.Trim() + "';", con);
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

        void createAppointment()
        {
            if (checkPatientExists())
            {
                Button1_Click(new object(), new EventArgs());

                if (checkUserExists())
                {
                    Button4_Click(new object(), new EventArgs());

                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("INSERT INTO appointment_tbl (patient_name,patient_id,contact_no,date,time,remarks,member_id,member_name) values (@patient_name,@patient_id,@contact_no,@date,@time,@remarks,@member_id,@member_name)", con);

                        cmd.Parameters.AddWithValue("@patient_name", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@patient_id", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact_no", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@date", TextBox7.Text.Trim());
                        cmd.Parameters.AddWithValue("@time", TextBox8.Text.Trim());
                        cmd.Parameters.AddWithValue("@remarks", TextBox11.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_id", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());


                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Appointment Successfully Created. View In Appointment List');</script>");
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
                    Response.Write("<script>alert('Invalid Doctor ID');</script>");
                }
                
            }
            else
            {
                Response.Write("<script>alert('Invalid Patient ID');</script>");
            }
        }

        void getDoctorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id='" + TextBox5.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox3.Text = dr.GetValue(0).ToString(); //full name
                        
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
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox11.Text = "";
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (checkAppointment())
            {
                Response.Write("<script>alert('SMS has been sent to patient');</script>");
            }
            else
            {
                Response.Write("<script>alert('Appointment Does Not Exist');</script>");
            }
        }
    }
}