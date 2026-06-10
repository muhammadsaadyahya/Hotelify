using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindHotel();
                BindBooking();
            }
        }

            protected void BindHotel()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string username = Session["Username"].ToString();

                connection.Open();
                string query = "SELECT * FROM Hotel where owner_id=(Select [user_id] from [user] where [username]=@username)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = command.ExecuteReader();
                HotelGridView.DataSource = reader;
                HotelGridView.DataBind();
            }
        }

        protected void AddRooom(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                Button btn = (Button)sender; // Cast sender to Button as expected
                int hotelId = Convert.ToInt32(btn.CommandArgument);

                // **No need to register hotelId for event validation**

                // Construct the URL with query string parameters
                string destinationPageUrl = "AddRoom.aspx?hotelId=" + hotelId.ToString();

                // Redirect to the destination page
                Response.Redirect(destinationPageUrl);
            }
        }



        protected void BindBooking()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string username = Session["Username"].ToString();

                connection.Open();
                string query = "SELECT * FROM Booking B JOIN Room R ON B.room_id = R.room_id JOIN Hotel H ON R.hotel_id = H.hotel_id WHERE R.hotel_id IN (SELECT [hotel_id] FROM Hotel  WHERE owner_id = (SELECT [user_id] FROM [User] WHERE username = @username));";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = command.ExecuteReader();
                BookingGridView.DataSource = reader;
                BookingGridView.DataBind();
            }
        }


        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("owner.aspx");

        }

    }
}