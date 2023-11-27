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

    public partial class userSignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Sign up button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkUserExists())
            {
                Response.Write("<script>alert('User Already Exist with this User ID, try other ID');</script>");
            }
            else if (checkUserText())
            {

            }
            else
            {
                signUpNewUser();
                
            }
            
        }



        // user defined method
        bool checkUserText()
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
                    Response.Write("<script>alert('Please Enter IC Number');</script>");
                    return true;
                }
                else if (TextBox10.Text == "")
                {
                    Response.Write("<script>alert('Please Enter Your Contact Number');</script>");
                    return true;
                }
                else if (TextBox11.Text == "")
                {
                    Response.Write("<script>alert('Please Enter Your Email');</script>");
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
                else if (TextBox8.Text == "")
                {
                    Response.Write("<script>alert('Please Enter A Member ID');</script>");
                    return true;
                }
                else if (TextBox9.Text == "")
                {
                    Response.Write("<script>alert('Please Enter A Password');</script>");
                    return true;

                }
                else if (DropDownList1.SelectedItem.Value == "Select")
                {
                    Response.Write("<script>alert('Please Select A State');</script>");
                    return true;
                }
                else if (DropDownList2.SelectedItem.Value == "Select")
                {
                    Response.Write("<script>alert('Please Select Your Occupation');</script>");
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

        bool checkUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl Where member_id='"+TextBox8.Text.Trim()+"' OR ic_number='"+TextBox3.Text.Trim()+"';", con);
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


        void signUpNewUser()
        {
            //Response.Write("<script>alert('Testing');</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into member_master_tbl(full_name,dob,occupation,contact_no,email,state,city,zipcode,full_address,member_id,password,account_status,date,time,status,work,day,ic_number) values (@full_name,@dob,@occupation,@contact_no,@email,@state,@city,@zipcode,@full_address,@member_id,@password,@account_status,@date,@time,@status,@work,@day,@ic_number)", con);

                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@ic_number", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@occupation", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact_no", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "Pending");
                cmd.Parameters.AddWithValue("@date", "Pending");
                cmd.Parameters.AddWithValue("@time", "Pending");
                cmd.Parameters.AddWithValue("@status", "Pending");
                cmd.Parameters.AddWithValue("@work", "0");
                cmd.Parameters.AddWithValue("@day", "");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('User Sign Up Successful. Go to User Login to Login');</script>");
                clearForm();
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
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            DropDownList1.ClearSelection();
            DropDownList2.ClearSelection();
        }
    }
}