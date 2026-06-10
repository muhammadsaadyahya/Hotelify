using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class ManageBooking : System.Web.UI.Page
    {
        
     
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Load hotels data into HotelGridView
                    BindBooking();
                }
            }

 protected void BindBooking()
{
    string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
                string username = Session["Username"].ToString();

                connection.Open();
        
        SqlCommand command = new SqlCommand("ViewBookingDetails", connection);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.AddWithValue("@username", username);
        SqlDataReader reader = command.ExecuteReader();

        BookingGridView.DataSource = reader;
        BookingGridView.DataBind();
    }
}


         

         protected void DeleteRoom(object sender, EventArgs e)
{
    string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        Button btn = (Button)sender;
        int bookingId = Convert.ToInt32(btn.CommandArgument);

        connection.Open();
        
                SqlCommand command = new SqlCommand("CancelBooking", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@booking_id", bookingId);
        
        command.ExecuteNonQuery();

        BindBooking();
    }
}
            


            protected void home(object sender, EventArgs e)
            {
                Response.Redirect("guest.aspx");
            }
        }
    }