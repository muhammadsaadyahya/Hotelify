using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication6
{
    public partial class AddReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"].ToString() != "Guest")
            {
                
                Response.Redirect("Login.aspx");
            }
        }

        protected void SubmitReviewButton_Click(object sender, EventArgs e)
        {
            string guestUsername = Session["Username"]?.ToString();
            if (string.IsNullOrEmpty(guestUsername))
            {
                ResultLabel.Text = "Invalid session. Please login again.";
                return;
            }

            if (!int.TryParse(HotelIDTextBox.Text.Trim(), out int hotelId))
            {
                ResultLabel.Text = "Invalid hotel ID.";
                return;
            }

            if (!int.TryParse(RatingTextBox.Text.Trim(), out int rating))
            {
                ResultLabel.Text = "Invalid rating.";
                return;
            }

            string comment = CommentTextBox.Text.Trim();
            DateTime datePosted = DateTime.Now;

            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("AddReview", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@guest_id", GetGuestId(guestUsername, connection));
                        command.Parameters.AddWithValue("@hotel_id", hotelId);
                        command.Parameters.AddWithValue("@rating", rating);
                        command.Parameters.AddWithValue("@comment", comment);
                        command.Parameters.AddWithValue("@date_posted", datePosted);

                        connection.Open();

                        if (rating < 0 || rating > 5)
                        {

                            ResultLabel.Text = "Review Not added .";
                        }
                        else
                        {
                            command.ExecuteNonQuery();
                            connection.Close();

                            ResultLabel.Text = "Review added successfully.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ResultLabel.Text = "Error occurred: " + ex.Message;
            }
        }

        private int GetGuestId(string username, SqlConnection connection)
        {
            int guestId = -1; 
            using (SqlCommand command = new SqlCommand("SELECT user_id FROM [User] WHERE username = @username", connection))
            {
                command.Parameters.AddWithValue("@username", username);
                connection.Open();
                object result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    guestId = Convert.ToInt32(result);
                }
                connection.Close();
            }
            return guestId;
        }
    }
}