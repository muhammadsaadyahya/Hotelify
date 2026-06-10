using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class Reviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReviews();
            }
        }

        private void LoadReviews()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT R.rating, R.comment, R.date_posted, U.username
                    FROM Review R
                    JOIN [User] U ON R.guest_id = U.user_id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable reviewsTable = new DataTable();
                        reviewsTable.Load(reader);
                        ReviewsRepeater.DataSource = reviewsTable;
                        ReviewsRepeater.DataBind();
                    }
                }
            }
        }
    }
}
