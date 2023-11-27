using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty((string)Session["role"])) //Not Logged In
                {
                    //User Only
                    LinkButton4.Visible = false; //Dashboard
                    LinkButton2.Visible = false; //Patient
                    LinkButton5.Visible = false; //Queue
                    LinkButton13.Visible = false; //Appointment
                    LinkButton14.Visible = false; //Payment
                    LinkButton15.Visible = false; //Facility
                    LinkButton17.Visible = false; //Medicine
                    LinkButton16.Visible = false; //Schedule
                    LinkButton7.Visible = false; //User Profile Button

                    //Public
                    LinkButton1.Visible = true; //User login button
                    LinkButton3.Visible = false; //User log out button

                    //Admin
                    LinkButton6.Visible = true; //Admin Login Button
                    LinkButton11.Visible = false; //Add User Button
                    LinkButton10.Visible = false; //User Management

                }
                else if (Session["role"].Equals("user")) //Logged In as User
                {
                    //User Only
                    LinkButton4.Visible = true; //Dashboard
                    LinkButton2.Visible = true; //Patient
                    LinkButton5.Visible = true; //Queue
                    LinkButton13.Visible = true; //Appointment
                    LinkButton14.Visible = true; //Payment
                    LinkButton15.Visible = true; //Facility
                    LinkButton17.Visible = true; //Medicine
                    LinkButton16.Visible = true; //Schedule
                    LinkButton7.Visible = true; //User Profile Button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    //Public
                    LinkButton1.Visible = false; //User login button
                    LinkButton3.Visible = true; //User log out button

                    //Admin
                    LinkButton6.Visible = true; //Admin Login Button
                    LinkButton11.Visible = true; //Add User Button
                    LinkButton10.Visible = false; //User Management
                }
                else if (Session["role"].Equals("admin")) //Logged In as Admin
                {
                    //User Only
                    LinkButton4.Visible = true; //Dashboard
                    LinkButton2.Visible = true; //Patient
                    LinkButton5.Visible = true; //Queue
                    LinkButton13.Visible = true; //Appointment
                    LinkButton14.Visible = true; //Payment
                    LinkButton15.Visible = true; //Facility
                    LinkButton17.Visible = true; //Medicine
                    LinkButton16.Visible = true; //Schedule
                    LinkButton7.Visible = true; //User Profile Button
                    LinkButton7.Text = "Hello Admin";

                    //Public
                    LinkButton1.Visible = false; //User login button
                    LinkButton3.Visible = true; //User log out button

                    //Admin
                    LinkButton6.Visible = false; //Admin Login Button
                    LinkButton11.Visible = true; //Add User Button
                    LinkButton10.Visible = true; //User Management
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberManagementPage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("Schedule.aspx");
        }

        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacilityTracking.aspx");
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicineManagement.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("payment.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("appointment.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("queuePatient.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("patient.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        //Logout
        protected void LinkButton3_Click(object sender, EventArgs e)
        {

            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            //User Only
            LinkButton4.Visible = false; //Dashboard
            LinkButton2.Visible = false; //Patient
            LinkButton5.Visible = false; //Queue
            LinkButton13.Visible = false; //Appointment
            LinkButton14.Visible = false; //Payment
            LinkButton15.Visible = false; //Facility
            LinkButton17.Visible = false; //Medicine
            LinkButton16.Visible = false; //Schedule
            LinkButton7.Visible = false; //User Profile Button

            //Public
            LinkButton1.Visible = true; //User login button
            LinkButton3.Visible = false; //User log out button

            //Admin
            LinkButton6.Visible = true; //Admin Login Button
            LinkButton11.Visible = true; //Add User Button
            LinkButton10.Visible = false; //User Management

            //Redirect to homepage
            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userProfile.aspx");
        }
    }
}