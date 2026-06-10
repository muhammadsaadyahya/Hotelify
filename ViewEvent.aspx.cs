using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class ViewEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load events data into EventGridView
                BindEvent();
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

                string query = "SELECT * FROM GroupBookings WHERE [HotelID] = ANY (SELECT [hotel_id] FROM Hotel where owner_id= (Select [user_id] from [User] WHERE username = @username))";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = command.ExecuteReader();

                GroupBookingGridView.DataSource = reader;
                GroupBookingGridView.DataBind();
            }
        }
        
        protected void BindEvent()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string username = Session["Username"].ToString();
                connection.Open();

                string query = "SELECT * FROM Event WHERE [hotel_id] = any (SELECT [hotel_id] FROM Hotel where owner_id= (Select user_id from [User] WHERE username = @username))";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = command.ExecuteReader();

                EventGridView.DataSource = reader;
                EventGridView.DataBind();
            }
        }


        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Owner.aspx");
        }
    }
}