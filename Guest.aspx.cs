using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication6
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null && Session["Role"].ToString() == "Guest")
            {
                // Display username and address
                UsernameLabel.Text = $"Username:  {Session["Username"].ToString()}";
                string username = Session["Username"].ToString();
                // Here you can retrieve address from the database based on the username
                string address = GetAddressFromDatabase(username);
                string name = getname(username);
                string phonenum = getphone(username);
                string email = getemail(username);

                if (!string.IsNullOrEmpty(address))
                {
                    // Display address
                    AddressLabel.Text = address;
                }
                else
                {
                    // Display a message if address is not found
                    AddressLabel.Text = "Address not found";
                }

                if (!string.IsNullOrEmpty(name))
                {
                    // Display address
                    nameLabel.Text = name;
                }
                else
                {
                    // Display a message if address is not found
                    nameLabel.Text = "Name not found";
                }

                if (!string.IsNullOrEmpty(phonenum))
                {
                    // Display address
                    phoneLabel.Text = phonenum;
                }
                else
                {
                    // Display a message if address is not found
                    phoneLabel.Text = "phone not found";
                }
                if (!string.IsNullOrEmpty(email))
                {
                    // Display address
                    EmailLabel.Text = email;
                }
                else
                {
                    // Display a message if address is not found
                    EmailLabel.Text = "email not found";
                }
            }
            else
            {
                // Redirect to login page if not authenticated
                Response.Redirect("Login.aspx");
            }

        }

        private string getname(string username)
        {
            // Define the connection string
            string connectionString = "DatabaseConnectionString";

            // Initialize the address variable
            string address = "";

            // Create a SqlConnection object
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                // Define the SQL query to retrieve the address based on username
                string query = "SELECT first_name+\' \'+last_name FROM [User] WHERE Username = @Username";

                // Create a SqlCommand object
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Username", username);

                    // Open the connection
                    connection.Open();

                    // Execute the command and retrieve the address
                    object result = command.ExecuteScalar();

                    // Check if the result is not null
                    if (result != null)
                    {
                        // Convert the result to string and assign it to the address variable
                        address = result.ToString();
                    }
                }
            }

            // Return the address
            return address;
        }

        private string getphone(string username)
        {
            // Define the connection string
            string connectionString = "DatabaseConnectionString";

            // Initialize the address variable
            string address = "";

            // Create a SqlConnection object
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                // Define the SQL query to retrieve the address based on username
                string query = "SELECT phone_number FROM [User] WHERE username = @Username";

                // Create a SqlCommand object
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Username", username);

                    // Open the connection
                    connection.Open();

                    // Execute the command and retrieve the address
                    object result = command.ExecuteScalar();

                    // Check if the result is not null
                    if (result != null)
                    {
                        // Convert the result to string and assign it to the address variable
                        address = result.ToString();
                    }
                }
            }

            // Return the address
            return address;
        }

        private string getemail(string username)
        {
            // Define the connection string
            string connectionString = "DatabaseConnectionString";

            // Initialize the address variable
            string email = "";

            // Create a SqlConnection object
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                // Define the SQL query to retrieve the address based on username
                string query = "SELECT email FROM [User] WHERE username = @Username";

                // Create a SqlCommand object
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Username", username);

                    // Open the connection
                    connection.Open();

                    // Execute the command and retrieve the address
                    object result = command.ExecuteScalar();

                    // Check if the result is not null
                    if (result != null)
                    {
                        // Convert the result to string and assign it to the address variable
                        email = result.ToString();
                    }
                }
            }

            // Return the address
            return email;
        }


        private string GetAddressFromDatabase(string username)
        {
            // Define the connection string
            string connectionString = "DatabaseConnectionString";

            // Initialize the address variable
            string address = "";

            // Create a SqlConnection object
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                // Define the SQL query to retrieve the address based on username
                string query = "SELECT [address]  FROM [User] WHERE username = @Username";

                // Create a SqlCommand object
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Username", username);

                    // Open the connection
                    connection.Open();

                    // Execute the command and retrieve the address
                    object result = command.ExecuteScalar();

                    // Check if the result is not null
                    if (result != null)
                    {
                        // Convert the result to string and assign it to the address variable
                        address = result.ToString();
                    }
                }
            }

            // Return the address
            return address;
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();

            // Redirect to login page
            Response.Redirect("Login.aspx");
        }

        protected void manage(object sender, EventArgs e)
        {
            Response.Redirect("manageprofile.aspx");
        }

        protected void manageaps(object sender, EventArgs e)
        {
            Response.Redirect("ManageBooking.aspx");
        }

        protected void ehr_Click(object sender, EventArgs e)
        {
            string user = Session["Username"].ToString();


                Response.Redirect("WebForm5.aspx");
            

        }

        protected void AddReviewButton_Click(object sender, EventArgs e)
        {
            

            Response.Redirect("addreview.aspx");


        }


        protected void GroupBookings(object sender, EventArgs e)
        {
            Response.Redirect("GroupBooking.aspx");

        }
        protected void EventBooking(object sender, EventArgs e)
        {
            Response.Redirect("EventBooking.aspx");

        }

        protected void Reviews(object sender, EventArgs e)
        {
            Response.Redirect("Reviews.aspx");

        }
    }
}