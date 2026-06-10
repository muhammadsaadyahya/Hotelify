using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication6
{
    public partial class AddHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void AddHoteel(string hotelName,string description,string location)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("AddHotelA", connection))
                {
                    string username = Session["Username"].ToString();
                   


                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters
                    command.Parameters.AddWithValue("@user", username);
                    command.Parameters.AddWithValue("@hn", hotelName);
                    command.Parameters.AddWithValue("@des", description);
                    command.Parameters.AddWithValue("@loc", location);
                    // Execute the stored procedure
                    command.ExecuteNonQuery();



                }
            }



        }
        protected void Confirm(object sender, EventArgs e)
        {

            string hotelName = HotelNameTextBox.Text.Trim();
            string description = descriptionTextBox.Text.Trim();
            string location = LocationTextBox1.Text.Trim();



            AddHoteel( hotelName, description, location);


        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("owner.aspx");
        }



    }
}