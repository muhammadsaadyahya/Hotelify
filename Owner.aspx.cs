using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class Owner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOwnerDetails();
            }
        }

        protected void manage(object sender, EventArgs e)
        {
            LoadOwnerDetails();
        }

        private void LoadOwnerDetails()
        {
            string username = Session["Username"]?.ToString(); 
            if (username != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM [User] WHERE username = @Username";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);

                        connection.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Retrieve owner details
                                string ownerName = $"{reader["first_name"]} {reader["last_name"]}";
                                string phone = reader["phone_number"].ToString();
                                string address = reader["address"].ToString();
                                string email = reader["email"].ToString();

                                // Display owner details on the page
                                nameLabel.Text = ownerName;
                                UsernameLabel.Text = username;
                                phoneLabel.Text = phone;
                                AddressLabel.Text = address;
                                EmailLabel.Text = email;
                            }
                        }
                    }
                }
            }
        }

        protected void VEvent(object sender, EventArgs e)
        {
            string username = Session["Username"]?.ToString();

            Response.Redirect("ViewEvent.aspx");
        }

        protected void ShowRoom(object sender, EventArgs e)
        {

            Response.Redirect("ShowRoom.aspx");
        }

        protected void AnalyticsButton_Click(object sender, EventArgs e)
        {

            Response.Redirect("HotelAnalytics.aspx");
        }


        private int GetHotelIdFromSession()
        {
      
            return Convert.ToInt32(Session["HotelId"]);
        }


        protected void CheckBookingsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bookings and Hotels.aspx");

        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("Login.aspx");
        }
        protected void AddHotrel(object sender, EventArgs e)
        {

            Response.Redirect("AddHotel.aspx");
        }


    }
}
