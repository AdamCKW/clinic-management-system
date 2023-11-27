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
    public partial class payment : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string name;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getName();
        }

        //Add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfItemExist() && checkIfPatientExist())
            {

                addValue();

            }
            else
            {
                Response.Write("<script>alert('Wrong Item ID or Patient ID');</script>");
            }
        }

        //clear button
        protected void Button3_Click(object sender, EventArgs e)
        {
            clearForm();
        }

        //pay button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfItemExist() && checkIfPatientExist())
            {

                payItem();

            }
            else
            {
                Response.Write("<script>alert('Wrong Item ID or Patient ID');</script>");
            }
        }


        //user defined function

        void payItem()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO payment_details(patient_id,medicine_id,patient_name,medicine_name,total,date) values (@patient_id,@medicine_id,@patient_name,@medicine_name,@total,@date)", con);

                cmd.Parameters.AddWithValue("@medicine_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@patient_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@patient_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@medicine_name", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@total", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@date", TextBox7.Text.Trim());

                cmd.ExecuteNonQuery();


                con.Close();
                Response.Write("<script>alert('Items Paid Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfItemExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from medicine_master_tbl WHERE medicine_id='" + TextBox1.Text.Trim() + "'", con);
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
                return false;
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
                SqlCommand cmd = new SqlCommand("select full_name from patient_master_tbl WHERE ic_number='" + TextBox2.Text.Trim() + "'", con);
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
                return false;
            }
        }

        void addValue()
        {
            if (checkIfItemExist())
            {
                int cost = Convert.ToInt32(TextBox5.Text.Trim());
                int total = Convert.ToInt32(TextBox6.Text.Trim());

                name = TextBox4.Text;

                total += cost;

                TextBox6.Text = "" + total;
                TextBox8.Text = TextBox8.Text + ", " + name;
            }
            else
            {
                Response.Write("<script>alert('Invalid Medicine ID');</script>");
            }
        }

        void getName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select medicine_name, medicine_cost from medicine_master_tbl WHERE medicine_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["medicine_name"].ToString();
                    TextBox5.Text = dt.Rows[0]["medicine_cost"].ToString().Trim();
                }
                else
                {
                    Response.Write("<script>alert('Incorrect Medicine ID');</script>");
                }


                cmd = new SqlCommand("select full_name from patient_master_tbl WHERE ic_number='" + TextBox2.Text.Trim() + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString().Trim();
                    TextBox2.ReadOnly = true;
                }
                else
                {
                    Response.Write("<script>alert('Incorrect Patient ID');</script>");
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
            TextBox6.Text = "0";
            TextBox7.Text = "";
            TextBox8.Text = "";

            TextBox2.ReadOnly = false;
            name = "";
        }
    }
}