using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication6
{
    public partial class WebForm8 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load events data into EventGridView
                BindEvent();
                BindHotel();
            }
        }

        protected void BindHotel()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM Hotel";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                HotelGridView.DataSource = reader;
                HotelGridView.DataBind();
            }
        }

        protected void BindEvent()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string username = Session["Username"].ToString();
                connection.Open();

                string query = "SELECT * FROM Event WHERE [guest_id] = (SELECT [user_id] FROM [User] WHERE username = @username)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = command.ExecuteReader();

                EventGridView.DataSource = reader;
                EventGridView.DataBind();
            }
        }



        protected void DoEventBooking(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            string username = Session["Username"].ToString();

            int.TryParse(HotelIDTextBox.Text, out int hotelId);
            DateTime eventDate = DateTime.Parse(EventDateTextBox.Text);
            int attendees = int.Parse(AttendeesTextBox.Text);
            string eventType = EventTypeTextBox.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("EventBook", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@user", username);
                    command.Parameters.AddWithValue("@hid", hotelId);
                    command.Parameters.AddWithValue("@date", eventDate);
                    command.Parameters.AddWithValue("@e", eventType);
                    command.Parameters.AddWithValue("@g", attendees);

                    command.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }


        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("guest.aspx");
        }
    }
}
