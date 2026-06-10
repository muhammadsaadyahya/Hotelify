using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

namespace WebApplication6
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {

            string username = regusername.Value;
            string email = regemail.Value;
            string firstname = regfirstname.Value;
            string lastname = reglastname.Value;
            string address = regaddress.Value;
            string phonenum = regphone.Value;
            string password = regpassword.Value;



            string role = regrole.Value;






            // Establish database connection (replace with your connection logic)
            string connectionString = "DatabaseConnectionString";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[connectionString].ConnectionString))
            {
                connection.Open();

                // Insert data into the respective table based on the selected role
                string tableName = "";
                switch (role)
                {
                    case "Guest":
                        tableName = "Guest";
                        break;
                    case "Owner":
                        tableName = "Owner";
                        break;
               
                }

                // Execute the SQL command to insert data
                


                SqlCommand command = new SqlCommand("SignUpUser", connection);
                command.CommandType = CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@user_type", role);
                command.Parameters.AddWithValue("@first_name", firstname);
                command.Parameters.AddWithValue("@last_name", lastname);
                command.Parameters.AddWithValue("@phone_number", phonenum);
                command.Parameters.AddWithValue("@address", address);

                // Execute the stored procedure
                int error=0;



                if (password.Length < 4 || username.Length == 0 || !email.Contains("@"))
                {
                    ConfirmationLabel.Text = "Your Input donot match Standard of Input";
                }
                else
                {

                    command.ExecuteNonQuery();

                    // Show confirmation message
                    ConfirmationLabel.Text = "You have been registered.";
                }
            }
        }
    }
}