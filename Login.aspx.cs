
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
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
                Session.Clear();
            }
        }

        protected void log(object sender, EventArgs e)
        {
            string username = UsernameTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();
            string role = RoleDropDownList.SelectedValue;

            // Here you perform authentication and validation logic
            bool isAuthenticated = AuthenticateUser(username, password, role);

            if (isAuthenticated)
            {
                // Store user information in session
                Session["Username"] = username;
                Session["Role"] = role;

                // Redirect to respective page based on role
                if (role == "Owner")
                {
                    Response.Redirect("Owner.aspx");
                }
                else
                {
                    Response.Redirect($"{role}.aspx");
                }
            }
            else
            {
                // Display error message if authentication fails
                ErrorMessageLabel.Text = "Invalid username or password.";
            }
        }

        private bool AuthenticateUser(string username, string password, string role)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("LoginUser", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add input parameters
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    // Add output parameter
                    SqlParameter outputParameter = new SqlParameter();
                    outputParameter.ParameterName = "@flag";
                    outputParameter.SqlDbType = SqlDbType.Int;
                    outputParameter.Direction = ParameterDirection.Output;
                    command.Parameters.Add(outputParameter);

                    connection.Open();
                    command.ExecuteNonQuery();

                    // Retrieve the value of the output parameter
                    int userId = Convert.ToInt32(outputParameter.Value);

                    // Check if login was successful
                    if (userId != 0)
                    {
                        // Now, check if the user has the appropriate role
                        if (role == "Owner")
                        {
                            // Check if the user is actually an owner in the database
                            string checkRoleQuery = "SELECT user_type FROM [User] WHERE username = @username";
                            using (SqlCommand roleCommand = new SqlCommand(checkRoleQuery, connection))
                            {
                                roleCommand.Parameters.AddWithValue("@username", username);
                                string userType = roleCommand.ExecuteScalar()?.ToString();
                                return userType == "Owner";
                            }
                        }
                        else if(role == "User")
                        {
                            // For roles other than Owner, no additional check is needed
                            string checkRoleQuery = "SELECT user_type FROM [User] WHERE username = @username";
                            using (SqlCommand roleCommand = new SqlCommand(checkRoleQuery, connection))
                            {
                                roleCommand.Parameters.AddWithValue("@username", username);
                                string userType = roleCommand.ExecuteScalar()?.ToString();
                                return userType == "User";
                            }


                        }
                        return true;
                    }
                    else
                    {
                        // Login failed
                        return false;
                    }
                }
            }
        }

    }
}

