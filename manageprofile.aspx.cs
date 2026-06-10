using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication6
{
    public partial class WebForm4 : System.Web.UI.Page
    { 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null && (Session["Role"].ToString() == "Guest" || Session["Role"].ToString() == "Owner"))
        {
            UsernameLabel.Text = $"Username:  {Session["Username"].ToString()}";
            string username = Session["Username"].ToString();
                string address = GetAddressFromDatabase(username);
                string name = getname(username);
                string phonenum = getphone(username);
                string email = getemail(username);
                string password = getpwd(username);

                if (!string.IsNullOrEmpty(address))
            {
                AddressLabel.Text = address;
            }
            else
            {
                AddressLabel.Text = "Address not found";
            }

            if (!string.IsNullOrEmpty(name))
            {
                nameLabel.Text = name;
            }
            else
            {
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

            

            if (!string.IsNullOrEmpty(password))
            {
                // Display address
                pwdLabel.Text = password;
            }
            else
            {
                // Display a message if address is not found
                pwdLabel.Text = "password error";
            }
        }
        else
        {
            // Redirect to login page if not authenticated
          Response.Redirect("login.aspx");
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
        private string getfirst(string username)
        {
            // Define the connection string
            string connectionString = "DatabaseConnectionString";

            // Initialize the address variable
            string address = "";

            // Create a SqlConnection object
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                // Define the SQL query to retrieve the address based on username
                string query = "SELECT first_name FROM [User] WHERE Username = @Username";

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

        private string getlast(string username)
        {
            // Define the connection string
            string connectionString = "DatabaseConnectionString";

            // Initialize the address variable
            string address = "";

            // Create a SqlConnection object
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                // Define the SQL query to retrieve the address based on username
                string query = "SELECT last_name FROM [User] WHERE Username = @Username";

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

        private string getpwd(string username)
    {
        // Define the connection string
        string connectionString = "DatabaseConnectionString";

        // Initialize the address variable
        string address = "";

        // Create a SqlConnection object
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
        {
            // Define the SQL query to retrieve the address based on username
            string query = "";

                query = "SELECT Password FROM [User] WHERE username = @Username";
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




    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        string address = regaddress.Value;
        string phonenum = regphone.Value;
        string password = regpassword.Value;
        string first = firstname.Value;
        string last= lastname.Value;
        string email = emailLabel1.Value;

            string Username = Session["Username"].ToString();



            string role = Session["Role"].ToString();


            if (address.IsNullOrWhiteSpace())
            {
                address = GetAddressFromDatabase(Username);
            }
            if (phonenum.IsNullOrWhiteSpace())
            {
                phonenum = getphone(Username);
            }
            if (password.IsNullOrWhiteSpace())
            {
                password = getpwd(Username);
            }
            if (first.IsNullOrWhiteSpace())
            {
                first = getfirst(Username);

            }
            if (last.IsNullOrWhiteSpace())
            {
                last=getlast(Username);
            }
            if (email.IsNullOrWhiteSpace())
            {
                email = getemail(Username);
            }


            // Establish database connection (replace with your connection logic)
            string connectionString = "DatabaseConnectionString";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                connection.Open();

                // Insert data into the respective table based on the selected role
                string tableName = "";
             

                // Execute the SQL command to insert data
                using (SqlCommand command = new SqlCommand("UPDATE_USER_PROFILE", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@username", Username);
                    command.Parameters.AddWithValue("@password", password);

                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@first_name", first);
                    command.Parameters.AddWithValue("@last_name", last);


                    command.Parameters.AddWithValue("@address", address);
                    command.Parameters.AddWithValue("@phone_number", phonenum);
                    command.ExecuteNonQuery();

                }
            }
        // Show confirmation message

        Page_Load(sender, e);
        ConfirmationLabel.Text = "You have been Updated.";
    }

    protected void deleteButton_Click(object sender, EventArgs e)
    {
        // Get the username from the current session
        string username = Session["Username"].ToString();

        // Call the function to delete the profile
        DeleteProfile(username);

        // Clear the session
        Session.Clear();

        // Redirect to the login page
        Response.Redirect("Login.aspx");
    }

    // Function to delete the profile based on the username
    private void DeleteProfile(string username)
    {
        // Define the connection string
        string connectionString = "DatabaseConnectionString";

        // Establish a connection to the database
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
        {
            // Open the connection
            connection.Open();
            string role = Session["Role"].ToString();

            string tableName = "";
            

            // Define the SQL query to delete the profile
            string query = $"DELETE FROM User WHERE username = @Username";

            // Create a command to execute the query
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameters to the command
                command.Parameters.AddWithValue("@Username", username);

                // Execute the query
                command.ExecuteNonQuery();
            }
        }
    }

    protected void home(object sender, EventArgs e)
    {
        
            string role = Session["Role"].ToString();
            role = role + ".aspx";
            Response.Redirect(role);
    }
}
}